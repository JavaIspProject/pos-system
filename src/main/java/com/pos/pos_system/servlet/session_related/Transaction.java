/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pos.pos_system.servlet.session_related;

import com.pos.pos_system.ejb.ProductBean;
import com.pos.pos_system.ejb.TransactionBean;
import java.io.IOException;
import java.util.ArrayList;
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
 * @author No! I AM SPARTACUS
 */
@DeclareRoles({"AdminRole", "ClientRole", "DirectorRole"})
@WebServlet(name = "Transaction", urlPatterns = {"/Transaction"})
public class Transaction extends HttpServlet {

    @Inject
    TransactionBean transactionBean;

    @Inject
    ProductBean productBean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("activePage", "Tranzactie");

        request.setAttribute("productList", transactionBean.displayCart());
        request.setAttribute("totalValue", transactionBean.getTotalValue());
        request.getRequestDispatcher("/WEB-INF/pages/product/transaction.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("button_action").equals("delete")) {
            String[] productsIdsAsString = request.getParameterValues("product_ids_for_delete");
            if (productsIdsAsString != null) {
                List<Integer> productsIds = new ArrayList<>();
                for (String productIdAsString : productsIdsAsString) {
                    productsIds.add(Integer.parseInt(productIdAsString));
                }
                transactionBean.removeProductByIdList(productsIds);

            }
        }
        if (request.getParameter("button_action").equals("addProduct")) {
            int productId = Integer.parseInt(request.getParameter("product_id"));
            try {
                productBean.findById(productId);
                transactionBean.addProductById(productId);
            } catch (Exception e) {
                request.setAttribute("transactionMessage", "Incorrect product!");
                request.setAttribute("productList", transactionBean.displayCart());
                request.setAttribute("totalValue", transactionBean.getTotalValue());
                request.getRequestDispatcher("/WEB-INF/pages/product/transaction.jsp").forward(request, response);
            }
        }
        if (request.getParameter("button_action").equals("receipt")) {
            transactionBean.createReceipt();
            transactionBean.emptyCart();
        }
        response.sendRedirect(request.getContextPath() + "/Transaction");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
