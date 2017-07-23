<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>编辑参数 - Shop4blue</title>
<meta name="author" content="SHOP++ Team" />
<meta name="copyright" content="SHOP++" />
<link href="${pageContext.request.contextPath}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/input.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	var $parameterTable = $("#parameterTable");
	var $addParameter = $("#addParameter");
	var $deleteParameter = $("a.deleteParameter");
	var parameterIndex = ${totalNum};
	
	
	// 增加参数
	$addParameter.live("click", function() {
		var $this = $(this);
var trHtml = '<tr class="parameterTr"> <td> &nbsp; <\/td> <td> <input type="text" name="parameters[' + parameterIndex + '].name" class="text parametersName" maxlength="200" \/> <\/td> <td> <input type="text" name="parameters[' + parameterIndex + '].orders" class="text parametersOrder" maxlength="9" style="width: 30px;" \/> <\/td> <td> <a href="javascript:;" class="deleteParameter">[删除]<\/a> <\/td> <\/tr>';		$parameterTable.append(trHtml);
		parameterIndex ++;
	});
	
	// 删除参数
	$deleteParameter.live("click", function() {
		var $this = $(this);
		if ($parameterTable.find("tr.parameterTr").size() <= 1) {
			$.message("warn", "必须至少保留一个参数");
		} else {
			$this.closest("tr").remove();
		}
	});
	
	$.validator.addClassRules({
		parametersName: {
			required: true
		},
		parametersOrder: {
			digits: true
		}
	});
	
	// 表单验证
	$inputForm.validate({
		rules: {
			productCategoryId: "required",
			name: "required",
			order: "digits"
		}
	});

});
</script>
</head>
<body>
	<div class="path">
		<a href="">首页</a> &raquo; 编辑参数
	</div>
	<form id="inputForm" action="${pageContext.request.contextPath }/parameter/change" method="post">
		<input type="hidden" name="id" value="${par.id }" />
		<table id="parameterTable" class="input">
			<tr>
				<th>
					${par.name }:
				</th>
				<td colspan="3">
					<select name="productCategory" >
							<c:forEach items="${cate }" var ="v">
							<option value="${v.id }" >
								${v.name }
							</option>
								<c:forEach items="${v.categorys }" var="vv">
								<c:if test="${vv.id == par.productCategory }">
								<option value="${vv.id }" selected="selected">
											&nbsp;&nbsp;
									${vv.name }
								</option>
								</c:if>
								<c:if test="${vv.id != par.productCategory }">
								<option value="${vv.id }" ">
											&nbsp;&nbsp;
									${vv.name }
								</option>
								</c:if>
								</c:forEach>
							</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>名称:
				</th>
				<td colspan="3">
					<input type="text" name="name" class="text" value="${par.name }" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					排序:
				</th>
				<td colspan="3">
					<input type="text" name="orders" class="text" value="${par.orders }" maxlength="9" />
				</td>
			</tr>
			<tr>
				<td>
					&nbsp;
				</td>
				<td colspan="3">
					<a href="javascript:;" id="addParameter" class="button">增加参数</a>
				</td>
			</tr>
			<tr class="title">
				<td>
					&nbsp;
				</td>
				<td>
					名称
				</td>
				<td>
					排序
				</td>
				<td>
					删除
				</td>
			</tr>
				<c:forEach items="${par.parameters }" var="p">
				<tr class="parameterTr">
					<td>
						<input type="hidden" name="parameters[0].id" class="text parametersName" value="${p.id }" />
					</td>
					<td>
						<input type="text" name="parameters[0].name" class="text parametersName" value="${p.name }" maxlength="200" />
					</td>
					<td>
						<input type="text" name="parameters[0].orders" class="text parametersOrder" value="${p.orders }" maxlength="9" style="width: 30px;" />
					</td>
					<td>
						<a href="javascript:;" class="deleteParameter">[删除]</a>
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