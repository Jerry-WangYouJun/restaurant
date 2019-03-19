<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-theme.min.css">
 	<script src="${pageContext.request.contextPath}/bootstrap/js/jquery-3.2.1.min.js"></script>  
 	<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>  
		
		<style type="text/css">
			body{
				background-color: #FCF8E3;
				margin: 0px;
				padding: 0px;
			}
			.time{
				font-size: 20px;
				font-family: "幼圆";
			}
			.headInfo{
				text-align: right;
				margin-right: 40px;
			}
			.head_tittle{
				text-align: center;
			}
		</style>
	</head>
	<script type="text/javascript">
	
		function getTime(){
			var timeContainer=document.getElementById("time");
			timeContainer.innerText=new Date().toLocaleString();
		}
		setInterval("getTime()", 1000);
	</script>
	<body>
		<div class="headInfo">
			<span class="time">欢迎您</span>
			<span class="time" id="time"></span>
		</div>
	</body>
</html>