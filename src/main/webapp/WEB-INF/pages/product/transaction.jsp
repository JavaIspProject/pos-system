<%-- 
    Document   : transaction
    Created on : Jan 9, 2022, 7:03:18 PM
    Author     : boo_b
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:pageTemplate pageTitle="Products">
    <h1>Cart</h1>
    <form method="POST" action="${pageContext.request.contextPath}/Transaction">
        <div class="form-group">
            <label for="inputProductName">Product Code</label>
            <input type="number" autofocus class="form-control" id="product_id" aria-describedby="productCodeHelp" placeholder="Product Code" name="product_id" value="" required>
        </div>
        <button type="submit" class="btn btn-primary">Add product to cart</button>
    </form>
    <br />
    <br />
    <form method="POST" action="${pageContext.request.contextPath}/Receipt">
        <button class="btn btn-primary" type="submit">Print receipt</button>
        <c:forEach var="productList" items="${productList}" varStatus="status">
            <div class="row mb-1">
                <div class="col-md">
                    <input type="hidden" name="product_ids" value="${productList.id}"/>
                </div>
                <div class="col-md-2">
                    ${productList.productName}
                </div>
                <div class="col-md-2">
                    price: ${productList.price} USD
                </div>
                <div class="col-md-1">
                    <img src="${pageContext.request.contextPath}/Products/Photos?id=${product.id}" width="48" />
                </div>
            </div>    
        </c:forEach>
    </form>
         
         

</t:pageTemplate>
