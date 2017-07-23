<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>商品评论 - Powered By SHOP++</title>
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
				<div class="title">商品评论</div>
				<table class="list">
					<tr>
						<th>
							商品图片
						</th>
						<th>
							商品
						</th>
						<th>
							评分
						</th>
						<th>
							创建日期
						</th>
					</tr>
					<c:forEach items="${list}" var="a">
						<tr>
							<td>
								<input type="hidden" name="id" value="${a.id}" />
								<img src="${a.xxProduct.image}" class="thumbnail" alt="${a.xxProduct.name}" />
							</td>
							<td>
								<a href="${pageContext.request.contextPath}/shopContent/shop?id=${a.xxProduct.id} "title="${a.xxProduct.name}" target="_blank">${a.xxProduct.name}</a>
							</td>
							<td>
								${a.score}
							</td>
							<td>
								<span ><fmt:formatDate value="${a.createDate}" pattern="yyyy-MM-dd hh:mm:ss" /></span>
							</td>
						</tr>
					</c:forEach>
				</table>
				<c:if test="${list==null}">
					<p>暂无信息</p>
				</c:if>
			</div>
		</div>
	</div>
<%@include file="../footer.jsp" %>
</body>
</html>