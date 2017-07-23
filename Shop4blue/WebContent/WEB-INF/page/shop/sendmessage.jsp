<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="itcast" uri="http://itcast.cn/common/" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/shop/css/common.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/shop/css/member.css"/>
    <script src="${pageContext.request.contextPath}/resources/backstage/js/js02.js"></script>
     <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	var $isDraft = $("#isDraft");
	var $type = $("input[name='type']");
	var $receiverTr = $("#receiverTr");
	var $username = $("#username");
	var $send = $("#send");
	var $save = $("#save");
	
	// 发送类型
	$type.click(function() {
		var $this = $(this);
		if ($this.val() == "member") {
			$username.prop("disabled", false);
			$receiverTr.show();
		} else {
			$username.prop("disabled", true);
			$receiverTr.hide();
		}
	});
	
	// 立即发送
	$send.click(function() {
		$isDraft.val("false");
		$inputForm.submit();
	});
	
	// 保存为草稿
	$save.click(function() {
		$isDraft.val("true");
		$inputForm.submit();
	});
	
	$.validator.addMethod("notEqualsIgnoreCase", 
		function(value, element, param) {
			return this.optional(element) || param.toLowerCase() != value.toLowerCase()
		}
	);
	
	// 表单验证
	$inputForm.validate({
		rules: {
			username: {
				required: true,
				notEqualsIgnoreCase: "wys",
				remote: {
					url: "check_username.jhtml",
					cache: false
				}
			},
			title: {
				required: true
			},
			content: {
				required: true,
				maxlength: 1000
			}
		},
		messages: {
			username: {
				notEqualsIgnoreCase: "不允许为自己",
				remote: "该用户不存在"
			}
		}
	});

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

});
</script>
<%@include file="header.jsp" %>
<div class="container member">
<%@include file="left.jsp" %>
	<div class="span18 last">
			<div class="input">
				<div class="title">发送消息</div>
				<form id="inputForm" action="${pageContext.request.contextPath}/sendMessage/getmessage" method="post">
					<input type="hidden" name="draftMessageId" value="" />
					<input type="hidden" id="isDraft" name="isDraft" value="false" />
					<table class="input">
						<tr>
							<th>
								<span class="requiredField">*</span>发送至:
							</th>
							<td>
								<label>
									<input type="radio" name="type" value="member" checked="checked" />其他会员
								</label>
								<label>
									<input type="radio" name="type" value="admin" />管理员
								</label>
							</td>
						</tr>
						<tr id="receiverTr">
							<th>
								<span class="requiredField">*</span>对方用户名:
							</th>
							<td>
								<input type="text" id="username" name="username" class="text" maxlength="20" value="" />
							</td>
						</tr>
						<tr>
							<th>
								<span class="requiredField">*</span>标题:
							</th>
							<td>
								<input type="text" name="title" class="text" maxlength="200" value="" />
							</td>
						</tr>
						<tr>
							<th>
								<span class="requiredField">*</span>内容:
							</th>
							<td>
								<textarea name="content" class="text"></textarea>
							</td>
						</tr>
						<tr>
							<th>
								&nbsp;
							</th>
							<td>
								<input type="button" id="send" class="button" value="立即发送" />
									<input type="button" id="save" class="button" value="保存为草稿"  />
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
<%@include file="footer.jsp" %>
</body>
</html>