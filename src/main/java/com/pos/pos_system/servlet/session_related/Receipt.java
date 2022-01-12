/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.pos.pos_system.servlet.session_related;

import com.pos.pos_system.ejb.TransactionBean;
import java.io.IOException;
import java.io.PrintWriter;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author SPARTACUS
 */
@WebServlet(name = "Receipt", urlPatterns = {"/Receipt"})
public class Receipt extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Receipt</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Receipt at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
    @Inject
    TransactionBean returnBean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("activePage", "Retur");

        //request.setAttribute("productList", returnBean.displayCart());
        //request.setAttribute("totalValue", returnBean.getTotalValue());
        request.getRequestDispatcher("/WEB-INF/pages/product/receipt.jsp").forward(request, response);
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
        if (request.getParameter("button_action").equals("showReceipt")) {
            try {
                returnBean.emptyCart();
                Integer receiptId = Integer.parseInt(request.getParameter("receipt_id"));
                request.setAttribute("productList", returnBean.findById(receiptId));
                request.setAttribute("totalValue", returnBean.getTotalById(receiptId));
                request.getRequestDispatcher("/WEB-INF/pages/product/receipt.jsp").forward(request, response);
            } catch (Exception e) {
                request.setAttribute("returnMessage", "Incorrect product!");
            }
        }
        //made by SPARTACUS
        if (request.getParameter("button_action").equals("returnProduct")) {
            returnBean.emptyCart();     //Golim returnBean pentru a putea pune in el din baza de date
            Integer receiptId = Integer.parseInt(request.getParameter("receipt_id"));
            returnBean.findById(receiptId);
            Integer productId = Integer.parseInt(request.getParameter("product_id"));
            Double refundValue = returnBean.refundValueByProductId(receiptId, productId);
            returnBean.emptyCart();     //Golim returnBean pentru a pune in el produsul pe care vrem sa-l returnam
            returnBean.addProductById(productId);
            returnBean.returnProductValue(refundValue);//Aflam cat valoreaza produsul la care ii facem retur
            returnBean.createReceipt(); //Creem bonul de retur (produsul impreuna cu valorea lui negativa)
            returnBean.emptyCart();     //Golim returnBean

            request.setAttribute("returnMessage", "Please return  " + (0.0 - refundValue) + " USD");
            request.getRequestDispatcher("/WEB-INF/pages/product/receipt.jsp").forward(request, response);
        }
        response.sendRedirect(request.getContextPath() + "/Receipt");
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
