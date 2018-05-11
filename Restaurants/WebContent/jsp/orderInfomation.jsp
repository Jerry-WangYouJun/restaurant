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

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
	<style>
			body{
				background-color: #FCF8E3;				
			}
		</style>
	</head>
	<script type="text/javascript">
	function selectOrder(){
		var number = document.getElementById("order_number").value;
		if(number==null||number==""){
		   window.location.href="${pageContext.request.contextPath}/selectOrderFen.action";
		}else{
		   window.location.href="${pageContext.request.contextPath}/selectOrder.action?order_number="+number;		
		}
	}	
	function deleteall(){
	    var id = document.getElementsByName('ids');
	    var value = new Array();
	    for(var i = 0; i < id.length; i++){
	     if(id[i].checked)
	     value.push(id[i].value);
	    } 
	    alert(value);
	  window.location.href= "${pageContext.request.contextPath}/deleteall.action?value="+value.toString();	
	// window.location.href ='某Action!netWorkingUpdate?concentratorids='+value.toString();
	}
   function update(id){
		  window.location.href="${pageContext.request.contextPath}/updeteOrder.action?order_id="+id;	
   }
	</script>

	<body>
		<div class="container">
			<div class="panel panel-default">
				  <div class="panel-body">
						<form class="navbar-form navbar-left" action="" method="post">
							<div class="form-group">
								<input type="text" id="order_number" class="form-control" placeholder="请输入订单号">
								<button type="button" class="btn btn-default" onclick="selectOrder()">查询</button>
							</div>
						   <button type="button" class="btn btn-default" onclick="deleteall()">批量删除</button>						
						</form>
				  </div>
			</div>
			
			<div class="panel panel-default">
				  <div class="panel-body">

						<table class="table table-striped">
							<thead>
								<tr>
								    <td></td>
									<td>时间</td>
									<td>订单号</td>
									<td>总费用</td>
									<td align="center">状态</td>
									<td >详情</td>
									
								</tr>
							</thead>
							<c:forEach var="order" items="${orderList}" >
							<tr>
							    <td><input type="checkbox" name="ids" value="${order.id}"/></td>
								<td>${order.orderdate}</td>
								<td>${order.orderid}</td>
								<td>${order.money}</td>
								<td align="center">
									  <c:choose>
									  	  <c:when test="${order.state eq 0}">未付款</c:when>
									  	  <c:when test="${order.state eq 1}">已付款</c:when>
									  	  <c:when test="${order.state eq 3}">已完成</c:when>
									  </c:choose>
								</td>
								<td><a href="${pageContext.request.contextPath}/selectOrderDetail.action?order_number=${order.orderid}">详细</a></td>
								<td><button type="button" class="btn btn-default" onclick="update(${order.id})">更新状态</button></td>
							</tr>
						</c:forEach>
						</table>
				  </div>
			</div>
			<div class="panel panel-default">
				  <div class="panel-body">
						<form class="navbar-form navbar-left" action="" method="post">
							<div class="form-group">
						<a href="${pageContext.request.contextPath}/selectOrderFen.action?index=${index-1}">	<button type="button" class="btn btn-default" >上一页</button></a>	
						<a href="${pageContext.request.contextPath}/selectOrderFen.action?index=${index+1}">	<button type="button" class="btn btn-default" >下一页</button></a>
							</div>
							<a href="${pageContext.request.contextPath}/dishAll.action" target="_parent"><button type="button" class="btn btn-default">返回</button></a>
						</form>
				  </div>
			</div>
		</div>
	</body>
</html>