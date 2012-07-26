<%@ page language="java" contentType="text/html; charset=GB18030"
	pageEncoding="GB18030"%>
<%@ page import="com.hdfs.util.HDFSFileUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Download File</title>
<style type="text/css">
p {
	color: blue;
	text-align: centerfond-size:40px
}
</style>
</head>
<body>
	<%!private static String baseuri = HDFSFileUtil.getBaseuri();%>
	<%
		String username = request.getParameter("username");
		String file = request.getParameter("file");
		String dir = baseuri + username + "/" + file;
		HDFSFileUtil hUtil = new HDFSFileUtil();
		hUtil.download(username, file);
	%>
	<p>File download successfully!!!</p>
</body>
</html>