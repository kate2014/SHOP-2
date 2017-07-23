<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>订单支付 - Powered By SHOP++</title>
<meta name="author" content="SHOP++ Team" />
<meta name="copyright" content="SHOP++" />
<link href="${pageContext.request.contextPath }/resources/shop/css/common.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/resources/shop/css/order.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/common.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $dialogOverlay = $("#dialogOverlay");
	var $dialog = $("#dialog");
	var $other = $("#other");
	var $amountPayable = $("#amountPayable");
	var $fee = $("#fee");
	var $paymentForm = $("#paymentForm");
	var $paymentPluginId = $("#paymentPlugin :radio");
	var $paymentButton = $("#paymentButton");
	
	
	// 选择其它支付方式
	$other.click(function() {
		$dialogOverlay.hide();
		$dialog.hide();
	});
	
	// 支付插件
	$paymentPluginId.click(function() {
		$.ajax({
			url: "calculate_amount.jhtml",
			type: "POST",
			data: {paymentPluginId: $(this).val(), sn: "201706061517"},
			dataType: "json",
			cache: false,
			success: function(data) {
				if (data.message.type == "success") {
					$amountPayable.text(currency(data.amount, true, true));
					if (data.fee > 0) {
						$fee.text(currency(data.fee, true)).parent().show();
					} else {
						$fee.parent().hide();
					}
				} else {
					$.message(data.message);
					setTimeout(function() {
						location.reload(true);
					}, 3000);
				}
			}
		});
	});
	
	// 支付
	$paymentForm.submit(function() {
		$dialogOverlay.show();
		$dialog.show();
	});

});
</script>
</head>
<body>
	<div id="dialogOverlay" class="dialogOverlay"></div>
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
	<div class="container order">
		<!-- <div id="dialog" class="dialog">
			<dl>
				<dt>请在新打开的页面中完成付款</dt><dd>付款完成前请不要关闭此窗口</dd><dd>完成付款后请点击下面按钮</dd>
			</dl>
			<div>
				<a href="view.jhtml?sn=201706061517">完成付款</a>
				<a href="/shopxx/">遇到问题</a>
			</div>
			<a href="javascript:;" id="other">选择其它支付方式</a>
		</div> -->
		<div class="span24">
			<div class="step step3">
				<ul>
					<li>订单信息</li>
					<li>查看购物车</li>
					<li class="current">完成订单</li>
				</ul>
			</div>
			<div class="result">
					<div class="title">您的订单已提交成功，正在等待商品配送！</div>
				<table>
					<tr>
						<th colspan="4">订单信息:</th>
					</tr>
					<tr>
						<td width="100">订单编号:</td>
						<td width="340">
							<strong>${order.sn }</strong>
							<a href="${pageContext.request.contextPath }/myorders/check?id=${order.id}">[查看订单]</a>
						</td>
							<td width="100">订单金额:</td>
							<td>
								<strong>￥<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${order.amountPaid }"></fmt:formatNumber>元</strong>
							</td>
					</tr>
					<tr>
						<td>配送方式:</td>
						<td>${order.shippingMethodName }</td>
						<td>支付方式:</td>
						<td>${order.paymentMethodName }</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<%@include file="../footer.jsp" %>
</body>
</html>