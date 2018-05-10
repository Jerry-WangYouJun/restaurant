<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-theme.min.css">
<script src="${pageContext.request.contextPath}/bootstrap/js/jquery-3.2.1.min.js"></script>  
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>  
<link href="https://cdn.bootcss.com/bootstrap-select/2.0.0-beta1/css/bootstrap-select.css" rel="stylesheet">
<script src="https://cdn.bootcss.com/bootstrap-select/2.0.0-beta1/js/bootstrap-select.js"></script> 
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />  
<script src="${pageContext.request.contextPath}/bootstrap/js/moment-with-locales.js"></script>  
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap-datetimepicker.min.js"></script> 
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap-datetimepicker.zh-CN.js"></script> 
<style type="text/css">
		body{
			background-color: #FCF8E3;
		}
		.table_show{
			text-align: center;
			font-size: 18px;;
		}
		.sum{
			font-size: 24px;
		}
		.sum_price button{
			margin-left: 50px;
		}
		.user_Info a{
			text-decoration: none;
		}
		.user_Info img{
			width: 160px;
			height: 160px;
			margin-bottom: 15px;
		}
		.user_Info div{
			text-align: center;
			font-size: 20px;
			margin-bottom: 30px;
		}
		.active label{
			width: 18px;
			text-align: center;
		}
		.active td:first-child{
			width: 85px !important;
			margin: auto 0;
			padding: auto 0;
		}
	</style>
	<script type="text/javascript">
	
		  $(function(){
			  $('#datetimepicker1').datetimepicker({  
			        todayBtn: true,//显示今日按钮
			        autoclose: true,
			        locale: moment.locale('zh-cn'),
			        startDate: new Date()
			    });
		  });
	</script>
</head>

	<body>	
		<div class="container">
		  	
		  	<div class="panel panel-default">
			  <div class="panel-body">
			  	
			  	<div class="user_Info">
			  		<div>
				  		<img src="${pageContext.request.contextPath}/image/login.jpg" class="img-circle" />
			  		</div>
			  		<div>
			  			<span>${username} </span>
			  		</div>
			  	</div>
			  	
			  	
			    	<table class="table table-hover table_show" id="order_all">
			    		<thead class="table">
			    			<tr class="success">
						  		<td>菜品名</td>
						  		<td>价格(￥)</td>
						  		<td>数量(份)</td>
								<td></td>
						  	</tr>		
			    		</thead>	
			    		   <c:set var="money" value="0"></c:set>
					    <c:forEach items="${orderbuyList}" var="buylist">
					    <c:set var="money" value="${money+buylist.order_price* buylist.order_count}"></c:set>
					    	<tr class="active">
					    	
					            <td id="namemai" name="namemai">${buylist.order_name}</td>
						  		<td id="pricemai" name="pricemai"> ${buylist.order_price}</td>
						  		<td name="countStr" value="">
						  			<button id="btn1_minus" class="btn btn-xs btn-primary glyphicon glyphicon-minus" onclick="num_Minus(${buylist.order_id})"></button>
						  			<label id="count" >${buylist.order_count}</label>
						  			<button id="btn1_add" class="btn btn-xs btn-primary glyphicon glyphicon-plus" onclick="num_Add(${buylist.order_id})"></button>
						  		</td>
						  		<td><button id="btn1_del" class="btn btn-xs btn-danger glyphicon glyphicon-trash" onclick="goods_Delete(${buylist.order_id})"></button></td>
						</tr>	
						</c:forEach>
					</table>
			  </div>
			</div>
			<div class="panel panel-default">
					<div class="panel-body sum_price">
						  是否外带：
						  <select style="width:20px" id="location" class="selectpicker show-tick" data-style="btn-info">
						  	  <option selected="selected" style="height: 35px">--请选择--</option>
						  	  <option value="1" style="height: 35px">--外带--</option>
						  	  <option value="2" style="height: 35px">--在店用餐--</option>
						  </select> 
						  <div  style="margin-top: 20px">  
					            <label>取餐时间：</label>  
					            <!--指定 date标记-->  
					            <div class='input-group date' id='datetimepicker1' >  
					                <input type='text' class="form-control"  id="orderDate"/>  
					                <span class="input-group-addon">  
					                    <span class="glyphicon glyphicon-calendar"></span>  
					                </span>  
					            </div>  
					        </div>  
					</div>
			</div>
			<div class="panel panel-default">
			  <div class="panel-body sum_price">
			       
			  		<span class="sum" >￥:<span class="sum" id="sum">${money}</span></span>
			  		<button id="check" class="btn btn-success" data-toggle="modal" data-target="#myModal" >
					    提交订单
					</button>
					
					<!-- Modal -->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header" style="background-color:#B2DBA1; border-radius: 5px 5px 0 0;">
					        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					        <h4 class="modal-title order_tittle" id="myModalLabel" style="font-size: 26px;color: white;">订单状态</h4>
					      </div>
					      <div class="modal-body">
					      		<h4 style="text-align: center;font-size: 25px;">订单已确认！</h4>
					      		<h4 style="position: absolute; left: 30px;top:160px; color: #D9534F; font-weight: bold;"> 萌萌哒~~</h4>
					           	<img src="${pageContext.request.contextPath}/image/1.gif" class="center-block"" />
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-success" data-dismiss="modal" onclick="jiezhang()">结账</button>
					      </div>
					    </div><!-- /.modal-content -->
					  </div><!-- /.modal-dialog -->
					</div><!-- /.modal -->
			   		
			  </div>
			</div>
		  	
		</div>
	</body>
	<script type="text/javascript">
	
	function jiezhang(){
		var  flag = confirm("是否使用现金付账");
		var location = $("#location").val();
		var orderDate = $("#orderDate").val();
		var cash ="1";
		if(!flag){
			 cash = "0"
		}
			 top.document.location.href="${pageContext.request.contextPath}/addorder.action?location="+ location 
			 + "&orderDate=" + orderDate + "&cash=" + cash ;	
	}	
	//数量+1
		function num_Add(i){
			top.document.location.href="${pageContext.request.contextPath}/dishadd.action?id=" + i;
		}
	//数量-1
		function num_Minus(i){
			top.document.location.href="${pageContext.request.contextPath}/dishdelete.action?id=" + i;
		}
	//删除已选菜品
		function goods_Delete(i){
			/* var order=document.getElementById("btn"+i+"_del");
			var x=order.parentElement.parentElement;
			x.remove(); */
			top.document.location.href="${pageContext.request.contextPath}/dishdeleteAll.action?id=" + i;	 
		}
		
		function clearAll(){
			var All=document.getElementsByClassName("active");
			document.getElementById("sum").innerText="0";
			 window.location.href="${pageContext.request.contextPath}/clearorder.action";
			console.log(All.length);
			while(All.length>0){
				All[0].remove();
			}
		}
	</script>

</html>