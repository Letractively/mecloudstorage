<%@ page language="java" contentType="text/html; charset=GB18030"
	pageEncoding="GB18030"%>
<%@ page import="com.hdfs.util.HDFSFileUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Upload a file to HDFS</title>
<style type="text/css">
body {
	text-align: center;
	background-color: cyan;
	font-size: 20px;
}
</style>
</head>
<body>
	<%!private static String baseuri = HDFSFileUtil.getBaseuri();%>
	<%
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String homedir = baseuri + request.getParameter("username") + "/";
		HDFSFileUtil hUtil = new HDFSFileUtil();
		hUtil.upload(homedir, request);
	%>
	<p>File upload successfully!!!</p>

	<script type="text/javascript">
		alert("Return to the main page.");
		window.history.back(-1);
	</script>
</body>
</html>
