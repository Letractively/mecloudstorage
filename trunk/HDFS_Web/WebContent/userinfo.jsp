<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.hdfs.dao.UserDao"%>
<%@ page import="com.hdfs.dao.impl.UserDaoImpl"%>
<%@ page import="com.hdfs.pojo.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Information</title>
<style type="text/css">
body {
	background-image: url('picture/gradient.png');
	background-repeat: repeat-x;
}

h1 {
	color: green;
	font-family: sans-serif;
	text-align: center;
}
</style>

</head>
<body>
	<h1>A Cloud Storage System Based On HDFS</h1>
	<%
		String username = (String) session.getAttribute("username");
		UserDao dao = new UserDaoImpl();
		User u = dao.getinfo(username);
	%>
	<p>
		Your name is :
		<%=u.getUsername()%></p>
	<p>
		Your password is :
		<%=u.getPassword()%></p>

</body>
</html>