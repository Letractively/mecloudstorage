<%@ page language="java" contentType="text/html; charset=GB18030"
	pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>A cloud storage based on HDFS</title>
<style type="text/css">
body {
	text-align: center;
	background-color: #87CEEB;
}

h1 {
	color: green;
	font-size: 50px;
}

img {
	width: 420px;
	height: 308px;
}

fieldset {
	text-align: left;
	margin: 0px auto;
	width: 300px;
}

form {
	text-align: center;
}

div {
	text-align: right;
}
</style>
</head>
<body>
	<div>
		<a href="register.jsp">Register</a>
	</div>
	<h1>A Cloud Storage System Based On HDFS</h1>
	<img src="picture/cloud.png" />
	<fieldset>
		<legend>Login</legend>
		<form action="main.jsp" method="post" name="form">
			<label>Username:</label> <input type="text" name="username"></input>
			<br /> <label>Password:</label> <input type="password"
				name="password"></input> <br /> <input type="submit" name="submit"
				value="Submit"></input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
				type="reset" name="reset" value="Reset"></input>
		</form>
	</fieldset>
</body>
</html>