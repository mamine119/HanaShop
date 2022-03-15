/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package duytt.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author thant
 */
public class MainController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private final static String ERROR = "invalid.html";
    private final static String LOGIN = "LoginController";
    private final static String LOGIN_PAGE = "login.jsp";
    private final static String SHOPPING_PAGE = "ProdcutController";
    private final static String SEARCH = "SearchController";
    private final static String LOGOUT = "LogoutController";
    private final static String HOME = "SearchController";
    private final static String CART_ADD = "Cart_AddController";
    private final static String VIEW_CART = "view_cart.jsp";
    private final static String UPDATEREDEUCE = "UpdateRDController";
    private final static String UPDATEINCREASE = "UpdateIRController";
    private final static String CART_BACK = "product.jsp";
    private final static String DELETE_PRO_CART = "DeleteProCartController";
    private final static String ORDER_NOW = "OrderNowController";
    private final static String SEARCHAD = "SearchAdController";
    private final static String UPDATEPRO = "UpdateProController";
    private final static String SEARCHHIS = "SearchHisController";
    private final static String REMOVE = "RemoveController";
    private final static String ADDPAGE = "pro_create.jsp";
    private final static String ADD = "AddProductController";
    private final static String ORDERADMIN = "OderController";
    private final static String UPDATEORDER = "UpdateOrderController";
    private final static String LOGINMAIL = "LoginMailController";
    private final static String AUTHENPAYPAL = "AuthorizePaymentServlet";
    private final static String REVIEWPAYPAL = "ReviewPaymentServlet";
    private final static String EXCUTEPAYPAL = "ExecutePaymentServlet";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;

        try {
            String action = request.getParameter("btnAction");
            if (("Sign In").equals(action)) {
                url = LOGIN;
            }
            if (("Login").equals(action)) {
                url = LOGIN_PAGE;
            }
            if (("Shopping").equals(action)) {
                url = SHOPPING_PAGE;
            }
            if (("Search").equals(action)) {
                url = SEARCH;
            }
            if (("SearchAd").equals(action)) {
                url = SEARCHAD;
            }
            if (("Logout").equals(action)) {
                url = LOGOUT;
            }
            if (("Home").equals(action)) {
                url = HOME;
            }
            if (("Addtocart").equals(action)) {
                url = CART_ADD;
            }
            if (("view_cart").equals(action)) {
                url = VIEW_CART;
            }
            if (("reduceQuanity").equals(action)) {
                url = UPDATEREDEUCE;
            }
            if (("increaQuanity").equals(action)) {
                url = UPDATEINCREASE;
            }
            if (("Back_cart").equals(action)) {
                url = CART_BACK;
            }
            if (("delete_proCart").equals(action)) {
                url = DELETE_PRO_CART;
            }
            if (("Check Out").equals(action)) {
                url = ORDER_NOW;
            }
            if (("Update").equals(action)) {
                url = UPDATEPRO;
            }
            if (("searchHis").equals(action)) {
                url = SEARCHHIS;
            }
            if (("history").equals(action)) {
                url = SEARCHHIS;
            }
            if (("Remove").equals(action)) {
                url = REMOVE;
            }
            if (("addProduct").equals(action)) {
                url = ADDPAGE;
            }
            if (("Add Product").equals(action)) {
                url = ADD;
            }
            if (("order").equals(action)) {
                url = ORDERADMIN;
            }
            if (("updateOrder").equals(action)) {
                url = UPDATEORDER;
            }
            if (("GmailLogin").equals(action)) {;
                url = LOGINMAIL;
            }
            if (("CheckoutPayPal").equals(action)) {
                url = AUTHENPAYPAL;
            }
            if (("reviewpaypal").equals(action)) {
                url = REVIEWPAYPAL;
            }
            if (("PayNow").equals(action)) {
                url = EXCUTEPAYPAL;
            }
        } catch (Exception e) {
            log("MainController: " + e.toString());
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
