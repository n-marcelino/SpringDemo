<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
</head>
<body>
<h1>${message}</h1>
<c:if test="${not empty userSession.username}">
    <p>Welcome, ${userSession.username}! (<a href="logout">Logout</a>)</p>
</c:if>
</body>
</html>
