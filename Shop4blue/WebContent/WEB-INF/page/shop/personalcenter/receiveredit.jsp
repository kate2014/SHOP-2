<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>编辑收货地址 - Powered By SHOP++</title>
<meta name="author" content="SHOP++ Team" />
<meta name="copyright" content="SHOP++" />
<link href="${pageContext.request.contextPath }/resources/shop/css/common.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/resources/shop/css/member.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/jquery.lSelect.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/common.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	var $areaId = $("#areaId");
	
	
	// 地区选择
	$areaId.lSelect({
		url: "${pageContext.request.contextPath }/area/area"
	});
	
	$.validator.addMethod("requiredOne", 
		function(value, element, param) {
			return $.trim(value) != "" || $.trim($(param).val()) != "";
		},
		"电话或手机必须填写一个"
	);
	
	// 表单验证
	$inputForm.validate({
		rules: {
			consignee: "required",
			areaId: "required",
			address: "required",
			zipCode: "required",
			phone: "required"
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
	<%@include file="../header.jsp" %>
<div class="container member">
<%@include file="../left.jsp" %>
<div class="span18 last">
			<div class="input">
				<div class="title">编辑收货地址</div>
				<form id="inputForm" action="update.jhtml" method="post">
					<input type="hidden" name="id" value="${receiver.id }" />
					<table class="input">
						<tr>
							<th>
								收货人: 
							</th>
							<td>
								<input type="text" name="consignee" class="text" value="${receiver.consignee }" maxlength="200" />
							</td>
						</tr>
						<tr>
							<th>
								地区: 
							</th>
							<td>
								<span class="fieldSet">
									<input type="hidden" id="areaId" name="areaId" value="${receiver.area }" treePath="${receiver.xxArea.treePath }" />
								</span>
							</td>
						</tr>
						<tr>
							<th>
								地址: 
							</th>
							<td>
								<input type="text" name="address" class="text" value="${receiver.address }" maxlength="200" />
							</td>
						</tr>
						<tr>
							<th>
								邮编: 
							</th>
							<td>
								<input type="text" name="zipCode" class="text" value="${receiver.zipCode }" maxlength="200" />
							</td>
						</tr>
						<tr>
							<th>
								电话: 
							</th>
							<td>
								<input type="text" name="phone" class="text" value="${receiver.phone }" maxlength="200" />
							</td>
						</tr>
						<tr>
							<th>
								是否默认:
							</th>
							<td>
								<input type="checkbox" name="isDefault" value="true" <c:if test="${receiver.isDefault }">checked="checked" </c:if> />
								<input type="hidden" name="_isDefault" value="false" />
							</td>
						</tr>
						<tr>
							<th>
								&nbsp;
							</th>
							<td>
								<input type="submit" class="button" value="提&nbsp;&nbsp;交" />
								<input type="button" class="button" value="返&nbsp;&nbsp;回" onclick="location.href='list.jhtml'" />
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<%@include file="../footer.jsp" %></body>
</html>