<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:pageTemplate pageTitle="List of Products">
    <h1>Products</h1>
    <form method="POST" action="${pageContext.request.contextPath}/ProductList">
        <c:forEach var="product" items="${products}" varStatus="status">
            <div class="row mb-1">
<!--                <div class="col-md">
                    <input type="checkbox" name="product_ids" value="${product.id}"/>
                </div>-->
                <div class="col-md-2">
                    ${product.productName}
                </div>
                <div class="col-md-2">
                    price: ${product.price} USD
                </div>
<!--                <div class="col-md-1">
                    <img src="${pageContext.request.contextPath}/Cars/Photos?id=${product.id}" width="48" />
                </div>-->
            </div>    
        </c:forEach>
    </form>
</t:pageTemplate>