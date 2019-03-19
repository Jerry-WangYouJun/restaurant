<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>会员系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<jsp:include page="common.jsp"></jsp:include>

  </head>
  
  <body>
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
      <div class="navbar-header">
          <a class="navbar-brand" href="<%=path%>/index.jsp">会员管理</a>
      </div>
      <!-- /.navbar-header -->
      <ul class="nav navbar-top-links navbar-right">
          <!-- /.dropdown -->
          <li><span class="dropdown-toggle">欢迎登陆：${userBean.username }</span></li>
          <li class="dropdown">
         	 
              <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                  <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
              </a>
              <ul class="dropdown-menu dropdown-user">
                  <li><a href="${pageContext.request.contextPath}/jsp/Login.jsp"><i class="fa fa-sign-out fa-fw"></i> 注销</a>
                  </li>
              </ul>
              <!-- /.dropdown-user -->
          </li>
          <!-- /.dropdown -->
      </ul>
      <!-- /.navbar-top-links -->
      <!-- /.navbar-static-side -->
  </nav>

  <div class="easyui-layout" fit="true" style="position:absolute;top:0;left:0;">
      <div data-options="region:'north'" style="height:50px"></div>
      <div data-options="region:'west',border:false"  style="width:18%;background-color:#f8f8f8">
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
        <ul class="nav" id="side-menu">
            <li>
                <a href="javascript:void(0)"  class="active" onclick="openTab('<%=path%>/jsp/user_manage.jsp')">
                  <i class="fa fa-dashboard fa-fw"></i>用户管理</a>
            </li>
        </ul>
      </div>
    </div>
      </div>
   <div data-options="region:'center',border:false,showHeader:false" class="easyui-tabs" style="padding:20px 20px 22px 20px">
        <iframe id="center-content" class="easyui-panel" frameborder="0"  scrolling="auto"  
          fit="true" data-options="border:false">

        </iframe>
      </div>
    </div>
    <!-- /#wrapper -->

    <script type="text/javascript">
        function openTab(url){
          document.getElementById("center-content").src = url;
        };
        function logout(){
        	$.ajax({ 
    			url: '${pageContext.request.contextPath}/user/loginOut',
    			dataType : 'json',
    			success : function(obj){
    				if(obj.success){
    					alert(obj.msg);
						location.replace('<%=path%>' + '/login.jsp');
					}else{
						alert(obj.msg);
					}
    			}
    		});
        }
    </script>
    <style type="text/css">
    .tabs-panels>.panel>.panel-body {  
    	overflow: hidden;  
    } 
    </style>
  </body>
</html>
