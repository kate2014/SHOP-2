<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>修改密码 - Powered By SHOP++</title>
<meta name="author" content="SHOP++ Team" />
<meta name="copyright" content="SHOP++" />
<link href="${pageContext.request.contextPath}/resources/shop/css/common.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/shop/css/member.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/shop/js/jquery.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/shop/js/jquery.validate.js"></script> --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/shop/js/common.js"></script>
<script type="text/javascript">
$().ready(function(){

	var $inputForm = $("#inputForm");
	
	
	// 表单验证
/* 	 $inputForm.validate({
		rules: {
			currentPassword: {
				required: true,
				remote: {
					url: "check_current_password.jhtml",
					cache: false
				}
			},
			password: {
				required: true,
				pattern: /^[^\s&\"<>]+$/,
				minlength: 4,
				maxlength: 20
			},
			rePassword: {
				required: true,
				equalTo: "#password"
			}
		},
		messages: {
			password: {
				pattern: "非法字符"
			}
		}
	});  */

});
</script>
</head>
<body>
<script type="text/javascript">
$().ready(function() {

	var $headerLogin = $("#headerLogin");
	var $headerRegister = $("#headerRegister");
	var $headerUsername = $("#headerUsername");
	var $headerLogout = $("#headerLogout");
	var $productSearchForm = $("#productSearchForm");
	var $keyword = $("#productSearchForm input");
	var defaultKeyword = "商品搜索";
	
	var username = getCookie("username");
	if (username != null) {
		$headerUsername.text("您好, " + username).show();
		$headerLogout.show();
	} else {
		$headerLogin.show();
		$headerRegister.show();
	}
	
	$keyword.focus(function() {
		if ($keyword.val() == defaultKeyword) {
			$keyword.val("");
		}
	});
	
	$keyword.blur(function() {
		if ($keyword.val() == "") {
			$keyword.val(defaultKeyword);
		}
	});
	
	$productSearchForm.submit(function() {
		if ($.trim($keyword.val()) == "" || $keyword.val() == defaultKeyword) {
			return false;
		}
	});
	var password=${user.password}
	$("input[name='currentPassword']").blur(function(){
		
		if($(this).val()!=password){
			$("#1").html("密码错误")
		}
        if($(this).val()==password || $(this).val()=="")
		{
			$("#1").html("")
		}
	})
	
	$("input[name='rePassword']").blur(function(){
		if($(this).val()!=$("input[name='password']").val()){
			$("#2").html("密码输入不一致")
		}else{
			$("#2").html("")
		}
	})
	$("#btn").click(function(){
		if($("input[name='currentPassword']").val()==password){
			if($("input[name='rePassword']").val()==$("input[name='password']").val()){
				$("form").submit()
			}
		}
	})

});
</script>
<%@include file="../header.jsp" %>
	<div class="container member">
	<%@include file="../left.jsp" %>
<div class="span18 last">
			<div class="input">
				<div class="title">修改密码</div>
				<form id="inputForm" action="${pageContext.request.contextPath}/pandu/updatepass?userid=${user.id}" method="post">
					<table class="input">
						<tr>
							<th>
								当前密码: 
							</th>
							<td>
								<input type="password" name="currentPassword" class="text" maxlength="20" /><span id="1" style="color: red"></span>
							</td>
						</tr>
						<tr>
							<th>
								新密码: 
							</th>
							<td>
								<input type="password" id="password" name="password" class="text" maxlength="20" />
							</td>
						</tr>
						<tr>
							<th>
								确认密码: 
							</th>
							<td>
								<input type="password" name="rePassword" class="text" maxlength="20" /><span id="2" style="color: red"></span>
							</td>
						</tr>
						<tr>
							<th>
								&nbsp;
							</th>
							<td>
								<input type="button" class="button" id="btn" value="提&nbsp;&nbsp;交" />
								<input type="button" class="button" value="返&nbsp;&nbsp;回" onclick="location.href=''" />
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
		<%@include file="../footer.jsp" %>
</body>
</html>