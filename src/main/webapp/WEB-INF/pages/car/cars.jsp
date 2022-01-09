<%-- 
    Document   : car
    Created on : Nov 3, 2021, 11:23:29 AM
    Author     : Teo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:pageTemplate pageTitle="Products">
    <h1>Products</h1>
    <form method="POST" action="${pageContext.request.contextPath}/Cars">
        <a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/AddCar" role="button">Add Product</a> 
        <button class="btn btn-danger" type="submit">Delete Products</button>
        <c:forEach var="product" items="${products}" varStatus="status">
            <div class="row mb-1">
                <div class="col-md">
                    <input type="checkbox" name="product_ids" value="${product.id}"/>
                </div>
                <div class="col-md-2">
                    ${product.productName}
                </div>
                <div class="col-md-2">
                    price: ${product.price} USD
                </div>
<!--                <div class="col-md-2">
                   dollarsign{product.username}
                </div>-->
                <div class="col-md-1">
                    <img src="${pageContext.request.contextPath}/Cars/Photos?id=${product.id}" width="48" />
                </div>
<!--                <div class="col-md-2">
                    <a class="btn btn-secondary" href="${pageContext.request.contextPath}/Cars/AddPhoto?id=${product.id}" role="button">Add Photo</a>
                </div>-->
                <div class="col-md-2">
                    <a class="btn btn-secondary" href="${pageContext.request.contextPath}/Cars/EditCar?id=${product.id}" role="button">Edit Product</a>
                </div>
            </div>    
        </c:forEach>
    </form>
</t:pageTemplate>
