<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    request.setCharacterEncoding("UTF-8");

    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang Chào Mừng</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .welcome-box {
            max-width: 400px;
            margin: 100px auto;
            padding: 30px;
            border: 1px solid #28a745;
            border-radius: 10px;
            background-color: #e9ffe9;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="welcome-box text-center">
        <h3 class="text-success">Đăng nhập thành công!</h3>
        <p>Chào mừng</p>
        <a href="logout.jsp" class="btn btn-danger btn-block">Đăng xuất</a>
    </div>
</div>
</body>
</html>
