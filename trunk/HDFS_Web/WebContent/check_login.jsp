<%@ page language="java" contentType="text/html; charset=GB18030"
	pageEncoding="GB18030"%>
<%@ page import="com.hdfs.util.HDFSFileUtil"%>
<%@ page import="com.hdfs.dao.UserDao"%>
<%@ page import="com.hdfs.dao.impl.UserDaoImpl"%>
<%@ page import="com.hdfs.pojo.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Check Login</title>
<link rel="stylesheet" type="text/css" href="css/cloud.css" />
</head>
<body>
	<%
		UserDao dao = new UserDaoImpl();
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			session.setAttribute("username", username);
			if (username != "" && password != "") {
		User u = dao.login(username, password);
		if (u != null) {
			response.sendRedirect("main.jsp");
		} else {
	%>
	<script type="text/javascript">
		alert("Username or Password is error, please try again.");
		window.history.back();
	</script>
	<%
		}
		} else {
	%>
	<script type="text/javascript">
		alert("Username or Password is needed, please try again.");
		window.history.back();
	</script>
	<%
		}
	%>

</body>
</html>