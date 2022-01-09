<%-- 
    Document   : transaction
    Created on : Jan 9, 2022, 7:03:18 PM
    Author     : boo_b
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:pageTemplate pageTitle="Products">
    <h1>Products</h1>
    <form method="POST" action="${pageContext.request.contextPath}/Cars">
        <button class="btn btn-danger" type="submit">Delete Products</button>
        <c:forEach var="product" items="${products}" varStatus="status">
            <div class="row mb-1">
                <c:if test="${pageContext.request.isUserInRole('AdminRole')}">
                <div class="col-md">
                    <input type="checkbox" name="product_ids" value="${product.id}"/>
                </div>
                </c:if>
                <div class="col-md-2">
                    ${product.productName}
                </div>
                <div class="col-md-2">
                    price: ${product.price} USD
                </div>
                <div class="col-md-1">
                    <img src="${pageContext.request.contextPath}/Cars/Photos?id=${product.id}" width="48" />
                </div>
                <c:if test="${pageContext.request.isUserInRole('AdminRole')}">
                <div class="col-md-2">
                    <a class="btn btn-secondary" href="${pageContext.request.contextPath}/Cars/AddPhoto?id=${product.id}" role="button">Add Photo</a>
                </div>
                <div class="col-md-2">
                    <a class="btn btn-secondary" href="${pageContext.request.contextPath}/Cars/EditCar?id=${product.id}" role="button">Edit Product</a>
                </div>
                </c:if>
            </div>    
        </c:forEach>
    </form>
</t:pageTemplate>
