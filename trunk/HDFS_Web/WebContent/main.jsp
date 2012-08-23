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
<link rel="stylesheet" type="text/css" href="css/cloud.css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("tr:odd").addClass("altrow");
	});
</script>
</head>
<body>
	<%!private static String baseuri = HDFSFileUtil.getBaseuri();%>
	<%
		String username = (String) session.getAttribute("username");
	%>
	<div>
	<p id="welcome">
		Welcome <a href="userinfo.jsp"><%=username%></a>,
		<script type="text/javascript">
			var oMyDate = new Date();
			var iYear = oMyDate.getFullYear();
			var iMonth = oMyDate.getMonth() + 1;
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
	<h1>A Cloud Storage System Based On HDFS</h1>
	</div>
	<div id="menu" style="background-color:#66CC99;font-family: Verdana;height:600px;width:10%;float:left;margin-top: 46px;">
	<center><b>Menu</b></center><br />
	<ul>
	<li><a href="userinfo.jsp">User info</a></li>
	<li><a href="main.jsp">Main</a></li>
	<li><a href="album.jsp">Browser Album</a></li>
	</ul>
	</div>
	<%
		String dir = request.getParameter("dir");
		if (username != null) {
			String homedir = baseuri + username + "/";
			if(dir != null){
		homedir = baseuri + username + "/" + dir + "/";}
		HDFSFileUtil hUtil = new HDFSFileUtil();
		ArrayList<FileObj> lst = hUtil.getList(homedir);
		if (lst.size() != 0) {
	%>
	<div style="width:90%;float:left;">
	<table id="summary" >
		<tr id="dirhis">
			<td id="directory" >Directory:
			<%
				if(dir != null) {
								out.write("/" + dir);		
							}else{
								out.write("/");
							}
			%>
			</td>
			<td id="history" >
				<%
					if(dir != null){
				%>
				<form action="create.jsp?dir=<%=dir%>" method="post">
					<label>Create new folder: </label><input type="text" name="new" />
					<input type="submit" value="Create" />
				</form> <%
 	}else{
 %>
				<form action="create.jsp" method="post">
					<label>Create new folder: </label><input type="text" name="new" />
					<input type="submit" value="Create" />
				</form> <%
 	}
 %> <a href="album.jsp">Album</a> | <a href="history.jsp"> History</a>
			</td>
		</tr>
	</table>
	<table class="content">
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
			<td id="name"><img class="icon" src="images/folder.png" /><a
				href="main.jsp?dir=<%=lst.get(i).getName()%>"> <%=lst.get(i).getName()%></a></td>
			<%
				}else{
			%>
			<td id="name"><img class="icon" src="images/folder.png" /><a
				href="main.jsp?dir=<%=dir +"/" + lst.get(i).getName()%>"> <%=lst.get(i).getName()%></a></td>
			<%
				}
			%>
			<%
				}else{
								if(dir == null){
			%>
			<td id="name"><img class="icon" src="images/file.png" /><a
				target="_blank" href="file.jsp?file=<%=lst.get(i).getName()%>">
					<%=lst.get(i).getName()%></a></td>
			<%
				}else{
			%>
			<td id="name"><img class="icon" src="images/file.png" /><a
				target="_blank"
				href="file.jsp?dir=<%=dir%>&file=<%=lst.get(i).getName()%>"> <%=lst.get(i).getName()%></a></td>
			<%
				}
							}
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
	<fieldset class="upload">
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
	<fieldset class="upload">
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
	<br />Sorry! directory is empty.
	<br />Please upload file to it.
	<br />
	<br />
	<br />
	<%
		if(dir != null) {
	%>
	<fieldset class="upload">
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
	<fieldset class="upload">
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
	</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>