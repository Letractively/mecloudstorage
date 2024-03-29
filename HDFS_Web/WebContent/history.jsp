<%@ page language="java" contentType="text/html; charset=GB18030"
	pageEncoding="GB18030"%>
<%@ page import="com.hdfs.dao.LogDao"%>
<%@ page import="com.hdfs.dao.impl.LogDaoImpl"%>
<%@ page import="com.hdfs.pojo.Log"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>History</title>
<link rel="stylesheet" type="text/css" href="css/cloud.css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("tr:odd").addClass("altrow");
	});
</script>
</head>
<body>
	<%
		String username = (String) session.getAttribute("username");
			if(username == null){
	%>
	<script type="text/javascript">
		alert("You must login first!");
		top.location = "index.jsp";
	</script>
	<%
		}
		LogDao log = new LogDaoImpl();
		ArrayList<Log> loglist = new ArrayList<Log>();
		loglist = log.read(username);
		if (loglist != null && loglist.size() != 0) {
	%>
	<div>
		<p class="title_p">
			Welcome <a href="userinfo.jsp"><%=username%></a>,
			<script type="text/javascript" src="js/cal.js"></script>
		</p>
		<jsp:include page="header.jsp"></jsp:include>
		<hr>
		<h2><%=username%>'s opereation history
		</h2>
	</div>
	<div>
		<table class="content">
			<tr>
				<th>Username</th>
				<th>Time</th>
				<th>Action</th>
				<th>Filename</th>
				<th>Filepath</th>
			</tr>
			<%
				for (int i = 0; i < loglist.size(); i++) {
			%>
			<tr>
				<td><%=loglist.get(i).getUsername()%></td>
				<td><%=loglist.get(i).getDate()%></td>
				<td><%=loglist.get(i).getAction()%></td>
				<td><%=loglist.get(i).getFilename()%></td>
				<td><%=loglist.get(i).getPathname()%></td>
			</tr>
			<%
				}
			%>
		</table>
		<br /> <br /> <br />
		<%
			} else {
		%>
		<p>Sorry, You have no history.</p>
		<%
			}
		%>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>