<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
#customers {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

#customers td, #customers th {
    border: 1px solid #ddd;
    padding: 2px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #4CAF50;
    color: white;
}
</style>

<title>List of Employees</title>
</head>
<body>
<div style= "width: 100%; height: 30px; background-color: gray; line-height: 30px;">
<div style="width: 50%; height: 30px; float: right;">
<table>
<tr>
	<td><b>Welcome! ${welcomeMessage}</b></td>
	<td><a href="logout">Logout</a></td>
</tr>
</table>
</div>
</div>
<table id="customers">
  <tr>
    <th>First Name</th>
    <th>Last Name</th>
    <th>Sex</th>
    <th>Phone</th>
  </tr>
  <c:forEach var="emp" items="${key1}">
  <tr>
    <td>${emp.fname}</td>
    <td>${emp.lname}</td>
    <td>${emp.sex}</td>
    <td>${emp.phone}</td>    
  </tr>
  </c:forEach>  
</table>  
<div style="width: 100%; height: 30px; background-color: gray; line-height: 30px;">
	<form>
	<button type="submit" formaction="returnAdmin" formmethod="get">BACK</button>
	</form>
</div>
</body>
</html>