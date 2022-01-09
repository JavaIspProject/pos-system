<%-- 
    Document   : addProduct
    Created on : Nov 17, 2021, 11:25:02 AM
    Author     : Teo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:pageTemplate pageTitle="Add Product">
    <h1>Add Product</h1>
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
                <label for="owner_id">Owner</label>
                <select class="custom-select d-block w-100" id="owner_id" name="owner_id">
                    <option value="">choose...</option>
                    <c:forEach var="user" items="${users}" varStatus="status">
                        <option value="${user.id}">${user.username}</option>
                    </c:forEach>
                </select>
                <div class="invalid-feedback">Please select an owner.</div>
            </div>
        </div>
            <form class="needs-validation" novalidate method="POST" enctype="multipart/form-data" 
          action="${pageContext.request.contextPath}/Cars/AddPhoto">
        <div class="row">
            <div class="col-md-6 mb-3">
                License plate: ${product.productName}
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="file">Photo</label>
                <input type="file" name="file" required>
                <div class="invalid-feedback">
                    Photo is required.
                </div>
            </div>
            <input type="hidden" name="product_id" value="${product.id}" />
        <div class="form-group">
            <button type="submit" class="btn btn-primary">Save</button>
        </div>
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


