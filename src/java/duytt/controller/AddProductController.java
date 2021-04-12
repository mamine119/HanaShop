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
public class AddProductController extends HttpServlet {

	/**
	 * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	private final static String ERROR = "pro_create.jsp";
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
					String des = request.getParameter("txtDes");
					String img = request.getParameter("txtImg");
					String creDate = request.getParameter("txtDate");
					String hsd = request.getParameter("txtHsd");
					String cate = request.getParameter("txtCate");
					String quanity = request.getParameter("txtQuanity");
					String checkBox = request.getParameter("txtCheck");
					boolean checkB = true;
					if (checkBox.equals("on")) {
						checkB = true;
					} else {
						checkB = false;
					}
					Product pro = new ProductDAO().getAProduct(proID);
					boolean check = true;
					if (proID == null || proID.isEmpty() || proID.equals("")) {
						check = false;
						request.setAttribute("proID", "Product Id not empty");
					} else {
						if (proID.substring(2).equals("")) {
							check = false;
							request.setAttribute("proID", "Product Id not empty");
						} else if (!proID.substring(2).matches("[0-9]+")) {
							check = false;
							request.setAttribute("proID", "Product Id only have number");
						} else if (proID.length() > 15) {
							check = false;
							request.setAttribute("proID", "Product length <= 15");
						}
						else if (pro != null) {
							check = false;
							request.setAttribute("proID", "Product Id has been exsit");
						}
					}

					if (proName.isEmpty() || proName.equals("") || proName == null) {
						check = false;
						request.setAttribute("proName", "Product Name not empty");
					}else if (proName.length() > 200) {
						check = false;
						request.setAttribute("proName", "Product length <= 200");
					}

					if (price.isEmpty() || price == null || price.equals("")) {
						check = false;
						request.setAttribute("proPrice", "Price not empty");
					} else if (!price.matches("[0-9]+")) {
						check = false;
						request.setAttribute("proPrice", "Price only have number");
					} else if (Float.parseFloat(price) <= 0) {
						check = false;
						request.setAttribute("proPrice", "Price > 0");
					}

					if (des.isEmpty() || des.equals("") || des == null) {
						check = false;
						request.setAttribute("des", "Product description not empty");
					}else if (des.length() > 500) {
						check = false;
						request.setAttribute("des", "Product description length <= 500");
					}

					if (img.isEmpty() || img.equals("") || img == null) {
						check = false;
						request.setAttribute("img", "Product Url Img not empty");
					}else if (img.length() > 8000) {
						check = false;
						request.setAttribute("img", "Product Url Img length <= 8000");
					}

					if (creDate.isEmpty() || creDate.equals("") || creDate == null) {
						check = false;
						request.setAttribute("creDate", "Product creDate not empty");
					} else {
						Date today = new Date();
						SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
						Date now = sm.parse(sm.format(today));
						Date txtCre = sm.parse(creDate);
						if (!now.equals(txtCre)) {
							check = false;
							request.setAttribute("creDate", "Product creDate not right");
						}

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

					if (cate.isEmpty() || cate.equals("") || cate == null) {
						check = false;
						request.setAttribute("cate", "Please choose again category");
					}else if (cate.length() > 20) {
						check = false;
						request.setAttribute("cate", "Please choose again category");
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
						Product proTemp = new Product(proID, proName, Float.parseFloat(price), des, creDate, img, Integer.parseInt(quanity), checkB, cate, hsd);
						new ProductDAO().addProduct(proTemp);
						url = SUCCESS;

					}
				} else {
					url = NOTADMIN;
				}
			}

		} catch (Exception e) {
			log("AddProductController: " + e.toString());
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
