<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    request.setCharacterEncoding("UTF-8");

    String username = request.getParameter("username");
    String password = request.getParameter("password");

    String usernameError = null;
    String passwordError = null;
    String loginError = null;

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        if (username == null || username.trim().isEmpty()) {
            usernameError = "Tên đăng nhập không được để trống!";
        } else if (password == null || password.trim().isEmpty()) {
            passwordError = "Mật khẩu không được để trống!";
        } else if ("admin".equals(username) && "123".equals(password)) {
            session.setAttribute("username", username);
            response.sendRedirect("welcome.jsp");
            return;
        } else {
            loginError = "Tên đăng nhập hoặc mật khẩu không chính xác!";
        }

        request.setAttribute("usernameError", usernameError);
        request.setAttribute("passwordError", passwordError);
        request.setAttribute("loginError", loginError);
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .login-form {
            max-width: 400px;
            margin: 100px auto;
            padding: 30px;
            border: 1px solid #ddd;
            border-radius: 10px;
            background-color: #f9f9f9;
        }
        .error-message {
            color: red;
            font-size: 0.9em;
        }
    </style>
</head>
<body>
<div class="container">
    <form class="login-form" action="login.jsp" method="post">
        <h3 class="text-center mb-4">Đăng nhập</h3>

        <c:if test="${not empty loginError}">
            <p class="text-center text-danger"><c:out value="${loginError}"/></p>
        </c:if>

        <div class="form-group">
            <label for="username">Tên đăng nhập</label>
            <input type="text" class="form-control" id="username" name="username"

                   placeholder="Nhập tên đăng nhập">
            <c:if test="${not empty usernameError}">
                <span class="error-message"><c:out value="${usernameError}"/></span>
            </c:if>
        </div>

        <div class="form-group">
            <label for="password">Mật khẩu</label>
            <input type="password" class="form-control" id="password" name="password"
                   placeholder="Nhập mật khẩu">
            <c:if test="${not empty passwordError}">
                <span class="error-message"><c:out value="${passwordError}"/></span>
            </c:if>
        </div>

        <button type="submit" class="btn btn-primary btn-block">Đăng nhập</button>
    </form>
</div>
</body>
</html>
