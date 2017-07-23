<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>查看退款单 - Powered By SHOP++</title>
<meta name="author" content="SHOP++ Team" />
<meta name="copyright" content="SHOP++" />
<link href="${pageContext.request.contextPath}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/input.js"></script>
<script type="text/javascript">
$().ready(function() {
	
	
});
</script>
</head>
<body>
	<div class="path">
		<a href="${pageContext.request.contextPath}/admin/common/index.jhtml">首页</a> &raquo; 查看退款单
	</div>
	<table class="input">
		<tr><!--
			<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2"> ${l.price } </fmt:formatNumber>
			<fmt:formatDate value="${xp.paymentDate }" pattern="yyyy-MM-dd"/>
			  -->
			<th>
				编号:
			</th>
			<td>
				${xr.sn }
			</td>
			<th>
				创建日期:
			</th>
			<td>
				<fmt:formatDate value="${xr.createDate }" pattern="yyyy-MM-dd"/>
			</td>
		</tr>
		<tr>
			<th>
				方式:
			</th>
			<td>
				${xr.method }
			</td>
			<th>
				支付方式:
			</th>
			<td>
				${xr.paymentMethod }
			</td>
		</tr>
		<tr>
			<th>
				退款银行:
			</th>
			<td>
				${xr.amount }
			</td>
			<th>
				退款账号:
			</th>
			<td>
				${xr.account }
			</td>
		</tr>
		<tr>
			<th>
				收款人:
			</th>
			<td>
				${xr.payee }
			</td>
			<th>
				退款金额:
			</th>
			<td>
			<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2"> ${xr.amount } </fmt:formatNumber>
				
			</td>
		</tr>
		<tr>
			<th>
				订单:
			</th>
			<td>
				${xr.orders }
			</td>
			<th>
				操作员:
			</th>
			<td>
				${xr.operator }
			</td>
		</tr>
		<tr>
			<th>
				备注:
			</th>
			<td colspan="3">
				${xr.memo }
			</td>
		</tr>
		<tr>
			<th>
				&nbsp;
			</th>
			<td colspan="3">
				<input type="button" id="backButton" class="button" value="返&nbsp;&nbsp;回" />
			</td>
		</tr>
	</table>
</body>
</html>