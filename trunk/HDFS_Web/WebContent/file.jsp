<%@ page language="java" contentType="text/html; charset=GB18030"
	pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>File Operation</title>
<link rel="stylesheet" type="text/css" href="css/cloud.css" />
</head>
<body>
	<h1>A Cloud Storage System Based On HDFS</h1>
	<%
		String username = (String) session.getAttribute("username");
		if (username == null) {
	%>
	<script type="text/javascript">
		alert("You must login first!");
		top.location = "index.jsp";
	</script>
	<%
		}
		String file = request.getParameter("file");
		String dir = request.getParameter("dir");
		String filename = new String(file.getBytes("iso-8859-1"), "GB18030");
	%>
	<table id="file_table">
		<tr>
			<td>File name</td>
			<td id="filename"><%=filename%></td>
		</tr>
	</table>
	<hr />
	<%
		if (dir != null) {
	%>
	<form name="download"
		action="download.jsp?dir=<%=dir%>&file=<%=filename%>" method="post">
		<label>Click to download this file</label> <br /> <input
			type="submit" value="Download" /><br /> <br />
	</form>
	<form name="delete" action="delete.jsp?dir=<%=dir%>&file=<%=filename%>"
		method="post">
		<label>Click to delete this file</label> <br /> <input type="submit"
			value="Delete" /><br /> <br />
	</form>

	<form name="view" action="testinclude.jsp?dir=<%=dir%>&file=<%=filename%>"
		method="post">
		<label>Click to look this file</label> <br /> <input type="submit"
			value="View" /><br /> <br />
	</form>

	<form name="rename" action="rename.jsp?dir=<%=dir%>&file=<%=filename%>"
		method="post">
		<label>New file name</label> <br /> <input type="text" name="rename" />
		<br /> <input type="submit" value="Rename" />
	</form>
	<%
		} else {
	%>
	<form name="download" action="download.jsp?file=<%=filename%>"
		method="post">
		<label>Click to download this file</label> <br /> <input
			type="submit" value="Download" /><br /> <br />
	</form>
	<form name="delete" action="delete.jsp?file=<%=filename%>"
		method="post">
		<label>Click to delete this file</label> <br /> <input type="submit"
			value="Delete" /><br /> <br />
	</form>

	<form name="view" action="testinclude.jsp?file=<%=filename%>" method="post">
		<label>Click to look this file</label> <br /> <input type="submit"
			value="View" /><br /> <br />
	</form>

	<form name="rename" action="rename.jsp?file=<%=filename%>"
		method="post">
		<label>New file name</label> <br /> <input type="text" name="rename" />
		<br /> <input type="submit" value="Rename" />
	</form>
	<%
		}
	%>


</body>
</html>