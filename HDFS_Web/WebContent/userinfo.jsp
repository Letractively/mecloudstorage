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
<link rel="stylesheet" type="text/css" href="css/cloud.css" />
</head>
<body>
	<%
		String username = (String) session.getAttribute("username");
	%>
	<div>
		<p class="title_p">
			Welcome <a href="userinfo.jsp"><%=username%></a>,
			<script type="text/javascript" src="js/cal.js"></script>
		</p>
		<jsp:include page="header.jsp"></jsp:include>
		<hr>
	</div>
	<%
		if (username == null) {
	%>
	<script type="text/javascript">
		alert("You must login first!");
		top.location = "index.jsp";
	</script>
	<%
		}
		UserDao dao = new UserDaoImpl();
		User u = dao.getinfo(username);
	%>
	<div>
		<p>
			Your name is :
			<%=u.getUsername()%></p>
		<p>
			Your password is :
			<%=u.getPassword()%></p>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>