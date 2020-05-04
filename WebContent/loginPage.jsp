<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<style type="text/css">
.input {
	width: 200px;
	height: 20px;
}

.link {
	font-weight: bold;
	color: #2672ec;
	text-decoration: none;
}
</style>
</head>
<body>
	<form action="login.do" method="post">
		<table>
			<tr>
				<td width="70px"><label>Email</label></td>
				<td width="250px"><input type="email" id="email" name="email"
					class="input" placeholder="Enter your email" required></td>
			</tr>
			<tr>
				<td width="70px"><label>Password</label></td>
				<td width="250px"><input type="password" id="password"
					name="password" class="input" placeholder="Enter your password"
					required></td>
			</tr>
		</table>
		<br>
		<table>
			<tr>
				<td width="70px"></td>
				<td><input type="submit" value="Sign in"></td>
			</tr>
		</table>
		<br> <span>Don't have an account? </span><a href="register"
			class="link">Sign up now</a>
	</form>
	
</body>
</html>