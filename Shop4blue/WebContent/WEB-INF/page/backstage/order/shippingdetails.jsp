<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>查看发货单 - Powered By SHOP++</title>
<meta name="author" content="SHOP++ Team" />
<meta name="copyright" content="SHOP++" />
<link href="${pageContext.request.contextPath}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/jquery.tools.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/input.js"></script>
<script type="text/javascript">
$().ready(function() {
	

});
</script>
</head>
<body>
	<div class="path">
		<a href="${pageContext.request.contextPath}/admin/common/index.jhtml">首页</a> &raquo; 查看发货单
	</div>
	<ul id="tab" class="tab">
		<li>
			<input type="button" value="基本信息" />
		</li>
		<li>
			<input type="button" value="发货项" />
		</li>
	</ul>
	<table class="input tabContent">
		<tr>
			<th>
				编号:
			</th>
			<td>
				${xs.sn }
			</td>
			<th>
				创建日期:
			</th>
			<!--
			<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2"> ${l.price } </fmt:formatNumber>
			<fmt:formatDate value="${xp.paymentDate }" pattern="yyyy-MM-dd"/>
			  -->
			<td>
				<fmt:formatDate value="${xs.createDate }" pattern="yyyy-MM-dd"/>
			</td>
		</tr>
		<tr>
			<th>
				配送方式:
			</th>
			<td>
				${xs.shippingMethod }
			</td>
			<th>
				物流公司:
			</th>
			<td>
				${xs.deliveryCorp }
			</td>
		</tr>
		<tr>
			<th>
				运单号:
			</th>
			<td>
				${xs.trackingNo }
			</td>
			<th>
				物流费用:
			</th>
			<td>
			<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2"> 	${xs.freight } </fmt:formatNumber>
			
			</td>
		</tr>
		<tr>
			<th>
				收货人:
			</th>
			<td>
				${xs.consignee }
			</td>
			<th>
				电话:
			</th>
			<td>
				${xs.phone }
			</td>
		</tr>
		<tr>
			<th>
				地区:
			</th>
			<td>
				${xs.area }
			</td>
			<th>
				地址:
			</th>
			<td>
				${xs.address }
			</td>
		</tr>
		<tr>
			<th>
				邮编:
			</th>
			<td>
				${xs.zipCode }
			</td>
			<th>
				订单:
			</th>
			<td>
				${xs.orders }
			</td>
		</tr>
		<tr>
			
			<th>
				操作员:
			</th>
			<td>
				${xs.operator }
			</td>
			<th>
				备注:
			</th>
			<td>
				${xs.memo }
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
				数量
			</th>
		</tr>
		 <c:forEach items="${xs.xsi }" var="l">
		 <tr>
				<td>
					${l.sn }
				</td>
				<td>
					<span title="尚都比拉女装2013夏装新款蕾丝连衣裙 韩版修身雪纺打底裙子 春款[白色 M]">${l.name }</span>
				</td>
				<td>
					${l.quantity }
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