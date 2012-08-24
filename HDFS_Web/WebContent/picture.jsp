<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Picture View</title>
<link rel="stylesheet" type="text/css" href="css/cloud.css" />
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
		<h2>Picture View</h2>
	</div>
	<div id="picture_div">
		<%
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
			if (dir != null) {
		%>

		<img src="view.jsp?dir=<%=dir%>&file=<%=file%>"></img>
		<%
			} else {
		%>
		<img src="view.jsp?file=<%=file%>"></img>
		<%
			}
		%>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>