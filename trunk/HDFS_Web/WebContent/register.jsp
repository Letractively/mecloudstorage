<%@ page language="java" contentType="text/html; charset=GB18030"
	pageEncoding="GB18030"%>
<%@ page import="com.hdfs.dao.RegisterDao"%>
<%@ page import="com.hdfs.dao.impl.RegisterDaoImpl"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Register</title>
<style type="text/css">
body {
	background-image: url('picture/gradient.png');
	background-repeat: repeat-x;
	text-align: center;
}

h1 {
	color: green;
	font-family: sans-serif;
	text-align: center;
}

fieldset {
	text-align: left;
	margin: 0px auto;
	width: 300px;
}

form {
	text-align: center;
}
</style>
</head>
<body>
	<h1>User Register</h1>
	<fieldset>
		<legend>Input your information</legend>
		<form action="register.jsp" method="post" name="form">
			<label>Username:</label> <input type="text" name="username" /><br />
			<label>Password:</label> <input type="text" name="password" /><br />
			<input type="submit" value="Submit" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
				type="reset" value="Reset" />
		</form>
	</fieldset>
	<%
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		RegisterDao dao = new RegisterDaoImpl();
		if (username == "" || password == "" || username == null
				|| password == null) {
	%>
	<p>Username or password can't be null, please input them.</p>
	<%
		} else if (dao.register(username, password)) {
	%>
	<jsp:forward page="return.jsp"></jsp:forward>
	<%
		} else {
	%>
	<p>Register is failed, please try it again.</p>
	<%
		}
	%>
</body>
</html>