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
		<style type="text/css">
				body{
					background-color: #FCF8E3;
				}
				h4{
			    	font-weight: 600;
				}
				p{
					font-size: 12px;
					margin-top: 5px;
				}
				.price{
					font-size: 25px;
			    	margin: 0 auto;
			    	color: #333;
				}
			
				.thumbnail{
					opacity:0.70;
					-webkit-transition: all 0.5s; 
					transition: all 0.5s;
				}
				.thumbnail:hover{
					opacity:1.00;
					box-shadow: 0px 0px 10px #4bc6ff;
				}
				.line{
					margin-bottom: 5px;
				}
				span.thumbnail {
			        border: 1px solid #00c4ff !important;
			    border-radius: 0px !important;
			    -webkit-box-shadow: 0px 0px 14px 0px rgba(0,0,0,0.16);
			    -moz-box-shadow: 0px 0px 14px 0px rgba(0,0,0,0.16);
			    box-shadow: 0px 0px 14px 0px rgba(0,0,0,0.16);
				padding: 10px;
				}
				.container h4{margin-top:10px; margin-bottom:5px;}
				.btn_tittle{
					background-color: lightgoldenrodyellow;
				}
				.btn_tittle p label{
					width: 120px;
					margin: 3px;
				}
				.btn_left{margin-left: 10px;}
				
				.dropdown-menu a{
					text-decoration: none;
					font-size: 20px;;
					color: black;
				}
				.dropdown a li{
					text-align: center;
					font-family: "幼圆";
					font-weight: 600;
					color: #8C8C8C;
				}
				hr{
					margin: 3px ;
				}
	</style>
	
	<script type="text/javascript">	   
	function selectorder(){
	     window.location.href="${pageContext.request.contextPath}/jsp/orderInfomation.jsp";
	}
	function selectdish1(){
	
	     window.location.href="${pageContext.request.contextPath}/selectDishFen.action?index="+1;
	}
	function returnMian(){
		parent.location.href="${pageContext.request.contextPath}/dishAll.action";
	}
	function editDish(){
		window.location.href="${pageContext.request.contextPath}/selectDishList.action";
	}
	function addDish(){
		window.location.href="${pageContext.request.contextPath}/jsp/addGood.jsp";
	}
	</script>
	</head>	
	<body>
		<div class="container">
		<div class="dropdown" style="display: inline;position: relative;left: 85%;">
					  <a href="#" class="btn  btn-default" data-toggle="dropdown"><span class="glyphicon glyphicon-th-list" style="width: 60px;"></span></a>
					  <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
				<c:choose>
		  		 	  <c:when test="${userBean.role eq '1' }">
		  		 	  			<li><a  href="${pageContext.request.contextPath}/jsp/addUser.jsp" style="cursor:hand">新增用户</a></li>
			           		    <li><a  href="${pageContext.request.contextPath}/user/userMenu.action" style="cursor:hand">用户充值</a></li>
		  		 	  </c:when>
		  		 	  <c:when test="${userBean.role eq '2' }">
		  		 	  		 <li> <a href="${pageContext.request.contextPath}/jsp/addGood.jsp">菜品新增</a></li>
				       		 <li><a href="#" onclick="selectorder()">历史订单</a></li>
			            	 <li><a  href="${pageContext.request.contextPath}/selectDishList.action" style="cursor:hand">菜品编辑</a></li>
		  		 	  </c:when>
		  		 	  <c:when test="${userBean.role eq '3' }">
			  		 		<li> <a>账户余额：${userBean.money}</a></li>
				            <li><a  href="${pageContext.request.contextPath}/user/userMenu.action" style="cursor:hand">用户充值</a></li>
				            <li><a href="${pageContext.request.contextPath}/selectOrderByUser.action">历史订单</a></li>
		  		 	  </c:when>
		  		 </c:choose>
		  		 	  <li><a  target="_top" href="${pageContext.request.contextPath}/jsp/Login.jsp" style="cursor:hand">注销</a></li>
					  </ul>
					  
					</div>  
			<div class="panel panel-default">
		  	<div class="panel-heading">
		  		  <c:choose>
		  		 	  <c:when test="${userBean.role eq '2' }">
		  		 	  		<button type="button" class="btn btn-success" onclick="addDish()">菜品新增</button>
			  				<button type="button" class="btn btn-success" onclick="selectdish1()">菜品管理</button>
					        <button type="button" class="btn btn-success" onclick="selectorder()">查询订单</button>
		  		 	  </c:when>
		  		 	  <c:when test="${userBean.role eq '3' }">
					  		 <button type="button" class="btn btn-success" onclick="returnMian()">返回</button>
		  		 	  </c:when>
		  		 </c:choose>
			</div>
			<div class="panel-body">				
				<div class="row"> 		
				<c:forEach items="${dishList}" var="list">								
					<div class="col-md-2">
							<span class="thumbnail">
								<input type="hidden" value = "${list.user_id}"/>
				      			<input type="hidden" value = "${list.dish_id}"/>
				      			<img src="/upload/${list.dish_img}" class="img-rounded" alt="..."/>			      			
				      			<h4 id="dishname1" name="dishname1">${list.dish_name}</h4>			      			
				      			<hr class="line">
				      			<div class="row">
				      				<div class="col-md-6 col-sm-6">
				      					<p class="price" id="dishprice1">${list.dish_price}</p>
				      				</div>
				      				<c:if test="${userBean.role eq '3' }">
					      				<div class="col-md-6 col-sm-6">
					      				 	<a href="${pageContext.request.contextPath}/dishbuy.action?name1=${list.dish_name}&price1=${list.dish_price}&id=${list.dish_id}&user_id=${list.user_id}" target="_parent">
					      				 		<c:choose>
					      				 			 <c:when test="${list.dish_state eq '2' }">
					      				 			 		<button type="button" class="btn btn-primary btn_left" disabled="disabled">售罄</button>
					      				 			 </c:when>
					      				 			 <c:otherwise>
					      				 			 	 <button type="button" class="btn btn-primary btn_left">Buy</button>
					      				 			 </c:otherwise>
					      				 		</c:choose>
					      				 	</a>
					      				</div>     				
				      				</c:if>
				      			</div>
				    		</span>
					</div>
				</c:forEach>														
				</div>
			  	</div>
			</div>
		</div>
	</body>
</html>