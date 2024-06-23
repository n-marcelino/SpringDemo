<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Quiz</title>
</head>
<body>

<form action="submitQuiz" method="post">
	<c:forEach var="question" items="${questions}" varStatus="loop">
		<h3>${question.questionText}</h3>
		<c:forEach var="choice" items="${question.choices}" varStatus="choiceLoop">
			<input type="radio" id="answers_${loop.index}_option${choiceLoop.index}" name="answers_${loop.index}" value="${choice}">
			<label for="answers_${loop.index}_option${choiceLoop.index}">${choice}</label><br>
		</c:forEach>
		<br>
	</c:forEach>

	<div class="form-actions">
		<button type="reset" value="Reset">Reset</button>
		<button type="submit">Submit</button>
	</div>
</form>

</body>
</html>
