<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>会员中心 - Powered By SHOP++</title>
<meta name="author" content="SHOP++ Team" />
<meta name="copyright" content="SHOP++" />
<link href="${pageContext.request.contextPath }/resources/shop/css/common.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/resources/shop/css/member.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/common.js"></script>
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
			<div class="index">
				<div class="top clearfix">
					<div>
						<ul>
							<li>
								会员等级: ${user.xxMemberRank.name }
							</li>
							<li>
								账户余额:
								<strong>￥<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${user.balance }"></fmt:formatNumber>元</strong>
							</li>
							<li>
								消费金额:
								<strong>￥<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${user.amount }"></fmt:formatNumber>元</strong>
							</li>
							<li>
								可用积分:
								<em>${user.point }</em>
								<a href="coupon_code/exchange.jhtml">积分兑换</a>
							</li>
						</ul>
						<ul>
							<li>
								<a href="order/list.jhtml">等待付款(<em>1</em>)</a>
								<a href="order/list.jhtml">等待发货(<em>0</em>)</a>
							</li>
							<li>
								<a href="message/list.jhtml">未读消息(<em>0</em>)</a>
								<a href="coupon_code/list.jhtml">可用优惠券(<em>0</em>)</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath }/webcollect/selectcollect?userid=${user.id}">商品收藏(<em>${goodsCollectCount }</em>)</a>
								<a href="${pageContext.request.contextPath }/wbmessage/webselectall?userid=${user.id}">到货通知(<em>${goodsMessageCount }</em>)</a>
							</li>
							<li>
								<a href="review/list.jhtml">商品评论(<em>27</em>)</a>
								<a href="consultation/list.jhtml">商品咨询(<em>11</em>)</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="list">
					<div class="title">最新订单</div>
					<table class="list">
						<tr>
							<th>
								订单编号
							</th>
							<th>
								商品
							</th>
							<th>
								收货人
							</th>
							<th>
								订单金额
							</th>
							<th>
								创建日期
							</th>
							<th>
								状态
							</th>
							<th>
								操作
							</th>
						</tr>
						<c:forEach items="${order }" var="o">
							<tr>
								<td>
									${o.sn }
								</td>
								<td>
								<c:forEach items="${o.orderItems }" var="oo">
										<img src="${oo.xxProduct.image }" class="thumbnail" alt="" />
									</c:forEach>
								</td>
								<td>
									${o.consignee }
								</td>
								<td>
									￥<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${o.orderMoney }"></fmt:formatNumber> 
								</td>
								<td>
									<fmt:formatDate value="${o.createDate }" pattern="yyyy-MM-dd HH:mm"/>
								</td>
								<td>
								<c:if test="${o.expired=='true' }">已过期</c:if>
								<c:if test="${o.expired=='false' }">
								  <c:if test="${o.orderStatus==3 }">已取消</c:if>
								  <c:if test="${o.orderStatus==2 }">已完成</c:if>
								  <c:if test="${o.orderStatus!=3 }">
								  <c:if test="${o.orderStatus!=2 }">
								    <c:if test="${o.paymentStatus==0 }">等待付款</c:if>
								    <c:if test="${o.paymentStatus!=0 }">
								      <c:if test="${o.paymentStatus==1 }">
								         <c:if test="${o.shippingStatus==0 }">部分支付 未发货</c:if>
								         <c:if test="${o.shippingStatus==1 }">部分支付 部分发货</c:if> 
								         <c:if test="${o.shippingStatus==2 }">部分支付 已发货</c:if> 
								         <c:if test="${o.shippingStatus==3 }">部分支付 部分退货</c:if> 
								         <c:if test="${o.shippingStatus==4 }">部分支付 已退货</c:if>     
								      </c:if>
								      <c:if test="${o.paymentStatus==2 }">
								         <c:if test="${o.shippingStatus==0 }">已支付 未发货</c:if>
								         <c:if test="${o.shippingStatus==1 }">已支付 部分发货</c:if> 
								         <c:if test="${o.shippingStatus==2 }">已支付 已发货</c:if> 
								         <c:if test="${o.shippingStatus==3 }">已支付 部分退货</c:if> 
								         <c:if test="${o.shippingStatus==4 }">已支付 已退货</c:if>     
								      </c:if>
								      <c:if test="${o.paymentStatus==3 }">
								         <c:if test="${o.shippingStatus==0 }">部分退款 未发货</c:if>
								         <c:if test="${o.shippingStatus==1 }">部分退款 部分发货</c:if> 
								         <c:if test="${o.shippingStatus==2 }">部分退款 已发货</c:if> 
								         <c:if test="${o.shippingStatus==3 }">部分退款 部分退货</c:if> 
								         <c:if test="${o.shippingStatus==4 }">部分退款 已退货</c:if>     
								     </c:if>
								      <c:if test="${o.paymentStatus==4 }">
								         <c:if test="${o.shippingStatus==0 }">已退款 未发货</c:if>
								         <c:if test="${o.shippingStatus==1 }">已退款 部分发货</c:if> 
								         <c:if test="${o.shippingStatus==2 }">已退款 已发货</c:if> 
								         <c:if test="${o.shippingStatus==3 }">已退款 部分退货</c:if> 
								         <c:if test="${o.shippingStatus==4 }">已退款 已退货</c:if>     
								     </c:if>
								    </c:if>
								    </c:if>
								  </c:if>
								  </c:if>
								
										
								</td>
								<td>
									<a href="${pageContext.request.contextPath }/myorders/check?id=${o.id}">[查看]</a>
								</td>
							</tr>
							</c:forEach>
					</table>
				</div>
			</div>
		</div>
		</div>
		<%@include file="footer.jsp" %>
</body>
</html>