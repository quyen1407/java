<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Trang Chào Mừng</title>
</head>
<body>
<h1>Thông điệp: <c:out value="${welcome.message}" /></h1>
<h2>Thời gian hiện tại: <c:out value="${welcome.currentTime}" /></h2>
</body>
</html>
