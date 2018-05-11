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
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-table.min.css" />  
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-table.js"></script>   
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
   function delDish(){
	   var a= $("#infoTable").bootstrapTable('getSelections');
		  window.location.href="${pageContext.request.contextPath}/updeteOrder.action?order_id="+a[0].id;	
   }
   
   function orderDetail(){
	   var a= $("#infoTable").bootstrapTable('getSelections');
	   window.location.href="${pageContext.request.contextPath}/selectOrderDetail.action?order_number=" + a[0].orderid;
   }

   $(function(){  
	    $('#infoTable').bootstrapTable({  
	        url : '${pageContext.request.contextPath}/selectOrderList.action', // 请求后台的URL（*）            
	        method : 'get', // 请求方式（*）
	        toolbar:'#toolbar',
	        cache : false, // 是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）  
	        sidePagination : "client", // 分页方式：client客户端分页，server服务端分页（*）  
	        pagination : true, // 是否显示分页（*）  
	        pageNumber: 1,    //如果设置了分页，首页页码  
	        pageSize: 4,                       //每页的记录行数（*）  
	        pageList: [4,5,6],        //可供选择的每页的行数（*）  
	        showRefresh : true, // 是否显示刷新按钮  
	        clickToSelect : true, // 是否启用点击选中行  
	        showToggle : false, // 是否显示详细视图和列表视图的切换按钮  
	        search:true,   //是否启用搜索框  
	        columns : [{radio:true},{filed:'id',
	        				visible:false
	        	}, 	{  
	            field : 'orderdate',  
	            title : '订单时间',  
	             align: 'center',  
	             valign: 'middle'  
	        },{  
	            field : 'orderid',  
	            title : '订单编号',  
	             align: 'center',  
	             valign: 'middle'  
	               
	        }, {  
	           field : 'state',  
	            title : '订单状态',  
	             align: 'center',  
	             valign: 'middle'  ,
	             formatter : function (value, row, index) {
	                if (value === '0') {
	                     return '未付款';
	                 }else  if (value === '1') {
	                     return '已付款';
	                 }else  if (value === '3') {
	                     return '已完成';
	                 }else{
	                	 	 return '';
	                 }
	             }
	        }],  
	        silent : true, // 刷新事件必须设置  
	               
	    });  
	}) 
	</script>

	<body>
		<div class="container">
			<div class="panel panel-default">
				  <div class="panel-body">
						<form class="navbar-form navbar-left" action="" method="post">
							<div class="form-group">
								  <a href="${pageContext.request.contextPath}/dishAll.action" target="_parent"><button type="button" class="btn btn-default">返回</button></a>						
							</div>
						</form>
				  </div>
			</div>
			<div class="panel panel-default">
				  <div class="panel-body">
					  <table id="infoTable">
					  </table>
					  
							  <div id="toolbar" class="btn-group">  
					  <c:if test="${userBean.role eq '3'}">
							  <button id="btn_delete" type="button" class="btn btn-default" onclick="delDish()">  
					                <span class="glyphicon glyphicon-usd" aria-hidden="true" ></span>付款  
					            </button> 
					  </c:if>
					            <button id="btn_delete" type="button" class="btn btn-default" onclick="orderDetail()">  
					                <span class="glyphicon glyphicon-list" aria-hidden="true" ></span>详情  
					            </button>  
					        </div> 
				  </div>
			</div>
		</div>
	</body>
</html>