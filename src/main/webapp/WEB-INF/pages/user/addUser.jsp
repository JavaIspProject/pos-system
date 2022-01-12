<%-- 
    Document   : addUser
    Created on : Dec 22, 2021, 10:36:30 AM
    Author     : Teo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:pageTemplate pageTitle="Add User">
    <h1>Add User</h1>
    <form class="needs-validation" novalidate method="POST" action="${pageContext.request.contextPath}/AddUser">
        <div class="row">
            <div class=" col-md-6 mb-3">
                <label for="username ">Username</label>
                <input type="text" class="form-control" id="username" name="username" placeholder="" value="" required>
                <div class="invalid-feedback">
                    Username necesar.
                </div>
            </div>
        </div>
        <div class=" row">
            <div class=" col-md-6 mb-3">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="" value="" required>
                <div class="invalid-feedback">
                    Email necesar.
                </div>
            </div>
        </div>
        <div class="row">
            <div class=" col-md-6 mb-3">
                <label for="password "> Parola</label>
                <input type="password" class=" form-control" id="password" name="password" placeholder="" value="" required>
                <div class="invalid-feedback">
                    Parola este necesara.
                </div>
            </div>
        </div>
        <div class="row">
            <div class=" col-md-6 mb-3">
                <label for="position ">Pozitie</label>
                <select class="custom-select d-block w-100" id="position" name="position" required>
                    <option value=" ">Alege...</option>
                    <option value="ADMINISTRATOR">Administrator</option>
                    <option value="DIRECTOR">Director</option>
                    <option value="NOT_CASHIER">Casier</option>
                </select>
                <div class="invalid-feedback">
                    Please select a position.
                </div>
            </div>
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-primary " required>Salveaza</button>
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
