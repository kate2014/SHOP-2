<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看订单 - Powered By SHOP++</title>
<meta name="author" content="SHOP++ Team" />
<meta name="copyright" content="SHOP++" />
<link href="${pageContext.request.contextPath }/resources/shop/css/common.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/resources/shop/css/member.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/common.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $dialogOverlay = $("#dialogOverlay");
	var $dialog = $("#dialog");
	var $close = $("#close");
	var $deliveryContent = $("#deliveryContent");
	var $cancel = $("#cancel");
	var $deliveryQuery = $("a.deliveryQuery");
	var $pay = $("#pay");
	
	// 订单取消
	$cancel.click(function() {
		if (confirm("您确定要取消该订单吗？")) {
			$.ajax({
				url: "${pageContext.request.contextPath }/myorders/updateorder",
				data:{"id":${order.id}}, 
				type: "POST",
				dataType: "json",
				cache: false,
				success: function(data) {
					window.location.reload(true);
				}
			});
		}
		return false;
	});
	
	// 订单取消
	$pay.click(function() {
		if (confirm("确认支付")) {
			$.ajax({
				url: "${pageContext.request.contextPath }/myorders/payment",
				data:{"orderId":${order.id},"paymentMethodId":1},  
				type: "POST",
				dataType: "json",
				cache: false,
				success: function(data) {
					alert(data);
					window.location.reload(true);
				}
			});
		}
		return false;
	});
	
	
	
	// 物流动态
	$deliveryQuery.click(function() {
		var $this = $(this);
		$.ajax({
			url: "delivery_query.jhtml?sn=" + $this.attr("sn"),
			type: "GET",
			dataType: "json",
			cache: true,
			beforeSend: function() {
				$dialog.show();
				$dialogOverlay.show();
				$deliveryContent.html("系统正在加载中...");
			},
			success: function(data) {
				if (data.data != null) {
					var html = '<table>';
					$.each(data.data, function(i, item) {
						html += '<tr><th>' + item.time + '<\/th><td>' + item.context + '<\/td><\/tr>';
					});
					html += '<\/table>';
					$deliveryContent.html(html);
				} else {
					$deliveryContent.text(data.message);
				}
			}
		});
		return false;
	});
	
	// 关闭物流动态
	$close.click(function() {
		$dialog.hide();
		$dialogOverlay.hide();
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
<div class="container member">
<%@include file="../left.jsp" %>
<div class="span18 last">
			<div class="input order">
				<div id="dialog" class="dialog">
					<div id="close" class="close"></div>
					<ul>
						<li>时间</li>
						<li>内容</li>
					</ul>
					<div id="deliveryContent" class="deliveryContent"></div>
				</div>
				<div class="title">查看订单</div>
				<div class="top">
					
				
				
				<c:if test="${order.expired=='true' }"><span>订单编号: ${order.sn }</span><span>状态: <strong>已过期</strong></span><div class="tips">尊敬的客户，您的订单正在处理中，请您耐心等待！</div></c:if>
								<c:if test="${order.expired=='false' }">
								  <c:if test="${order.orderStatus==3 }"><span>订单编号: ${order.sn }</span><span>状态: <strong>已取消</strong></span><div class="tips">尊敬的客户，您的订单正在处理中，请您耐心等待！</div></c:if>
								  <c:if test="${order.orderStatus==2 }"><span>订单编号: ${order.sn }</span><span>状态: <strong>已完成</strong></span><div class="tips">尊敬的客户，您的订单正在处理中，请您耐心等待！</div></c:if>
								  <c:if test="${order.orderStatus!=3 }">
								  <c:if test="${order.orderStatus!=2 }">
								    <c:if test="${order.paymentStatus==0 }"><span>订单编号: ${order.sn }</span><span>状态: <strong>等待付款</strong></span>
											<span class="handle">
											<a href="payment.jhtml?sn=201706081616" class="button" id="pay">订单支付</a>
											<a href="javascript:;" id="cancel" class="button">订单取消</a>
										</span>
										<div class="tips">
												尊敬的客户，您的订单正在处理中，请您耐心等待！
										</div>
								    </c:if>
								    <c:if test="${order.paymentStatus!=0 }">
								      <c:if test="${order.paymentStatus==1 }">
								         <c:if test="${order.shippingStatus==0 }"><span>订单编号: ${order.sn }</span><span>状态: <strong>部分支付 未发货</strong></span><div class="tips">尊敬的客户，您的订单正在处理中，请您耐心等待！</div></c:if>
								         <c:if test="${order.shippingStatus==1 }"><span>订单编号: ${order.sn }</span><span>状态: <strong>部分支付 部分发货</strong></span><div class="tips">尊敬的客户，您的订单正在处理中，请您耐心等待！</div></c:if> 
								         <c:if test="${order.shippingStatus==2 }"><span>订单编号: ${order.sn }</span><span>状态: <strong>部分支付 已发货</strong></span><div class="tips">尊敬的客户，您的订单正在处理中，请您耐心等待！</div></c:if> 
								         <c:if test="${order.shippingStatus==3 }"><span>订单编号: ${order.sn }</span><span>状态: <strong>部分支付 部分退货</strong></span><div class="tips">尊敬的客户，您的订单正在处理中，请您耐心等待！</div></c:if> 
								         <c:if test="${order.shippingStatus==4 }"><span>订单编号: ${order.sn }</span><span>状态: <strong>部分支付 已退货</strong></span><div class="tips">尊敬的客户，您的订单正在处理中，请您耐心等待！</div></c:if>     
								      </c:if>
								      <c:if test="${order.paymentStatus==2 }">
								         <c:if test="${order.shippingStatus==0 }"><span>订单编号: ${order.sn }</span><span>状态: <strong>已支付 未发货</strong></span><div class="tips">尊敬的客户，您的订单正在处理中，请您耐心等待！</div></c:if>
								         <c:if test="${order.shippingStatus==1 }"><span>订单编号: ${order.sn }</span><span>状态: <strong>已支付 部分发货</strong></span><div class="tips">尊敬的客户，您的订单正在处理中，请您耐心等待！</div></c:if> 
								         <c:if test="${order.shippingStatus==2 }"><span>订单编号: ${order.sn }</span><span>状态: <strong>已支付 已发货</strong></span><div class="tips">尊敬的客户，您的订单正在处理中，请您耐心等待！</div></c:if> 
								         <c:if test="${order.shippingStatus==3 }"><span>订单编号: ${order.sn }</span><span>状态: <strong>已支付 部分退货</strong></span><div class="tips">尊敬的客户，您的订单正在处理中，请您耐心等待！</div></c:if> 
								         <c:if test="${order.shippingStatus==4 }"><span>订单编号: ${order.sn }</span><span>状态: <strong>已支付 已退货</strong></span><div class="tips">尊敬的客户，您的订单正在处理中，请您耐心等待！</div></c:if>     
								      </c:if>
								      <c:if test="${order.paymentStatus==3 }">
								         <c:if test="${order.shippingStatus==0 }"><span>订单编号: ${order.sn }</span><span>状态: <strong>部分退款 未发货</strong></span><div class="tips">尊敬的客户，您的订单正在处理中，请您耐心等待！</div></c:if>
								         <c:if test="${order.shippingStatus==1 }"><span>订单编号: ${order.sn }</span><span>状态: <strong>部分退款 部分发货</strong></span><div class="tips">尊敬的客户，您的订单正在处理中，请您耐心等待！</div></c:if> 
								         <c:if test="${order.shippingStatus==2 }"><span>订单编号: ${order.sn }</span><span>状态: <strong>部分退款 已发货</strong></span><div class="tips">尊敬的客户，您的订单正在处理中，请您耐心等待！</div></c:if> 
								         <c:if test="${o.shippingStatus==3 }"><span>订单编号: ${order.sn }</span><span>状态: <strong>部分退款 部分退货</strong></span><div class="tips">尊敬的客户，您的订单正在处理中，请您耐心等待！</div></c:if> 
								         <c:if test="${order.shippingStatus==4 }"><span>订单编号: ${order.sn }</span><span>状态: <strong>部分退款 已退货</strong></span><div class="tips">尊敬的客户，您的订单正在处理中，请您耐心等待！</div></c:if>     
								     </c:if>
								      <c:if test="${order.paymentStatus==4 }">
								         <c:if test="${order.shippingStatus==0 }"><span>订单编号: ${order.sn }</span><span>状态: <strong>已退款 未发货</strong></span><div class="tips">尊敬的客户，您的订单正在处理中，请您耐心等待！</div></c:if>
								         <c:if test="${order.shippingStatus==1 }"><span>订单编号: ${order.sn }</span><span>状态: <strong>已退款 部分发货</strong></span><div class="tips">尊敬的客户，您的订单正在处理中，请您耐心等待！</div></c:if> 
								         <c:if test="${order.shippingStatus==2 }"><span>订单编号: ${order.sn }</span><span>状态: <strong>已退款 已发货</strong></span><div class="tips">尊敬的客户，您的订单正在处理中，请您耐心等待！</div></c:if> 
								         <c:if test="${order.shippingStatus==3 }"><span>订单编号: ${order.sn }</span><span>状态: <strong>已退款 部分退货</strong></span><div class="tips">尊敬的客户，您的订单正在处理中，请您耐心等待！</div></c:if> 
								         <c:if test="${order.shippingStatus==4 }"><span>订单编号: ${order.sn }</span><span>状态: <strong>已退款 已退货</strong></span><div class="tips">尊敬的客户，您的订单正在处理中，请您耐心等待！</div></c:if>     
								     </c:if>
								    </c:if>
								    </c:if>
								  </c:if>
								  </c:if>
				</div>
				<table class="info">
					<tr>
						<th>
							创建日期:
						</th>
						<td>
							<fmt:formatDate value="${order.createDate }" pattern="yyyy-MM-dd HH:mm"/>
						</td>
					</tr>
					<tr>
						<th>
							支付方式:
						</th>
						<td>
							${order.paymentMethodName }
						</td>
					</tr>
					<tr>
						<th>
							配送方式:
						</th>
						<td>
							${order.shippingMethodName }
						</td>
					</tr>
					<tr>
						<th>
							商品价格:
						</th>
						<td>
							￥<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${order.orderMoney }"></fmt:formatNumber>
						</td>
					</tr>
						<tr>
							<th>
								运费:
							</th>
							<td>
								￥<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${order.freight }"></fmt:formatNumber>
							</td>
						</tr>
					<tr>
						<th>
							订单金额:
						</th>
						<td>
							￥<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${order.orderMoney }"></fmt:formatNumber>
						</td>
					</tr>
					<tr>
						<th>
							附言:
						</th>
						<td>
							${order.memo }
						</td>
					</tr>
				</table>
				<c:if test="${order.isInvoice=='true' }">
					<table class="info">
						<tr>
							<th>
								发票抬头:
							</th>
							<td>
								${order.invoiceTitle }
							</td>
						</tr>
						<tr>
							<th>
								税金:
							</th>
							<td>
								￥<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${order.tax }"></fmt:formatNumber>
							</td>
						</tr>
					</table>
					</c:if>
				<table class="info">
					<tr>
						<th>
							收货人:
						</th>
						<td>
							${order.consignee }
						</td>
					</tr>
					<tr>
						<th>
							邮编:
						</th>
						<td>
							${order.zipCode }
						</td>
					</tr>
					<tr>
						<th>
							地址:
						</th>
						<td>
							${order.areaName }${order.address }
						</td>
					</tr>
					<tr>
						<th>
							电话:
						</th>
						<td>
							${order.phone }
						</td>
					</tr>
				</table>
				<table class="orderItem">
					<tr>
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
							小计
						</th>
					</tr>
					<c:forEach items="${order.orderItems }" var="o">
						<tr>
							<td>
								${o.sn }
							</td>
							<td>
									<a href="${pageContext.request.contextPath}/shopContent/shop?id=${o.product }" title="${o.fullName }" target="_blank">${o.name }</a>
							</td>
							<td>
									￥<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${o.price }"></fmt:formatNumber>
							</td>
							<td>
								${o.quantity }
							</td>
							<td>
									￥<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${o.price*o.quantity }"></fmt:formatNumber>
							</td>
						</tr>
						</c:forEach>
				</table>
			</div>
		</div>
	</div>
<%@include file="../footer.jsp" %>
</body>
</html>