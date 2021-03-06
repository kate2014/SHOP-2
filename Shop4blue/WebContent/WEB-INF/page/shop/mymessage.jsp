<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="itcast" uri="http://itcast.cn/common/" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/shop/css/common.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/shop/css/member.css"/>
     <script type="text/javascript" src="${pageContext.request.contextPath}/resources/shop/js/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/shop/js/common.js"></script>
   <script type="text/javascript">
$().ready(function() {

	var $listTable = $("#listTable");
	var $delete = $("#listTable a.delete");
	var $pageTotal = $("#pageTotal");
	
	// 删除
	$delete.click(function() {
		if (confirm("您确定要删除吗？")) {
			var $tr = $(this).closest("tr");
			var id = $tr.find("input[name='id']").val();
			$.ajax({
				url: "${pageContext.request.contextPath}/sendMessage/delete",
				type: "POST",
				data: {id: id},
				dataType: "json",
				cache: false,
				success: function(message) {
					$.message(message);
					if (message== "success") {
						var $siblings = $tr.siblings();
						if ($siblings.size() <= 1) {
							$listTable.after('<p>暂无信息<\/p>');
						} else {
							$siblings.last().addClass("last");
						}
						$pageTotal.text(parseInt($pageTotal.text()) - 1);
						$tr.remove();
					}
				}
			});
		}
		return false;
	});

});	
</script>
</head>
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
<body>
<%@include file="header.jsp" %>
	<div class="container member">
<%@include file="left.jsp" %> 
<div class="span18 last">
			<div class="list">
				<div class="title">我的消息 <span>(共<span id="pageTotal">${totalSize }</span>条)</span></div>
				<table id="listTable" class="list">
					<tr>
						<th> 
							标题
						</th>
						<th>
							对方
						</th>
						<th>
							新消息
						</th>
						<th>
							创建日期
						</th>
						<th>
							操作
						</th>
					</tr>
						<c:forEach items="${list}" var="l">
						<tr>
							<td>
								<input type="hidden" name="id" value="${l.id}" />
								<span title="${l.title}"  >${l.title}</span>
							</td>
							<td>
							      ${l.username}
							</td>
							<td>
				            <c:if test="${l.senderRead=='true'}">
				            新消息
				            </c:if>
				            <c:if test="${l.senderRead=='false'}">
				            -
				            </c:if>
							</td>
							<td>
								<span title="<fmt:formatDate value="${l.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>" ><fmt:formatDate value="${l.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
							</td>
							<td>
								<a href="${pageContext.request.contextPath}/sendMessage/check/${l.id}">[查看]</a>
								<a href="javascript:;" class="delete">[删除]</a>
							</td>
						</tr>
						</c:forEach> 
				</table>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>