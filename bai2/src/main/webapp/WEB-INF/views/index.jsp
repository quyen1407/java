<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Todo List</title>
</head>
<body>
<h1>Todo List</h1>
<a href="/todos/new">Add New Todo</a>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Completed</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="todo" items="${todos}">
        <tr>
            <td>${todo.id}</td>
            <td>${todo.title}</td>
            <td>${todo.completed}</td>
            <td>
                <a href="/todos/${todo.id}">View</a>
                <a href="/todos/delete/${todo.id}">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>