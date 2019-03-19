<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-theme.min.css">
<script src="${pageContext.request.contextPath}/bootstrap/js/jquery-3.2.1.min.js"></script>  
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>  
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>

<style type="text/css">
   body {
    background-color: #eee;
  }
  .fullscreen_bg {
    
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    background-size: cover;
    background-position: 50% 50%;
    background-image: url(${pageContext.request.contextPath}/image/bread.jpg);
  }
  .form-signin {
    max-width: 280px;
    padding: 15px;
    margin: 15% auto;
  }
  .form-signin .form-signin-heading, .form-signin {
    margin-bottom: 10px;
  }
  .form-signin .form-control {
    position: relative;
    font-size: 16px;
    height: auto;
    padding: 10px;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
  }
  .form-signin .form-control:focus {
    z-index: 2;
  }
  .form-signin input[type="text"] {
    margin-bottom: -1px;
    border-bottom-left-radius: 0;
    border-bottom-right-radius: 0;
    border-top-style: none;
    border-right-style: none;
    border-bottom-style: none;
    border-left-style: none;
    border-color: #000;
  }
  .form-signin input[type="password"] {
    margin-bottom: 10px;
    border-top-left-radius: 0;
    border-top-right-radius: 0;
    border-top-style: none;
    border-right-style: none;
    border-bottom-style: none;
    border-left-style: none;
    border-color: #000;
  }
  .form-signin-heading {
    color: #fff;
    text-align: center;
    text-shadow: 0 2px 2px rgba(0,0,0,0.5);
  }
  button{
  	opacity: 0.8; 
  	background-color: #FAFAD2;
  }
  button:hover{
  	opacity: 0.9;
  }
  
 </style> 
 <script type="text/javascript">
 function Login_Onclick(){
		var name=document.login.username.value;
		var pwd=document.login.password.value;
		if(name==null||name==""){
			alert("请输入用户名");
			return;
		}
		else if(pwd==null||pwd==""){
			alert("请输入密码名");		
			return;			
		}
		else{
			document.login.submit();			
		}
 }
 </script>
	<body>
		
		<div id="fullscreen_bg" class="fullscreen_bg">

		<div class="container">		
			<form name="login" class="form-signin" action="${pageContext.request.contextPath}/login.action" method="post">
				<h1 class="form-signin-heading text-muted">用户登录</h1>
				<input type="text" class="form-control" name="username" placeholder="请输入用户名" required="" autofocus="">
				<input type="password" class="form-control" name="password" placeholder="请输入密码" required="">
				<button class="btn btn-lg  btn-block" onclick="Login_Onclick()">
					登录
				</button>
				<span>${msg }</span>
			</form>
		
		</div>
		
		</div>
	</body>
</html>