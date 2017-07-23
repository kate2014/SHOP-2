<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>编辑评论 - Powered By SHOP++</title>
<meta name="author" content="SHOP++ Team" />
<meta name="copyright" content="SHOP++" />
<link href="${pageContext.request.contextPath}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/input.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	
	if($(".isShow:checked")){
		$(this).val("true");
	}
	if($(".isShow:unchecked")){
		$(this).val("false");
	}
	
	
});
</script>
</head>
<body>
	<div class="path">
		<a href="">首页</a> &raquo; 编辑评论
	</div>
	<form id="inputForm" action="commentediter" method="post">
		<table class="input">
			<tr>
				<th>
					商品:
				</th>
				<td>
					<a href="/shopxx/product/content/201705/150.html" target="_blank">${xxProduct.fullName}</a>
					<input type="hidden" name="id" value="${xxReview.id}">
				</td>
			</tr>
			<tr>
				<th>
					会员:
				</th>
				<td>
						${xxReview.member}
				</td>
			</tr>
			<tr>
				<th>
					IP:
				</th>
				<td>
					${xxReview.ip}
				</td>
			</tr>
			<tr>
				<th>
					评分:
				</th>
				<td>
					${xxReview.score}
				</td>
			</tr>
			<tr>
				<th>
					内容:
				</th>
				<td>
					${xxReview.content}
				</td>
			</tr>
			<tr>
				<th>
					是否显示:
				</th>
				<td>
					<c:if test="${xxReview.isShow=='true'}">
						<input type="checkbox" name="isShow" value="true" checked="checked" />
					</c:if>
					<c:if test="${xxReview.isShow=='false'}">
						<input type="checkbox" name="isShow" value="false"/>
					</c:if>
				</td>
			</tr>
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