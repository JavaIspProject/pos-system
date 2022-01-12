<%-- 
    Document   : addProduct
    Created on : Nov 17, 2021, 11:25:02 AM
    Author     : Teo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:pageTemplate pageTitle="Adauga Produs">
    <h1>Adauga Produs</h1>
    <form class="needs-validation" noValidate method="POST" action="${pageContext.request.contextPath}/AddCar">
        <div class="form-group">
            <label for="inputProductName">Product Name</label>
            <input type="text" class="form-control" id="product_name" aria-describedby="productNameHelp" placeholder="Product Name" name="product_name" value="" required>
        </div>
        <div class="form-group">
            <label for="inputProductValue">Price</label>
            <input type="number" class="form-control" id="product_value" aria-describedby="priceHelp" placeholder="Price" name="product_value" value="" required>
        </div>
        <div class="form-group">
            <div class="col-md-6 mb-3">
                <label for="owner_id">Categorie</label>
                <select class="custom-select d-block w-100" id="category_id" name="category_name">
                    <option value=" ">Alegeti...</option>
                    <c:forEach var="categories" items="${categories}" varStatus="status">
                        <option value="${categories.categoryName}">${categories.categoryName}</option>
                    </c:forEach>
                </select>
                <div class="invalid-feedback">Selectati o categorie.</div>
            </div>
        </div>
        <button type="submit" class="btn btn-primary">Salveaza</button>
    </form>
    <script>
        (function () {
            'use strict';
            window.addEventListener('load', function () {
                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                var forms = document.getElementsByClassName('needs-validation');

                // Loop over them and prevent submission
                Array.prototype.filter.call(forms, function (form) {
                    form.addEventListener('submit', function (event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();
    </script>
</t:pageTemplate>


