<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>配送单打印 </title>
<meta name="author" content="SHOP++ Team" />
<meta name="copyright" content="SHOP++" />
<link href="${pageContext.request.contextPath}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/common.js"></script>
<style type="text/css">
.bar {
	height: 30px;
	line-height: 30px;
	border-bottom: 1px solid #d7e8f8;
	background-color: #eff7ff;
}

table {
	width: 100%;
}

table th {
	font-weight: bold;
	text-align: left;
}

table td, table th {
	line-height: 30px;
	padding: 0px 4px;
	font-size: 10pt;
	color: #000000;
}

.separated th, .separated td {
	border-top: 1px solid #000000;
	border-bottom: 1px solid #000000;
}
</style>
<style type="text/css" media="print">
.bar {
	display: none;
}
</style>
<script type="text/javascript">
$().ready(function() {

	var $print = $("#print");

	$print.click(function() {
		window.print();
		return false;
	});

});
</script>
</head>
<body>
	<div class="bar">
		<a href="javascript:;" id="print" class="button">打 印</a>
	</div>
	<div class="content">
		<table>
			<tr>
				<td colspan="2" rowspan="2">
					<img src="${pageContext.request.contextPath}/resources/logo/logo.jpg" alt="SHOP" style="width:100px;height:100px]"/>
				</td>
				<td>
					Shop4Blue商城
				</td>
				<td>
					&nbsp;
				</td>
				<td colspan="2">
					收货人: ${order.consignee }
				</td>
			</tr>
			<tr>
				<td>
					<!-- http://localhost -->
				</td>
				<td>
					&nbsp;
				</td>
				<td colspan="2">
					会员: test
				</td>
			</tr>
			<tr class="separated">
				<th colspan="2">
					订单编号: ${order.sn }
				</th>
				<th colspan="2">
					创建日期: <fmt:formatDate value="${order.createDate }" pattern="yyyy-MM-dd"/>
				</th>
				<th colspan="2">
					打印日期: <fmt:formatDate value="${localdate }" pattern="yyyy-MM-dd"/>
				</th>
			</tr>
			<tr>
				<td colspan="6">
					&nbsp;
				</td>
			</tr>
			<tr class="separated">
				<th>
					序号
				</th>
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
			<c:forEach items="${orderItem }" var="l" varStatus="states">
				<tr>
					<td>
						${states.count }
					</td>
					<td>
						${l.sn }
					</td>
					<td>
						${l.name }
					</td>
					<td>
					￥<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${l.price }"/>
					</td>
					<td>
						${l.quantity }
					</td>
					<td>
					￥<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${l.price*l.quantity }"/>
					</td>
				</tr>
				</c:forEach>
			<tr>
				<td colspan="6">
					&nbsp;
				</td>
			</tr>
			<tr class="separated">
				<td colspan="3">
					&nbsp;
				</td>
				<td colspan="3">
					收货人: ${order.consignee }<br />
					地址: ${order.areaName }${order.address }<br />
					邮编: ${order.zipCode }<br />
					电话: ${order.phone }<br />
					配送方式: ${order.shipMethod.name }
				</td>
			</tr>
			<tr>
				<td>
					&nbsp;
				</td>
				<td>
					&nbsp;
				</td>
				<td>
					&nbsp;
				</td>
				<td>
					&nbsp;
				</td>
				<td colspan="2">
					Powered By shopxx.net
				</td>
			</tr>
		</table>
	</div>
</body>
</html>