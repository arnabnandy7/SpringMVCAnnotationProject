<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Personal Information</title>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

.input {
	width: 200px;
	height: 28px;
}

.input1 {
	width: 200px;
	height: 28px;
	background-color: #ffffcc;
}
</style>
</head>
<body>
	<div
		style="width: 100%; height: 30px; background-color: gray; line-height: 30px;">
		<div style="height: 30px; float: right; text-align: right;">
			<table>
				<tr>
					<td style="text-align: right;"><b>Welcome! ${welcomeMessage}</b></td>
					<td style="text-align: right;"><a href=${pageContext.request.contextPath}/logout>Logout</a></td>
				</tr>
			</table>
		</div>
	</div>
	<header>
		<h2>Update Info</h2>
	</header>
	<br>
	<div>
		<c:set var="emp" value="${key1}" />
		<form action=${pageContext.request.contextPath}/updateUserInformation method="post">
			<table>
				<tr height="30px">
					<td width="150px"><label>First Name</label></td>
					<td width="350px"><input type="text" id="fname" name="fname"
						value="${emp.fname}" class="input1"
						pattern="[A-Za-z][a-zA-Z\s]{2,15}"
						title="Must contains 2-15 alphabets incuding spaces"
						readonly="readonly" required></td>
				</tr>
				<tr height="30px">
					<td width="150px"><label>Last Name</label></td>
					<td width="350px"><input type="text" id="lname" name="lname"
						value="${emp.lname}" class="input1"
						pattern="[A-Za-z][a-zA-Z\s]{2,15}"
						title="Must contains 2-15 alphabets incuding spaces"
						readonly="readonly" required></td>
				</tr>
				<tr height="30px">
					<td width="150px"><label>Email</label></td>
					<td width="350px"><input type="email" id="email" name="email"
						value="${emp.email}" class="input1" title="username@yourmail.com"
						readonly="readonly" required></td>
				</tr>
				<tr height="30px">
					<td width="150px"><label>Sex</label></td>
					<td width="350px"><select id="sex" name="sex" class="input"
						required>
							<option value="Male">Male</option>
							<option value="Female">Female</option>
					</select></td>
				</tr>
				<tr height="30px">
					<td width="150px"><label>Date of Birth</label></td>
					<td width="350px"><input type="date" id="dob" name="dob"
						value="<fmt:formatDate pattern="yyyy-MM-dd" value="${emp.dob}" />"
						class="input"></td>
				</tr>
				<tr height="30px">
					<td width="150px"><label>Phone</label></td>
					<td width="350px"><input type="text" id="phone" name="phone"
						value="${emp.phone}" class="input" pattern="[0-9]{10,12}"
						title="Must contains 10-12 digits" required></td>
				</tr>
			</table>
			<br>
			<table>
				<tr>
					<td width="150px"></td>
					<td><input type="submit" value="Update"></td>
				</tr>
			</table>
		</form>
	</div>	
</body>
</html>