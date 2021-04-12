/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package duytt.controller;

import duytt.daos.ProductDAO;
import duytt.dtos.Category;
import duytt.dtos.Product;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author thant
 */
public class SearchController extends HttpServlet {

	/**
	 * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	private final static String ERROR = "product.jsp";
	private final static String SUCCESS = "product.jsp";

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String url = ERROR;
		try {
			HttpSession session = request.getSession();
			String minPrice = request.getParameter("minPrice");
			if (minPrice == null || minPrice.isEmpty() || minPrice.equals("")) {
				minPrice = new ProductDAO().getMinPrice();
			}
			String maxPrice = request.getParameter("maxPrice");
			if (maxPrice == null || maxPrice.isEmpty() || maxPrice.equals("")) {
				maxPrice = new ProductDAO().getMaxPrice();
			}
			String cate = request.getParameter("cate");
			if (cate == null) {
				cate = "All";
			}
			String txtSearch = "";
			if (request.getParameter("txtSearch") != null) {
				txtSearch = request.getParameter("txtSearch");
			}
			String sql = "";
			String sqlpage = "";
//			int indexS = Integer.parseInt(request.getParameter("index"));
			int indexPage = 0;
			if (request.getParameter("index") == null) {
				indexPage = 1;
			} else {
				indexPage = Integer.parseInt(request.getParameter("index"));
			}

			boolean check = true;
			if (minPrice.isEmpty() || minPrice == null || minPrice.equals("")) {
				check = false;
				request.setAttribute("MINPRICEERROR", "Min Price not empty");
			} else if (!minPrice.matches("[0-9.]+")) {
				check = false;
				request.setAttribute("MINPRICEERROR", "Min price only have number");
			} else if (Float.parseFloat(minPrice) <= 0) {
				check = false;
				request.setAttribute("MINPRICEERROR", "Min Price must be > 0");
			} else if (Float.parseFloat(minPrice) > Float.parseFloat(maxPrice)) {
				check = false;
				request.setAttribute("MINPRICEERROR", "Min Price must be < Max price");
			}

			if (maxPrice.isEmpty() || maxPrice == null || maxPrice.equals("")) {
				check = false;
				request.setAttribute("MAXPRICEERROR", "MAX Price not empty");
			} else if (!maxPrice.matches("[0-9.]+")) {
				check = false;
				request.setAttribute("MAXPRICEERROR", "MAX price only have number");
			} else if (Float.parseFloat(maxPrice) <= 0) {
				check = false;
				request.setAttribute("MAXPRICEERROR", "MAX Price must be > 0");
			} else if (Float.parseFloat(maxPrice) < Float.parseFloat(minPrice)) {
				check = false;
				request.setAttribute("MAXPRICEERROR", "Max Price must be > Min price");
			}

			if(cate.isEmpty() || cate == null || cate.equals("")){
				check = false;
				request.setAttribute("CATEERROR", "Please choose again Category");
			}
			
			if(txtSearch.contains("'"))
			{
				check = false;
				request.setAttribute("SEARCHERROR", "Please Enter name search again");
			}
			if (check) {
				if (cate.equals("All")) {

					sql = "with tblTemp as(select ROW_NUMBER() over ( order by [createDate] asc) as num,[foodId],[foodName],[price],[desciption],[quantity],[status],[createDate],[image],[categoryId],hsd from [dbo].[tblFood] where [foodName] like N'%" + txtSearch + "%' and hsd>=GETDATE() and status=1  and [quantity] > 0 and price >= " + minPrice + "\n"
							+ "and price <=  " + maxPrice + ") select [foodId],[foodName],[price],[desciption],[quantity],[status],[createDate],[image],[categoryId],hsd from tblTemp where num between " + (indexPage * 20 - 19) + " and " + (indexPage * 20);
					sqlpage = "select count(foodId) as soluong from [dbo].[tblFood] where [foodName] like N'%" + txtSearch + "%' and status=1 and hsd>=GETDATE()  and [quantity] > 0 and price >= " + minPrice + "\n"
							+ "and price <=  " + maxPrice;
					session.setAttribute("MINPRICE", minPrice);
					session.setAttribute("MAXPRICE", maxPrice);
					session.setAttribute("CATE", cate);
					session.setAttribute("TXTSEARCH", txtSearch);
					session.setAttribute("INDEXPAGE", indexPage);

				} else {

					sql = "with tblTemp as(select ROW_NUMBER() over ( order by [createDate] asc) as num,[foodId],[foodName],[price],[desciption],[quantity],[status],[createDate],[image],[categoryId],hsd from [dbo].[tblFood] where [foodName] like N'%" + txtSearch + "%' and hsd>=GETDATE() and status=1  and [quantity] > 0 and price >= " + minPrice + "\n"
							+ "and price <=  " + maxPrice + "and categoryId = '" + cate + "' ) select [foodId],[foodName],[price],[desciption],[quantity],[status],[createDate],[image],[categoryId],hsd from tblTemp where num between " + (indexPage * 20 - 19) + " and " + (indexPage * 20);
					sqlpage = "select count(foodId) as soluong from [dbo].[tblFood] where [foodName] like N'%" + txtSearch + "%' and status=1 and hsd>=GETDATE() and [quantity] > 0 and price >= " + minPrice + "\n"
							+ "and price <=  " + maxPrice + "and categoryId = '" + cate + "'";
					session.setAttribute("MINPRICE", minPrice);
					session.setAttribute("MAXPRICE", maxPrice);
					session.setAttribute("CATE", cate);
					session.setAttribute("TXTSEARCH", txtSearch);
					session.setAttribute("INDEXPAGE", indexPage);
				}

				List<Category> listCate = (List<Category>) new ProductDAO().getCate();
				List<Product> listProduct = (List<Product>) new ProductDAO().getProduct(sql);
				int soluong = new ProductDAO().getPage(sqlpage);
				int index = soluong / 20;
				if (soluong % 20 != 0) {
					index++;
				}
				session.setAttribute("LISTPRODUCT", listProduct);
				session.setAttribute("LISTCATE", listCate);
				session.setAttribute("INDEX", index);
				session.setAttribute("SUCCESS", null);
				url = SUCCESS;
			}

		} catch (Exception e) {
			log("SearchController: " + e.toString());
		} finally {
			request.getRequestDispatcher(url).forward(request, response);
		}
	}

	// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
	/**
	 * Handles the HTTP <code>GET</code> method.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * Handles the HTTP <code>POST</code> method.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * Returns a short description of the servlet.
	 *
	 * @return a String containing servlet description
	 */
	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>

}
