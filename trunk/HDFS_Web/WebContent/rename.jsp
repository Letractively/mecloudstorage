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
<style type="text/css">
p {
	color: blue;
	text-align: center;
	fond-size: 40px;
}
</style>
</head>
<body>
	<%!private static String baseuri = HDFSFileUtil.getBaseuri();%>
	<%
		String username = (String) session.getAttribute("username");
		String srcfile = request.getParameter("file");
		String filename = new String(srcfile.getBytes("iso-8859-1"),
				"GB18030");
		String src = baseuri + username + "/" + filename;
		String dst = baseuri + username + "/"
				+ request.getParameter("rename");
		HDFSFileUtil hUtil = new HDFSFileUtil();
		if (hUtil.rename(src, dst)) {
			LogDao log = new LogDaoImpl();
			log.write(username, "rename", filename, src + " => " + dst);
		}
	%>
	<p>File rename successfully!!!</p>

</body>
</html>