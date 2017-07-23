<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<title>到货通知 - Powered By SHOP++</title>
<meta name="author" content="SHOP++ Team" />
<meta name="copyright" content="SHOP++" />
<link href="${pageContext.request.contextPath }/resources/shop/css/common.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/resources/shop/css/member.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/common.js"></script>
<script type="text/javascript">
$().ready(function() {
	
	var $listTable = $("#listTable");
	var $delete = $("#listTable a.delete");
	

	// 删除
	/* $delete.click(function() {
		if (confirm("您确定要删除吗？")) {
			var $tr = $(this).closest("tr");
			var id = $tr.find("input[name='id']").val();
			$.ajax({
				url: "delete.jhtml",
				type: "POST",
				data: {id: id},
				dataType: "json",
				cache: false,
				success: function(message) {
					$.message(message);
					if (message.type == "success") {
						var $siblings = $tr.siblings();
						if ($siblings.size() <= 1) {
							$listTable.after('<p>暂无信息<\/p>');
						} else {
							$siblings.last().addClass("last");
						}
						$tr.remove();
					}
				}
			});
		}
		return false;
	}); */
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
				<div class="title">到货通知</div>
				<table id="listTable" class="list">
					<tr>
						<th>
							商品图片
						</th>
						<th>
							商品名称
						</th>
						<th>
							商品价格
						</th>
						<th>
							登记E-mail
						</th>
						<th>
							操作
						</th>
					</tr>
					<c:forEach items="${list }" var="l">
						<tr class="last">
							<td>
								<input type="hidden" name="id" value="4" />
								<img src="${l.xproduct.image }" class="thumbnail" alt="尚都比拉女装2013夏装新款蕾丝连衣裙 韩版修身雪纺打底裙子 春款" />
							</td>
							<td>
								<a href="${pageContext.request.contextPath }/shopContent/shop?id=${l.product}" title="" target="_blank">${l.xproduct.name }</a>
							</td>
							<td>
								￥<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${l.xproduct.price }"></fmt:formatNumber>
								
							</td>
							<td>
								${l.email }
							</td>
							<td>
								<a href="${pageContext.request.contextPath }/wbmessage/deleteone?id=${l.id}" class="delete">[删除]</a>
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