<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Random"%>
<%@ page import="util.Question"%>
<%@ page import="util.ShuffleUtil"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HTML Form Data</title>
</head>
<body>
	<%
	Question[] questions = new Question[] {
			new Question("What country has the highest life expectancy?",
			new String[] { "Philippines", "Hong Kong", "USA", "Singapore" }),
			new Question("How many elements are in the periodic table?", new String[] { "119", "118", "117", "120" }),
			new Question("Who was the Ancient Greek God of the Sun?",
			new String[] { "Athena", "Hades", "Apollo", "Venus" }),
			new Question("What country drinks the most coffee per capita?",
			new String[] { "Russia", "China", "USA", "Finland" }),
			new Question("What Renaissance artist is buried in Rome's Pantheon?",
			new String[] { "Donatello", "Leonardo", "Michelangelo", "Raphael" }) };

	ShuffleUtil.shuffleArray(questions);
	for (Question question : questions) {
		ShuffleUtil.shuffleArray(question.getChoices());
	}

	pageContext.setAttribute("allQuestions", questions);
	%>

	<form action="result.jsp" method="post">
		<c:forEach var="question" items="${allQuestions}" varStatus="loop">
			<label for="question${loop.index + 1}">${question.question}</label> <br>
			<c:forEach var="choice" items="${question.choices}"
				varStatus="choiceLoop">
				<input type="radio"
					id="question${loop.index + 1}_option${choiceLoop.index + 1}"
					name="question${loop.index + 1}" value="${choice}">
				<label for="question${loop.index + 1}_option${choiceLoop.index + 1}">${choice}</label>
				<br>
			</c:forEach>
			<br>
		</c:forEach>

		<div class="form-actions">
		<br>
			<button type="reset" value="Reset">Reset</button>
			<button type="submit">Submit</button>
		</div>
	</form>

</body>
</html>
