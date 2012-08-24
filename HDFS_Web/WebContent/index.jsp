<%@ page language="java" contentType="text/html; charset=GB18030"
	pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>A Cloud Storage Based On HDFS</title>
<link rel="stylesheet" type="text/css" href="css/cloud.css" />
</head>
<body>
	<div>
		<a id="index_a" href="register.jsp">Register</a>
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<div id="index_div">
		<img id="index_img" src="images/cloud.png" />
		<fieldset id="index_fieldset">
			<legend>Login</legend>
			<form id="index_form" action="check_login.jsp" method="post"
				name="form">
				<label>Username:</label> <input type="text" name="username"></input>
				<br /> <label>Password:</label> <input type="password"
					name="password"></input> <br /> <input type="submit" name="submit"
					value="Submit"></input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
					type="reset" name="reset" value="Reset"></input>
			</form>
		</fieldset>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>