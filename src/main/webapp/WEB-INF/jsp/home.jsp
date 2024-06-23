<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Home</title>
</head>
<body>

<c:if test="${not empty userSession.username}">
    <h1>Welcome, ${userSession.username}</h1>
</c:if>

<c:choose>
    <c:when test="${userSession.quizCompleted}">
        <c:set var="linkText" value="Retake a Quiz"/>
    </c:when>
    <c:otherwise>
        <c:set var="linkText" value="Take a Quiz"/>
    </c:otherwise>
</c:choose>

<a href="quiz">${linkText}</a>

<br>
<a href="grade">View Grades</a>
<br>
<br>
<a href="logout">Logout</a>
</body>
</html>
