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
import java.sql.SQLException;
import java.util.ArrayList;
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
public class OrderNowController extends HttpServlet {

	/**
	 * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	private Product checkLast(List<Product> list) throws ClassNotFoundException, SQLException {
		for (Product product : list) {
			Product proTemp = new ProductDAO().getAProduct(product.getProID());
			if (product.getQuanity() > proTemp.getQuanity()) {
				return proTemp;
			}
		}
		return null;
	}
	private final static String ERROR = "view_cart.jsp";
	private final static String SUCCESS = "view_cart.jsp";
	private final static String NOTUS = "login.jsp";

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String url = ERROR;
		try {
			HttpSession session = request.getSession();
			User userT = (User) session.getAttribute("USER");
			if (userT == null) {
				url = NOTUS;
			} else {
				if (userT.getRoleID().equals("US")) {

					request.setAttribute("ID", null);
					request.setAttribute("Error", null);
					Cart cart = (Cart) session.getAttribute("CART");
					String totl = String.valueOf(session.getAttribute("TOTAL"));
					User user = (User) session.getAttribute("USER");
					String userAccount = user.getUserAccount();
					String userName = request.getParameter("txtName");
					String userEmail = request.getParameter("txtEmail");
					String userPhone = request.getParameter("txtPhone");
					String userAddress = request.getParameter("txtAddress");
					request.setAttribute("TXTNAME", null);
					request.setAttribute("TXTEMAIL", null);
					request.setAttribute("TXTPHONE", null);
					request.setAttribute("TXTADDRESS", null);
					boolean checkVa = true;
					if (userName.isEmpty() || userName.equals("") || userName == null) {
						checkVa = false;
						request.setAttribute("TXTNAME", "Name not empty");
					} else if (userName.length() > 50) {
						checkVa = false;
						request.setAttribute("TXTNAME", "Name length <= 50");
					}

					if (userEmail.isEmpty() || userEmail.equals("") || userEmail == null) {
						checkVa = false;
						request.setAttribute("TXTEMAIL", "Email not empty");
					} else if (!userEmail.contains("@") && !userEmail.contains(".")) {
						checkVa = false;
						request.setAttribute("TXTEMAIL", "Please check email again");
					} else if (userEmail.length() > 50) {
						checkVa = false;
						request.setAttribute("TXTNAME", "Email length <= 50");
					}

					if (userPhone.isEmpty() || userPhone.equals("") || userPhone == null) {
						checkVa = false;
						request.setAttribute("TXTPHONE", "phone not empty");
					} else if (!userPhone.matches("[0-9]+")) {
						checkVa = false;
						request.setAttribute("TXTPHONE", "phone only have number");
					} else if (userPhone.length() != 10) {
						checkVa = false;
						request.setAttribute("TXTPHONE", "phone must have 10 digit");
					}

					if (userAddress.isEmpty() || userAddress.equals("") || userAddress == null) {
						checkVa = false;
						request.setAttribute("TXTADDRESS", "Address not empty");
					} else if (userAddress.length() > 4000) {
						checkVa = false;
						request.setAttribute("TXTADDRESS", "Address length <= 4000");
					}
					if (checkVa) {
						User userTemp = new User(userAccount, userName, "", Integer.parseInt(userPhone), userAddress, userEmail, true, "");
						float total = Float.parseFloat(totl);
						List<Product> list = new ArrayList<>();
						for (Product value : cart.getCart().values()) {
							list.add(value);
						}
						Product check = checkLast(list);
						if (check == null) {
							String orderID = new ProductDAO().addOrder(userTemp, total);
							for (Product pro : cart.getCart().values()) {
								new ProductDAO().createOrderDetail(orderID, pro.getProID(), pro.getPrice(), pro.getQuanity());
							}
							for (Product product : cart.getCart().values()) {
								Product proTemp = new ProductDAO().getAProduct(product.getProID());
								new ProductDAO().updateQuanity(proTemp.getQuanity() - product.getQuanity(), product.getProID());
							}
							session.setAttribute("CART", null);
							session.setAttribute("TOTAL", null);
							session.setAttribute("COUNT", null);
							request.setAttribute("SUCCESSFULLY", "Order successfully. please check product in History");
							url = SUCCESS;
						} else {
							request.setAttribute("ID", check.getProID());
							request.setAttribute("Error", check.getQuanity());
						}
					}

				} else {
					url = NOTUS;
				}
			}
		} catch (Exception e) {
			log("OrderNowController: " + e.toString());
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
