<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Test Include</title>
</head>
<body>
	<h1>TEST INCLUDE</h1>
	<%
		String file = request.getParameter("file");
		String dir = request.getParameter("dir");
	%>
	<jsp:include page="view.jsp" flush="true">
		<jsp:param value="<%=dir%>" name="dir" />
		<jsp:param value="<%=file%>" name="file" />
	</jsp:include>
</body>
</html>