<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("UTF-8");

    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String isSubmitted = request.getParameter("isSubmitted");

    String alertMessage = null;

    if ("POST".equalsIgnoreCase(request.getMethod()) && isSubmitted != null) {
        if (username == null || username.trim().isEmpty()) {
            alertMessage = "Tên đăng nhập không được để trống!";
        } else if (password == null || password.trim().isEmpty()) {
            alertMessage = "Mật khẩu không được để trống!";
        } else if ("admin".equals(username) && "123".equals(password)) {
            session.setAttribute("username", username);
            response.sendRedirect("welcome.jsp");
            return;
        } else {
            alertMessage = "Tên đăng nhập hoặc mật khẩu không chính xác!";
        }
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
    </style>
</head>
<body>


<% if (alertMessage != null) { %>
    <script>
        alert("<%= alertMessage %>");
    </script>
<% } %>

<div class="container">
    <form class="login-form" action="login.jsp" method="post">
        <h3 class="text-center mb-4">Đăng nhập</h3>

        <div class="form-group">
            <label for="username">Tên đăng nhập</label>
            <input type="text" class="form-control" id="username" name="username"
                   placeholder="Nhập tên đăng nhập" value="<%= username != null ? username : "" %>">
        </div>

        <div class="form-group">
            <label for="password">Mật khẩu</label>
            <input type="password" class="form-control" id="password" name="password"
                   placeholder="Nhập mật khẩu">
        </div>

        
        <input type="hidden" name="isSubmitted" value="true"/>

        <button type="submit" class="btn btn-primary btn-block">Đăng nhập</button>
    </form>
</div>
</body>
</html>
