<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>订单信息 - Powered By SHOP++</title>
<meta name="author" content="SHOP++ Team" />
<meta name="copyright" content="SHOP++" />
<link href="${pageContext.request.contextPath }/resources/shop/css/common.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/resources/shop/css/order.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/jquery.lSelect.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/common.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $dialogOverlay = $("#dialogOverlay");
	var $receiverForm = $("#receiverForm");
	var $receiver = $("#receiver ul");
	var $otherReceiverButton = $("#otherReceiverButton");
	var $newReceiverButton = $("#newReceiverButton");
	var $newReceiver = $("#newReceiver");
	var $areaId = $("#areaId");
	var $newReceiverSubmit = $("#newReceiverSubmit");
	var $newReceiverCancelButton = $("#newReceiverCancelButton");
	var $orderForm = $("#orderForm");
	var $receiverId = $("#receiverId");
	var $paymentMethodId = $("#paymentMethod :radio");
	var $shippingMethodId = $("#shippingMethod :radio");
	var $isInvoice = $("#isInvoice");
	var $invoiceTitleTr = $("#invoiceTitleTr");
	var $invoiceTitle = $("#invoiceTitle");
	var $code = $("#code");
	var $couponCode = $("#couponCode");
	var $couponName = $("#couponName");
	var $couponButton = $("#couponButton");
	var $useBalance = $("#useBalance");
	var $freight = $("#freight");
	var $promotionDiscount = $("#promotionDiscount");
	var $couponDiscount = $("#couponDiscount");
	var $tax = $("#tax");
	var $amountPayable = $("#amountPayable");
	var $submit = $("#submit");
	var shippingMethodIds = {};
	
	// ${shippingMethods}
