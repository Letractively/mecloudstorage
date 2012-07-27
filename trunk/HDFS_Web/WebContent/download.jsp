<%@ page language="java" contentType="text/html; charset=GB18030"
	pageEncoding="GB18030"%>
<%@ page import="com.hdfs.util.HDFSFileUtil"%>
<%@ page import="com.hdfs.dao.LogDao"%>
<%@ page import="com.hdfs.dao.impl.LogDaoImpl"%>
<%@ page import="java.io.*"%>
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
		String filename = new String(file.getBytes("iso-8859-1"), "GB18030");
		String dir = baseuri + username + "/" + filename;
		response.reset();
		out.clear();
		out = pageContext.pushBody();
		response.setContentType("application/x-download");
		response.addHeader("Content-Disposition", "attachment;filename="
				+ file);
		OutputStream outres = null;
		InputStream in = null;
		try {
			outres = response.getOutputStream();
			HDFSFileUtil hUtil = new HDFSFileUtil();
			in = hUtil.download(username, filename);
			byte[] ioBuffer = new byte[4096];
			int readLen = 0;
			while ((readLen = in.read(ioBuffer)) != -1) {
				outres.write(ioBuffer, 0, readLen);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			outres.close();
			in.close();
		}
		LogDao log = new LogDaoImpl();
		log.write(username, "download", filename, dir);
	%>
</body>
</html>