<%-- 
    Document   : addPhoto
    Created on : Dec 27, 2021, 1:54:48 PM
    Author     : Teo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:pageTemplate pageTitle="Adauga o Poza">
    <h1>Adauga o poza la produs</h1>
    <form class="needs-validation" novalidate method="POST" enctype="multipart/form-data" 
          action="${pageContext.request.contextPath}/Products/AddPhoto">
        <div class="row">
            <div class="col-md-6 mb-3">
                Numele Produsului: ${product.productName}
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="file">Poza</label>
                <input type="file" name="file" required>
                <div class="invalid-feedback">
                    Poza este necesara.
                </div>
            </div>
            <input type="hidden" name="product_id" value="${product.id}" />
            <button type="submit" class="btn btn-primary  btn-lg btn-block" >Salveaza</button>
    </form>
</t:pageTemplate>
