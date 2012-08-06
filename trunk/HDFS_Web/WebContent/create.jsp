<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.hdfs.util.HDFSFileUtil"%>
<%@ page import="com.hdfs.dao.LogDao"%>
<%@ page import="com.hdfs.dao.impl.LogDaoImpl"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create new folder</title>
<style type="text/css">
body {
	background-image: url('picture/gradient.png');
	background-repeat: repeat-x;
}
</style>
</head>
<body>
	<%!private static String baseuri = HDFSFileUtil.getBaseuri();%>
	<%
		String username = (String) session.getAttribute("username");
		String folder = request.getParameter("new");
		String dir = request.getParameter("dir");
		String foldername = new String(folder.getBytes("iso-8859-1"), "GB18030");
		String pathname = baseuri + username + "/" + foldername;
		if (dir != null) {
			pathname = baseuri + username + "/" + dir + "/" + foldername;
		}
		HDFSFileUtil hUtil = new HDFSFileUtil();
		if (hUtil.mkdirs(pathname)) {
			LogDao log = new LogDaoImpl();
			log.write(username, "create", "not", pathname);
		}
	%>
	<script type="text/javascript">
		alert("File create successfully!!!");
		window.history.back();
	</script>
</body>
</html>