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

h2 {
	text-align: center;
}

table {
	margin: 0px auto;
	font-size: 20px;
	border-collapse: collapse;
	frame: box;
}

tr {
	vertical-align: top;
	background-color: #99CC99;
}

th {
	background-color: blue;
	color: white;
}

th,td {
	border: 1px solid black;
}
</style>
</head>
<body>
	<h1>A Cloud Storage System Based On HDFS</h1>
	<%
		String username = (String) session.getAttribute("username");
		LogDao log = new LogDaoImpl();
		ArrayList<Log> loglist = new ArrayList<Log>();
		loglist = log.read(username);
		if (loglist != null && loglist.size() != 0) {
	%>
	<h2><%=username.toUpperCase()%>'s Opereation history
	</h2>

	<table>
		<tr>
			<th>Username</th>
			<th>Time</th>
			<th>Action</th>
			<th>filename</th>
			<th>filepath</th>
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
	<br />
	<br />
	<br />
	<%
		} else {
	%>
	<p>Sorry, You have no history.</p>
	<%
		}
	%>

</body>
</html>