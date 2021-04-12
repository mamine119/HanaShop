/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package duytt.controller;

import duytt.daos.ProductDAO;
import duytt.dtos.Cart;
import duytt.dtos.Product;
import duytt.dtos.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author thant
 */
public class UpdateIRController extends HttpServlet {

	/**
	 * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	private final static String ERROR = "view_cart.jsp";
	private final static String SUCCESS = "view_cart.jsp";
	private final static String NOTUS = "login.jsp";

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String url = ERROR;
		HttpSession session = request.getSession();
		try {

			User user = (User) session.getAttribute("USER");
			if (user == null) {
				url = NOTUS;
			} else {
				if (user.getRoleID().equals("US")) {
					session.setAttribute("TOTAL", null);
					String proID = request.getParameter("proID");
					Product pro = new ProductDAO().getAProduct(proID);
					if (pro != null) {
						Cart cart = (Cart) session.getAttribute("CART");
						if (cart != null) {
							if (cart.getCart() != null) {
								if (cart.getCart().containsKey(proID)) {
									Product proTemp = cart.getCart().get(proID);
									if (proTemp.getQuanity() < pro.getQuanity()) {
										proTemp.setQuanity(proTemp.getQuanity() + 1);
										cart.update(proTemp);
									} else {

									}
								}
							}
							int total = 0;
							if (cart.getCart().values() != null) {
								for (Product proS : cart.getCart().values()) {
									total += proS.getPrice() * proS.getQuanity();
								}
							}
							session.setAttribute("COUNT", cart.getCart().keySet().size());
							session.setAttribute("CART", cart);
							session.setAttribute("TOTAL", total);
							url = SUCCESS;
						}
					}
				} else {
					url = NOTUS;
				}
			}
		} catch (Exception e) {
			log("UpdateIRController: " + e.toString());
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
