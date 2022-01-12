<%@page contentType="text/html" pageEncoding="UTF-8"  %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
    <c:when test="${pageContext.request.isUserInRole('DirectorRole')}">
        <c:redirect url="/newCashier"/>
    </c:when>
</c:choose>


<t:pageTemplate pageTitle="POS"> 
    <h1>POS system made by SPARTACUS</h1> 
</t:pageTemplate>

