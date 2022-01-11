<%-- 
    Document   : receipt
    Created on : Jan 11, 2022, 7:08:36 PM
    Author     : boo_b
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:pageTemplate pageTitle="Receipt">
    <h1>Receipt</h1>
    <form method="POST" action="${pageContext.request.contextPath}/Receipt">
        <div class="form-group">
            <label for="inputProductName">Receipt Code</label>
            <input type="number" autofocus class="form-control" id="receipt_id" aria-describedby="productCodeHelp" placeholder="Receipt Code" name="receipt_id" value="" required>
        <c:forEach var="product" items="${productList}" varStatus="status">
            <div class="row mb-1">
                <div class="col-md-2">
                    ${product.productName}
                </div>
                <div class="col-md-2">
                    price: ${product.price} USD
                </div>
            </div>    
        </c:forEach>
        </div>
        <button type="submit" class="btn btn-primary" name="button_action" value="showReceipt">Show receipt details</button>
    </form>
    
</t:pageTemplate>