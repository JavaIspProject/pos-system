<%-- 
    Document   : editCar
    Created on : Nov 23, 2021, 6:38:48 PM
    Author     : Teo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:pageTemplate pageTitle="Edit Car">
    <h1>Edit Car</h1>
        <form class="needs-validation" novalidate method="POST" action="${pageContext.request.contextPath}/Cars/EditCar">
        <div class="form-group">
            <label for="inputLicensePlate">License Plate</label>
            <input type="text" class="form-control" id="license_plate" aria-describedby="licensePlateHelp" placeholder="License Plate" name="license_plate" value="${car.licensePlate}" required>
        </div>
        <div class="form-group">
            <label for="inputParkingSpot">Parking Spot</label>
            <input type="text" class="form-control" id="parking_spot" aria-describedby="parkingSpotHelp" placeholder="Parking Spot" name="parking_spot" value="${car.parkingSpot}" required>
        </div>
        <div class="form-group">
            <div class="col-md-6 mb-3">
                <label for="owner_id">Owner</label>
                <select class="custom-select d-block w-100" id="owner_id" name="owner_id">
                    <option value="">choose...</option>
                    <c:forEach var="user" items="${users}" varStatus="status">
                        <option value="${user.id}" ${car.username eq user.username ? 'selected' : ''}>${user.username}</option>
                    </c:forEach>
                </select>
                <div class="invalid-feedback">Please select an owner.</div>
            </div>
        </div>
        <div class="form-group">
            <input type="hidden" name="car_id" value="${car.id}" />
            <button type="submit" class="btn btn-primary " required>Save</button>
        </div>
    </form>
</t:pageTemplate>
