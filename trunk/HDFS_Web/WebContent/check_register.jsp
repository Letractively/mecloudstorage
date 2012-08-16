<%@ page language="java" contentType="text/html; charset=GB18030"
	pageEncoding="GB18030"%>
<%@ page import="com.hdfs.dao.UserDao"%>
<%@ page import="com.hdfs.dao.impl.UserDaoImpl"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Check Register</title>
<link rel="stylesheet" type="text/css" href="css/cloud.css" />
</head>
<body>
	<%
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		UserDao dao = new UserDaoImpl();
		if (username == "" || password == "" || username == null
				|| password == null) {
	%>
	<script type="text/javascript">
		alert("Username or password can't be null, please input them.");
		top.location = "register.jsp";
	</script>
	<%
		} else if (dao.register(username, password)) {
	%>
	<script type="text/javascript">
		alert("Register is successful! Click to Login.");
		top.location = "index.jsp";
	</script>
	<%
		} else {
	%>
	<script type="text/javascript">
		alert("Register is failed, please try it again.");
		top.location = "register.jsp";
	</script>
	<%
		}
	%>
</body>
</html>