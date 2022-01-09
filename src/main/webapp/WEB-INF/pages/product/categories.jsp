<%-- 
    Document   : categories
    Created on : Jan 9, 2022, 4:51:20 PM
    Author     : Teo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:pageTemplate pageTitle="Categories">
    <h1>Categories</h1>
    <form method="POST" action="${pageContext.request.contextPath}/Categories">
        <c:if test="${pageContext.request.isUserInRole('AdminRole')}">
            <a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/AddCategory" role="button">Add Category</a>
            <button class="btn btn-danger" type="submit">Delete Products</button>
        </c:if>
        <c:forEach var="category" items="${categories}" varStatus="status">
            <div class="row">
                <div class="col-md">
                    <input type="checkbox" name="category_ids" value="${category.id}" />
                </div>
                <div class="col-md-4">
                    ${category.categoryName}
                </div>
            </div>
        </c:forEach>
    </form>
</t:pageTemplate>
