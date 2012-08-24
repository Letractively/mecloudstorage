<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.hdfs.util.HDFSFileUtil"%>
<%@ page import="com.hdfs.util.DBUtil"%>
<%@ page import="com.hdfs.dao.*"%>
<%@ page import="com.hdfs.dao.impl.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Picture Album</title>
<link rel="stylesheet" type="text/css" href="css/cloud.css" />
<link rel="stylesheet" type="text/css" href="css/lightbox.css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/lightbox.js"></script>
</head>
<body>
	<%
		String username = (String) session.getAttribute("username");
	%>
	<div>
		<p class="title_p">
			Welcome <a href="userinfo.jsp"><%=username%></a>,
			<script type="text/javascript" src="js/cal.js"></script>
		</p>
		<jsp:include page="header.jsp"></jsp:include>
		<hr />
		<h2>Album Browser</h2>
	</div>
	<%
		if (username == null) {
	%>
	<script type="text/javascript">
		alert("You must login first!");
		top.location = "index.jsp";
	</script>
	<%
		}
		ArrayList<String> paths = new ArrayList<String>();
		PictureDao pic = new PictureDaoImpl();
		paths = pic.get(username);
	%>
	<div id="album_thumbnail">
		<%
			for (int i = 0; i < paths.size(); i++) {
		%>
		<a href="viewalbum.jsp?path=<%=paths.get(i)%>" rel="lightbox[pic]">
			<img width="200" height="150"
			src="thumbnail.jsp?path=<%=paths.get(i)%>"></img>
		</a>
		<%
			}
		%>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>