/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package duytt.controller;

import duytt.daos.UserDAO;
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
public class LoginController extends HttpServlet {

	/**
	 * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	private final static String ERROR = "login.jsp";
	private final static String SUCCESS = "product.jsp";
	private final static String ADMIN = "SearchAdController";
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String url = ERROR;
		HttpSession session = request.getSession();
		try {
			String userID = request.getParameter("userAccount");
			String password = request.getParameter("password");
			session.setAttribute("userID_ERROR", null);
			session.setAttribute("password_ERROR", null);
			session.setAttribute("userAccount", null);
			boolean check = true;
			if (userID.isEmpty()) {
				check = false;
				session.setAttribute("userID_ERROR", "Your Account not empty");
			} else if (userID.length() > 50) {
				check = false;
				session.setAttribute("userID_ERROR", "Your Account length <= 50");
			} else if (!userID.matches("[A-Za-z0-9]+")) {
				check = false;
				session.setAttribute("userID_ERROR", "Your Account mustn't have special characters");
			} else {
				session.setAttribute("userAccount", userID);
			}
			if (password.isEmpty()) {
				check = false;
				session.setAttribute("password_ERROR", "Password not empty");
			} else if (password.length() > 30) {
				check = false;
				session.setAttribute("password_ERROR", "Password length <= 30");
			} else if (!password.matches("[A-Za-z0-9]+")) {
				check = false;
				session.setAttribute("password_ERROR", "Password mustn't have special characters");
			}
			if (check) {
				User user = new UserDAO().checkLogin(userID, password);
				if (user != null) {
					if (user.isStatus()) {
						session.setAttribute("USER", user);
						session.setAttribute("Error_Login", null);
						session.setAttribute("SUCCESS", "success");
						if (user.getRoleID().equals("AD")) {
							url = ADMIN;
						} else if (user.getRoleID().equals("US")) {
							url = SUCCESS;
						}
					} else {
						session.setAttribute("Error_Login", "The account has been locked");
					}
				} else {
					session.setAttribute("Error_Login", "Wrong User Account or Password. Please try again!");
				}
			}
			
		} catch (Exception e) {
			log("LoginController: " + e.toString());
		} finally {
			response.sendRedirect(url);
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
