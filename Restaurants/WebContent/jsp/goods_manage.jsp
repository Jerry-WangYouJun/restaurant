<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>课程管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    
   <jsp:include page="/common.jsp"></jsp:include>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>

  </head>
  
  <body class="easyui-layout">
 	<div data-options="region:'north',border:false,showHeader:false"  style="height:40px" >
 		<p style="font-size: 22px;height:40px;line-height: 40px;margin: 0px">实验管理</p>
 	</div>
 	<div data-options="region:'center',border:false,showHeader:false" style="padding-bottom: 3px">
 		<table id="dish_table" class="easyui-datagrid" fit="true" ></table>
 	</div>
	
	
	<div id="toolbar_dish" style="padding:2px 5px;">
		<c:choose >
		        <a onclick="dish_edit()" class="easyui-linkbutton"  plain="true" iconCls="fa fa-edit fa-fw" style="margin: 2px">提交实验资料</a>    
		</c:choose>
    </div>
	
    <script type="text/javascript">
    	$(function(){
			$('#dish_table').datagrid({
				url:'${pageContext.request.contextPath}/list',
				pagination: true,
				toolbar:'#toolbar_dish',				
				fitColumns: true,
				singleSelect: true,
				columns:[[
					{field:'id', hidden:'true',editor:'textbox' },
					{field:'dish_name',title:'菜品',width:100,align:'center'},
					{field:'dish_price',title:'价格',width:100,align:'center',
						formatter : function(value, row, index) {
							return row.classInfo.experName;
						}},
					{field:'experTime',title:'实验时间',width:100,align:'center',
							formatter : function(value, row, index) {
								return row.classInfo.classDate;
							}},
					{field:'states',title:'实验状态',width:100,align:'center',
						formatter : function(value, row, index) {
							if (value == '1') {
								return "已选课";
							} else if (value == '0') {
								return "已取消";
							} else if(value =='2' ){
								 return "已提交报告";
							} else if(value == "3"){
								return "教师已评价";
							}
						}},
					{field:'judge',title:'教师评价',width:150,align:'center'},
					{field:'situation',title:'学生试验情况',width:150,align:'center'},
					{field:'imageName',title:'实验图片',width:150,align:'center',formatter:function(value,row,index){
						if(value){
							 return '<img style="width:100px;length:100px" border="1" src="${pageContext.request.contextPath}/uploadFile/' + value +'"/>'; 
						}else{
							return "";
						}
					}},				
					{field:'remark',title:'备注',width:100,align:'center'}
				]],				
			});
		});
		function dish_add(){
			var row = $('#dish_table').datagrid('getSelected');
			if(row){
				$('#dish_dlg').dialog('open');	
				$('#dish_dlg').dialog('setTitle','添加评价');
				$('#dish_form').form('load', row);
				$("#dish_save").unbind('click').click(function(){
	  				$("#dish_form").ajaxSubmit({
	  					url : "${pageContext.request.contextPath}/dish/dish_judge",
	  					type : 'post',
	  					dataType : 'json',
	  					success : function(obj) {
	  						if (obj.success) {
								alert(obj.msg);
								dish_close();
							} else {
								alert(obj.msg);
							}
	  					},
	  					error : function(transport) {
	  						$.messager.alert('提示', "系统产生错误,请联系管理员!", "error");
	  					}
	  				});
				});
			}
		}
		function dish_edit(){
			var row = $('#dish_table').datagrid('getSelected');
    		if(row){
    			$('#dish_dlg').dialog('open');	
    			$('#dish_dlg').dialog('setTitle','提交实验结果');
    			$('#dish_form').form('load', row);
				$("#dish_save").unbind('click').click(function(){
					var upfile = $("#upfile").val();
					if(upfile ==''){
						  alert("请选择要上传的实验图片");
						  return false;
					}
					$("#dish_form").ajaxSubmit({
	  					url : "${pageContext.request.contextPath}/dish/dish_situation",
	  					type : 'post',
	  					dataType : 'json',
	  					success : function(obj) {
	  						if (obj.success) {
								alert(obj.msg);
								dish_close();
							} else {
								alert(obj.msg);
							}
	  					},
	  					error : function(transport) {
	  						$.messager.alert('提示', "系统产生错误,请联系管理员!", "error");
	  					}
	  				});
				});
			}
    	}
		function dish_close(){
			$('#dish_form').form('reset');
			$('#dish_form').form('clear');
			$('#dish_dlg').dialog('close');	
			$('#dish_table').datagrid('reload');
		}
    </script>
    
    <div id="dish_dlg_buttons" style="width:800px;height: 40px;text-align: center">
		<button id="dish_save" type="button" class="btn btn-primary btn-dialog-left">保存</button>
		<button onclick="dish_close()" type="button" class="btn btn-default btn-dialog-right">取消</button>
	</div>
	<div  id="dish_dlg" closed="true" class="easyui-dialog" style="width:400px;height: 450px"
	data-options="border:'thin',cls:'c1',collapsible:false,modal:true,closable:false,top:10,buttons: '#dish_dlg_buttons'">
    	<form id="dish_form" role="form" style="padding: 20px">
            <input type="hidden" name = "id">
	            <div class="form-group col-md-12">
	            	<label class="col-md-4" style="display: inline-block;height: 34px;line-height: 34px;text-align: left;width: 30%">实验情况：</label>
	                <textarea name="situation" class=" form-control" rows="4" style="display: inline-block;width: 70%"></textarea>
	            </div>
	            <div class="form-group col-md-12">
	            	<label class="col-md-4" style="display: inline-block;height: 34px;line-height: 34px;text-align: left;width: 30%">实验照片：</label>
	                <input type="file" id="upfile" name="upfile" class=" form-control" style="display: inline-block;width: 70%">
	            </div>
			 	<div class="form-group col-md-12">
	            	<label class="col-md-4" style="display: inline-block;height: 34px;line-height: 34px;text-align: left;width: 30%">教师评价：</label>
	                <textarea name="judge" class=" form-control" rows="4" style="display: inline-block;width: 70%"></textarea>
	            </div>
            <div class="form-group col-md-12">
            	<label class="col-md-4" style="display: inline-block;height: 34px;line-height: 34px;text-align: left;width: 30%">备注：</label>
                <textarea name="remark" class=" form-control" rows="4" style="display: inline-block;width: 70%"></textarea>
            </div>
            <input id="id" name="id" style="display:none;"/> 
    	</form>                  
    </div>
</body>
</html>
