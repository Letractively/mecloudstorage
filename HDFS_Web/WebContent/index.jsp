<%@ page language="java" contentType="text/html; charset=GB18030"
	pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>A cloud storage based on HDFS</title>
<style type="text/css">
body {
	background-image: url('picture/gradient.png');
	background-repeat: repeat-x;
}

#div1 {
	text-align: right;
}

h1 {
	color: green;
	font-family: sans-serif;
	text-align: center;
}

#div2 {
	text-align: center;
	position: relative;
	top: 80px;
}

img {
	width: 600px;
	height: 316px;
}

fieldset {
	text-align: left;
	margin: 0px auto;
	width: 300px;
	position: relative;
	top: -180px;
}

form {
	text-align: center;
}
</style>
</head>
<body>
	<div id="div1">
		<a href="register.jsp">Register</a>
		<h1>A Cloud Storage System Based On HDFS</h1>
	</div>
	<div id="div2">
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
	</div>
</body>
</html>