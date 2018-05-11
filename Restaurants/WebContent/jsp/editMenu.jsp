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
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-table.min.css" />  
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-table.js"></script>   
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
		function delDish(){
			var a= $("#infoTable").bootstrapTable('getSelections');
			window.location.href="${pageContext.request.contextPath}/delDish.action?dishid="+a[0].dish_id;
		}
		function updateDish(){	
			var a= $("#infoTable").bootstrapTable('getSelections');
			window.location.href="${pageContext.request.contextPath}/selectDishById.action?dishId="+a[0].dish_id;
		}
		
		$(function(){  
		    $('#infoTable').bootstrapTable({  
		        url : '${pageContext.request.contextPath}/dishList.action', // 请求后台的URL（*）            
		        method : 'get', // 请求方式（*）  
		        toolbar : '#toolbar', // 工具按钮用哪个容器  
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
		        columns : [ {  
		            radio : true 
		        },{  
		            field : 'dish_id',  
		        },{  
		            field : 'dish_name',  
		            title : '菜名',  
		             align: 'center',  
		             valign: 'middle'  
		        },{  
		            field : 'dish_price',  
		            title : '价格',  
		             align: 'center',  
		             valign: 'middle'  
		               
		        }, {  
		           field : 'dish_value',  
		            title : '类型',  
		             align: 'center',  
		             valign: 'middle'  ,
		             formatter : function (value, row, index) {
		                 if (value === 1) {
		                     return '小吃';
		                 }else  if (value === 2) {
		                     return '主食';
		                 }else  if (value === 3) {
		                     return '菜品';
		                 }else  if (value === 4) {
		                     return '酒水';
		                 }else{
		                	 	 return '其他';
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
						<form class="navbar-form navbar-left" action="${pageContext.request.contextPath}/queryByName.action">
							<div class="form-group">
								<input type="text" name="dishname" class="form-control" placeholder="输入菜的名字">
								<button type="submit" class="btn btn-default" >查询</button>	
								<a href="${pageContext.request.contextPath}/dishAll.action" target="_parent"><button type="button" class="btn btn-default">返回</button></a>						
							</div>
						</form>
				  </div>
			</div>
			<div class="panel panel-default">
				  <div class="panel-body">
				  	    <table id="infoTable"> </table>
					<div id="toolbar" class="btn-group">  
			            <button id="btn_edit" type="button" class="btn btn-default" onclick="updateDish()">  
			                <span class="glyphicon glyphicon-pencil" aria-hidden="true" ></span>修改  
			            </button>  
			            <button id="btn_delete" type="button" class="btn btn-default" onclick="delDish()">  
			                <span class="glyphicon glyphicon-remove" aria-hidden="true" ></span>删除  
			            </button>  
			        </div>  
				  </div>
			</div>
		</div>
	</body>

</html>