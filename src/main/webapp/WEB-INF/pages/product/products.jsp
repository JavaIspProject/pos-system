<%-- 
    Document   : car
    Created on : Nov 3, 2021, 11:23:29 AM
    Author     : Teo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:pageTemplate pageTitle="Produse">
    <h1>Produse</h1>
    <form method="POST" action="${pageContext.request.contextPath}/Products">
        <c:if test="${pageContext.request.isUserInRole('AdminRole')}">
            <a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/AddCar" role="button">Adauga Produs</a> 
        </c:if>
        <c:if test="${pageContext.request.isUserInRole('AdminRole')}">
            <button class="btn btn-danger" type="submit">Sterge Produs(e)</button>
        </c:if>
        <div class="row mb-1">
            <div class="col-md-1">
                <h5></h5>
            </div>
            <div class="col-md-1">
                <h5>Cod bare</h5>
            </div>
            <div class="col-md-1">
                <h5>Nume</h5>
            </div>
            <div class="col-md-2">
                <h5>Pret</h5>
            </div>
            <div class="col-md-2">
                <h5>Categorie</h5> 
            </div>
            <div class="col-md-2">
                <h5>Imagine</h5>
            </div>
        </div>
        <c:forEach var="product" items="${products}" varStatus="status">
            <div class="row mb-1">
                <c:if test="${pageContext.request.isUserInRole('AdminRole')}">
                    <div class="col-md-1">
                        <input type="checkbox" name="product_ids" value="${product.id}"/>
                    </div>
                </c:if>
                <div class="col-md-1">
                    ${product.id}
                </div>
                <div class="col-md-1">
                    ${product.productName}
                </div>
                <div class="col-md-2">
                    price: ${product.price} RON
                </div>
                <div class="col-md-2">
                    ${product.categoryName} 
                </div>
                <div class="col-md-1">
                    <img src="${pageContext.request.contextPath}/Products/Photos?id=${product.id}" width="48" />
                </div>
                <c:if test="${pageContext.request.isUserInRole('AdminRole')}">
                    <div class="col-md-2">
                        <a class="btn btn-secondary" href="${pageContext.request.contextPath}/Products/AddPhoto?id=${product.id}" role="button">Adauga Poza</a>
                    </div>
                    <div class="col-md-2">
                        <a class="btn btn-secondary" href="${pageContext.request.contextPath}/EditProduct?id=${product.id}" role="button">Editeaza Produsul</a>
                    </div>
                </c:if>
            </div>    
        </c:forEach>
    </form>
</t:pageTemplate>
