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
	<h3>${Msg}</h3>
	<h4>Check Your Details</h4>
	<br>
	<div>
		<c:set var="emp" value="${user}" />		
			<table border="1">
				<tr height="30px">
					<td width="150px"><label>First Name</label></td>
					<td width="350px">${emp.fname}</td>
				</tr>
				<tr height="30px">
					<td width="150px"><label>Last Name</label></td>
					<td width="350px">${emp.lname}</td>
				</tr>
				<tr height="30px">
					<td width="150px"><label>Email</label></td>
					<td width="350px">${emp.email}</td>
				</tr>
				<tr height="30px">
					<td width="150px"><label>Sex</label></td>
					<td width="350px">${emp.sex}</td>
				</tr>
				<tr height="30px">
					<td width="150px"><label>Date of Birth</label></td>
					<td width="350px">${emp.dob}</td>
				</tr>
				<tr height="30px">
					<td width="150px"><label>Phone</label></td>
					<td width="350px">${emp.phone}</td>
				</tr>
			</table>
			
	</div>	
</body>
</html>