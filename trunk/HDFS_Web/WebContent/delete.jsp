<%@ page language="java" contentType="text/html; charset=GB18030"
	pageEncoding="GB18030"%>
<%@ page import="com.hdfs.util.HDFSFileUtil"%>
<%@ page import="com.hdfs.dao.LogDao"%>
<%@ page import="com.hdfs.dao.impl.LogDaoImpl"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Delete File</title>
<link rel="stylesheet" type="text/css" href="css/cloud.css" />
</head>
<body>
	<%!private static String baseuri = HDFSFileUtil.getBaseuri();%>
	<%
		String username = (String) session.getAttribute("username");
		if(username == null){
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
		String homedir = baseuri + username + "/" + filename;
		if (dir != null) {
			homedir = baseuri + username + "/" + dir + "/" + filename;
		}
		HDFSFileUtil hUtil = new HDFSFileUtil();
		hUtil.delete(homedir);
		LogDao log = new LogDaoImpl();
		log.write(username, "delete", filename, homedir);
	%>
	<script type="text/javascript">
		alert("File delete successfully!!!");
		window.history.back();
	</script>

</body>
</html>