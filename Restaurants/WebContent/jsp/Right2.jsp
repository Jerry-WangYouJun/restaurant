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
	     window.location.href="${pageContext.request.contextPath}/selectOrderFen.action?state="+0;
	}
	function selectorderAll(){
	     window.location.href="${pageContext.request.contextPath}/jsp/orderInfomation.jsp";
	}
	</script>
	</head>	
	<body>
		<div class="container">
		<div class="dropdown" style="display: inline;position: relative;left: 85%;">
					  <a href="#" class="btn  btn-default" data-toggle="dropdown"><span class="glyphicon glyphicon-th-list" style="width: 60px;"></span></a>
					  <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
			  		 		<li> <a>账户余额：${userBean.money}</a></li>
				            <li><a href="${pageContext.request.contextPath}/selectOrderByUser.action">历史订单</a></li>
		  		 	  <li><a  target="_top" href="${pageContext.request.contextPath}/jsp/Login.jsp" style="cursor:hand">注销</a></li>
					  </ul>
					</div>  
			<div class="panel panel-default">
		  	<div class="panel-heading">
			        <button type="button" class="btn btn-success" onclick="selectorderAll()">查询订单</button>
			</div>
			<div class="panel-body">				
				<div class="row"> 		
				<c:forEach items="${sellerList}" var="list">								
					<div class="col-md-3">
							<span class="thumbnail">
				      			<input type="hidden" value = "${list.id}"/>
				      			<img src="/upload/${list.img}" class="img-rounded" alt="..."/>			      			
				      			<hr class="line">
				      			<div class="row">
				      				<div class="col-md-6 col-sm-6">
				      					<p class="price" id="dishprice1">${list.username}</p>
				      				</div>
				      				<div class="col-md-6 col-sm-6">
				      				 	<a href="${pageContext.request.contextPath}/userbuy.action?id=${list.id}" ><button type="button" class="btn btn-primary btn_left">进入商家</button></a>
				      				</div>     				
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