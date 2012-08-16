<%@ page language="java" contentType="text/html; charset=GB18030"
	pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Register</title>
<link rel="stylesheet" type="text/css" href="css/cloud.css" />
</head>
<body>
	<h1>User Register</h1>
	<fieldset id="register_fieldset">
		<legend>Input your information</legend>
		<form id="register_form" action="check_register.jsp" method="post"
			name="form">
			<label>Username:</label> <input type="text" name="username" /><br />
			<label>Password:</label> <input type="text" name="password" /><br />
			<input type="submit" value="Submit" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
				type="reset" value="Reset" />
		</form>
	</fieldset>
</body>
</html>