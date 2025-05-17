<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Đăng ký</title>

    <!-- Link Bootstrap 5 (CDN) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">

            <div class="card shadow">
                <div class="card-header bg-primary text-white text-center">
                    <h4>Form Đăng Ký</h4>
                </div>
                <div class="card-body">

                    <c:if test="${not empty error}">
                        <div class="alert alert-danger">${error}</div>
                    </c:if>

                    <%-- Biến user được map vào đây --%>
                    <form:form method="POST" modelAttribute="user">
                        <div class="mb-3">
                            <label class="form-label">Username:</label>
                            <form:input path="username" cssClass="form-control"/>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Password:</label>
                            <form:password path="password" cssClass="form-control"/>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Email:</label>
                            <form:input path="email" cssClass="form-control"/>
                        </div>

                        <div class="d-grid">
                            <button type="submit" class="btn btn-success">Đăng ký</button>
                        </div>
                    </form:form>
                </div>
            </div>

        </div>
    </div>
</div>

</body>
</html>
