<%-- 
    Document   : editCar
    Created on : Nov 23, 2021, 6:38:48 PM
    Author     : Teo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:pageTemplate pageTitle="Edit Product">
    <h1>Edit Product</h1>
        <form class="needs-validation" novalidate method="POST" action="${pageContext.request.contextPath}/EditProduct">
        <div class="form-group">
            <label for="inputProductName">Product Name</label>
            <input type="text" class="form-control" id="product_name" aria-describedby="productNameHelp" placeholder="Product Name" name="product_name" value="${product.productName}" required>
        </div>
        <div class="form-group">
            <label for="inputProductValue">Price</label>
            <input type="number" class="form-control" id="product_value" aria-describedby="priceHelp" placeholder="Price" name="product_value" value="${product.price}" required>
        </div>
        <div class="form-group">
            <div class="col-md-6 mb-3">
                <label for="owner_id">Category</label>
                <select class="custom-select d-block w-100" id="owner_id" name="category_name" required>
                    <option value="${product.categoryName}">${product.categoryName}</option>
                    <c:forEach var="categories" items="${categories}" varStatus="status">
                        <option value="${categories.categoryName}">${categories.categoryName}</option>
                    </c:forEach>
                </select>
                <div class="invalid-feedback">Please select an owner.</div>
            </div>
        </div>
        <div class="form-group">
            <input type="hidden" name="product_id" value="${product.id}" />
            <button type="submit" class="btn btn-primary " >Save</button>
        </div>
    </form>
</t:pageTemplate>
