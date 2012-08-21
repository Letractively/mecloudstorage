<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Test Include</title>
<link rel="stylesheet" type="text/css" href="css/cloud.css" />
<style type="text/css">
body {
	text-align: center;
}

iframe {
	frameborder: 0;
	scolling: no;
	width: 60%;
	height: 600px;
}
</style>
</head>
<body>
	<h1>TEST INCLUDE</h1>
	<%
		String file = request.getParameter("file");
		String dir = request.getParameter("dir");
		if (dir != null) {
	%>
	<img src="view.jsp?dir=<%=dir%>&file=<%=file%>"></img>
	<%
		} else {
	%>
	<img src="view.jsp?file=<%=file%>"></img>
	<%
		}
	%>
</body>
</html>