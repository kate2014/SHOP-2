<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>账号设置 </title>
<meta name="author" content="SHOP++ Team" />
<meta name="copyright" content="SHOP++" />
<link href="${pageContext.request.contextPath}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/jquery.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/jquery.validate.js"></script> --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/input.js"></script>
<script type="text/javascript">
/* $().ready(function() {

	var $inputForm = $("#inputForm");
	
	
	$.validator.addMethod("requiredTo", 
		function(value, element, param) {
			var parameterValue = $(param).val();
			if ($.trim(parameterValue) == "" || ($.trim(parameterValue) != "" && $.trim(value) != "")) {
				return true;
			} else {
				return false;
			}
		},
		"必填"
	);
	
	// 表单验证
	$inputForm.validate({
		rules: {
			currentPassword: {
				requiredTo: "#password",
				remote: {
					url: "check_current_password.jhtml",
					cache: false
				}
			},
			password: {
				pattern: /^[^\s&\"<>]+$/,
				minlength: 4,
				maxlength: 20
			},
			rePassword: {
				equalTo: "#password"
			},
			email: {
				required: true,
				email: true
			}
		},
		messages: {
			password: {
				pattern: "非法字符"
			}
		}
	});
	
}); */
</script>
<script type="text/javascript">
	$(function(){
		$("#currentPassword").blur(function(){
			if($(this).val()!="${admin.password}"){
				$(this).css("border-color","red");
				$("#cpspan").html("密码错误");
			}else{
				$(this).css("border-color","");
				$("#cpspan").html("");
			}
		})
		$("#password").blur(function(){
			if($(this).val().length<4){
				$(this).css("border-color","red");
				$("#pspan").html("密码长度小于四");
			}else if($(this).val().length>16){
				$(this).css("border-color","red");
				$("#pspan").html("密码长度大于16");
			}else{
				$(this).css("border-color","");
				$("#pspan").html("");
			}
		})
		$("#rePassword").blur(function(){
			if($(this).val()!=$("#password").val()){
				$(this).css("border-color","red");
				$("#rpspan").html("两次输入不一致");
			}else{
				$(this).css("border-color","");
				$("#rpspan").html("");
			}
		})
	})

</script>
</head>
<body>
	<div class="path">
		<a href="">首页</a> &raquo; 账号设置
	</div>
	<form id="inputForm" action="${pageContext.request.contextPath}/adminman/changepass" method="post">
		<table class="input">
			<tr>
				<th>
					用户名: 
				</th>
				<td>
					${admin.username }
				</td>
			</tr>
			<tr>
				<th>
					姓名: 
				</th>
				<td>
					${admin.name }
				</td>
			</tr>
			<tr>
				<th>
					部门: 
				</th>
				<td>
					${admin.department }
				</td>
			</tr>
			<tr>
				<th>
					当前密码: 
				</th>
				<td>
					<input type="password" id="currentPassword" name="currentPassword" class="text" maxlength="20" />
					<span id="cpspan" style="color:red"></span>
				</td>
			</tr>
			<tr>
				<th>
					新密码: 
				</th>
				<td>
					<input type="password" id="password" name="password" class="text" maxlength="20" />
					<span id="pspan" style="color:red"></span>
				</td>
			</tr>
			<tr>
				<th>
					确认新密码: 
				</th>
				<td>
					<input id="rePassword" type="password" name="rePassword" class="text" maxlength="20" />
					<span id="rpspan" style="color:red"></span>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>E-mail: 
				</th>
				<td>
					<input type="text" name="email" class="text" value="${admin.email }" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<span class="tips">如需修改密码请先填写当前密码，若留空则密码保持不变</span>
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="submit" class="button" value="确&nbsp;&nbsp;定" />
					<input type="button" id="backButton" class="button" value="返&nbsp;&nbsp;回" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>