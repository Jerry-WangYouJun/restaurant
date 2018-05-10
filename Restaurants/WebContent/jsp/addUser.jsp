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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
		<style>
			body{
				background-color: #FCF8E3;
			}
			tr{
				font-size: 16px;
			}
			
			.miniPic{
				width: 180px;
				height: 180px;
				border: 1px solid white;
				border-radius: 10px;
			}
			input{
				border-radius: 3px;
			}
			a{
				text-decoration: none;
			}
			.selecter{
				width: 80px;
				height: 30px;
				border-radius: 3px;
			}
			.upPic{
				height: 30px;
				width: 220px;
				
			}
			
		</style>
<body>
	<div class="container">
			<div class="panel panel-info">
				<div class="panel-heading ">
					<h3 style="color: white;">新增用户</h3>
				</div>
				  <div class="panel-body">
					  	<div class="row">
						  <div class="col-md-6 col-md-offset-3">
							  	<form action="${pageContext.request.contextPath}/user/user_add.action" method="post">
							  		<table class="table table-striped">
										
										<tr>
											<td>用户名称</td>
											<td><input name="username" type="text" autofocus=""/></td>
										</tr>
										
										<tr>
											<td>密码</td>
											<td><input type="password" name="password" type="text"/></td>
										</tr>
										<tr>
											<td>角色</td>
											<td>
											    <select name="role" class="selecter">
													<option value="1">管理员</option>
													<option value="2">商户</option>
													<option value="3">消费者</option>
												</select>
											</td>
										</tr>
										
										<tr>
											<td></td>
											<td>
												<button class="btn btn-default" type="submit" style="margin-right: 60px;">新增</button>
												<a href="${pageContext.request.contextPath}/jsp/Right.jsp"><button type="button" class="btn btn-default">返回</button></a>
											</td>
										</tr>													
									</table>
							  	</form>
						  </div>
						</div>
						<div>
							
						</div>
				  </div>
			</div>
		</div>
</body>
</html>