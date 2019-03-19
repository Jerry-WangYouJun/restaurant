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
<script type="text/javascript">
	 $(function(){
		if( '${userBean.role}' == '3'    ){
			$("#right").attr("src" , "${pageContext.request.contextPath }/jsp/Right2.jsp")
			if('${sellerId}' != ''){
				$("#right").attr("src" , "${pageContext.request.contextPath }/jsp/Right.jsp")
			}
		}else{
			location.href =  "${pageContext.request.contextPath }/jsp/Right.jsp";
		}
		
		  if("${msg}" != ""){
			   alert('${msg}');
		  }
	 });
	 
</script>
<title>Insert title here</title>
</head>
<style type="text/css">
		body{
			background-color: #FCF8E3;
			margin: 0px;
			padding: 0px;
		}
	</style>
	
	<frameset rows="5%,91%,4%" border="0">
		<frame src="${pageContext.request.contextPath }/jsp/header.jsp" />
		<frameset cols="25%,*" >
			<frame src="${pageContext.request.contextPath }/jsp/Left.jsp" id="leftFrame"/>
			<frame id="right" src="" />
		</frameset>
		<frame src="${pageContext.request.contextPath }/jsp/footer.jsp"/>
	</frameset>
	<body>
	</body>
</html>