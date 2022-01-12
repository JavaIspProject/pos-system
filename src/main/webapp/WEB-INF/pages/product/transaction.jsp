<%-- 
    Document   : transaction
    Created on : Jan 9, 2022, 7:03:18 PM
    Author     : No! I AM SPARTACUS
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:pageTemplate pageTitle="Transactie">
    <c:if test="${transactionMessage != null}">
        <div class="alert alert-warning" role="alert">
            ${transactionMessage}
        </div>
    </c:if>
    <h1>Cos</h1>
    <form method="POST" action="${pageContext.request.contextPath}/Transaction">
        <div class="form-group">
            <label for="inputProductName">Codul Produsuli</label>
            <input type="number" autofocus class="form-control" id="product_id" aria-describedby="productCodeHelp" placeholder="Codul de bare al produsului" name="product_id" value="" required>
        </div>
        <button type="submit" class="btn btn-primary" name="button_action" value="addProduct">Adauga un produs in cos</button>
    </form>
    <br />
    <br />
    <form method="POST" action="${pageContext.request.contextPath}/Transaction">
        <button class="btn btn-primary" type="submit" name="button_action" value="receipt">Scoate Bon</button>
        <button class="btn btn-danger" type="submit" name="button_action" value="delete">Elimina produse din cos</button>
        <div class="col-md-2">
            Pret: ${totalValue} RON
        </div>
        <div class="row mb-1">
            <div class="col-md-1">
                <h5></h5>
            </div>
            <div class="col-md-3">
                <h5></h5>
            </div> 
            <div class="col-md-2">
                <h5>Cod bare</h5>
            </div>
            <div class="col-md-2">
                <h5>Nume</h5>
            </div>
            <div class="col-md-2">
                <h5>Pret</h5>
            </div>
        </div> 
        <c:forEach var="product" items="${productList}" varStatus="status">
            <div class="row mb-1">
                <div class="col-md-1">
                    <input type="checkbox" name="product_ids_for_delete" value="${product.id}"/>
                </div>
                <div class="col-md-3">
                    <input type="hidden" name="product_ids" value="${product.id}"/>
                </div> 
                <div class="col-md-2">
                    ${product.id}
                </div>
                <div class="col-md-2">
                    ${product.productName}
                </div>
                <div class="col-md-2">
                    ${product.price} RON
                </div>
            </div>    
        </c:forEach>
    </form>



</t:pageTemplate>
