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
	background-color: #87CEEB;
}

h1 {
	color: green;
	font-size: 50px;
	text-align: center;
}

h2 {
	font-size: 30px;
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
	border-style: dotted;
	background-color: LightBlue;
}

th {
	background-color: blue;
	color: white;
}

td.name {
	text-align: left;
}

table,th,td {
	border: 1px solid black;
}
</style>
</head>
<body>
	<h1>A Cloud Storage System Based On HDFS</h1>
	<%
		String username = request.getParameter("username");
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