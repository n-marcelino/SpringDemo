<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<style>
form {
	display: table;
}

.row {
	display: table-row;
}

label {
	display: table-cell;
}

input {
	display: table-cell;
}
</style>
</head>
<body>

	<form action="login" method="post">
		<p class="row">
			<label for="username">Username:</label> <input type="text"
				id="username" name="username"><br>
		</p>
		<br>
		<p class="row">
			<label for="password">Password:</label> <input type="password"
				id="password" name="password"><br>
		</p>
		<br>

		<p class="row">
		<div style="display: table-cell"></div>
		<div class="form-actions" style="display: table-cell">
			<button type="submit" value="submit">Login</button>
			<button type="reset" value="reset">Clear</button>
		</div>
		</p>

	</form>

	<c:if test="${not empty param.error}">
		<p>${param.error}</p>
	</c:if>
</body>
</html>