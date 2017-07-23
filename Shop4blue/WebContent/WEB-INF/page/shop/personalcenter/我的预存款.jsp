<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>我的预存款 - Powered By SHOP++</title>
<meta name="author" content="SHOP++ Team" />
<meta name="copyright" content="SHOP++" />
<link href="${pageContext.request.contextPath }/resources/shop/css/common.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/resources/shop/css/member.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/common.js"></script>
<script type="text/javascript">
$().ready(function() {
	

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
			<div class="list">
				<div class="title">我的预存款</div>
				<table class="list">
					<tr>
						<th>
							类型
						</th>
						<th>
							收入金额
						</th>
						<th>
							支出金额
						</th>
						<th>
							当前余额
						</th>
						<th>
							创建日期
						</th>
					</tr>
					<c:forEach items="${list}" var="a" varStatus="stat">
						<c:if test="${!stat.last}">
							<tr>
								<td>
									<c:if test="${a.type==0}">
										会员充值
									</c:if>
									<c:if test="${a.type==1}">
										会员支付
									</c:if>
									<c:if test="${a.type==2}">
										后台充值
									</c:if>
									<c:if test="${a.type==3}">
										后台扣费
									</c:if>
									<c:if test="${a.type==4}">
										后台支付
									</c:if>
									<c:if test="${a.type==5}">
										后台退款
									</c:if>
								</td>
								<td>
									<fmt:formatNumber type="number" value="${a.credit}" maxFractionDigits="2"/> 
								</td>
								<td>
									<fmt:formatNumber type="number" value="${a.debit}" maxFractionDigits="2"/>
								</td>
								<td>
									<fmt:formatNumber type="number" value="${a.balance}" maxFractionDigits="2"/>
								</td>
								<td>
									<span ><fmt:formatDate value="${a.createDate}" pattern="yyyy-MM-dd"/></span>
								</td>
							</tr>
						</c:if>
						<c:if test="${stat.last}">
							<tr class="last">
								<td>
									<c:if test="${a.type==0}">
										会员充值
									</c:if>
									<c:if test="${a.type==1}">
										会员支付
									</c:if>
									<c:if test="${a.type==2}">
										后台充值
									</c:if>
									<c:if test="${a.type==3}">
										后台扣费
									</c:if>
									<c:if test="${a.type==4}">
										后台支付
									</c:if>
									<c:if test="${a.type==5}">
										后台退款
									</c:if>
								</td>
								<td>
									<fmt:formatNumber type="number" value="${a.credit}" maxFractionDigits="2"/> 
								</td>
								<td>
									<fmt:formatNumber type="number" value="${a.debit}" maxFractionDigits="2"/>
								</td>
								<td>
									<fmt:formatNumber type="number" value="${a.balance}" maxFractionDigits="2"/>
								</td>
								<td>
									<fmt:formatDate value="${a.createDate}" pattern="yyyy-MM-dd"/>
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
<%@include file="../footer.jsp" %>
</body>
</html>