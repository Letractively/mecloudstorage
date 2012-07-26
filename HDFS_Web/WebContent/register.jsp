<%@ page language="java" contentType="text/html; charset=GB18030"
	pageEncoding="GB18030"%>
<%@ page import="com.hdfs.dao.RegisterDao"%>
<%@ page import="com.hdfs.dao.impl.RegisterDaoImpl"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Register</title>
</head>
<body>
	<h1>User Register</h1>
	<form action="register.jsp" method="post" name="form">
		<input type="text" name="username" /><br /> <input type="text"
			name="password" /><br /> <input type="submit" value="Submit" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
			type="reset" value="Reset" />
	</form>
	<%
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		RegisterDao dao = new RegisterDaoImpl();
		if (dao.register(username, password)) {
	%>
	<jsp:forward page="return.jsp"></jsp:forward>
	<%
		} else if (!(username == null) && !(password == null)) {
	%>
	<p>Register is failed, please do it again.</p>
	<%
		} else {
	%>
	<p>Please Register.</p>
	<%
		}
	%>
</body>
</html>