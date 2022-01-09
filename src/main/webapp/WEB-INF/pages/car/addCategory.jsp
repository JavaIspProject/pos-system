<%-- 
    Document   : addCategory
    Created on : Jan 9, 2022, 3:58:38 PM
    Author     : Teo
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:pageTemplate pageTitle="Add Category">
    <h1>Add Category</h1>
    <form class="needs-validation" novalidate method="POST" action="${pageContext.request.contextPath}/AddCategory">
        <div class="row">
            <div class="col-md-6 mb-3">
                <div class="form-group">
                    <label for="category_name">Category Name</label>
                    <input type="text" class="form-control" id="category_name" aria-describedby="categoryNameHelp" placeholder="Category Name" name="category_name" value=""  required>
                </div>
            </div>
            <input type="hidden" name="category_id" value="${category.id}" />
            <button type="submit" class="btn btn-primary  btn-lg btn-block" >Save</button>
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

