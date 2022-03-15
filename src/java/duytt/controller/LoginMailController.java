/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package duytt.controller;

import duytt.daos.ProductDAO;
import duytt.daos.UserDAO;
import duytt.dtos.History;
import duytt.dtos.Status;
import duytt.dtos.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HTV
 */
public class LoginMailController extends HttpServlet {

    private final static String ERROR = "login.jsp";
    private final static String SUCCESS = "product.jsp";
    private final static String ADMIN = "SearchAdController";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        HttpSession session = request.getSession();
        try {
            String userID = request.getParameter("UserID").substring(0, 19);
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            System.out.println("asdasd");
            User user = new UserDAO().checkLogin(userID);
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
                
                user=new User(userID, fullName, "123", 0, "", email, true, "US");
                new UserDAO().create(user);
                session.setAttribute("USER", user);
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("OrderController: " + e.toString());
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
