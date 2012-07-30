<%@ page language="java" contentType="text/html; charset=GB18030"
	pageEncoding="GB18030"%>
<%@ page import="com.hdfs.dao.LoginDao"%>
<%@ page import="com.hdfs.dao.impl.LoginDaoImpl"%>
<%@ page import="com.hdfs.util.HDFSFileUtil"%>
<%@ page import="com.hdfs.pojo.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.DecimalFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload Files</title>
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
	background-color: LightBlue;
}

th {
	background-color: green;
	color: white;
}

.name {
	text-align: left;
}

table,th,td {
	border: 1px solid black;
}

fieldset {
	width: 300px;
}

div {
	text-align: right;
}
</style>
</head>
<body>
	<h1>A Cloud Storage System Based On HDFS</h1>
	<%!private static String baseuri = HDFSFileUtil.getBaseuri();%>
	<%
		LoginDao dao = new LoginDaoImpl();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		session.setAttribute("username", username);
		if (username != "" && password != "") {
			User u = dao.login(username, password);
			if (u != null) {
				String homedir = baseuri + u.getUsername() + "/";
				HDFSFileUtil hUtil = new HDFSFileUtil();
				ArrayList<FileObj> lst = hUtil.getList(homedir);
				if (lst.size() != 0) {
	%>

	<h2><%=u.getUsername().toUpperCase()%>'s Home Directory
	</h2>
	<table>
		<tr>
			<th>Name</th>
			<th>Type</th>
			<th>Size</th>
			<th>Replication</th>
			<th>Block Size</th>
			<th>Modification Time</th>
			<th>Permission</th>
			<th>Owner</th>
			<th>Group</th>
		</tr>
		<%
			for (int i = 0; i < lst.size(); i++) {
		%>
		<tr>
			<td class="name"><a target="_blank"
				href="file.jsp?file=<%=lst.get(i).getName()%>">
					<%=lst.get(i).getName()%></a></td>
			<td><%=lst.get(i).isType() ? "dir" : "file"%></td>
			<%
				DecimalFormat df = new DecimalFormat("######0.00");
			%>
			<td><%=df.format((double) lst.get(i).getSize()
									/ (double) (1024 * 1024))%> Mb</td>
			<td><%=lst.get(i).getReplication()%></td>
			<td><%=(double) lst.get(i).getBlock_size()
									/ (double) (1024 * 1024)%> Mb</td>
			<td><%=new Date(lst.get(i).getMtime())%></td>
			<td><%=lst.get(i).getPermission()%></td>
			<td><%=lst.get(i).getOwner()%></td>
			<td><%=lst.get(i).getGroup()%></td>
			<%
				}
			%>
		
	</table>
	<fieldset>
		<legend>File Upload</legend>
		<form action="upload.jsp" method="post"
			name="form" enctype="multipart/form-data">
			<input type="file" name="file" id="file" multiple size="80" /><br />
			<input type="submit" value="Submit" /> <input type="reset"
				value="Reset" />
		</form>
	</fieldset>
	<%
		} else {
	%>
	<br />
	<br />
	<br />Sorry! your home directory is empty.
	<br />Please upload file to it.
	<br />
	<br />
	<br />
	<fieldset>
		<legend>File Upload</legend>
		<form action="upload.jsp" method="post"
			name="form" enctype="multipart/form-data">
			<input type="file" name="file" id="file" multiple size="80" /><br />
			<input type="submit" value="Submit" /> <input type="reset"
				value="Reset" />
		</form>
	</fieldset>
	<%
		}
			} else {
	%>
	<p>Username or Password is error, please try again.</p>
	<%
		}
		} else {
	%>
	<p>Username or Password is needed, please input them.</p>
	<%
		}
	%>
	<div>
		<a href="history.jsp">History</a>
	</div>
</body>
</html>