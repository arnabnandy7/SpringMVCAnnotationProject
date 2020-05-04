<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
<style type="text/css">
.input {
	width: 200px;
	height: 28px;
}
</style>
</head>
<body>
	<header>
		<h2>Demo Registration</h2>
	</header>
	<hr>
	<form action=${pageContext.request.contextPath}/DEMO/demoRegister.do method="post">
		<table>
			<tr height="30px">
				<td width="150px"><label>First Name</label></td>
				<td width="350px"><input type="text" id="fname" name="fname"
					class="input" pattern="[A-Za-z][a-zA-Z\s]{2,15}"
					title="Must contains 2-15 alphabets incuding spaces" required></td>
			</tr>
			<tr height="30px">
				<td width="150px"><label>Last Name</label></td>
				<td width="350px"><input type="text" id="lname" name="lname"
					class="input" pattern="[A-Za-z][a-zA-Z\s]{2,15}"
					title="Must contains 2-15 alphabets incuding spaces" required></td>
			</tr>
			<tr height="30px">
				<td width="150px"><label>Email</label></td>
				<td width="350px"><input type="email" id="email" name="email"
					class="input" title="username@yourmail.com" required></td>
			</tr>
			<tr height="30px">
				<td width="150px"><label>Password</label></td>
				<td width="350px"><input type="password" id="password"
					name="password" pattern=".{8,15}"
					title="Must contains 8-15 charecter" class="input" required></td>
			</tr>
			<tr height="30px">
				<td width="150px"><label>Confirm Password</label></td>
				<td width="350px"><input type="password" id="cpassword"
					name="cpassword" class="input" oninput="check(this)" required></td>
			</tr>
			<tr height="30px">
				<td width="150px"><label>Sex</label></td>
				<td width="350px">
				<select id="sex" name="sex" class="input" required>
					<option value="Male">Male</option>
					<option value="Female">Female</option>
				</select>	
				</td>
			</tr>
			<tr height="30px">
				<td width="150px"><label>Date of Birth</label></td>
				<td width="350px"><input type="date" id="dob" name="dob"
					class="input"></td>
			</tr>
			<tr height="30px">
				<td width="150px"><label>Phone</label></td>
				<td width="350px"><input type="text" id="phone" name="phone"
					class="input" pattern="[0-9]{10,12}"
					title="Must contains 10-12 digits" required></td>
			</tr>
		</table>
		<br>
		<table>
			<tr>
				<td width="150px"></td>
				<td><input type="submit" value="Sign up"></td>
			</tr>
			<tr>
				<td style="font-weight: bold; color:maroon;">${errors}</td>
			</tr>
		</table>
	</form>
<script type='text/javascript'>

function check(input) 
			{
				if (input.value != document.getElementById('password').value) 
					{
						input.setCustomValidity('The two passwords must match.');	
					} 
				else {
						// input is valid -- reset the error message
						input.setCustomValidity('');
					 }
			}
</script>

</body>
</html>