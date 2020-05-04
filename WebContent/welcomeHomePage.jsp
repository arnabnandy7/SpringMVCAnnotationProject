<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
</head>
<body>
	<div
		style="width: 100%; height: 30px; background-color: gray; line-height: 30px;">
		<div style="height: 30px; float: right; text-align: right;">
			<table>
				<tr>
					<td style="text-align: right;"><b>Welcome! ${welcomeMessage}</b></td>
					<td style="text-align: right;"><a href="logout">Logout</a></td>
				</tr>
			</table>
		</div>
	</div>
	<div>
		<table>
			<tr>
				<td><a href="insertUpdateAddressInfo/${user}">Insert Address
						Information</a></td>
			</tr>
			<tr>
				<td><a href="updateInfo/${user}">Update Personal
						Information</a></td>
			</tr>
		</table>
	</div>

</body>
</html>