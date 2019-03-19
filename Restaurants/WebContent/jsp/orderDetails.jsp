<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-theme.min.css">
<script src="${pageContext.request.contextPath}/bootstrap/js/jquery-3.2.1.min.js"></script>  
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>  
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>欢迎来到订单界面</title>
</head>

		<style>
			body{
				background-color: #FCF8E3;
			}
			tr{
				font-size: 16px;
			}
			a{
				text-decoration: none;
			}
		</style>
	</head>
	<script type="text/javascript">
	function fanhui(){
		//window.navigate("jsp/Left.jsp"); 

		window.location.href="jsp/Left.jsp";
	}
	</script>
	<body>
		
		<div class="container">
			<div class="panel panel-info">
				<div class="panel-heading ">
					<h3>订单号：Order_${ orderList[0].order_number}</h3>
					
				</div>
				  <div class="panel-body">
						<table class="table table-striped">
							<thead>
								<tr style="font-size: 18px;">
									<td>菜品名称</td>
									<td>菜品数量</td>
									<td>单价</td>
									
								</tr>
							</thead>
							<!--详单菜品信息-->
							<c:forEach var="order" items="${orderList}" >
							<tr>
								<td>${order.order_name}</td>
								<td>${order.order_count}</td>
								<td>${order.order_price}</td>
							</tr>
						</c:forEach>
						<!--	总计-->
							<tfoot>
								<tr style="font-size: 20px;">
									<td>
										<a href="${pageContext.request.contextPath}/selectOrderByUser.action"><button type="button" class="btn btn-default">返回</button></a>
									</td>
									<td></td>
								<td></td>
								</tr>
							</tfoot>
							
							
						</table>
				  </div>
			</div>
		</div>
		
	</body>
</html>