<%-- 
    Document   : transaction
    Created on : Jan 9, 2022, 7:03:18 PM
    Author     : No! I AM SPARTACUS
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:pageTemplate pageTitle="Products">
    <c:if test="${transactionMessage != null}">
        <div class="alert alert-warning" role="alert">
            ${transactionMessage}
        </div>
    </c:if>
    <h1>Cart</h1>
    <form method="POST" action="${pageContext.request.contextPath}/Transaction">
        <div class="form-group">
            <label for="inputProductName">Product Code</label>
            <input type="number" autofocus class="form-control" id="product_id" aria-describedby="productCodeHelp" placeholder="Product Code" name="product_id" value="" required>
        </div>
        <button type="submit" class="btn btn-primary" name="button_action" value="addProduct">Add product to cart</button>
    </form>
    <br />
    <br />
    <form method="POST" action="${pageContext.request.contextPath}/Transaction">
        <button class="btn btn-primary" type="submit" name="button_action" value="receipt">Print receipt</button>
        <button class="btn btn-danger" type="submit" name="button_action" value="delete">Delete Products</button>
        <div class="col-md-2">
            price: ${totalValue} USD
        </div>
        <c:forEach var="product" items="${productList}" varStatus="status">
            <div class="row mb-1">
                <div class="col-md-1">
                    <input type="checkbox" name="product_ids_for_delete" value="${product.id}"/>
                </div>
                <div class="col-md">
                    <input type="hidden" name="product_ids" value="${product.id}"/>
                </div> 
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
    </form>



</t:pageTemplate>
