<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Todo</title>
</head>
<body>
<h1>Add New Todo</h1>
<form method="post" action="/todos">
    <label>Title: </label>
    <input type="text" name="title" required/><br/>
    <label>Completed: </label>
    <input type="checkbox" name="completed"/><br/>
    <button type="submit">Add Todo</button>
</form>
<a href="/todos">Back to List</a>
</body>
</html>