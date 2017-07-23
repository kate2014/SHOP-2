<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>购物车 - Powered By SHOP++</title>
<meta name="author" content="SHOP++ Team" />
<meta name="copyright" content="SHOP++" />
<link href="${pageContext.request.contextPath }/resources/shop/css/common.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/resources/shop/css/cart.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/common.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $quantity = $("input[name='quantity']");
	var $increase = $("span.increase");
	var $decrease = $("span.decrease");
	var $delete = $("a.delete");
	var $effectivePoint = $("#effectivePoint");
	var $effectivePrice = $("#effectivePrice");
	var $clear = $("#clear");
	var $submit = $("#submit");
	var timeouts = {};
	
	// 初始数量
	$quantity.each(function() {
		var $this = $(this);
		$this.data("value", $this.val());
	});
	
	// 数量
	$quantity.keypress(function(event) {
		var key = event.keyCode ? event.keyCode : event.which;
		if ((key >= 48 && key <= 57) || key==8) {
			return true;
		} else {
			return false;
		}
	});
	
	// 增加数量
	$increase.click(function() {
		var $quantity = $(this).parent().siblings("input");
		var quantity = $quantity.val();
		if (/^\d*[1-9]\d*$/.test(quantity)) {
			$quantity.val(parseInt(quantity) + 1);
		} else {
			$quantity.val(1);
		}
		edit($quantity);
	});
	
	// 减少数量
	$decrease.click(function() {
		var $quantity = $(this).parent().siblings("input");
		var quantity = $quantity.val();
		if (/^\d*[1-9]\d*$/.test(quantity) && parseInt(quantity) > 1) {
			$quantity.val(parseInt(quantity) - 1);
		} else {
			$quantity.val(1);
		}
		edit($quantity);
	});
	
	// 编辑数量
	$quantity.bind("input propertychange change", function(event) {
		if (event.type != "propertychange" || event.originalEvent.propertyName == "value") {
			edit($(this));
		}
	});
	
	// 编辑数量
	function edit($quantity) {
		var quantity = $quantity.val();
		if (/^\d*[1-9]\d*$/.test(quantity)) {
			var $tr = $quantity.closest("tr");
			var id = $tr.find("input[name='id']").val();
			clearTimeout(timeouts[id]);
			timeouts[id] = setTimeout(function() {
				$.ajax({
					url: "${pageContext.request.contextPath }/cart/edit",
					type: "POST",
					data: {id: id, quantity: quantity},
					dataType: "json",
					cache: false,
					beforeSend: function() {
						$submit.prop("disabled", true);
					},
					success: function(data) {
						if (data.message == "success") {
							$quantity.data("value", quantity);
							$tr.find("span.subtotal").text(currency(data.subtotal, true));
							if (!data.isLowStock) {
								$tr.find("span.lowStock").remove();
							}
							$effectivePoint.text(data.effectivePoint);
							$effectivePrice.text(data.effectivePrice);
						} else if (data.message == "error") {
							$.message(data.message);
							$quantity.val($quantity.data("value"));
							setTimeout(function() {
								location.reload(true);
							}, 3000);
						}
					},
					complete: function() {
						$submit.prop("disabled", false);
					}
				});
			}, 500);
		} else {
			$quantity.val($quantity.data("value"));
		}
	}

	// 删除
	$delete.click(function() {
		if (confirm("您确定要删除吗？")) {
			var $this = $(this);
			var $tr = $this.closest("tr");
			var id = $tr.find("input[name='id']").val();
			clearTimeout(timeouts[id]);
			$.ajax({
				url: "${pageContext.request.contextPath }/cart/delete",
				type: "POST",
				data: {id: id},
				dataType: "json",
				cache: false,
				beforeSend: function() {
					$submit.prop("disabled", true);
				},
				success: function(data) {
					if (data.message == "success") {
						if (data.quantity > 0) {
							$tr.remove();
							$effectivePoint.text(data.effectivePoint);
							$effectivePrice.text(currency(data.effectivePrice, true, true));
						} else {
							location.reload(true);
						}
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
		}
		return false;
	});
	
	// 清空
	$clear.click(function() {
		if (confirm("您确定要清空吗？")) {
			$.each(timeouts, function(i, timeout) {
				clearTimeout(timeout);
			});
			$.ajax({
				url: "${pageContext.request.contextPath }/cart/clear",
				type: "POST",
				dataType: "json",
				cache: false,
				success: function(data) {
					location.reload(true);
				}
			});
		}
		return false;
	});
	
	// 提交
	$submit.click(function() { 
		if (${user==null}) {
			$.redirectLogin("${pageContext.request.contextPath }/prologin/login", "必须登录后才能提交订单");
			return false;
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
<div class="container cart">
		<div class="span24">
			<div class="step step1">
				<ul>
					<li class="current">查看购物车</li>
					<li>订单信息</li>
					<li>完成订单</li>
				</ul>
			</div>
			<c:if test="${cart!=null }">
				<table>
					<tr>
						<th>图片</th>
						<th>商品</th>
						<th>单价</th>
						<th>数量</th>
						<th>小计</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${cartItems }" var="cartItem" >
						<tr>
							<td width="60">
								<input type="hidden" name="id" value="${cartItem.id}" />
								<img src="${cartItem.xxProduct.image}" alt="${cartItem.xxProduct.name}" />
							</td>
							<td>
								<a href="${pageContext.request.contextPath }/shopContent/shop?id=${cartItem.xxProduct.id}" title="${cartItem.xxProduct.name }" target="_blank">${cartItem.xxProduct.fullName }</a>
							</td>
							<td>
								<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${cartItem.unitPrice }"></fmt:formatNumber>
							</td>
							<td class="quantity" width="60">
								<input type="text" name="quantity" value="${cartItem.quantity }" maxlength="4" onpaste="return false;" />
								<div>
									<span class="increase">&nbsp;</span>
									<span class="decrease">&nbsp;</span>
								</div>
							</td>
							<td width="140">
								<span class="subtotal"><fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${cartItem.subtotal }"></fmt:formatNumber></span>
							</td>
							<td>
								<a href="javascript:;" class="delete">删除</a>
							</td>
						</tr>
						</c:forEach>
				</table>
				<dl id="giftItems" class="hidden">
				</dl>
				<div class="total">
					<em id="promotion">
					</em>
					赠送积分: <em id="effectivePoint">${cart.effectivePoint }</em>
					商品金额: <strong id="effectivePrice"><fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${cart.effectivePrice }"></fmt:formatNumber></strong>
				</div>
				<div class="bottom">
					<a href="javascript:;" id="clear" class="clear">清空购物车</a>
					<a href="${pageContext.request.contextPath }/order/info" id="submit" class="submit">提交订单</a>
				</div>
			</c:if>
			<c:if test="${cart==null }">
			<p>
					<a href="${pageContext.request.contextPath }/hc/index">您的购物车是空的，立即去商城逛逛</a>
				</p>
			</c:if>
		</div>
	</div>
<%@include file="../footer.jsp" %>
</body>
</html>