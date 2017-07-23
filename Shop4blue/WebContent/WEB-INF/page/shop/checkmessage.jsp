<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="itcast" uri="http://itcast.cn/common/" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
   <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/shop/css/common.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/shop/css/member.css"/>
    <script src="${pageContext.request.contextPath}/resources/backstage/js/js02.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	
	
	// 表单验证
	$inputForm.validate({
		rules: {
			content: {
				required: true,
				maxlength: 1000
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
			<div class="message">
				<div class="title">查看消息</div>
				<dl>
					<dt>
						<strong>${message.title}</strong>
							<span>收件人: ${message.username}</span>
					</dt>
					<c:forEach items="${list}" var="l">
						<dd>
							<div <c:if test="${user.id==l.sender}">class="right"</c:if><c:if test="${user.id!=l.sender}">class="left"</c:if>>
								<p>${l.content}</p>
								<span>[${l.receiver}] ${l.createDate}</span>
								<div class="arrow"></div>
							</div>
						</dd>
					</c:forEach>
				</dl>
			</div>
			<div class="input">
				<div class="title">回复消息</div>
				<form id="inputForm" action="${pageContext.request.contextPath}/sendMessage/reply" method="post">
					<input type="hidden" name="forMessage" value="${mess.id}" />
					<input type="hidden" name="firstid" value="${message.id}" /> 
					<input type="hidden" name="title" value="reply:${mess.title}" /> 
						<table class="input">
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
								<input type="submit" class="button" value="发送消息" />
								<input type="button" class="button" value="返&nbsp;&nbsp;回" onclick="location.href='list.jhtml'" />
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