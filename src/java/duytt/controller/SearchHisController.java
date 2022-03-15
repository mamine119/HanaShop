/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package duytt.controller;

import duytt.daos.ProductDAO;
import duytt.dtos.History;
import duytt.dtos.User;
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
public class SearchHisController extends HttpServlet {

	/**
	 * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	private final static String ERROR = "history.jsp";
	private final static String SUCCESS = "history.jsp";
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
					String date = request.getParameter("txtDate");
					if (date == null) {
						date = "";
					}
					String txtsearch = request.getParameter("txtSearch");
					if (txtsearch == null) {
						txtsearch = "";
					}
					
					User user = (User) session.getAttribute("USER");
					String userAccount = user.getUserAccount();
					String sql = "";
					if (date.equals("")) {
						sql = "select b.foodId,[foodName],[image],b.[quanity],b.[price],[date],b.orderId,e.statusName,d.fullName,d.userAccount from [dbo].[tblFood]a,[dbo].[tblOderDetail]b,[dbo].[tblOders]c,[dbo].[tblUsers] d, [dbo].[tblStatus] e where a.foodId=b.foodId and b.orderId=c.orderId and c.userAccount=d.userAccount and c.statusID=e.statusID and c.orderId in (select c.[orderId] from [dbo].[tblFood]a,[dbo].[tblOderDetail]b,[dbo].[tblOders]c,[dbo].[tblUsers] d where a.foodId=b.foodId and b.orderId=c.orderId and c.userAccount=d.userAccount and d.userAccount ='" + userAccount + "' and  foodName like N'%%' group by c.[orderId]) ORDER BY [date] DESC,orderId DESC";
					} else {
						sql = "select b.foodId,[foodName],[image],b.[quanity],b.[price],[date],b.orderId,e.statusName,d.fullName,d.userAccount from [dbo].[tblFood]a,[dbo].[tblOderDetail]b,[dbo].[tblOders]c,[dbo].[tblUsers] d, [dbo].[tblStatus] e where a.foodId=b.foodId and b.orderId=c.orderId and c.userAccount=d.userAccount and c.statusID=e.statusID and c.orderId in (select c.[orderId] from [dbo].[tblFood]a,[dbo].[tblOderDetail]b,[dbo].[tblOders]c,[dbo].[tblUsers] d where a.foodId=b.foodId and b.orderId=c.orderId and c.userAccount=d.userAccount and d.userAccount ='" + userAccount + "' and foodName like N'%" + txtsearch + "%'and [date] = '" + date + "' group by c.[orderId]) ORDER BY [date] DESC,orderId DESC";
					}
					List<History> list = new ProductDAO().getHistory(sql);
                                        
					session.setAttribute("TXTSEAR", txtsearch);
					session.setAttribute("TXTDATE", date);
					session.setAttribute("LISTHIS", list);
					session.setAttribute("SUCCESS", null);
					url = SUCCESS;
				} else {
					url = NOTUS;
				}
			}
		} catch (Exception e) {
			log("SearchHisController: "+e.toString());
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
