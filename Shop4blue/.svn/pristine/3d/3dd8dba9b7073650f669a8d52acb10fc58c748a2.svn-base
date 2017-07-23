<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>预存款充值 - Powered By SHOP++</title>
<meta name="author" content="SHOP++ Team" />
<meta name="copyright" content="SHOP++" />
<link href="${pageContext.request.contextPath }/resources/shop/css/common.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/resources/shop/css/member.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/common.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	var $amount = $("#amount");
	var $paymentPluginId = $("#paymentPlugin :radio");
	var $fee = $("#fee");
	var timeout;
	
	
	// 充值金额
	$amount.bind("input propertychange change", function(event) {
		if (event.type != "propertychange" || event.originalEvent.propertyName == "value") {
			calculateFee();
		}
	});
	
	// 支付插件
	$paymentPluginId.click(function() {
		calculateFee();
	});
	
	// 计算支付手续费
	function calculateFee() {
		clearTimeout(timeout);
		timeout = setTimeout(function() {
			if ($inputForm.valid()) {
				var paymentPluginId = $paymentPluginId.filter(":checked").val();
				$.ajax({
					url: "calculate_fee.jhtml",
					type: "POST",
					data: {paymentPluginId: paymentPluginId, amount: $amount.val()},
					dataType: "json",
					cache: false,
					success: function(data) {
						if (data.message.type == "success") {
							if (data.fee > 0) {
								$fee.text(currency(data.fee, true)).closest("tr").show();
							} else {
								$fee.closest("tr").hide();
							}
						} else {
							$.message(data.message);
						}
					}
				});
			} else {
				$fee.closest("tr").hide();
			}
		}, 500);
	}
	
	// 检查余额
	setInterval(function() {
		$.ajax({
			url: "check_balance.jhtml",
			type: "POST",
			dataType: "json",
			cache: false,
			success: function(data) {
				if (data.balance > 0) {
					location.href = "list.jhtml";
				}
			}
		});
	}, 10000);
	
	// 表单验证
	$inputForm.validate({
		rules: {
			amount: {
				required: true,
				positive: true,
				decimal: {
					integer: 12,
					fraction: 2
				}
			}
		},
		submitHandler: function(form) {
			form.submit();
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
			<div class="input deposit">
				<div class="title">预存款充值</div>
				<form id="inputForm" action="${pageContext.request.contextPath }/yck/chargeType" method="post" target="_blank">
					<input type="hidden" name="id" value="${user.id}" />
					<table class="input">
						<tr>
							<th>
								当前余额: 
							</th>
							<td>
								<c:forEach items="${list}" var="a" varStatus="stats">
									<c:if test="${stats.last}">
										￥<fmt:formatNumber type="number" value="${a.balance}" maxFractionDigits="2"/>元
									</c:if>
								</c:forEach>
							</td>
						</tr>
						<tr>
							<th>
								充值金额: 
							</th>
							<td>
								<input type="text" id="amount" name="amount" class="text" maxlength="16" onpaste="return false;" />
							</td>
						</tr>
						<tr>
							<th>
								支付方式:
							</th>
							<td>
								<div id="paymentPlugin" class="paymentPlugin clearfix">
											<div>
												<input type="radio" id="alipayDirectPlugin" name="paymentPluginId" value="alipayDirectPlugin" checked="checked" />
												<label for="alipayDirectPlugin">
														<em title="支付宝即时交易" style="background-image: url(${pageContext.request.contextPath}/resources/IMG/payment/alipay_direct_logo.gif);">&nbsp;</em>
												</label>
											</div>
											<div>
												<input type="radio" id="tenpayDirectPlugin" name="paymentPluginId" value="tenpayDirectPlugin" />
												<label for="tenpayDirectPlugin">
														<em title="财付通即时交易" style="background-image: url(${pageContext.request.contextPath}/resources/IMG/payment/tenpay_direct_logo.gif);">&nbsp;</em>
												</label>
											</div>
											<div>
												<input type="radio" id="pay99billPlugin" name="paymentPluginId" value="pay99billPlugin" />
												<label for="pay99billPlugin">
														<em title="快钱支付" style="background-image: url(${pageContext.request.contextPath}/resources/IMG/payment/pay99bill_logo.gif);">&nbsp;</em>
												</label>
											</div>
											<div>
												<input type="radio" id="yeepayPlugin" name="paymentPluginId" value="yeepayPlugin" />
												<label for="yeepayPlugin">
														<em title="易宝支付" style="background-image: url(${pageContext.request.contextPath}/resources/IMG/payment/yeepay_logo.gif);">&nbsp;</em>
												</label>
											</div>
											<div>
												<input type="radio" id="unionpayPlugin" name="paymentPluginId" value="unionpayPlugin" />
												<label for="unionpayPlugin">
														<em title="银联在线支付" style="background-image: url(${pageContext.request.contextPath}/resources/IMG/payment/chinabank_logo.gif);">&nbsp;</em>
												</label>
											</div>
											<div>
												<input type="radio" id="paypalPlugin" name="paymentPluginId" value="paypalPlugin" />
												<label for="paypalPlugin">
														<em title="Paypal" style="background-image: url(${pageContext.request.contextPath}/resources/IMG/payment/paypal_cn_logo.gif);">&nbsp;</em>
												</label>
											</div>
								</div>
							</td>
						</tr>
						<tr class="hidden">
							<th>
								支付手续费: 
							</th>
							<td>
								<span id="fee"></span>
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
<%@include file="../footer.jsp" %>
</body>
</html>