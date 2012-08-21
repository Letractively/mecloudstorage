<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.hdfs.util.HDFSFileUtil"%>
<%@ page import="com.hdfs.util.DBUtil"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Test Include</title>
<link rel="stylesheet" type="text/css" href="css/cloud.css" />
<link rel="stylesheet" type="text/css" href="css/lightbox.css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/lightbox.js"></script>
</head>
<body>
	<h1>Picture Test</h1>
	<%
		ArrayList<String> paths = new ArrayList<String>();
		String sql = "SELECT pathname FROM log WHERE username=?";
		DBUtil util = new DBUtil();
		Connection conn = util.openConnection();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "jack");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				String s = rs.getString(1);
				paths.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			util.closeConnection(conn);
		}
	%>

	<%
		for (int i = 0; i < paths.size(); i++) {
	%>
	<a href="viewp.jsp?path=<%=paths.get(i)%>" rel="lightbox[pic]"> <img width="304"
		height="228" src="viewp.jsp?path=<%=paths.get(i)%>"></img></a>
	<%
		}
	%>

</body>
</html>