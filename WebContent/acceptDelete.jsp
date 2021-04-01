<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@page isELIgnored="false" %>
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
<script type="text/javascript">

function OnButton1()
{
    document.Form1.action = "accept"
    document.Form1.target = "_self";    // Open in a new window
    document.Form1.submit();             // Submit the page
    return true;
}
function OnButton2()
{
    document.Form1.action = "delete"
    document.Form1.target = "_self";    // Open in a new window
    document.Form1.submit();             // Submit the page
    return true;
}
</script>
<title>Insert title here</title>
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
<form id="Form1" name="Form1" action="" method="post">
<table id="customers">
  <tr>
 	<th>Select</th> 
    <th>First Name</th>
    <th>Last Name</th>
    <th>Sex</th>
    <th>Email</th>
    <th>Phone</th>
  </tr>
  <c:forEach var="emp" items="${key1}">  
  <tr>
  	<td><input type="checkbox" id="check" name="emailCheck" value="${emp.email}"></td>
    <td>${emp.fname}</td>
    <td>${emp.lname}</td>
    <td>${emp.sex}</td>
    <td>${emp.email}</td>
    <td>${emp.phone}</td>    
  </tr>
  </c:forEach>  
</table>
<br>
<table>
<tr>
<td><INPUT type="button" value="Accept" name=button1 onclick="return OnButton1();"></td>
<td><INPUT type="button" value="Reject" name=button2 onclick="return OnButton2();"></td>
</tr>
</table>
</form>
<div style="width: 100%; height: 30px; background-color: gray; line-height: 30px;">
	<form>
	<button type="submit" formaction="returnAdmin" formmethod="get">BACK</button>
	</form>
</div>
</body>
</html>