shippingMethodIds["1"] = [ "1", "2" ]; shippingMethodIds["2"] = [ "1", "2" ]; shippingMethodIds["3"] = [ "2" ];	
	
	// 地区选择
	$areaId.lSelect({
		url: "${pageContext.request.contextPath }/area/area"
	});
	
	// 收货地址
	$("#receiver li").live("click", function() {
		var $this = $(this);
		$receiverId.val($this.attr("receiverId"));
		$("#receiver li").removeClass("selected");
		$this.addClass("selected");
			if ($.trim($invoiceTitle.val()) == "") {
				$invoiceTitle.val($this.find("strong").text());
			}
	});
	
	// 其它收货地址
	$otherReceiverButton.click(function() {
		$otherReceiverButton.hide();
		$newReceiverButton.show();
		$("#receiver li").show();
	});
	
	// 新收货地址
	$newReceiverButton.click(function() {
		$dialogOverlay.show();
		$newReceiver.show();
	});
	
	// 新收货地址取消
	$newReceiverCancelButton.click(function() {
		if ($receiverId.val() == "") {
			$.message("warn", "必须新增一个收货地址");
			return false;
		}
		$dialogOverlay.hide();
		$newReceiver.hide();
	});
	
	// 计算
	function calculate() {
		$.ajax({
			url: "${pageContext.request.contextPath }/order/calculate",
			type: "POST",
			data: $orderForm.serialize(),
			dataType: "json",
			cache: false,
			success: function(data) {
				if (data.message== "success") {
					$freight.text(data.freight);
					if (data.tax > 0) {
						$tax.text(data.tax);
						$tax.parent().show();
					} else {
						$tax.parent().hide();
					}
					$amountPayable.text(data.amountPayable);
				} else {
					$.message(data.message);
					setTimeout(function() {
						location.reload(true);
					}, 3000);
				}
			}
		});
	}
	
	// 支付方式
	$paymentMethodId.click(function() {
		var $this = $(this);
		if ($this.prop("disabled")) {
			return false;
		}
		$this.closest("dd").addClass("selected").siblings().removeClass("selected");
		var paymentMethodId = $this.val();
		$shippingMethodId.each(function() {
			var $this = $(this);
			if ($.inArray($this.val(), shippingMethodIds[paymentMethodId]) >= 0) {
				$this.prop("disabled", false);
			} else {
				$this.prop("disabled", true).prop("checked", false).closest("dd").removeClass("selected");
			}
		});
		calculate();
	});
	
	// 配送方式
	$shippingMethodId.click(function() {
		var $this = $(this);
		if ($this.prop("disabled")) {
			return false;
		}
		$this.closest("dd").addClass("selected").siblings().removeClass("selected");
		calculate();
	});
	
	// 开据发票
	$isInvoice.click(function() {
		$invoiceTitleTr.toggle();
		calculate();
	});
	
	
	// 使用余额
	$useBalance.click(function() {
		calculate();
	});
	
	// 订单提交
	$submit.click(function() {
		var $checkedPaymentMethodId = $paymentMethodId.filter(":checked");
		var $checkedShippingMethodId = $shippingMethodId.filter(":checked");
		if ($checkedPaymentMethodId.size() == 0) {
			$.message("warn", "请选择支付方式");
			return false;
		}
		if ($checkedShippingMethodId.size() == 0) {
			$.message("warn", "请选择配送方式");
			return false;
		}
			if ($isInvoice.prop("checked") && $.trim($invoiceTitle.val()) == "") {
				$.message("warn", "请填写发票抬头");
				return false;
			}
		$.ajax({
			url: "${pageContext.request.contextPath }/order/create",
			type: "POST",
			data: $orderForm.serialize(),
			dataType: "json",
			cache: false,
			beforeSend: function() {
				$submit.prop("disabled", true);
			},
			success: function(data) {
				if (data.message == "success") {
					location.href = "${pageContext.request.contextPath }/order/payment?sn=" + data.sn;
				} else {
					$.message(data.message);
					setTimeout(function() {
						location.reload(true);
					}, 3000);
				}
			},
			complete: function() {
				$submit.prop("disabled", false);
			}
		});
	});
	
	// 表单验证
	$receiverForm.validate({
		rules: {
			consignee: "required",
			areaId: "required",
			address: "required",
			zipCode: "required",
			phone: "required"
		},
		submitHandler: function(form) {
			$.ajax({
				url: "${pageContext.request.contextPath }/order/save_receiver",
				type: "POST",
				data: $receiverForm.serialize(),
				dataType: "json",
				cache: false,
				beforeSend: function() {
					$newReceiverSubmit.prop("disabled", true);
				},
				success: function(data) {
					if (data.message == "success") {
						$receiverId.val(data.receiver.id);
						$("#receiver li").removeClass("selected");
						$receiver.append('<li class="selected" receiverId="' + data.receiver.id + '"><div><strong>' + data.receiver.consignee + '<\/strong> 收<\/div><div><span>' + data.receiver.areaName + data.receiver.address + '<\/span><\/div><div>' + data.receiver.phone + '<\/div><\/li>');
						$dialogOverlay.hide();
						$newReceiver.hide();
							if ($.trim($invoiceTitle.val()) == "") {
								$invoiceTitle.val(data.receiver.consignee);
							}
					} else {
						$.message(data.message);
					}
				},
				complete: function() {
					$newReceiverSubmit.prop("disabled", false);
				}
			});
		}
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
		<div class="span24">
			<div class="step step2">
				<ul>
					<li>订单信息</li>
					<li class="current">查看购物车</li>
					<li>完成订单</li>
				</ul>
			</div>
			<div class="info">
				<form id="receiverForm" action="save_receiver.jhtml" method="post">
					<div id="receiver" class="receiver clearfix">
						<div class="title">收货地址</div>
						<ul>
							<c:forEach items="${user.receivers }" var="receiver">
								<li <c:if test="${receiver.isDefault }"> class="selected"</c:if> receiverId="${receiver.id }">
									<div>
										<strong>${receiver.consignee }</strong> 收
									</div>
									<div>
										<span>${receiver.areaName }${receiver.address }</span>
									</div>
									<div>
										${receiver.zipCode }
									</div>
								</li>
							</c:forEach>
						</ul>
						<p>
							<a href="javascript:;" id="newReceiverButton" class="button">使用新地址</a>
						</p>
					</div>
					<table id="newReceiver" class="newReceiver hidden">
						<tr>
							<th width="100">
								<span class="requiredField">*</span>收货人:
							</th>
							<td>
								<input type="text" id="consignee" name="consignee" class="text" maxlength="200" />
							</td>
						</tr>
						<tr>
							<th>
								<span class="requiredField">*</span>地区:
							</th>
							<td>
								<span class="fieldSet">
									<input type="hidden" id="areaId" name="areaId" />
								</span>
							</td>
						</tr>
						<tr>
							<th>
								<span class="requiredField">*</span>地址:
							</th>
							<td>
								<input type="text" id="address" name="address" class="text" maxlength="200" />
							</td>
						</tr>
						<tr>
							<th>
								<span class="requiredField">*</span>邮编:
							</th>
							<td>
								<input type="text" id="zipCode" name="zipCode" class="text" maxlength="200" />
							</td>
						</tr>
						<tr>
							<th>
								<span class="requiredField">*</span>手机/电话:
							</th>
							<td>
								<input type="text" id="phone" name="phone" class="text" maxlength="200" />
							</td>
						</tr>
						<tr>
							<th>
								默认:
							</th>
							<td>
								<input type="checkbox" name="isDefault" value="true" />
								<input type="hidden" name="_isDefault" value="false" />
							</td>
						</tr>
						<tr>
							<th>&nbsp;
								
							</th>
							<td>
								<input type="submit" id="newReceiverSubmit" class="button" value="确&nbsp;&nbsp;定" />
								<input type="button" id="newReceiverCancelButton" class="button" value="取&nbsp;&nbsp;消" />
							</td>
						</tr>
					</table>
				</form>
				<form id="orderForm" action="create.jhtml" method="post">
					<input type="hidden" id="receiverId" name="receiverId" <c:if test="${user.defaultReceiver!=null}">value="${user.defaultReceiver.id}"</c:if> />
					<input type="hidden" name="cartToken" value="ea1abb7e685749b9f359e6487c0e6ccd" />
					<dl id="paymentMethod" class="select">
						<dt>支付方式</dt>
						<c:forEach items="${paymentMethods }" var="paymentMethod">
							<dd>
								<label for="paymentMethod_${paymentMethod.id }">
									<input type="radio" id="paymentMethod_${paymentMethod.id }" name="paymentMethodId" value="${paymentMethod.id }" />
									<span>
											<!-- <em style="border-right: none; background: url(http://storage.shopxx.net/demo-image/3.0/payment_method/online.gif) center no-repeat;">&nbsp;</em> -->
										<strong>${paymentMethod.name}</strong>
									</span>
									<span>${paymentMethod.description}</span>
								</label>
							</dd>
							</c:forEach>
					</dl>
					<dl id="shippingMethod" class="select">
						<dt>配送方式</dt>
							<c:forEach items="${shippingMethods }" var="shippingMethod"> 
							<dd>
								<label for="shippingMethod_${shippingMethod.id }">
									<input type="radio" id="shippingMethod_${shippingMethod.id }" name="shippingMethodId" value="${shippingMethod.id }" />
									<span>
											<!-- <em style="border-right: none; background: url(http://storage.shopxx.net/demo-image/3.0/shipping_method/normal.gif) center no-repeat;">&nbsp;</em> -->
										<strong>${shippingMethod.name }</strong>
									</span>
									<span>${shippingMethod.description }</span>
								</label>
							</dd>
							</c:forEach>
					</dl>
						<table>
							<tr>
								<th colspan="2">发票信息</th>
							</tr>
							<tr>
								<td width="100">
									开据发票:
								</td>
								<td>
									<label for="isInvoice">
										<input type="checkbox" id="isInvoice" name="isInvoice" value="true" />
										(发票税金: 6%)
									</label>
								</td>
							</tr>
							<tr id="invoiceTitleTr" class="hidden">
								<td width="100">
									发票抬头:
								</td>
								<td>
								
									<input type="text" id="invoiceTitle" name="invoiceTitle" class="text" <c:if test="${user.defaultReceiver!=null }">value="${user.defaultReceiver.consignee }"</c:if> maxlength="200" />
								</td>
							</tr>
						</table>
					<table class="product">
						<tr>
							<th width="60">图片</th>
							<th>商品</th>
							<th>单价</th>
							<th>数量</th>
							<th>小计</th>
						</tr>
						<c:forEach items="${order.orderItems }" var="orderItem">
							<tr>
								<td>
									<img src="${orderItem.xxProduct.image }" alt="${orderItem.xxProduct.name}" />
								</td>
								<td>
									<a href="${pageContext.request.contextPath }/shopContent/shop?id=${orderItem.xxProduct.id}" title="${orderItem.xxProduct.fullName}" target="_blank">${orderItem.xxProduct.fullName}</a>
								</td>
								<td>
								<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${orderItem.price }"></fmt:formatNumber>
								</td>
								<td>
									${orderItem.quantity}
								</td>
								<td>
								<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${orderItem.subtotal }"></fmt:formatNumber>
									
								</td>
							</tr>
							</c:forEach>
					</table>
					<div class="span12">
						<dl class="memo">
							<dt>附&nbsp;&nbsp;&nbsp;言:</dt>
							<dd>
								<input type="text" name="memo" maxlength="200" />
							</dd>
						</dl>
						<dl class="coupon">
							<dt>优惠券:</dt>
							<dd>
								<input type="hidden" id="code" name="code" maxlength="200" />
								<input type="text" id="couponCode" maxlength="200" />
								<span id="couponName">&nbsp;</span>
								<button type="button" id="couponButton">确 认</button>
							</dd>
						</dl>
					</div>
					<div class="span12 last">
						<ul class="statistic">
							<li>
								<span>
									运费: <em id="freight">${order.freight }</em>
								</span>
									<span class="hidden">
										税金: <em id="tax">${order.tax }</em>
									</span>
								<span>
									积分: <em>${order.point }</em>
								</span>
							</li>
							
							<li>
								<span>
									应付金额: <strong id="amountPayable">￥<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${order.amountPayable }"></fmt:formatNumber>元</strong>
								</span>
							</li>
								<li>
									<input type="checkbox" id="useBalance" name="useBalance" value="true" />
									<label for="useBalance">
										使用余额支付 (账户余额: <em>￥<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${user.balance }"></fmt:formatNumber></em>)
									</label>
								</li>
						</ul>
					</div>
					<div class="span24">
						<div class="bottom">
							<a href="${pageContext.request.contextPath }/cart/tocart" class="back">返回购物车</a>
							<a href="javascript:;" id="submit" class="submit">提交订单</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@include file="../footer.jsp" %>
</body>
</html>