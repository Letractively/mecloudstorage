<%@ page language="java" contentType="text/html; charset=GB18030"
	pageEncoding="GB18030"%>
<%@ page import="com.hdfs.util.HDFSFileUtil"%>
<%@ page import="com.hdfs.dao.*"%>
<%@ page import="com.hdfs.dao.impl.*"%>
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
		String homedir = baseuri + username + "/";
		if (dir != null) {
			homedir = baseuri + username + "/" + dir + "/";
		}
		HDFSFileUtil hUtil = new HDFSFileUtil();
		hUtil.delete(homedir + filename);
		LogDao log = new LogDaoImpl();
		log.write(username, "delete", filename, homedir + filename);
		int dot = filename.lastIndexOf('.');
		String type = filename.substring(dot + 1);
		if (type.equals("jpg") || type.equals("png")) {
			PictureDao pic = new PictureDaoImpl();
			pic.delete(homedir + filename);
		}
	%>
	<script type="text/javascript">
		alert("File delete successfully!!!");
		window.history.back();
	</script>

</body>
</html>