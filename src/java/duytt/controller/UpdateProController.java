/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package duytt.controller;

import duytt.daos.ProductDAO;
import duytt.dtos.Product;
import duytt.dtos.User;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author thant
 */
public class UpdateProController extends HttpServlet {

	/**
	 * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	private final static String ERROR = "product.jsp";
	private final static String SUCCESS = "SearchAdController";
	private final static String NOTADMIN = "login.jsp";

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String url = ERROR;
		try {
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("USER");

			if (user == null) {
				url = NOTADMIN;
			} else {
				if (user.getRoleID().equals("AD")) {
					String proID = request.getParameter("txtProId");
					String proName = request.getParameter("txtProName");
					String price = request.getParameter("txtPrice");
					String descript = request.getParameter("txtProDes");
					String createDate = request.getParameter("txtCreateDate");
					String hsd = request.getParameter("txtHsd");
					String image = request.getParameter("txtUrlImage");
					String quanity = request.getParameter("txtQuanity");
					boolean status;
					String sta = request.getParameter("txtCheckBox");
					if (sta == null) {
						status = false;
					} else {
						status = true;
					}
					String cateId = request.getParameter("cate");
					request.setAttribute("proPrice", null);
					request.setAttribute("proName", null);
					request.setAttribute("des", null);
					request.setAttribute("img", null);
					request.setAttribute("cate", null);
					request.setAttribute("hsd", null);
					request.setAttribute("quanity", null);
					boolean check = true;

					if (proName.isEmpty() || proName.equals("") || proName == null) {
						check = false;
						request.setAttribute("proName", "Product Name not empty");
					}

					if (price.isEmpty() || price == null || price.equals("")) {
						check = false;
						request.setAttribute("proPrice", "Price not empty");
					} else if (!price.matches("[0-9.]+")) {
						check = false;
						request.setAttribute("proPrice", "Price only have number");
					} else if (Float.parseFloat(price) <= 0) {
						check = false;
						request.setAttribute("proPrice", "Price > 0");
					}

					if (descript.isEmpty() || descript.equals("") || descript == null) {
						check = false;
						request.setAttribute("des", "Product description not empty");
					}

					if (image.isEmpty() || image.equals("") || image == null) {
						check = false;
						request.setAttribute("img", "Product Url Img not empty");
					}

					if (cateId.isEmpty() || cateId.equals("") || cateId == null) {
						check = false;
						request.setAttribute("cate", "Please choose again category");
					}
					if (hsd.isEmpty() || hsd.equals("") || hsd == null) {
						check = false;
						request.setAttribute("hsd", "Product hsd not empty");
					} else {
						Date today = new Date();
						SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
						Date now = sm.parse(sm.format(today));
						Date txtHsd = sm.parse(hsd);
						if (txtHsd.compareTo(now) < 0) {
							check = false;
							request.setAttribute("hsd", "Product hsd must lager today");
						}
					}
					
					if (quanity.isEmpty() || quanity == null || quanity.equals("")) {
						check = false;
						request.setAttribute("quanity", "quanity not empty");
					} else if (!quanity.matches("[0-9]+")) {
						check = false;
						request.setAttribute("quanity", "quanity only have number");
					} else if (Integer.parseInt(quanity) <= 0) {
						check = false;
						request.setAttribute("quanity", "quanity > 0");
					}
					if (check) {
						Product pro = new Product(proID, proName, Float.parseFloat(price), descript, createDate, image, Integer.parseInt(quanity), status, cateId, hsd);
						new ProductDAO().updatePro(pro);
						new ProductDAO().writeRecord(user.getUserAccount(), proID, "Update");
						url = SUCCESS;
					}
					request.setAttribute("proID", proID);
				} else {
					url = NOTADMIN;
				}
			}

		} catch (Exception e) {
			log("UpdateProController: " + e.toString());
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
