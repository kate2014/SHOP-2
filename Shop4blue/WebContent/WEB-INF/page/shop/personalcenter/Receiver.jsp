<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>收货地址 - Powered By SHOP++</title>
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
	$delete.click(function() {
		if (confirm("您确定要删除吗？")) {
			var $tr = $(this).closest("tr");
			var id = $tr.find("input[name='id']").val();
			$.ajax({
				url: "${pageContext.request.contextPath }/premember/delete",
				type: "POST",
				data: {id: id},
				dataType: "json",
				cache: false,
				success: function(message) {
					$.message(message);
					if (message == "success") {
						var $siblings = $tr.siblings();
						if ($siblings.size() <= 1) {
							$listTable.after('<p>暂无信息<\/p>');
						} else {
							$siblings.last().addClass("last");
						}
						$tr.remove();
						window.location.reload(true);
					}
				}
			});
		}
		return false;
	});

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
				<div class="title">收货地址</div>
				<div class="bar">
					<a href="${pageContext.request.contextPath }/premember/toadd" class="button">添加收货地址</a>
				</div>
				<table id="listTable" class="list">
					<tr>
						<th>
							收货人
						</th>
						<th>
							地址
						</th>
						<th>
							是否默认
						</th>
						<th>
							操作
						</th>
					</tr>
					<c:forEach items="${receivers }" var="receiver" varStatus="v">
						<tr>
							<td>
								<input type="hidden" name="id" value="${receiver.id }" />
								${receiver.consignee }
							</td>
							<td>
								<span title="${receiver.areaName }${receiver.address}">${receiver.areaName }${receiver.address}</span>
							</td>
							<td>
							<c:if test="${receiver.isDefault==true }">是</c:if>
							<c:if test="${receiver.isDefault==false }">否</c:if>
							</td>
							<td>
								<a href="${pageContext.request.contextPath }/premember/toedit?id=${receiver.id}">[编辑]</a>
								<a href="javascript:;" class="delete">[删除]</a>
							</td>
						</tr>
						</c:forEach>
						<!-- <tr class="last">
							<td>
								<input type="hidden" name="id" value="1" />
								ddj
							</td>
							<td>
								<span title="福建省龙岩市新罗区xxx">福建省龙岩市新罗区xxx</span>
							</td>
							<td>
								否
							</td>
							<td>
								<a href="edit.jhtml?id=1">[编辑]</a>
								<a href="javascript:;" class="delete">[删除]</a>
							</td>
						</tr> -->
				</table>
			</div>
		</div>
	</div>
	<%@include file="../footer.jsp" %>
</body>
</html>