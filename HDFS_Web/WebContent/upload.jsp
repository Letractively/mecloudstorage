<%@ page language="java" contentType="text/html; charset=GB18030"
	pageEncoding="GB18030"%>
<%@ page import="java.io.BufferedInputStream"%>
<%@ page import="com.hdfs.util.HDFSFileUtil"%>
<%@ page import="com.hdfs.dao.LogDao"%>
<%@ page import="com.hdfs.dao.impl.LogDaoImpl"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page
	import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Upload a file to HDFS</title>
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
		String dir = request.getParameter("dir");
		if (ServletFileUpload.isMultipartContent(request)) {
			try {
				ServletFileUpload upload = new ServletFileUpload();
				FileItemIterator iter = upload.getItemIterator(request);
				while (iter.hasNext()) {
					FileItemStream item = iter.next();
					if (!item.isFormField() && item.getName().length() > 0) {
						String filename = item.getName();
						BufferedInputStream in = new BufferedInputStream(
								item.openStream());
						String homedir = baseuri + username + "/";
						if (dir != null) {
							homedir = baseuri + username + "/" + dir + "/";
						}
						HDFSFileUtil hUtil = new HDFSFileUtil();
						hUtil.upload(homedir, in, filename);
						LogDao log = new LogDaoImpl();
						log.write(username, "upload", filename, homedir
								+ filename);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	%>
	<script type="text/javascript">
		alert("File upload successfully!!!");
		window.history.back();
	</script>
</body>
</html>
