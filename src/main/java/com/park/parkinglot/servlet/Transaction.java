/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.park.parkinglot.servlet;

import com.park.parkinglot.common.ProductDetails;
import com.park.parkinglot.ejb.TransactionBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.annotation.security.DeclareRoles;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Oli
 */
@DeclareRoles({"AdminRole", "ClientRole","DirectorRole"})
@WebServlet(name = "Transaction", urlPatterns = {"/Transaction"})
public class Transaction extends HttpServlet {
    
@Inject
TransactionBean transactionBean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("activePage", "Transaction");

        request.setAttribute("productList", transactionBean.displayCart());
        
        request.getRequestDispatcher("/WEB-INF/pages/car/transaction.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("product_id"));
        transactionBean.addProductById(productId);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}