<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<style>
			body{
				background-color: #FCF8E3;
				font-size: 18px;
			}
			thead td{
				font-size: 20px;
				font-weight: bolder;	
			}
			td{
				text-align: center;
			}
			a{
				text-decoration: none;
			}
			img{
				width: 120px;
				height: 90px;
				border-radius: 3px;
			}
		</style>
	</head>
	
		<script type="text/javascript">
		function delDish(dishId){		
			window.location.href="${pageContext.request.contextPath}/delDish.action?dishid="+dishId;

		}
		function updateDish(dishId){		
			window.location.href="${pageContext.request.contextPath}/selectDishById.action?dishId="+dishId;

		}
	</script>
	<body>
		<div class="container">
			<div class="panel panel-default">
				  <div class="panel-body">
						<form class="navbar-form navbar-left" action="${pageContext.request.contextPath}/queryByName.action">
							<div class="form-group">
								<input type="text" name="dishname" class="form-control" placeholder="输入菜的名字">
								<button type="submit" class="btn btn-default" >查询</button>							
							</div>
						</form>
				  </div>
			</div>
			
			<div class="panel panel-default">
				  <div class="panel-body">
						<table class="table table-striped">
							<thead>
								<tr>
									<td>菜名</td>
									<td>价格</td>
									<td>分类</td>
									<td>图片</td>
									<td>操作</td>
								</tr>
							</thead>
								<c:forEach var="dish" items="${dishList}">
							<tr>					  
								<td align="center">${dish.dish_name}</td>
								<td align="center">${dish.dish_price}</td>
								<td align="center">
									  <c:choose>
									  		<c:when test="${dish.dish_value eq 1 }">小吃</c:when>
									  		<c:when test="${dish.dish_value eq 2 }">主食</c:when>
									  		<c:when test="${dish.dish_value eq 3 }">菜品</c:when>
									  		<c:when test="${dish.dish_value eq 4 }">酒水</c:when>
									  		<c:otherwise>其他</c:otherwise>
									  </c:choose>
								</td>
								<td align="center"><img src="/upload/${dish.dish_img}" /></td>
								<td align="center"><input class="btn btn-default"type="button" value="编辑" onclick="updateDish(${dish.dish_id})"/></td>
						    	<td align="center"><input class="btn btn-default" type="button" value="删除" onclick="delDish(${dish.dish_id})"/></td>
							</tr>
							</c:forEach>							
						</table>
						<div class="panel panel-default">
				  <div class="panel-body">
						<form class="navbar-form navbar-left" action="" method="post">
							<div class="form-group">						
						<a href="${pageContext.request.contextPath}/selectDishFen.action?index=${index-1}">	<button type="button" class="btn btn-default" >上一页</button></a>	
						<a href="${pageContext.request.contextPath}/selectDishFen.action?index=${index+1}">	<button type="button" class="btn btn-default" >下一页</button></a>
							</div>
							<a href=${pageContext.request.contextPath}/jsp/Right.jsp><button type="button" class="btn btn-default">返回</button></a>
						</form>
				  </div>
			</div>
				  </div>
				 
			</div>
			
		</div>
			
		
	</body>

</html>