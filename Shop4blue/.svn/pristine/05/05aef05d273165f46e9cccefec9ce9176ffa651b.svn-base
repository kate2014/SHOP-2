<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>添加会员注册项 - Powered By SHOP++</title>
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
	var $type = $("#type");
	var $addOptionTr = $("#addOptionTr");
	var $addOptionButton = $("#addOptionButton");
	var $deleteOption = $("a.deleteOption");
	
	
	// 显示/隐藏“增加选项”按钮
	$type.change(function() {
		if ($type.val() == "select" || $type.val() == "checkbox") {
			$memberAttributeTable.find("tr.optionTr").remove();
			$addOptionTr.show();
			addOption();
		} else {
			$addOptionTr.hide();
			$memberAttributeTable.find("tr.optionTr").remove();
		}
	});
	
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
		<a href="">首页</a> &raquo; 添加会员注册项
	</div>
	<form id="inputForm" action="${pageContext.request.contextPath}/memberr/insertdate"  method="post">
		<table id="memberAttributeTable" class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>名称:
				</th>
				<td>
					<input type="text" name="name" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					类型:
				</th>
				<td>
					<select id="type" name="type1">
						<option value="text">文本</option>
						<option value="select">单选项</option>
						<option value="checkbox">多选项</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					排序:
				</th>
				<td>
					<input type="text" name="orders" class="text" maxlength="9" />
				</td>
			</tr>
			<tr>
				<th>
					设置:
				</th>
				<td>
					<label>
						<input type="checkbox" id="isEnabled" name="isEnabled" value="true"  />是否启用
						<!-- <input type="hidden" name="_isEnabled" value="false" /> -->
					</label>
					<label>
						<input type="checkbox" id="isRequired" name="isRequired" value="true"  />是否必填
						<!-- <input type="hidden" name="_isRequired" value="false" /> -->
					</label>
				</td>
			</tr>
			<tr id="addOptionTr" class="hidden">
				<th>
					&nbsp;
				</th>
				<td>
					<a href="javascript:;" id="addOptionButton" class="button">添加</a>
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