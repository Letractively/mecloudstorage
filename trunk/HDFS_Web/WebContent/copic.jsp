<%@ page contentType="text/html;charset=gb2312"%>
<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="java.io.*"%>
<%@ page language="java" import="java.awt.*"%>
<%@ page language="java" import="java.awt.image.*"%>
<%@ page language="java" import="com.sun.image.codec.jpeg.*"%>
<%@ page import="com.hdfs.util.HDFSFileUtil"%>
<%@ page import="com.hdfs.dao.LogDao"%>
<%@ page import="com.hdfs.dao.impl.LogDaoImpl"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<meta name="generator" content="editplus" />
<meta name="author" content="Wang Shiqiang" />
<meta name="keywords" content="Wang Shiqiang" />
<meta name="description" content="" />
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
		String path = request.getParameter("path");
		response.reset();
		out.clear();
		out = pageContext.pushBody();
		response.setContentType("image/jpeg");
		OutputStream outres = null;
		InputStream in = null;
		try {
			outres = response.getOutputStream();
			HDFSFileUtil hUtil = new HDFSFileUtil();
			in = hUtil.download(path);
			Image src = javax.imageio.ImageIO.read(in);
			float tagsize = 200;
			int old_w = src.getWidth(null);
			int old_h = src.getHeight(null);
			int new_w = 0;
			int new_h = 0;
			int tempsize;
			float tempdouble;
			if (old_w > old_h) {
				tempdouble = old_w / tagsize;
			} else {
				tempdouble = old_h / tagsize;
			}
			new_w = Math.round(old_w / tempdouble);
			new_h = Math.round(old_h / tempdouble);
			BufferedImage tag = new BufferedImage(new_w, new_h,
					BufferedImage.TYPE_INT_RGB);
			tag.getGraphics().drawImage(src, 0, 0, new_w, new_h, null);
			JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(outres);
			encoder.encode(tag);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			outres.close();
			in.close();
		}
	%>
</body>
</html>