<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>查看订单 - Powered By SHOP++</title>
<meta name="author" content="SHOP++ Team" />			
<meta name="copyright" content="SHOP++" />
<link href="${pageContext.request.contextPath}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/jquery.tools.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/jquery.lSelect.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/input.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $confirmForm = $("#confirmForm");
	var $completeForm = $("#completeForm");
	var $cancelForm = $("#cancelForm");
	var $confirmButton = $("#confirmButton");
	var $paymentButton = $("#paymentButton");
	var $shippingButton = $("#shippingButton");
	var $completeButton = $("#completeButton");
	var $refundsButton = $("#refundsButton");
	var $returnsButton = $("#returnsButton");
	var $cancelButton = $("#cancelButton");
	var isLocked = false;
	
	
	// 检查锁定
	function checkLock() {
		if (!isLocked) {
			$.ajax({
				url: "${pageContext.request.contextPath}/ordermanage/checklock",
				type: "POST",
				data: {id: ${order.id }},   
				dataType: "json",
				cache: false,
				success: function(message) {
					//if (message.type != "success") {
					if (message != "success") {
						$.message(message);
						$confirmButton.prop("disabled", true);
						$paymentButton.prop("disabled", true);
						$shippingButton.prop("disabled", true);
						$completeButton.prop("disabled", true);
						$refundsButton.prop("disabled", true);
						$returnsButton.prop("disabled", true);
						$cancelButton.prop("disabled", true);
						isLocked = true;
					}
				}
			});
		}
	}
	
	// 检查锁定
	checkLock();
	setInterval(function() {
		checkLock();
	}, 100000);
	
	// 确认
	$confirmButton.click(function() {
		var $this = $(this);
		$.dialog({
			type: "warn",
			content: "订单确认后将无法编辑，是否继续?",
			onOk: function() {
				$confirmForm.submit();
			}
		});
	});
	
	// 完成
	$completeButton.click(function() {
		var $this = $(this);
		$.dialog({
			type: "warn",
			content: "订单完成后将无法操作，是否继续?",
			onOk: function() {
				$completeForm.submit();
			}
		});
	});
	
	// 取消
	$cancelButton.click(function() {
		var $this = $(this);
		$.dialog({
			type: "warn",
			content: "订单取消后将无法操作，是否继续?",
			onOk: function() {
				$cancelForm.submit();
			}
		});
	});

	// 支付
	$paymentButton.click(function() {
		$.dialog({
			title: "支 付",
content: ' <form id="paymentForm" action="${pageContext.request.contextPath}/ordermanage/payment" method="post"> <input type="hidden" name="token" value="2edd8242-d8c6-4b6e-bd26-dd8b69e4a9ce" \/> <input type="hidden" name="orderId" value="${order.id}" \/> <table class="input"> <tr> <th> 订单编号: <\/th> <td width="300"> ${order.sn} <\/td> <th> 创建日期: <\/th> <td> <fmt:formatDate value="${order.createDate }" pattern="yyyy-MM-dd HH:mm:ss"/> <\/td> <\/tr> <tr> <th> 订单金额: <\/th> <td> ￥<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${order.orderMoney }"></fmt:formatNumber> <\/td> <th> 已付金额: <\/th> <td> ￥<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${order.amountPaid }"></fmt:formatNumber> <\/td> <\/tr> <tr> <th> 收款银行: <\/th> <td> <input type="text" name="bank" class="text" maxlength="200" \/> <\/td> <th> 收款账号: <\/th> <td> <input type="text" name="account" class="text" maxlength="200" \/> <\/td> <\/tr> <tr> <th> 付款金额: <\/th> <td> <input type="text" name="amount" class="text" value="<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${order.orderMoney }"></fmt:formatNumber>" maxlength="16" \/> <\/td> <th> 付款人: <\/th> <td> <input type="text" name="payer" class="text" maxlength="200" \/> <\/td> <\/tr> <tr> <th> 方式: <\/th> <td> <select id="method" name="method"> <option value="0">在线支付<\/option> <option value="1">线下支付<\/option> <option value="2">预存款支付<\/option> <\/select> <\/td> <th> 支付方式: <\/th> <td> <select name="paymentMethodId"> <option value="">请选择...<\/option> <option value="1">网上支付<\/option> <option value="2">银行汇款<\/option> <option value="3">货到付款<\/option> <\/select> <\/td> <\/tr> <tr> <th> 备注: <\/th> <td colspan="3"> <input type="text" name="memo" class="text" maxlength="200" \/> <\/td> <\/tr> <tr> <td colspan="4" style="border-bottom: none;"> &nbsp; <\/td> <\/tr> <\/table> <\/form>',				width: 900,
			modal: true,
			ok: "确  定",
			cancel: "取  消",
			onShow: function() {
				var $method = $("#method");
				$.validator.addMethod("balance", 
					function(value, element, param) {
						return this.optional(element) || $method.val() != "deposit" || parseFloat(value) <= parseFloat(param);
					},
					"账户余额不足"
				);
				$("#paymentForm").validate({
					rules: {
						amount: {
							required: true,
							positive: true,
							max: ${order.orderMoney},
							decimal: {
								integer: 12,
								fraction: 2
							},
							balance: ${order.xxMember.balance}
						}
					}
				});
			},
			onOk: function() {
				$("#paymentForm").submit();
				return false;
			}
		});
	});
	
	// 退款
	$refundsButton.click(function() {
		$.dialog({
			title: "退 款",
			content: ' <form id="refundsForm" action="${pageContext.request.contextPath}/ordermanage/refunds" method="post"> <input type="hidden" name="token" value="43170c7a-a847-43f5-9034-9846276b6720" \/> <input type="hidden" name="orderId" value="${order.id}" \/> <table class="input"> <tr> <th> 订单编号: <\/th> <td width="300"> ${order.sn} <\/td> <th> 创建日期: <\/th> <td>  <fmt:formatDate value="${order.createDate }" pattern="yyyy-MM-dd HH:mm:ss"/> <\/td> <\/tr> <tr> <th> 订单金额: <\/th> <td> ￥<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${order.orderMoney }"></fmt:formatNumber> <\/td> <th> 已付金额: <\/th> <td> ￥<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${order.amountPaid }"></fmt:formatNumber> <\/td> <\/tr> <tr> <th> 退款银行: <\/th> <td> <input type="text" name="bank" class="text" maxlength="200" \/> <\/td> <th> 退款账号: <\/th> <td> <input type="text" name="account" class="text" maxlength="200" \/> <\/td> <\/tr> <tr> <th> 退款金额: <\/th> <td> <input type="text" name="amount" class="text" value="<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${order.orderMoney }"></fmt:formatNumber>" maxlength="16" \/> <\/td> <th> 收款人: <\/th> <td> <input type="text" name="payee" class="text" maxlength="200" \/> <\/td> <\/tr> <tr> <th> 方式: <\/th> <td> <select name="method"> <option value="0">在线支付<\/option> <option value="1">线下支付<\/option> <option value="2">预存款支付<\/option> <\/select> <\/td> <th> 支付方式: <\/th> <td> <select name="paymentMethodId"> <option value="">请选择...<\/option> <option value="1">网上支付<\/option> <option value="2">银行汇款<\/option> <option value="3">货到付款<\/option> <\/select> <\/td> <\/tr> <tr> <th> 备注: <\/th> <td colspan="3"> <input type="text" name="memo" class="text" maxlength="200" \/> <\/td> <\/tr> <tr> <td colspan="4" style="border-bottom: none;"> &nbsp; <\/td> <\/tr> <\/table> <\/form>',				width: 900,
			modal: true,
			ok: "确  定",
			cancel: "取  消",
			onShow: function() {
				$("#refundsForm").validate({
					rules: {
						amount: {
							required: true,
							positive: true,
							max: ${order.orderMoney},
							decimal: {
								integer: 12,
								fraction: 2
							}
						}
					}
				});
			},
			onOk: function() {
				$("#refundsForm").submit();
				return false;
			}
		});
	});

  

	// 发货
	$shippingButton.click(function() {
		$.dialog({
			title: "发 货",
			content: ' <form id="shippingForm" action="${pageContext.request.contextPath}/ordermanage/shipping" method="post"> <input type="hidden" name="token" value="ae0c0139-5887-4c1c-ad02-a6cf4c0f5646" \/> <input type="hidden" name="orderId" value="${order.id}" \/> <div style="height: 380px; overflow-x: hidden; overflow-y: auto;"> <table class="input" style="margin-bottom: 30px;"> <tr> <th> 订单编号: <\/th> <td width="300"> ${order.sn} <\/td> <th> 创建日期: <\/th> <td> <fmt:formatDate value="${order.createDate }" pattern="yyyy-MM-dd HH:mm:ss"/> <\/td> <\/tr> <tr> <th>配送方式: <\/th> <td> <select name="shippingMethodId" > <c:forEach items="${shippingMethods }" var="shippingMethod"><option value="${shippingMethod.id }" <c:if test="${order.shippingMethod==shippingMethod.id}">selected="selected"</c:if> >${shippingMethod.name }<\/option> </c:forEach> <\/select> <\/td> <th> 物流公司: <\/th> <td> <select name="deliveryCorpId"> <option value="">请选择...<\/option><c:forEach items="${deliveryCorps }" var="deliveryCorp"><option value="${deliveryCorp.id }" <c:if test="${order.shipMethod.defaultDeliveryCorp==deliveryCorp.id}">selected="selected"</c:if> >${deliveryCorp.name }<\/option> </c:forEach> <\/select> <\/td> <\/tr> <tr> <th> 运单号: <\/th> <td> <input type="text" name="trackingNo" class="text" maxlength="200" \/> <\/td> <th> 物流费用: <\/th> <td> <input type="text" name="freight" value="<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${order.freight }"></fmt:formatNumber>" class="text" maxlength="16" \/> <\/td> <\/tr> <tr> <th> 收货人: <\/th> <td> <input type="text" name="consignee" class="text" value="${order.consignee}" maxlength="200" \/> <\/td> <th> 邮编: <\/th> <td> <input type="text" name="zipCode" class="text" value="${order.zipCode}" maxlength="200" \/> <\/td> <\/tr> <tr> <th> 地区: <\/th> <td> <span class="fieldSet"> <input type="hidden" id="areaId" name="areaId" value="${order.area}" treePath="${order.xxarea.treePath}" \/> <\/span> <\/td> <th> 地址: <\/th> <td> <input type="text" name="address" class="text" value="${order.address}" maxlength="200" \/> <\/td> <\/tr> <tr> <th> 电话: <\/th> <td> <input type="text" name="phone" class="text" value="${order.phone}" maxlength="200" \/> <\/td> <th> 备注: <\/th> <td> <input type="text" name="memo" class="text" maxlength="200" \/> <\/td> <\/tr> <\/table> <table class="input"> <tr class="title"> <th> 商品编号 <\/th> <th> 商品名称 <\/th> <th> 商品库存 <\/th> <th> 购买数量 <\/th> <th> 已发货数量 <\/th> <th> 发货数量 <\/th> <\/tr> <c:forEach items="${orderItem}" var="l" varStatus="status">   <tr> <td> <input type="hidden" name="shippingItems[${status.count-1 }].sn" value="${l.sn}" \/> ${l.sn} <\/td> <td width="300"> <span title="${l.fullName}">${l.name}<\/span> <\/td> <td> - <\/td> <td> ${l.quantity} <\/td> <td> ${l.shippedQuantity}<\/td> <td> <input type="text" name="shippingItems[${status.count-1 }].quantity" class="text shippingItemsQuantity" value="${l.quantity-l.shippedQuantity}" maxlength="9" style="width: 30px;" max="${l.quantity-l.shippedQuantity}" \/> <\/td> <\/tr> <tr> <td colspan="6" style="border-bottom: none;"> &nbsp; <\/td> <\/tr></c:forEach> <\/table> <\/div> <\/form>',				width: 900,
			modal: true,
			ok: "确  定",
			cancel: "取  消",
			onShow: function() {
				$("#areaId").lSelect({
					url: "${pageContext.request.contextPath}/area/area"
				});
				$.validator.addClassRules({
					shippingItemsQuantity: {
						required: true,
						digits: true
					}
				});
				$("#shippingForm").validate({
					rules: {
						shippingMethodId: "required",
						deliveryCorpId: "required",
						freight: {
							min: 0,
							decimal: {
								integer: 12,
								fraction: 2
							}
						},
						consignee: "required",
						zipCode: "required",
						areaId: "required",
						address: "required",
						phone: "required"
					}
				});
			},
			onOk: function() {
				var total = 0;
				$("#shippingForm input.shippingItemsQuantity").each(function() {
					var quantity = $(this).val();
					if ($.isNumeric(quantity)) {
						total += parseInt(quantity);
					}
				});
				if (total <= 0) {
					$.message("warn", "发货总数必须大于0");
				} else {
					$("#shippingForm").submit();
				}
				return false;
			}
		});
	});
	
	// 退货
	$returnsButton.click(function() {
		$.dialog({
			title: "退 货",
			content: ' <form id="returnsForm" action="${pageContext.request.contextPath}/ordermanage/returns" method="post"> <input type="hidden" name="token" value="96b82ecf-871f-4ced-ae4a-b208c62823be" \/> <input type="hidden" name="orderId" value="${order.id}" \/> <div style="height: 380px; overflow-x: hidden; overflow-y: auto;"> <table class="input" style="margin-bottom: 30px;"> <tr> <th> 订单编号: <\/th> <td width="300"> ${order.sn} <\/td> <th> 创建日期: <\/th> <td> <fmt:formatDate value="${order.createDate }" pattern="yyyy-MM-dd HH:mm:ss"/> <\/td> <\/tr> <tr> <th> 配送方式: <\/th> <td> <select name="shippingMethodId"> <option value="">请选择...<\/option><c:forEach items="${shippingMethods }" var="shippingMethod"><option value="${shippingMethod.id }" >${shippingMethod.name }<\/option> </c:forEach>  <\/select> <\/td> <th> 物流公司: <\/th> <td> <select name="deliveryCorpId"> <option value="">请选择...<\/option> <c:forEach items="${deliveryCorps }" var="deliveryCorp"><option value="${deliveryCorp.id }" >${deliveryCorp.name }<\/option> </c:forEach><\/select> <\/td> <\/tr> <tr> <th> 运单号: <\/th> <td> <input type="text" name="trackingNo" class="text" maxlength="200" \/> <\/td> <th> 物流费用: <\/th> <td> <input type="text" name="freight" class="text" maxlength="16" \/> <\/td> <\/tr> <tr> <th> 发货人: <\/th> <td> <input type="text" name="shipper" class="text" value="${order.consignee}" maxlength="200" \/> <\/td> <th> 邮编: <\/th> <td> <input type="text" name="zipCode" class="text" value="${order.zipCode}" maxlength="200" \/> <\/td> <\/tr> <tr> <th> 地区: <\/th> <td> <span class="fieldSet"> <input type="hidden" id="areaId" name="areaId" value="${order.area}" treePath="${order.xxarea.treePath}" \/> <\/span> <\/td> <th> 地址: <\/th> <td> <input type="text" name="address" class="text" value="${order.address}" maxlength="200" \/> <\/td> <\/tr> <tr> <th> 电话: <\/th> <td> <input type="text" name="phone" class="text" value="${order.phone}" maxlength="200" \/> <\/td> <th> 备注: <\/th> <td> <input type="text" name="memo" class="text" maxlength="200" \/> <\/td> <\/tr> <\/table> <table class="input"> <tr class="title"> <th> 商品编号 <\/th> <th> 商品名称 <\/th> <th> 商品库存 <\/th> <th> 已发货数量 <\/th> <th> 已退货数量 <\/th> <th> 退货数量 <\/th> <\/tr> <c:forEach items="${orderItem}" var="l" varStatus="status">   <tr> <td> <input type="hidden" name="returnsItems[${status.count-1 }].sn" value="${l.sn}" \/> ${l.sn} <\/td> <td width="300"> <span title="${l.fullName}">${l.name}<\/span> <\/td> <td> - <\/td> <td> ${l.quantity} <\/td> <td> ${l.shippedQuantity}<\/td> <td> <input type="text" name="returnsItems[${status.count-1 }].quantity" class="text returnsItemsQuantity" value="${l.quantity-l.returnQuantity}" maxlength="9" style="width: 30px;" max="${l.quantity-l.returnQuantity}" \/> <\/td> <\/tr> <tr> <td colspan="6" style="border-bottom: none;"> &nbsp; <\/td> <\/tr></c:forEach><\/table> <\/div> <\/form>',				width: 900,
			modal: true,
			ok: "确  定",
			cancel: "取  消",
			onShow: function() {
				$("#areaId").lSelect({
					url: "${pageContext.request.contextPath}/area/area"
				});
				$.validator.addClassRules({
					returnsItemsQuantity: {
						required: true,
						digits: true
					}
				});
				$("#returnsForm").validate({
					rules: {
						freight: {
							min: 0,
							decimal: {
								integer: 12,
								fraction: 2
							}
						},
						shipper: "required",
						zipCode: "required",
						areaId: "required",
						address: "required",
						phone: "required"
					}
				});
			},
			onOk: function() {
				var total = 0;
				$("#returnsForm input.returnsItemsQuantity").each(function() {
					var quantity = $(this).val();
					if ($.isNumeric(quantity)) {
						total += parseInt(quantity);
					}
				});
				if (total <= 0) {
					$.message("warn", "退货总数必须大于0");
				} else {
					$("#returnsForm").submit();
				}
				return false;
			}
		});
	});
 
	// 完成
	$completeButton.click(function() {
		var $this = $(this);
		$.dialog({
			type: "warn",
			content: "订单完成后将无法操作，是否继续?",
			onOk: function() {
				$completeForm.submit();
			}
		});
	});
	
	// 取消
	$cancelButton.click(function() {
		var $this = $(this);
		$.dialog({
			type: "warn",
			content: "订单取消后将无法操作，是否继续?",
			onOk: function() {
				$cancelForm.submit();
			}
		});
	});


	
 
});
</script>
</head>
<body>
	<form id="confirmForm" action="${pageContext.request.contextPath}/ordermanage/confirm" method="post">
		<input type="hidden" name="id" value="${order.id }" />
	</form>
	<form id="completeForm" action="${pageContext.request.contextPath}/ordermanage/complete" method="post">
		<input type="hidden" name="id" value="${order.id }" />
	</form>
	<form id="cancelForm" action="${pageContext.request.contextPath}/ordermanage/cancel" method="post">
		<input type="hidden" name="id" value="${order.id }" />
	</form>
	<div class="path">
		<a href="/shopxx/admin/common/index.jhtml">首页</a> &raquo; 查看订单
	</div>
	<ul id="tab" class="tab">
		<li>
			<input type="button" value="订单信息" />
		</li>
		<li>
			<input type="button" value="商品信息" />
		</li>
		<li>
			<input type="button" value="收款信息" />
		</li>
		<li>
			<input type="button" value="发货信息" />
		</li>
		<li>
			<input type="button" value="退款信息" />
		</li>
		<li>
			<input type="button" value="退货信息" />
		</li>
		<li>
			<input type="button" value="订单日志" />
		</li>
	</ul>
	<table class="input tabContent">
		<tr>
			<td>
				&nbsp;
			</td>
			<td>
			
			 	<!-- 未到期 订单未确认可以点确认 -->
				<input type="button" id="confirmButton" class="button" value="确 认" <c:if test="${order.orderStatus!=0||order.expired }">disabled="disabled" </c:if>/>
				
				<input type="button" id="paymentButton" class="button" value="支 付" <c:if test="${order.orderStatus!=1||order.expired||(order.paymentStatus !=0 && order.paymentStatus !=1) }">disabled="disabled"</c:if> />
				
				<input type="button" id="shippingButton" class="button" value="发 货" <c:if test="${order.orderStatus!=1||order.expired||(order.shippingStatus !=0 && order.shippingStatus !=1) }">disabled="disabled"</c:if> />
				
				<input type="button" id="completeButton" class="button" value="完 成" <c:if test="${order.orderStatus!=1||order.expired }">disabled="disabled"</c:if> />
			</td>
			<td>
				&nbsp;
			</td>
			<td>
				<input type="button" id="refundsButton" class="button" value="退 款" <c:if test="${order.expired || order.orderStatus !=1 || (order.paymentStatus !=2 && order.paymentStatus !=1 && order.paymentStatus !=3) }">disabled="disabled"</c:if> />
				<input type="button" id="returnsButton" class="button" value="退 货" <c:if test="${order.expired || order.orderStatus !=1 || (order.shippingStatus !=2 && order.shippingStatus !=1 && order.shippingStatus !=3) }">disabled="disabled"</c:if> />
				<input type="button" id="cancelButton" class="button" value="取 消" <c:if test="${order.expired || order.orderStatus !=0 }">disabled="disabled"</c:if> />
			</td>
		</tr>
		<tr>
			<th>
				订单编号:
			</th>
			<td width="360">
				${order.sn }
			</td>
			<th>
				创建日期:
			</th>
			<td>
			<fmt:formatDate value="${order.createDate }" pattern="yyyy-MM-dd HH:mm:ss"/>
			</td>
		</tr>
		<tr>
			<th>
				订单状态:
			</th>
			<td>
				<c:if test="${order.orderStatus==0 }">未确认</c:if>
	            <c:if test="${order.orderStatus==1 }">已确认</c:if>
	            <c:if test="${order.orderStatus==2 }">已完成</c:if>
	            <c:if test="${order.orderStatus==3 }">已取消</c:if>
			</td>
			<th>
				支付状态:
			</th>
			<td>
				<c:if test="${order.paymentStatus==0 }">未支付</c:if>
	            <c:if test="${order.paymentStatus==1 }">部分支付</c:if>
	            <c:if test="${order.paymentStatus==2 }">已支付</c:if>
	            <c:if test="${order.paymentStatus==3 }">部分退款</c:if>
	            <c:if test="${order.paymentStatus==4 }">已退款</c:if>
			</td>
		</tr>
		<tr>
			<th>
				配送状态:
			</th>
			<td>
				<c:if test="${order.shippingStatus==0 }">未发货</c:if>
	            <c:if test="${order.shippingStatus==1 }">部分发货</c:if>
	            <c:if test="${order.shippingStatus==2 }">已发货</c:if>
	            <c:if test="${order.shippingStatus==3 }">部分退货</c:if>
	            <c:if test="${order.shippingStatus==4 }">已退货</c:if>
			</td>
			<th>
				用户名:
			</th>
			<td>
				${order.xxMember.username }
			</td>
		</tr>
		<tr>
			<th>
				订单金额:
			</th>
			<td>
				<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${order.orderMoney }"></fmt:formatNumber>
			</td>
			<th>
				已付金额:
			</th>
			<td>
				<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${order.amountPaid }"></fmt:formatNumber>
			</td>
		</tr>
		<tr>
			<th>
				商品重量:
			</th>
			<td>
				${order.weight }
			</td>
			<th>
				商品数量:
			</th>
			<td>
				${order.quantity }
			</td>
		</tr>
		<tr>
			<th>
				促销:
			</th>
			<td>
			<c:if test="${order.promotion==null }">-</c:if>
			<c:if test="${order.promotion!=null }">${order.promotion }</c:if>
			</td>
			<th>
				使用优惠券:
			</th>
			<td>
			<c:if test="${order.couponCode==null }">-</c:if>
			<c:if test="${order.couponCode!=null }">${order.promotion }</c:if>
				
			</td>
		</tr>
		<tr>
			<th>
				促销折扣:
			</th>
			<td>
			<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${order.promotionDiscount }"></fmt:formatNumber>
			</td>
			<th>
				优惠券折扣:
			</th>
			<td>
			<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${order.couponDiscount }"></fmt:formatNumber>
			</td>
		</tr>
		<tr>
			<th>
				调整金额:
			</th>
			<td>
			<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${order.offsetAmount }"></fmt:formatNumber>
			</td>
			<th>
				赠送积分:
			</th>
			<td>
				${order.point }
			</td>
		</tr>
		<tr>
			<th>
				运费:
			</th>
			<td>
				<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${order.freight }"></fmt:formatNumber>
			</td>
			<th>
				支付手续费:
			</th>
			<td>
			<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${order.fee }"></fmt:formatNumber>
			</td>
		</tr>
		<tr>
			<th>
				支付方式:
			</th>
			<td>
				${order.paymentMethodName }
			</td>
			<th>
				配送方式:
			</th>
			<td>
				${order.shipMethod.name }
			</td>
		</tr>
		<tr>
			<th>
				收货人:
			</th>
			<td>
				${order.consignee }
			</td>
			<th>
				地区:
			</th>
			<td>
				${order.areaName }
			</td>
		</tr>
		<tr>
			<th>
				地址:
			</th>
			<td>
				${order.address }
			</td>
			<th>
				邮编:
			</th>
			<td>
				${order.zipCode }
			</td>
		</tr>
		<tr>
			<th>
				电话:
			</th>
			<td>
				${order.phone }
			</td>
			<th>
				附言:
			</th>
			<td>
				${order.memo }
			</td>
		</tr>
	</table>
	<table class="input tabContent">
		<tr class="title">
			<th>
				商品编号
			</th>
			<th>
				商品名称
			</th>
			<th>
				商品价格
			</th>
			<th>
				数量
			</th>
			<th>
				已发货数量
			</th>
			<th>
				已退货数量
			</th>
			<th>
				小计
			</th>
		</tr>
		<c:forEach items="${orderItem }" var="l">
			<tr>
				<td>
					${l.sn }
				</td>
				<td width="400">
					<span title="${l.fullName }">${l.name }</span>
				</td>
				<td>
						${l.price }
				</td>
				<td>
						${l.quantity }
				</td>
				<td>
						${l.shippedQuantity }
				</td>
				<td>
						${l.returnQuantity }
				</td>
				<td>
				<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${l.price*l.quantity }"></fmt:formatNumber>
				</td>
			</tr>
			</c:forEach>
	</table>
	<table class="input tabContent">
		<tr class="title">
			<th>
				编号
			</th>
			<th>
				方式
			</th>
			<th>
				支付方式
			</th>
			<th>
				付款金额
			</th>
			<th>
				状态
			</th>
			<th>
				付款日期
			</th>
		</tr>
		<c:forEach items="${payments }" var="payment">
			<tr>
				<td>
					${payment.sn }
				</td>
				<td>
					${payment.method }
				</td>
				<td>
					${payment.paymentMethod }
				</td>
				<td>
					${payment.amount }
				</td>
				<td>
					${payment.status }
				</td>
				<td>
				<fmt:formatDate value="${payment.createDate }" pattern="yyyy-MM-dd"/>
				</td>
			</tr>
			</c:forEach>
	</table>
	
	<table class="input tabContent">
		<tr class="title">
			<th>
				编号
			</th>
			<th>
				配送方式
			</th>
			<th>
				物流公司
			</th>
			<th>
				运单号
			</th>
			<th>
				收货人
			</th>
			<th>
				创建日期
			</th>
		</tr>
			<tr>
				<td>
					${shipping.sn }
				</td>
				<td>
					${shipping.shippingMethod }
				</td>
				<td>
					${shipping.deliveryCorp }
				</td>
				<td>
					${shipping.trackingNo }
				</td>
				<td>
					${shipping.consignee }
				</td>
				<td>
					<span title="<fmt:formatDate value='${shipping.createDate }' pattern='yyyy-MM-dd HH:mm:ss'/>">
					<fmt:formatDate value="${shipping.createDate }" pattern="yyyy-MM-dd"/>
					</span>
				</td>
			</tr>
	</table>
	<table class="input tabContent">
		<tr class="title">
			<th>
				编号
			</th>
			<th>
				方式
			</th>
			<th>
				支付方式
			</th>
			<th>
				退款金额
			</th>
			<th>
				创建日期
			</th>
		</tr>
		<tr>
				<td>
					${refunds.sn }
				</td>
				<td>
					${refunds.method }
				</td>
				<td>
					${refunds.paymentMethod }
				</td>
				<td>
					${refunds.amount }
				</td>
				<td>
					<span title="<fmt:formatDate value='${refunds.createDate }' pattern='yyyy-MM-dd HH:mm:ss'/>">
					<fmt:formatDate value="${refunds.createDate }" pattern="yyyy-MM-dd"/>
					</span>
				</td>
			</tr>
		
	</table>
	<table class="input tabContent">
		<tr class="title">
			<th>
				编号
			</th>
			<th>
				配送方式
			</th>
			<th>
				物流公司
			</th>
			<th>
				运单号
			</th>
			<th>
				发货人
			</th>
			<th>
				创建日期
			</th>
		</tr>
		<tr>
				<td>
					${returns.sn }
				</td>
				<td>
					${returns.shippingMethod }
				</td>
				<td>
					${returns.deliveryCorp }
				</td>
				<td>
					${returns.trackingNo }
				</td>
				<td>
					${returns.shipper }
				</td>
				<td>
					<span title="<fmt:formatDate value='${returns.createDate }' pattern='yyyy-MM-dd HH:mm:ss'/>">
					<fmt:formatDate value="${returns.createDate }" pattern="yyyy-MM-dd"/>
					</span>
				</td>
			</tr>
		
	</table>
	<table class="input tabContent">
		<tr class="title">
			<th>
				类型
			</th>
			<th>
				操作员
			</th>
			<th>
				内容
			</th>
			<th>
				创建日期
			</th>
		</tr>
		<c:forEach items="${orderLogs }" var="ol">
			<tr>
				<td>
					<c:if test="${ol.type==0}">订单创建</c:if>
					<c:if test="${ol.type==1}">订单修改</c:if>
					<c:if test="${ol.type==2}">订单确认</c:if>
					<c:if test="${ol.type==3}">订单支付</c:if>
					<c:if test="${ol.type==4}">订单退款</c:if>
					<c:if test="${ol.type==5}">订单发货</c:if>
					<c:if test="${ol.type==6}">订单退货</c:if>
					<c:if test="${ol.type==7}">订单完成</c:if>
					<c:if test="${ol.type==8}">订单取消</c:if>
					<c:if test="${ol.type==9}">其它</c:if>
				</td>
				<td>
						<span class="green">${ol.operator }</span>
				</td>
				<td>
					${ol.content }
				</td>
				<td>
					<span title="<fmt:formatDate value='${ol.createDate }' pattern='yyyy-MM-dd HH:mm:ss'/>">
					<fmt:formatDate value="${ol.createDate }" pattern="yyyy-MM-dd"/>
					
					</span>
				</td>
			</tr>
		</c:forEach>
			
	</table>
	<table class="input">
		<tr>
			<th>
				&nbsp;
			</th>
			<td>
				<input type="button" id="backButton" class="button" value="返&nbsp;&nbsp;回" />
			</td>
		</tr>
	</table>
</body>
</html>