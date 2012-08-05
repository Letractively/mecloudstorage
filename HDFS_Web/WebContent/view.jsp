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
<title>View File</title>
</head>
<body>
	<%!private static String baseuri = HDFSFileUtil.getBaseuri();%>
	<%
		String username = (String) session.getAttribute("username");
		String file = request.getParameter("file");
		String dir = request.getParameter("dir");
		String filename = new String(file.getBytes("iso-8859-1"), "GB18030");
		String homedir = baseuri + username + "/" + filename;
		if (dir != null) {
			homedir = baseuri + username + "/" + dir + "/" + filename;
		}
		response.reset();
		out.clear();
		out = pageContext.pushBody();
		response.setContentType("image/jpeg");
		OutputStream outres = null;
		InputStream in = null;
		try {
			outres = response.getOutputStream();
			HDFSFileUtil hUtil = new HDFSFileUtil();
			in = hUtil.download(homedir);
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
	%>
</body>
</html>