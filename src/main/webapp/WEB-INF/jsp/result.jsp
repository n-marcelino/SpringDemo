<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Result</title>
</head>
<body>

	<h1>Quiz Result</h1>

	<c:set var="correctAnswers"
		value="${{'Hong Kong', '120', 'Apollo', 'Raphael', 'Finland'}}" />

	<c:set var="userAnswers">
		<c:set var="param1" value="${param.question1}" />
		<c:set var="param2" value="${param.question2}" />
		<c:set var="param3" value="${param.question3}" />
		<c:set var="param4" value="${param.question4}" />
		<c:set var="param5" value="${param.question5}" />
        ${param1},${param2},${param3},${param4},${param5}
	</c:set>

	<c:set var="userAnswersArray" value="${fn:split(userAnswers, ',')}" />

	<c:set var="score" value="0" />
	<c:forEach var="userAnswer" items="${userAnswersArray}"
		varStatus="loop">
		<c:forEach var="correctAnswer" items="${correctAnswers}">
			<c:if test="${not empty userAnswer && userAnswer eq correctAnswer}">
				<c:set var="score" value="${score + 1}" />
			</c:if>
		</c:forEach>
	</c:forEach>

	<c:set var="totalQuestions" value="${fn:length(correctAnswers)}" />
	<c:set var="percentage" value="${(score / totalQuestions) * 100}" />

	<p>Your score: ${score} out of ${totalQuestions}</p>
	<p>Your percentage: ${String.format('%.2f', percentage)}%</p>

	<a href="home.jsp">Return home</a>
	<br>

	<c:set var="quizCompletedCookie" value="true" scope="page" />
	<c:set var="percentageFormatted"
		value="${String.format('%.2f', percentage)}" />
		
	<c:set var="quizResultCookie" value="${cookie['quiz_result']}" />
	<c:if test="${empty quizResultCookie}">
		<c:set var="quizResultCookie" value="${percentageFormatted}" />
	</c:if>
	<c:set var="quizResultCookie" value="${percentageFormatted}" />
	<c:set var="quizResultCookie" value="${percentageFormatted}" />
	
	<%
	Cookie quizCompletedCookie = new Cookie("quiz_completed", (String) pageContext.getAttribute("quizCompletedCookie"));
    quizCompletedCookie.setMaxAge(60 * 60 * 24 * 365); 
	response.addCookie(quizCompletedCookie);

	Cookie quizResultCookie = new Cookie("quiz_result", (String) pageContext.getAttribute("quizResultCookie"));
	quizCompletedCookie.setMaxAge(60 * 60 * 24 * 365); 
	response.addCookie(quizResultCookie);
	%>


</body>
</html>