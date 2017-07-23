<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title>商城动态 - Powered By SHOP++</title>
	<meta name="author" content="SHOP++ Team" />
	<meta name="copyright" content="SHOP++" />
		<meta name="keywords" content="商城动态" />
		<meta name="description" content="商城动态" />
<link href="${pageContext.request.contextPath }/resources/shop/css/common.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/resources/shop/css/article.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/common.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $articleSearchForm = $("#articleSearchForm");
	var $keyword = $("#articleSearchForm input");
	var $articleForm = $("#articleForm");
	var $pageNumber = $("#pageNumber");
	var defaultKeyword = "文章搜索";
	
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

	$articleSearchForm.submit(function() {
		if ($.trim($keyword.val()) == "" || $keyword.val() == defaultKeyword) {
			return false;
		}
	});
	
	$articleForm.submit(function() {
		if ($pageNumber.val() == "" || $pageNumber.val() == "1") {
			$pageNumber.prop("disabled", true)
		}
	});
	
	$.pageSkip = function(pageNumber) {
		$pageNumber.val(pageNumber);
		$articleForm.submit();
		return false;
	}

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
<%@include file="header.jsp" %>	
<div class="container articleList">
		<div class="span6">
			<div class="hotArticleCategory">
				<div class="title">热点分类</div>
				<c:forEach items="${articleCategory }" var="arti">
						<dl>
							<dt>
								<a href="${pageContext.request.contextPath }/articleByTag.do?id=${arti.id}">${arti.name }</a>
							</dt>
						</dl>
				</c:forEach>
			</div>
			<div class="hotArticle">
				<div class="title">热点文章</div>
				<ul>
						<c:forEach items="${hotArticle }" var="hota" begin="0" end="6">
							<li>
								<a href="${pageContext.request.contextPath }/article.do?id=${hota.id}" title="${hota.title }">${hota.title }</a>
							</li>
						</c:forEach>
				</ul>
			</div>
			<!-- <div class="articleSearch">
				<div class="title">文章搜索</div>
				<div class="content">
					<form id="articleSearchForm" action="/shopxx/article/search.jhtml" method="get">
						<input type="text" name="keyword" value="文章搜索" maxlength="30" />
						<button type="submit">搜&nbsp;&nbsp;索</button>
					</form>
				</div>
			</div> -->
		</div>
		<div class="span18 last">
			<div class="path">
				<ul>
					<li>
						<a href="${pageContext.request.contextPath }/hc/index.do">首页</a>
					</li>
					<li class="last">${articleTag.name }</li>
				</ul>
			</div>
			<form id="articleForm" action="/shopxx/article/list/1.jhtml" method="get">
				<input type="hidden" id="pageNumber" name="pageNumber" value="1" />
				<div class="result"><!-- ${article} -->
						<ul>
						<c:if test="${article!='[]'}">
						<c:forEach items="${article }" var="a">
								<li>
									<a href="" title="${a.title }">${a.title }</a>
									
									<span title="${a.modifyDate }" >${a.modifyDate }</span>
									<p>${a.content }</p>
								</li>
						</c:forEach>
						</c:if>
						<c:if test="${articles!='[]'}">
						<c:forEach items="${articles}" var="a">
								<li>
									<a href="${pageContext.request.contextPath }/article.do?id=${a.id}" title="${a.title }">${a.title }</a>
									
									<span title="${a.modifyDate }" >${a.modifyDate }</span>
									<p>${a.content }</p>
								</li>
						
						</c:forEach>	
						</c:if>		
						</ul>
				</div>
			</form>
		</div>
	</div>
<%@include file="footer.jsp" %>
</body>
</html>