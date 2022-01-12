<%-- 
    Document   : newKasheer
    Created on : Jan 9, 2022, 2:38:40 PM
    Author     : boo_b
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:pageTemplate pageTitle="Accepta Casier">
    <h1>Casieri in Asteptare</h1>
    <form method="POST" action="${pageContext.request.contextPath}/newCashier">
        <button class="btn btn-secondary" type="submit">Aproba casieri noi</button>
        <div class="row">
            <div class="col-md">
                <h3></h3>
            </div>
            <div class="col-md-4">
                <h3>Nume</h3>
            </div>
            <div class="col-md-4">
                <h3>Email</h3>
            </div>
            <div class="col-md-3">
                <h3>Pozitie</h3>
            </div>
        </div>
        <c:forEach var="user" items="${users}" varStatus="status">
            <c:if test="${user.position.equals('NOT_CASHIER')}">
                <div class="row">
                    <div class="col-md">
                        <input type="checkbox" name="user_ids" value="${user.id}" />
                    </div>
                    <div class="col-md-4">
                        ${user.username}
                    </div>
                    <div class="col-md-4">
                        ${user.email}
                    </div>
                    <div class="col-md-3">
                        ${user.position}
                    </div>
                </div>
            </c:if>
        </c:forEach>
    </form>
    <c:forEach var="username" items="${invoices}" varStatus="status">
        ${username}
    </c:forEach>
</t:pageTemplate>
