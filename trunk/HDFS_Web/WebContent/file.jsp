<%@ page language="java" contentType="text/html; charset=GB18030"
	pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>File Operation</title>
<style type="text/css">
table {
	font-size: 20px;
	border-collapse: collapse;
	frame: box;
}

td {
	border: 1px solid black;
}

#filename {
	color: blue;
}
</style>
</head>
<body>
	<%
		String file = request.getParameter("file");
		String filename = new String(file.getBytes("iso-8859-1"), "GB18030");
	%>
	<table>
		<tr>
			<td>File name</td>
			<td id="filename"><%=filename%></td>
		</tr>
	</table>
	<hr />

	<form name="download" action="download.jsp?file=<%=filename%>"
		method="POST" enctype="multipart/form-data">
		<label>Click to download this file</label> <br /> <input
			type="submit" value="Download" /><br /> <br />
	</form>

	<form name="delete" action="delete.jsp?file=<%=filename%>"
		method="POST" enctype="multipart/form-data">
		<label>Click to delete this file</label> <br /> <input type="submit"
			value="Delete" /><br /> <br />
	</form>

	<form name="look" action="look.jsp?file=<%=filename%>" method="POST"
		enctype="multipart/form-data">
		<label>Click to look this file</label> <br /> <input type="submit"
			value="Look" /><br />
	</form>
</body>
</html>