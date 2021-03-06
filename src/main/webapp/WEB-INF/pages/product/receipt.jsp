<%-- 
    Document   : receipt
    Created on : Jan 11, 2022, 7:08:36 PM
    Author     : No! I AM SPARTACUS
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:pageTemplate pageTitle="Bon">
    <c:if test="${returnMessage != null}">
        <div class="alert alert-warning" role="alert">
            ${returnMessage}
        </div>
    </c:if>
    <h1>Returneaza unul sau mai multe produse</h1>
    <form method="POST" action="${pageContext.request.contextPath}/Receipt">
        <div class="form-group">
            <label for="inputProductName">Codul Bonului</label>
            <input type="number" autofocus class="form-control" id="receipt_id" aria-describedby="productCodeHelp" placeholder="Cod bon" name="receipt_id" value="" required>
            <button type="submit" class="btn btn-primary" name="button_action" value="showReceipt">Afiseaza Detaliile Bonului</button>
            <br/>
            <label for="inputProductName">Codul Produsului</label>
            <input type="number" class="form-control" id="receipt_id" aria-describedby="productCodeHelp" placeholder="Codul de bare al produsului" name="product_id" value="">
            <button type="submit" class="btn btn-primary" name="button_action" value="returnProduct">Returneaza Produs</button>
        </div>
    </form>
    <div class="row mb-1">
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

</t:pageTemplate>