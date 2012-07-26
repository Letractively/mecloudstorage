<%@ page language="java" contentType="text/html; charset=GB18030"
	pageEncoding="GB18030"%>
<%@ page import="com.hdfs.dao.LoginDao"%>
<%@ page import="com.hdfs.dao.impl.LoginDaoImpl"%>
<%@ page import="com.hdfs.util.HDFSFileUtil"%>
<%@ page import="com.hdfs.pojo.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.DecimalFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>File Browse</title>
<style type="text/css">
body {
	background-color: cyan;
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
	background-color: LightBlue;
}

th {
	background-color: green;
	color: white;
}

td.name {
	text-align: left;
}

table,th,td {
	border: 1px solid black;
}

fieldset {
	width: 300px;
}
</style>
</head>
<body>
	<%!private static String baseuri = HDFSFileUtil.getBaseuri();%>
	<%
		LoginDao dao = new LoginDaoImpl();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		if (username != "" && password != "") {
			User u = dao.login(username, password);
			if (u != null) {
				String homedir = baseuri + u.getUsername() + "/";
				HDFSFileUtil hUtil = new HDFSFileUtil();
				ArrayList<FileObj> lst = hUtil.getList(homedir);
				if (lst.size() != 0) {
	%>
	<br />
	<br />
	<br />
	<h1>A Cloud Storage System Based On HDFS</h1>

	<fieldset>
		<legend>File Upload</legend>
		<form
			action="upload.jsp?username=<%=u.getUsername()%>&password=<%=u.getPassword()%>"
			method="post" name="form" enctype="multipart/form-data">
			<input type="file" name="file1" id="file1" /><br /> <input
				type="submit" value="Submit" /> <input type="reset" value="Reset" />
		</form>
	</fieldset>
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
				href="file.jsp?file=<%=lst.get(i).getName()%>&username=<%=u.getUsername()%>">
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
		<form
			action="upload.jsp?username=<%=u.getUsername()%>&password=<%=u.getPassword()%>"
			method="post" name="form" enctype="multipart/form-data">
			<input type="file" name="file1" id="file1" /><br /> <input
				type="submit" value="Submit" /> <input type="reset" value="Reset" />
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

</body>
</html>