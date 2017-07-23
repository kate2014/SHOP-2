<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>添加会员等级 - Powered By SHOP++</title>
<meta name="author" content="SHOP++ Team" />
<meta name="copyright" content="SHOP++" />
	<link href="${pageContext.request.contextPath}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/jquery.tools.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/jquery.validate.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/common.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/input.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/jquery.lSelect.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	var $areaId = $("#areaId");
	
	
	// 地区选择
	$areaId.lSelect({
		url: "${pageContext.request.contextPath}/area/area"
	});

	// 表单验证
	$inputForm.validate({
		rules: {
			name: "required",
			contact: "required",
			areaId: "required",
			address: "required"
		}
	});

});
</script>
</head>
<body>
	<div class="path">
		<a href="/shopxx/admin/common/index.jhtml">首页</a> &raquo; 添加发货点
	</div>
	<form id="inputForm" action="${pageContext.request.contextPath}/deliveryManage/getuser" method="post">
		<table class="input">
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
					<span class="requiredField">*</span>联系人:
				</th>
				<td>
					<input type="text" name="contact" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>地区:
				</th>
				<td>
					<span class="fieldSet">
						<input type="hidden" id="areaId" name="area" />
					</span>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>地址:
				</th>
				<td >
					<input type="text" name="address" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					邮编:
				</th>
				<td >
					<input type="text" name="zipCode" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					电话:
				</th>
				<td>
					<input type="text" name="phone" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					手机:
				</th>
				<td>
					<input type="text" name="mobile" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					是否默认:
				</th>
				<td>
					<input type="checkbox" name="isDefault" />
					<input type="hidden" name="_isDefault" value="false" />
				</td>
			</tr>
			<tr>
				<th>
					备注
				</th>
				<td>
					<input type="text" name="memo" class="text" maxlength="200" />
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