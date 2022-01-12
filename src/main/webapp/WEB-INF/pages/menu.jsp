<%-- 
    Document   : menu
    Created on : Oct 27, 2021, 11:00:30 AM
    Author     : No! I AM SPARTACUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- %@ taglib prefix="c" uri="https://java,sun.jsp.jst1/core" %> -->

<nav class="navbar navbar-expand-md navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}">POS system made by SPARTACUS</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav me-auto mb-2 mb-md-0">
                <li class="nav-item ">
                    <a class="nav-link ${activePage eq 'Produse' ? 'active' : ' ' }" href="${pageContext.request.contextPath}/Products">Catalog Produse</a>
                </li>
                <c:if test="${pageContext.request.isUserInRole('AdminRole')}">
                    <li class="nav-item ">
                        <a class="nav-link ${activePage eq 'Categorii' ? 'active' : ' ' }" href="${pageContext.request.contextPath}/Categories">Categorii</a>
                    </li>
                </c:if>
                <c:if test="${pageContext.request.isUserInRole('ClientRole')}">
                    <li class="nav-item ">
                        <a class="nav-link ${activePage eq 'Utilizatori' ? 'active' : ' ' }" href="${pageContext.request.contextPath}/Users">Utilizatori</a>
                    </li>
                </c:if>   
                <c:if test="${pageContext.request.isUserInRole('DirectorRole')}">
                    <li class="nav-item ">
                        <a class="nav-link ${activePage eq 'Verificare casieri' ? 'active' : ' ' }" href="${pageContext.request.contextPath}/newCashier">Verificare casieri</a>
                    </li>
                </c:if> 
                <c:if test="${pageContext.request.isUserInRole('ClientRole')}">
                    <li class="nav-item ">
                        <a class="nav-link ${activePage eq 'Tranzactie' ? 'active' : ' ' }" href="${pageContext.request.contextPath}/Transaction">Tranzactie</a>
                    </li>
                </c:if> 
                <c:if test="${pageContext.request.isUserInRole('ClientRole')}">
                    <li class="nav-item ">
                        <a class="nav-link ${activePage eq 'Retur' ? 'active' : ' ' }" href="${pageContext.request.contextPath}/Receipt">Retur</a>
                    </li>
                </c:if> 
            </ul>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <c:choose>
                        <c:when test="${pageContext.request.getRemoteUser() == null}">
                            <a class="nav-link" href="${pageContext.request.contextPath}/Login">Login</a>
                        </c:when>
                        <c:otherwise>
                            <a class="nav-link" href="${pageContext.request.contextPath}/Logout">Logout</a>
                        </c:otherwise>
                    </c:choose> 
                </li>
            </ul>
            </ul>
        </div>
    </div>
</nav>