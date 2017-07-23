<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>编辑属性 - Powered By SHOP++</title>
<meta name="author" content="SHOP++ Team" />
<meta name="copyright" content="SHOP++" />
<link href="/shopxx/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/shopxx/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="/shopxx/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="/shopxx/resources/admin/js/common.js"></script>
<script type="text/javascript" src="/shopxx/resources/admin/js/input.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	var $attributeTable = $("#attributeTable");
	var $addOption = $("#addOption");
	var $deleteOption = $("a.deleteOption");
	
	
	// 增加可选项
	$addOption.live("click", function() {
		var $this = $(this);
var trHtml = '<tr class="optionTr"> <td> &nbsp; <\/td> <td> <input type="text" name="options" class="text" maxlength="200" \/> <\/td> <td> <a href="javascript:;" class="deleteOption">[删除]<\/a> <\/td> <\/tr>';		$attributeTable.append(trHtml);
	});
	
	// 删除可选项
	$deleteOption.live("click", function() {
		var $this = $(this);
		if ($attributeTable.find("tr.optionTr").size() <= 1) {
			$.message("warn", "必须至少保留一个可选项");
		} else {
			/* var options=$this.closest("tr").find("input").val();
			var attribute=$("#attribute").val();
			alert(options)
			$.post("${pageContext.request.contextPath}/spsx/deleteOptions",{"attribute":attribute,"options":options},function(data){
				alert(data);
			}) */
			$this.closest("tr").remove();
		}
	});
	
	// 表单验证
	$inputForm.validate({
		rules: {
			productCategoryId: "required",
			name: "required",
			order: "digits",
			options: "required"
		}
	});

});
</script>
</head>
<body>
	<div class="path">
		<a href="/shopxx/admin/common/index.jhtml">首页</a> &raquo; 编辑属性
	</div>
	<form id="inputForm" action="${pageContext.request.contextPath}/spsx/editOptions" method="post">
		<input type="hidden" name="id" value="${attr.id}" />
		<table id="attributeTable" class="input">
			<tr>
				<th>
					绑定分类:
				</th>
				<td colspan="2">
					${attr.xxProductCategory.name}
					<input type="hidden" name="productCategory" value="${attr.productCategory}">
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>名称:
				</th>
				<td colspan="2">
					<input type="text" name="name" class="text" value="${attr.name}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					排序:
				</th>
				<td colspan="2">
					<input type="text" name="orders" class="text" value="${attr.orders}" maxlength="9" />
				</td>
			</tr>
			<tr>
				<td>
					&nbsp;
				</td>
				<td colspan="2">
					<a href="javascript:;" id="addOption" class="button">增加可选项</a>
				</td>
			</tr>
			<tr class="title">
				<td>
					&nbsp;
				</td>
				<td>
					可选项
				</td>
				<td>
					删除
				</td>
			</tr>
			<c:forEach items="${attr.xxAttributeOptions}" var="a">
				<tr class="optionTr">
					<td>
						&nbsp;
					</td>
					<td>
						<input type="text" name="options" class="text" value="${a.options}" maxlength="200" />
					</td>
					<td>
						<a href="javascript:;" class="deleteOption">[删除]</a>
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
					<input type="submit" class="button" value="确&nbsp;&nbsp;定" />
					<input type="button" id="backButton" class="button" value="返&nbsp;&nbsp;回" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>