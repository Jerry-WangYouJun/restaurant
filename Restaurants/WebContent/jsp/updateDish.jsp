<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-theme.min.css">
<script
	src="${pageContext.request.contextPath}/bootstrap/js/jquery-3.2.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
	<jsp:include page="/common.jsp"></jsp:include>
   <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>更改价格</title>
</head>
<style>
body {
	background-color: #FCF8E3;
}

tr {
	font-size: 16px;
}

.miniPic {
	width: 180px;
	height: 180px;
	border: 1px solid white;
	border-radius: 10px;
}

input {
	border-radius: 3px;
}

a {
	text-decoration: none;
}

.selecter {
	width: 80px;
	height: 30px;
	border-radius: 3px;
}

.upPic {
	height: 30px;
	width: 220px;
}
</style>
<body>
	<div class="container">
		<div class="panel panel-info">
			<div class="panel-heading ">
				<h3 style="color: white;">更改菜品</h3>
			</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-md-6 col-md-offset-3">
						<form id="dataForm"
							action="${pageContext.request.contextPath}/updatePriceById.action"
							method="post" enctype="application/x-www-form-urlencoded">
							<table class="table table-striped">
								<c:forEach var="dish" items="${dishList}">
									<tr>
										<td>菜品ID <input type="hidden" value="${dish.user_id }"></td>
							   
										<td><input  name="dish_id" type="text" value="${dish.dish_id }" /></td>
									</tr>
									<tr>
										<td>菜品名称</td>
										<td><input name="dish_name" type="text" value="${dish.dish_name }"  /></td>
									</tr>
									<tr>
										<td>菜品价格</td>
										<td><input name="dish_price" type="text" value="${dish.dish_price}" /></td>
									</tr>
									<tr>
											<td>在售状态</td>
											<td>
											    <select name="dish_state" class="selecter" >
													<option value="1">在售</option>
													<option value="2">售罄</option>
												</select>
											</td>
										</tr>
									<tr>
										<td>菜品分类</td>
										<td><select name="dish_value"   >																							
												 <option value="1">小吃</option>
												 <option value="2">主食</option>
												 <option value="3">菜品</option>
												 <option value="4">酒水</option>											   
										</select></td>
									</tr>
									<tr>
										<td>图片上传</td>
										<td><input type="file" id="upfile" name="upfile" class="upPic"/></td>
									</tr>
									<tr>
										<td></td>
										<td><img class="miniPic" src="image/login.jpg" /></td>
									</tr>
									<tr>
										<td></td>
										<td>
											<button class="btn btn-default" type="button"
												style="margin-right: 60px;" onclick="addDishNew()">修改</button> <a
											href="${pageContext.request.contextPath}/jsp/Right.jsp"><button
													type="button" class="btn btn-default">返回</button></a>
										</td>
									</tr>
								</c:forEach>
							</table>
						</form>
					</div>
				</div>
				<div></div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
			  function addDishNew(){
				  $("#dataForm").ajaxSubmit({
	  					url : "${pageContext.request.contextPath}/ajaxupdate_dish.action",
	  					type : 'post',
	  					dataType : 'json',
	  					success : function(obj) {
	  						if (obj.success) {
								alert(obj.msg);
								parent.location.href="${pageContext.request.contextPath}/dishAll.action";
							} else {
								alert(obj.msg);
							}
	  					},
	  					error : function(transport) {
	  						$.messager.alert('提示', "系统产生错误,请联系管理员!", "error");
	  					}
	  				});
			  }
		
		</script>
</body>
</html>