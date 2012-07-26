<%@ page language="java" contentType="text/html; charset=GB18030"
	pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>File Operation</title>
</head>
<body>
	<%
		String filename = request.getParameter("file");
		String username = request.getParameter("username");
	%>
	<table border="1">
		<tr>
			<td>File name</td>
			<td style="color: blue;"><%=filename%></td>
		</tr>
	</table>
	<hr />

	<form name="download"
		action="download.jsp?file=<%=filename%>&username=<%=username%>"
		method="POST" enctype="multipart/form-data">
		Click to download this file <br /> <input type="submit"
			value="Download" /><br /> <br />
	</form>
	<form name="delete"
		action="delete.jsp?file=<%=filename%>&username=<%=username%>"
		method="POST" enctype="multipart/form-data">
		Click to delete this file <br /> <input type="submit" value="Delete" /><br />
	</form>
</body>
</html>