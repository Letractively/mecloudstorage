<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ajax</title>
<style>
#myTable {
	margin: 0px auto;
	font-size: 14px;
	font-family: Verdana;
	border-collapse: collapse;
	width: 95%;
}

#myTables th {
	background-color: green;
	color: white;
}
td {
	text-align: center;
}
</style>
</head>
<body>
	<script type="text/javascript">
		function loadXMLDoc() {
			var xmlhttp;
			if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
				xmlhttp = new XMLHttpRequest();
			} else {// code for IE6, IE5
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					document.getElementById("myTable").innerHTML = xmlhttp.responseText;
				}
			}
			xmlhttp.open("GET", "info.jsp?filepath=/user/user/lyy", true);
			xmlhttp.send();
		}
	</script>
</head>
<body>

	<div>
		<table id="myTable" class="content"></table>
		<h2>Let AJAX change this text</h2>
	</div>
	<button type="button" onclick="loadXMLDoc()">Change Content</button>
</body>
</html>