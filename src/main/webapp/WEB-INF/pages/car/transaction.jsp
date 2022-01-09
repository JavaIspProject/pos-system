<%-- 
    Document   : transaction
    Created on : Jan 9, 2022, 7:03:18 PM
    Author     : boo_b
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:pageTemplate pageTitle="Products">
    <c:if test="${transactionMessage != null}">
        <div class="alert alert-warning" role="alert">
            ${message}
        </div>
    </c:if>
    <h1>Products</h1>
    <form method="POST" action="${pageContext.request.contextPath}/Transaction">
        <div class="form-group">
            <label for="inputProductName">Product Code</label>
            <input type="number" autofocus class="form-control" id="product_id" aria-describedby="productCodeHelp" placeholder="Product Code" name="product_id" value="" required>
        </div>
        <button type="submit" class="btn btn-primary">Add product to cart</button>
    </form>
    <br />
    <br />
    <c:forEach var="productList" items="${productList}" varStatus="status">
            <div class="row mb-1">
                <c:if test="${pageContext.request.isUserInRole('AdminRole')}">
                <div class="col-md">
                    <input type="checkbox" name="product_ids" value="${productList.id}"/>
                </div>
                </c:if>
                <div class="col-md-2">
                    ${productList.productName}
                </div>
                <div class="col-md-2">
                    price: ${productList.price} USD
                </div>
                <div class="col-md-1">
                    <img src="${pageContext.request.contextPath}/Cars/Photos?id=${productList.id}" width="48" />
                </div>
            </div>    
        </c:forEach>
</t:pageTemplate>
