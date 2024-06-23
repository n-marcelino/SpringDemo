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

<!-- get current session user and cookies -->
<c:set var="quizCompleted" value="false" scope="session"/>
<c:forEach var="cookie" items="${cookies}">
    <c:if test="${cookie.name eq 'quiz_completed'}">
        <c:set var="quizCompleted" value="true" scope="session"/>
    </c:if>
</c:forEach>
<c:if test="${not empty userSession.username}">
    <h1>Welcome, ${userSession.username}</h1>
</c:if>
<c:choose>
    <c:when test="${quizCompleted}">
        <c:set var="linkText" value="Retake a Quiz"/>
    </c:when>
    <c:otherwise>
        <c:set var="linkText" value="Take a Quiz"/>
    </c:otherwise>
</c:choose>

<a href="form">${linkText}</a>

<br>
<a href="grade">View Grades</a>
<br>
<br>
<a href="login">Logout</a>
</body>
</html>
