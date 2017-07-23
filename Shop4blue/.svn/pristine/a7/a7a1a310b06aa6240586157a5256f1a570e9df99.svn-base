<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>编辑订单 - Powered By SHOP++</title>
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

	var $inputForm = $("#inputForm");
	var $input = $("#inputForm :input:not(#productSn)");
	var $amount = $("#amount");
	var $weight = $("#weight");
	var $quantity = $("#quantity");
	var $isInvoice = $("#isInvoice");
	var $invoiceTitle = $("#invoiceTitle");
	var $tax = $("#tax");
	var $areaId = $("#areaId");
	var $orderItemTable = $("#orderItemTable");
	var $deleteOrderItem = $("#orderItemTable a.deleteOrderItem");
	var $productSn = $("#productSn");
	var $addOrderItem = $("#addOrderItem");
	var isLocked = false;
	var timeouts = {};
	var orderItemIndex = ${count};
	
	
	
	// 初始值
	$input.each(function() {
		var $this = $(this);
		$this.data("value", $this.val());
	});
	
	// 地区选择
	$areaId.lSelect({
		url: "${pageContext.request.contextPath}/area/area"
	});
		
			
	
	// 检查锁定
	function checkLock() {
		if (!isLocked) {
			$.ajax({
				url: "${pageContext.request.contextPath}/ordermanage/checklock",
				type: "POST",
				data: {id: 7},
				dataType: "json",
				cache: false,
				success: function(message) {
					if (message.type != "success") {
						$.message(message);
						$inputForm.find(":input:not(#backButton), #orderItemTable a.deleteOrderItem").prop("disabled", true);
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
	}, 10000);
	
	// 开据发票
	$isInvoice.click(function() {
		if ($(this).prop("checked")) {
			$invoiceTitle.prop("disabled", false);
			$tax.prop("disabled", false);
		} else {
			$invoiceTitle.prop("disabled", true);
			$tax.prop("disabled", true);
		}
	});
	
	// 计算
	$input.bind("input propertychange change", function(event) {
		if (event.type != "propertychange" || event.originalEvent.propertyName == "value") {
			calculate($(this));
		}
	});
	
	// 计算
	function calculate($input) {
		var name = $input.attr("name");
		clearTimeout(timeouts[name]);
		timeouts[name] = setTimeout(function() {
			if ($inputForm.valid()) {
				$.ajax({
					url: "calculate.jhtml",
					type: "POST",
					data: $inputForm.serialize(),
					dataType: "json",
					cache: false,
					success: function(data) {
						if (data.message.type == "success") {
							$input.data("value", $input.val());
							$amount.text(currency(data.amount, true));
							$weight.text(data.weight);
							$quantity.text(data.quantity);
							if ($input.hasClass("orderItemPrice") || $input.hasClass("orderItemQuantity")) {
								var $tr = $input.closest("tr");
								$tr.find("span.subtotal").text(currency(data.orderItems[$tr.find("input.orderItemSn").val()].subtotal, true));
							}
						} else {
							$.message(data.message);
							$input.val($input.data("value"));
						}
					}
				});
			}
		}, 500);
	}
	
	// 添加订单项
	 $addOrderItem.click(function() {
		 
		var productSn = $.trim($productSn.val());
		if (productSn == "") {
			
			alert("请填写商品编号");
			return false;
		}
		var repeat = false;
		$("#inputForm input.orderItemSn").each(function() {
			if ($(this).val() == productSn) {
				repeat = true;
				return false;
			}
		});
		if (repeat) {
			alert("该商品编号已存在");
			return false;
		}
		
		$.ajax({
			url: "${pageContext.request.contextPath}/manageedit/editadd",
			type: "POST",
			data: {productSn: $productSn.val(),id:"${order.id}"},
			dataType: "json",
			success: function(data) {
				
var $tr = $( '<tr class="orderItemTr"> <td> <input type="hidden" name="orderItems[' + orderItemIndex + '].sn" class="orderItemSn" value="' + data.sn + '" \/> <input type="hidden" name="orderItems[' + orderItemIndex + '].weight" value="' + (data.weight != null ? data.weight : '') + '" \/> ' + data.sn + ' <\/td> <td width="400"> <span title="' + data.fullName + '">' + data.fullName.substring(0, 50) + '<\/span> ' + (data.isGift ? '<span class="red">[赠品]<\/span>' : '') + ' <\/td> <td> ' + (data.isGift ? '<input type="hidden" name="orderItems[' + orderItemIndex + '].price" value="0" \/>-' : '<input type="text" name="orderItems[' + orderItemIndex + '].price" class="text orderItemPrice" value="' + data.price + '" maxlength="16" style="width: 60px;" \/>') + ' <\/td> <td> <input type="text" name="orderItems[' + orderItemIndex + '].quantity" class="text orderItemQuantity" value="1" maxlength="4" style="width: 30px;" \/> <\/td> <td> ' + (data.isGift ? '-' : '<span class="subtotal">' + currency(data.price, true) + '<\/span>') + ' <\/td> <td> <a href="javascript:;" class="deleteOrderItem">[删除]<\/a> <\/td> <\/tr>');					
$tr.appendTo($orderItemTable).find(":text").each(function() {
						var $this = $(this);
						$this.data("value", $this.val());
					}).bind("input propertychange change", function(event) {
						if (event.type != "propertychange" || event.originalEvent.propertyName == "value") {
							calculate($(this));
						}
					});
					orderItemIndex ++;
				window.location.reload(true);
			}
		});
	}); 
	
	// 删除订单项deleteOrderItem
	$deleteOrderItem.live("click", function() {
		var $this = $(this);
		if ($orderItemTable.find("tr.orderItemTr").size() <= 1) {
			$.message("warn", "删除失败，必须至少保留一项");
			//alert("删除失败，必须至少保留一项");
		} else {
			$this.closest("tr").find(":text").each(function() {
				var name = $(this).attr("name");
				clearTimeout(timeouts[name]);
			});
			$this.closest("tr").remove();
		}
	});
	
	$.validator.addClassRules({
		orderItemPrice: {
			required: true,
			min: 0,
			decimal: {
				integer: 12,
				fraction: 2
			}
		},
		orderItemQuantity: {
			required: true,
			integer: true,
			min: 1
		}
	});
	
	// 表单验证
	$inputForm.validate({
		rules: {
			offsetAmount: {
				required: true,
				number: true,
				decimal: {
					integer: 12,
					fraction: 2
				}
			},
			point: {
				required: true,
				digits: true
			},
			freight: {
				required: true,
				min: 0,
				decimal: {
					integer: 12,
					fraction: 2
				}
			},
			paymentMethodId: "required",
			shippingMethodId: "required",
			invoiceTitle: "required",
			tax: {
				required: true,
				min: 0,
				decimal: {
					integer: 12,
					fraction: 2
				}
			},
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
	<div class="path">
		<a href="/shopxx/admin/common/index.jhtml">首页</a> &raquo; 编辑订单
	</div>
	<ul id="tab" class="tab">
		<li>
			<input type="button" value="订单信息" />
		</li>
		<li>
			<input type="button" value="商品信息" />
		</li>
	</ul>
	<form id="inputForm" action="${pageContext.request.contextPath}/manageedit/updateedit" method="post">
		<input type="hidden" name="id" value="7" />
		<table class="input tabContent">
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
					${order.orderStatus }
				</td>
				<th>
					支付状态:
				</th>
				<td>
					${order.paymentStatus }
				</td>
			</tr>
			<tr>
				<th>
					配送状态:
				</th>
				<td>
					${order.shippingStatus }
				</td>
				<th>
					用户名:
				</th>
				<td>
					<a href="../member/view.jhtml?id=1">${order.xxMember.username }</a>
				</td>
			</tr>
			<tr>
				<th>
					订单金额:
				</th>
				<td>
					<span id="amount">￥<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${order.orderMoney }"></fmt:formatNumber></span>
				</td>
				<th>
					已付金额:
				</th>
				<td>
					￥<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${order.amountPaid }"></fmt:formatNumber>
				</td>
			</tr>
			<tr>
				<th>
					商品重量:
				</th>
				<td>
					<span id="weight">${order.weight }</span>
				</td>
				<th>
					商品数量:
				</th>
				<td>
					<span id="quantity">${order.quantity }</span>
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
					<input type="text" name="offsetAmount" class="text" value="<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${order.offsetAmount }"></fmt:formatNumber>" maxlength="16" />
				</td>
				<th>
					赠送积分:
				</th>
				<td>
					<input type="text" name="point" class="text" value="<fmt:formatNumber maxFractionDigits="4" minFractionDigits="0" value="${order.point }"></fmt:formatNumber>" maxlength="9" />
				</td>
			</tr>
			<tr>
				<th>
					运费:
				</th>
				<td>
					<input type="text" name="freight" class="text" value="<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${order.freight }"></fmt:formatNumber>" maxlength="16" />
				</td>
				<th>
					支付手续费:
				</th>
				<td>
					￥<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${order.fee }"></fmt:formatNumber>
				</td>
			</tr>
			<tr>
				<th>
					支付方式:
				</th>
				<td>
					<select name="paymentMethod">
						<option value="">请选择...</option>
						<c:forEach items="${pmethod }" var="p">
						<c:if test="${order.paymentMethod==p.id }">
							<option value="${p.id }" selected="selected">${p.name }</option>
							</c:if>
							<c:if test="${order.paymentMethod!=p.id }">
							<option value="${p.id }">${p.name }</option>
							</c:if>
							</c:forEach>
					</select>
				</td>
				<th>
					配送方式:
				</th>
				<td>
					<select name="shippingMethod">
						<option value="">请选择...</option>
						<c:forEach items="${smethod }" var="s">
						<c:if test="${order.shippingMethod==s.id }">
							<option value="${s.id }" selected="selected">${s.name }</option>
							</c:if>
							<c:if test="${order.shippingMethod!=s.id }">
							<option value="${s.id }" >${s.name }</option>
							</c:if>
							</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					发票抬头:
				</th>
				<td>
					<span class="fieldSet">
						<c:if test="${order.isInvoice=='true' }">
						<input type="text" id="invoiceTitle" name="invoiceTitle" class="text" value="${order.invoiceTitle }" maxlength="200"  />
						<label>
							<input type="checkbox" id="isInvoice" name="isInvoice" value="true" checked="checked"/>是否开据发票
							</label>
							</c:if>
							<c:if test="${order.isInvoice=='false' }">
							<input type="text" id="invoiceTitle" name="invoiceTitle" class="text" value="${order.invoiceTitle }" maxlength="200" disabled="disabled" />
							<label>
							<input type="checkbox" id="isInvoice" name="isInvoice" value="true" />是否开据发票
							</label>
							</c:if>
							<input type="hidden" name="_isInvoice" value="false" />
						
					</span>
				</td>
				<th>
					税金:
				</th>
				<c:if test="${order.isInvoice=='true' }">
				<td>
					<input type="text" id="tax" name="tax" class="text" value="<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${order.tax }"></fmt:formatNumber>" maxlength="16"  />
				</td>
				</c:if>
				<c:if test="${order.isInvoice=='false' }">
				<td>
					<input type="text" id="tax" name="tax" class="text" value="<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${order.tax }"></fmt:formatNumber>" maxlength="16" disabled="disabled" />
				</td>
				</c:if>
			</tr>
			<tr>
				<th>
					收货人:
				</th>
				<td>
					<input type="text" name="consignee" class="text" value="${order.consignee }" maxlength="200" />
				</td>
				<th>
					地区:
				</th>
				<td>
					<span class="fieldSet">
						<input type="hidden" id="areaId" name="area" value="${order.area}" treepath="${order.xxarea.treePath }" />
					</span>
				</td>
			</tr>
			<tr>
				<th>
					地址:
				</th>
				<td>
					<input type="text" name="address" class="text" value="${order.address }" maxlength="200" />
				</td>
				<th>
					邮编:
				</th>
				<td>
					<input type="text" name="zipCode" class="text" value="${order.zipCode }" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					电话:
				</th>
				<td>
					<input type="text" name="phone" class="text" value="${order.phone }" maxlength="200" />
				</td>
				<th>
					附言:
				</th>
				<td>
					<input type="text" name="memo" class="text" value="${order.memo }" maxlength="200" />
				</td>
			</tr>
		</table>
		<table id="orderItemTable" class="input tabContent">
			<tr>
				<td colspan="6">
					商品编号: <input type="text" id="productSn" name="productSn" class="text" maxlength="200" />
					<input type="button" id="addOrderItem" class="button" value="添加商品" />
				</td>
			</tr>
			<tr class="title">
				<th>
					编号
				</th>
				<th>
					名称
				</th>
				<th>
					价格
				</th>
				<th>
					购买数量
				</th>
				<th>
					小计
				</th>
				<th>
					操作
				</th>
			</tr>
				<tr class="orderItemTr">
				<c:forEach items="${orderItem }" var="l" varStatus="i">
					<td>
					   <input type="hidden" id="count" />
						 <input type="hidden" name="orderItems[${i.count-1 }].id" value="${l.id }" />
						<input type="hidden" name="" class="orderItemSn" value="${l.sn }" />
						<%--<input type="hidden" name="orderItems[0].weight" value="${l.weight }" /> --%>
						${l.sn }
					</td>
					<td width="400">
						<span title="尚都比拉2013夏装新款淑女装 春款森女系 碎花修身短袖蕾丝连衣裙[粉红色 L]">${l.name }</span>
					</td>
					<td>
							<input type="text" name="orderItems[${i.count-1 }].price" class="text orderItemPrice" value="<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${l.price }"></fmt:formatNumber>" maxlength="16" style="width: 60px;" />
					</td>
					<td>
						<input type="text" name="orderItems[${i.count-1 }].quantity" class="text orderItemQuantity" value="${l.quantity }" maxlength="4" style="width: 30px;" />
					</td>
					<td>
							<span class="subtotal">￥<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${l.price*l.quantity }"></fmt:formatNumber></span>
					</td>
					<td>
						<a href="${pageContext.request.contextPath}/manageedit/editdel?pid=${l.id}&id=${order.id}" class="deleteOrderItem">[删除]</a>
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
					<input type="submit" class="button" value="确&nbsp;&nbsp;定" />
					<input type="button" id="backButton" class="button" value="返&nbsp;&nbsp;回" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>