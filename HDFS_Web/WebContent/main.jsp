<%@ page language="java" contentType="text/html; charset=GB18030"
	pageEncoding="GB18030"%>
<%@ page import="com.hdfs.util.HDFSFileUtil"%>
<%@ page import="com.hdfs.pojo.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.DecimalFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>File Browse</title>
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

p {
	margin-right: 50px;
	margin-top: 0px;
	text-align: right;
}

span {
	color: blue;
}

table {
	margin: 0px auto;
	font-size: 16px;
	border-collapse: collapse;
	width: 90%;
}

tr {
	background-color: #3DE3F1;
}

th {
	background-color: green;
	color: white;
}

.altrow {
	background-color: #10C8EB;
}

fieldset {
	margin-left: 50px;
	width: 300px;
}

img {
	width: 16px;
	height: 16px;
}

a {
	text-decoration: none;
}

#summary{
	margin-bottom: 0px;
}

#directory{
	color: blue;
	background-color: white;
}

#history{
	text-align: right;
	background-color: white;
}
</style>
<script type=""></script>
<script type="text/javascript" src="jquery-1.7.2.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("tr:odd").addClass("altrow");
	});
</script>
</head>
<body>
	<h1>A Cloud Storage System Based On HDFS</h1>
	<%!private static String baseuri = HDFSFileUtil.getBaseuri();%>
	<%
		String username = (String) session.getAttribute("username");
			String dir = request.getParameter("dir");
			if (username != null) {
		String homedir = baseuri + username + "/";
		if(dir != null){
			homedir = baseuri + username + "/" + dir + "/";}
		HDFSFileUtil hUtil = new HDFSFileUtil();
		ArrayList<FileObj> lst = hUtil.getList(homedir);
		if (lst.size() != 0) {
	%>
	<p>
		Welcome <a href="userinfo.jsp"><%=username%></a>,
		<script type="text/javascript">
			var oMyDate = new Date();
			var iYear = oMyDate.getFullYear();
			var iMonth = oMyDate.getMonth() + 1; //月份是从0开始的
			var iDate = oMyDate.getDate();
			var iDay = oMyDate.getDay();
			switch (iDay) {
			case 0:
				iDay = "Sunday";
				break;
			case 1:
				iDay = "Monday";
				break;
			case 2:
				iDay = "Tuesday";
				break;
			case 3:
				iDay = "Wednesday";
				break;
			case 4:
				iDay = "Thursday";
				break;
			case 5:
				iDay = "Friday";
				break;
			case 6:
				iDay = "Satday";
				break;
			default:
				iDay = "error";
			}
			document.write("Today is " + iYear + "/" + iMonth + "/" + iDate
					+ "," + iDay);
		</script>
	</p>

	<table id="summary">
		<tr>
			<td id="directory">Directory:
			<%
			if(dir != null) {
			out.write("/" + dir);		
				}else{
			out.write("/");
				}
		%></td>
			<td id="history"><a href="history.jsp">History</a></td>
		</tr>
	</table>
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
			<%
				if(lst.get(i).isType()){
								if(dir == null){
			%>
			<td><img src="picture/folder.png" /><a
				href="main.jsp?dir=<%=lst.get(i).getName()%>"> <%=lst.get(i).getName()%></a></td>
			<%
				}else{
			%>
			<td><img src="picture/folder.png" /><a
				href="main.jsp?dir=<%=dir +"/" + lst.get(i).getName()%>"> <%=lst.get(i).getName()%></a></td>
			<%
				}
			%>
			<%
				}else{
								if(dir == null){
			%>
			<td><img src="picture/file.png" /><a target="_blank"
				href="file.jsp?file=<%=lst.get(i).getName()%>"> <%=lst.get(i).getName()%></a></td>
			<%
				}else{
			%>
			<td><img src="picture/file.png" /><a target="_blank"
				href="file.jsp?dir=<%=dir%>&file=<%=lst.get(i).getName()%>"> <%=lst.get(i).getName()%></a></td>
			<%
				}}
			%>
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
		if(dir != null) {
	%>
	<fieldset>
		<legend>File Upload</legend>
		<form action="upload.jsp?dir=<%=dir%>" method="post" name="form"
			enctype="multipart/form-data">
			<input type="file" name="file" id="file" multiple size="80" /><br />
			<input type="submit" value="Submit" /> <input type="reset"
				value="Reset" />
		</form>
	</fieldset>
	<%
		}else{
	%>
	<fieldset>
		<legend>File Upload</legend>
		<form action="upload.jsp" method="post" name="form"
			enctype="multipart/form-data">
			<input type="file" name="file" id="file" multiple size="80" /><br />
			<input type="submit" value="Submit" /> <input type="reset"
				value="Reset" />
		</form>
	</fieldset>
	<%
		}
	%>
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
		<form action="upload.jsp" method="post" name="form"
			enctype="multipart/form-data">
			<input type="file" name="file" id="file" multiple size="80" /><br />
			<input type="submit" value="Submit" /> <input type="reset"
				value="Reset" />
		</form>
	</fieldset>
	<%
		}
			} else {
	%>
	<script type="text/javascript">
		alert("You must login first!");
		top.location = "index.jsp";
	</script>
	<%
		}
	%>
</body>
</html>