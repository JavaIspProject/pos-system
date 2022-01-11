<%-- 
    Document   : receipt
    Created on : Jan 11, 2022, 7:08:36 PM
    Author     : No! I AM SPARTACUS
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:pageTemplate pageTitle="Receipt">
    <c:if test="${returnMessage != null}">
        <div class="alert alert-warning" role="alert">
            ${returnMessage}
        </div>
    </c:if>
    <h1>Return</h1>
    <form method="POST" action="${pageContext.request.contextPath}/Receipt">
        <div class="form-group">
            <label for="inputProductName">Receipt Code</label>
            <input type="number" autofocus class="form-control" id="receipt_id" aria-describedby="productCodeHelp" placeholder="Receipt Code" name="receipt_id" value="" required>
            <button type="submit" class="btn btn-primary" name="button_action" value="showReceipt">Show receipt details</button>
            <br/>
            <label for="inputProductName">Product Code</label>
            <input type="number" class="form-control" id="receipt_id" aria-describedby="productCodeHelp" placeholder="Product Code" name="product_id" value="">
            <button type="submit" class="btn btn-primary" name="button_action" value="returnProduct">Return product</button>
       </div>
    </form>
    <c:forEach var="product" items="${productList}" varStatus="status">
        <div class="row mb-1">
            <div class="col-md-2">
                ${product.id}
            </div>
            <div class="col-md-2">
                ${product.productName}
            </div>
            <div class="col-md-2">
                price: ${product.price} USD
            </div>
        </div>    
    </c:forEach>

</t:pageTemplate>