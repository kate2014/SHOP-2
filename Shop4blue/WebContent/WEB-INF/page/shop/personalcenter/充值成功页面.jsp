<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="success">
		充值成功，点击<input id="close" type="button" value="关闭">关闭此页面
	</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#close").click(function(){
			window.opener = null; 
			window.open('', '_self'); 
			window.close() 
		})
	})
</script>
</html>