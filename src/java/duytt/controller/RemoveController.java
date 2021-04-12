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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author thant
 */
public class RemoveController extends HttpServlet {

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
					String txtRemove = request.getParameter("txtremove");
					String[] list = txtRemove.split(";");
					boolean check = true;
					for (String string : list) {
						if (!string.equals("")) {
							Product pro = new ProductDAO().getAProduct(string);
							if (pro == null) {
								check = false;
								break;
							}
						}
					}
					if (check) {
						for (String string : list) {
							if (!string.equals("")) {
								new ProductDAO().deleteProduct(string);
								new ProductDAO().writeRecord(user.getUserAccount(), string, "Delete");
							}
						}
						url = SUCCESS;
					}
				} else {
					url = NOTADMIN;
				}
			}

		} catch (Exception e) {
			log("RemoveController: "+e.toString());
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
