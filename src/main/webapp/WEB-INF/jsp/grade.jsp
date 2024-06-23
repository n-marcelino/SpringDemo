<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Grade</title>
</head>
<style>
table, th, td {
	border: 1px solid black;
}
</style>
<body>
	<h1>Grade Page</h1>

	<%
	// Dummy grades data
	Map<String, Integer> grades = new HashMap<>();
	grades.put("Admin", 90);
	grades.put("John", 80);
	grades.put("Mary", 100);
	grades.put("Peter", 80);

	// Current user's grades data
	String username = (String) session.getAttribute("user_name");
	String grade = "N/A"; // Default value if no grade is found

	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (Cookie cookie : cookies) {
			if ("quiz_result".equals(cookie.getName())) {
		grade = cookie.getValue();
		break;
			}
		}
	}

	// Adding the user's grades to hasmap if available
	if (username != null && !grade.equals("N/A")) {
		grades.put(username, (int) Double.parseDouble(grade));
	}

	// Sort the grades by value in descending order
	List<Map.Entry<String, Integer>> sortedGrades = new ArrayList<>(grades.entrySet());
	sortedGrades.sort((entry1, entry2) -> entry2.getValue().compareTo(entry1.getValue()));

	pageContext.setAttribute("grades", sortedGrades);
	%>

	<table>
		<tr>
			<th>Username</th>
			<th>Grade</th>
		</tr>
		<c:forEach items="${grades}" var="entry">
			<tr>
				<td>${entry.key}</td>
				<td>${entry.value}</td>
			</tr>
		</c:forEach>
	</table>
	
	<br>
	<a href="home.jsp">Return home</a>
	<br>

</body>
</html>