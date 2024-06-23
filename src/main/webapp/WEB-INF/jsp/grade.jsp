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
	<a href="/">Return home</a>
	<br>

</body>
</html>