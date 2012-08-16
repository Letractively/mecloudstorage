<%@ page language="java" contentType="text/html; charset=GB18030"
	pageEncoding="GB18030"%>
<%@ page import="com.hdfs.util.HDFSFileUtil"%>
<%@ page import="com.hdfs.dao.LogDao"%>
<%@ page import="com.hdfs.dao.impl.LogDaoImpl"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Rename File</title>
<link rel="stylesheet" type="text/css" href="css/cloud.css" />
<style type="text/css">
</style>
</head>
<body>
	<%!private static String baseuri = HDFSFileUtil.getBaseuri();%>
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
		String src = baseuri + username + "/" + filename;
		String dst = baseuri + username + "/"
				+ request.getParameter("rename");
		if (dir != null) {
			src = baseuri + username + "/" + dir + "/" + filename;
			dst = baseuri + username + "/" + dir + "/"
					+ request.getParameter("rename");
		}
		HDFSFileUtil hUtil = new HDFSFileUtil();
		if (hUtil.rename(src, dst)) {
			LogDao log = new LogDaoImpl();
			log.write(username, "rename", filename, src + " => " + dst);
		}
	%>
	<script type="text/javascript">
		alert("File rename successfully!!!");
		window.history.back();
	</script>

</body>
</html>