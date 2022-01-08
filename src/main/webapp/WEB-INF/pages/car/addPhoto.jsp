<%-- 
    Document   : addPhoto
    Created on : Dec 27, 2021, 1:54:48 PM
    Author     : Teo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:pageTemplate pageTitle="Add Car">
    <h1>Add Photo</h1>
    <form class="needs-validation" novalidate method="POST" enctype="multipart/form-data" 
          action="${pageContext.request.contextPath}/Cars/AddPhoto">
        <div class="row">
            <div class="col-md-6 mb-3">
                License plate: ${car.licensePlate}
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
            <input type="hidden" name="car_id" value="${car.id}" />
            <button type="submit" class="btn btn-primary  btn-lg btn-block" >Save</button>
    </form>
</t:pageTemplate>
