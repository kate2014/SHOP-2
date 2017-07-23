<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>添加规格 - Powered By SHOP++</title>
<meta name="author" content="SHOP++ Team" />
<meta name="copyright" content="SHOP++" />
<link href="${pageContext.request.contextPath}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/jquery.event.drag.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/input.js"></script>
<script type="text/javascript">
$().ready(function() {
	var $inputForm = $("#inputForm");
	var $specificationTable = $("#specificationTable");
	var $type = $("#type");
	var $addSpecificationValueButton = $("#addSpecificationValueButton");
	var $deleteSpecificationValue = $("a.deleteSpecificationValue");
	var specificationValueIndex = 1;
	
/* 	$("input[type='file']").change(function(){
		var formData=new FormData($("#inputForm")[0]);
		alert("haha");
		$.ajax({
			url:"${pageContext.request.contextPath}/gggl/saveImg",
			type:"post",
			data:formDate,
			async:false,
			cache:false,
			processData:false,
			contentType:false,
			success:function(data){
				  // $("#container").css({background:"url("+data+")"});
				   alert(data);
				   $("input.specificationValuesImage").attr("value","/pic/"+data);
			   }
		})
	}) */
	
	// 修改规格类型
	$type.change(function() {
		if ($(this).val() == "0") {
			$("input.specificationValuesImage").val("").attr("disabled", true);
			//$("input.browserButton").prop("disabled", true);
			$("input[type='file']").attr("disabled",true);
		} else {
			$("input.specificationValuesImage").attr("disabled", false);
			//$("input.browserButton").prop("disabled", false);
			$("input[type='file']").attr("disabled",false);
		}
	});
	
/* 	$("input.browserButton").browser(); */
	
	// 增加规格值
	$addSpecificationValueButton.click(function() {
		if ($type.val() == "0") {
var trHtml = '<tr class="specificationValueTr"> <td> &nbsp; <\/td> <td> <input type="text" name="xxSpecificationValue[' + specificationValueIndex + '].name" maxlength="200" class="text specificationValuesName" \/> <\/td> <span class="fieldSet"><td> <input type="text" name="xxSpecificationValue[' + specificationValueIndex + '].image" class="text specificationValuesImage" maxlength="200" disabled="disabled" > <input type="file" name="file" class="text specificationValuesImage" maxlength="200" disabled="disabled" > <td> </span><input type="text" name="xxSpecificationValue[' + specificationValueIndex + '].orders" maxlength="9" class="text specificationValuesOrder" style="width: 30px;" \/> <\/td> <td> <a href="javascript:;" class="deleteSpecificationValue">[删除]<\/a> <\/td> <\/tr>';		} else {
var trHtml = '<tr class="specificationValueTr"> <td> &nbsp; <\/td> <td> <input type="text" name="xxSpecificationValue[' + specificationValueIndex + '].name" maxlength="200" class="text specificationValuesName" \/> <\/td> <span class="fieldSet"><td> <input type="text" name="xxSpecificationValue[' + specificationValueIndex + '].image" class="text specificationValuesImage" maxlength="200"> <input type="file" name="file" class="text specificationValuesImage" maxlength="200"> <td> </span> <input type="text" name="xxSpecificationValue[' + specificationValueIndex + '].orders" maxlength="9" class="text specificationValuesOrder" style="width: 30px;" \/> <\/td> <td> <a href="javascript:;" class="deleteSpecificationValue">[删除]<\/a> <\/td> <\/tr>';		}
		$specificationTable.append(trHtml);
		$("input[name='file']").each(function(){
			$(this).change(function(){
				   //formdata对象，用来模拟表单 只对文件进行处理 
				   var formData=new FormData($("#inputForm")[0]);
				   $.ajax({
					   url:"${pageContext.request.contextPath}/gggl/saveImg?value="+Math.random(),
					   type:"post",
					   data:formData,
					   //请求是否异步
					   async:false,
					   cache:false,
					   //FormData值是FormData对象 不需要做数据的处理
					   processData:false,
					   //enctype="multipart/form-data"
					   contentType:false,
					   //请求成功 将数据返回给页面
					   success:function(data){
						   alert(data);
						   $(this).parent().find("input[class='text specificationValuesImage']").attr("value","/pic/"+data);
					   }
				   })
			   })
		})
		specificationValueIndex ++;
	});
	
	// 删除规格值
	$deleteSpecificationValue.live("click", function() {
		var $this = $(this);
		if ($specificationTable.find("tr.specificationValueTr").size() <= 1) {
			$.message("warn", "必须至少保留一个规格值");
		} else {
			$this.closest("tr").remove();
		}
	});
	
	$.validator.addClassRules({
		specificationValuesName: {
			required: true
		},
		specificationValuesImage: {
			required: true
		},
		specificationValuesOrder: {
			digits: true
		}
	});
	
	// 表单验证
	$inputForm.validate({
		rules: {
			name: "required",
			order: "digits"
		}
	});

});
</script>
<script type="text/javascript">
$(function(){
	$("input[name='file']").each(function(){
		$(this).change(function(){
			   //formdata对象，用来模拟表单 只对文件进行处理 
			   var formData=new FormData($("#inputForm")[0]);
			   $.ajax({
				   url:"${pageContext.request.contextPath}/gggl/saveImg?value="+Math.random(),
				   type:"post",
				   data:formData,
				   //请求是否异步
				   async:false,
				   cache:false,
				   //FormData值是FormData对象 不需要做数据的处理
				   processData:false,
				   //enctype="multipart/form-data"
				   contentType:false,
				   //请求成功 将数据返回给页面
				   success:function(data){
					   alert(data);
					$(this).parent().find("input[class='text specificationValuesImage']").attr("value","/pic/"+data);
				   }
			   })
		   })
	})
	/* $("input[name='file']").change(function(){
		   //formdata对象，用来模拟表单 只对文件进行处理 
		   var formData=new FormData($("#inputForm")[0]);
		   $.ajax({
			   url:"${pageContext.request.contextPath}/gggl/saveImg",
			   type:"post",
			   data:formData,
			   //请求是否异步
			   async:false,
			   cache:false,
			   //FormData值是FormData对象 不需要做数据的处理
			   processData:false,
			   //enctype="multipart/form-data"
			   contentType:false,
			   //请求成功 将数据返回给页面
			   success:function(data){
				   alert(data);
				   $("input.specificationValuesImage").attr("value","/pic/"+data);
			   }
		   })
	   }) */
})
</script>
</head>
<body>
	<div class="path">
		<a href="/shopxx/admin/common/index.jhtml">首页</a> &raquo; 添加规格
	</div>
	<form id="inputForm" action="${pageContext.request.contextPath}/gggl/addGggl" method="post" enctype="multipart/form-data">
		<table id="specificationTable" class="input">
			<tr class="titleTr">
				<th>
					<span class="requiredField">*</span>名称:
				</th>
				<td colspan="4">
					<input type="text" name="name" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					类型:
				</th>
				<td colspan="4">
					<select id="type" name="type">
							<option value="0">文本</option>
							<option value="1">图片</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					备注:
				</th>
				<td colspan="4">
					<input type="text" name="memo" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					排序:
				</th>
				<td colspan="4">
					<input type="text" name="orders" class="text" maxlength="9" />
				</td>
			</tr>
			<tr>
				<td>
					&nbsp;
				</td>
				<td colspan="4">
					<a href="javascript:;" id="addSpecificationValueButton" class="button">增加规格值</a>
				</td>
			</tr>
			<tr class="title">
				<td>
					&nbsp;
				</td>
				<td>
					规格值名称
				</td>
				<td>
					规格值图片
				</td>
				<td>
					规格值排序
				</td>
				<td>
					删除
				</td>
			</tr>
			<tr class="specificationValueTr">
				<td>
					&nbsp;
				</td>
				<td>
					<input type="text" name="xxSpecificationValue[0].name" class="text specificationValuesName" maxlength="200" />
				</td>
				<td>
					<span class="fieldSet">
						<!-- <input type="text" name="specificationValues[0].image" class="text specificationValuesImage" maxlength="200" disabled="disabled" />
						<input type="button" class="button browserButton" value="选择文件" disabled="disabled" /> -->
						<input type="text" name="xxSpecificationValue[0].image" class="text specificationValuesImage" maxlength="200" disabled="disabled" >
						<input type="file" name="file" class="text specificationValuesImage" maxlength="200" disabled="disabled" >
					</span>
				</td>
				<td>
					<input type="text" name="xxSpecificationValue[0].orders" class="text specificationValuesOrder" maxlength="9" style="width: 30px;" />
				</td>
				<td>
					<a href="javascript:;" class="deleteSpecificationValue">[删除]</a>
				</td>
			</tr>
		</table>
		<table class="input">
			<tr>
				<th>
					&nbsp;
				</th>
				<td colspan="4">
					<input type="submit" class="button" value="确&nbsp;&nbsp;定" />
					<input type="button" id="backButton" class="button" value="返&nbsp;&nbsp;回" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>