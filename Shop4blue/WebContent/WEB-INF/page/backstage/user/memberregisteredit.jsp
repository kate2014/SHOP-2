<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>编辑会员注册项 - Powered By SHOP++</title>
<meta name="author" content="SHOP++ Team" />
<meta name="copyright" content="SHOP++" />
<link href="${pageContext.request.contextPath}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/jquery.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/jquery.validate.js"></script> --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/input.js"></script>
<script type="text/javascript">

$().ready(function() {
	var $inputForm = $("#inputForm");
	var $memberAttributeTable = $("#memberAttributeTable");
	var $addOptionButton = $("#addOptionButton");
	var $deleteOption = $("a.deleteOption");
	
	
	// 增加选项内容
	$addOptionButton.click(function() {
		addOption();
	});
		
	// 删除选项内容
	$deleteOption.live("click", function() {
		if ($memberAttributeTable.find("tr.optionTr").size() <= 1) {
			$.message("warn", "删除失败，必须至少保留一项");
		} else {
			$(this).closest("tr").remove();
		}
	});
	
	// 增加选项内容
	function addOption() {
       var trHtml = '<tr class="optionTr"> <th>可选项:<\/th> <td> <input type="text" name="options" class="text options" maxlength="200" \/> <a href="javascript:;" class="deleteOption">[删除]<\/a> <\/td> <\/tr>';		$memberAttributeTable.append(trHtml);
	}
	
	$.validator.addClassRules({
		options: {
			required: true
		}
	});
	
	// 表单验证
	$inputForm.validate({
		rules: {
			type: "required",
			name: "required",
			order: "digits"
		}
	});
	
	

});


</script>
</head>
<body>
	<div class="path">
		<a href="">首页</a> &raquo; 编辑会员注册项
	</div>
	<form id="inputForm" action="${pageContext.request.contextPath}/memberr/updateedit?id=${xma.id }" method="post">
		<input type="hidden" name="id" value="1" />
		<table id="memberAttributeTable" class="input">
			<tr>
				<th>
					类型:
				</th>
				<td>
				<c:if test="${xma.type==0 }">文本</c:if>
				<c:if test="${xma.type==1 }">单选项</c:if>
				<c:if test="${xma.type==2 }">多选项</c:if>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>名称:
				</th>
				<td>
					<input type="text" name="name" class="text" value="${xma.name }" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					排序:
				</th>
				<td>
					<input type="text" name="orders" class="text" value="${xma.orders }" maxlength="9" />
				</td>
			</tr>
			<tr>
				<th>
					设置:
				</th>
				<td>
					<label>
					   <c:if test="${xma.isEnabled=='true' }"> 
						<input type="checkbox" id="isEnabled" name="isEnabled" value="true" checked="checked" />是否启用
						</c:if>
						<c:if test="${xma.isEnabled=='false' }"> 
						<input type="checkbox"  id="isEnabled" name="isEnabled" value="true"  />是否启用
						</c:if>
						<!-- <input type="hidden" name="_isEnabled" value="false" /> -->
					</label>
					<label>
					<c:if test="${xma.isRequired=='true' }"> 
						<input type="checkbox" id="isRequired" name="isRequired" value="true" checked="checked"/>是否必填
						</c:if>
						<c:if test="${xma.isRequired=='false' }"> 
						<input type="checkbox" id="isRequired" name="isRequired" value="true" />是否必填
						</c:if>
						<!-- <input type="hidden" name="_isRequired" value="false" /> -->
					</label>
				</td>
			</tr>
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