<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑商品分类 - Powered By SHOP++</title>
<meta name="author" content="SHOP++ Team" />
<meta name="copyright" content="SHOP++" />
<link href="${pageContext.request.contextPath}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/jquery.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/jquery.validate.js"></script> --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/input.js"></script>
<style type="text/css">
.brands label {
	width: 150px;
	display: block;
	float: left;
	padding-right: 6px;
}
</style>
<script type="text/javascript">

    $(function(){
    	
 		var a=${brands}
 		$.each(a,function(i){
 			$("label > input[id='"+a[i]+"']").attr("checked","checked")
 		})
    	
    })
$().ready(function() {


	var $inputForm = $("#inputForm");
	

	// 表单验证
	$inputForm.validate({
		rules: {
			name: "required",
			order: "digits"
		}
	});
	
});
</script>
</head>
<body>
	<div class="path">
		<a href="">首页</a> &raquo; 编辑商品分类
	</div>
	<form id="inputForm" action="${pageContext.request.contextPath}/category/updateedit?id=${xpc.id}" method="post">
		<input type="hidden" name="id" value="1" />
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>名称:
				</th>
				<td>
					<input type="text" id="name" name="name" class="text" value="${xpc.name }" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					上级分类:
				</th>
				<td>
					<select name="parentId">
					<c:if test="${xpc.parent==null }">
						<option value="0" selected="selected">顶级分类</option>
						</c:if>
						<c:if test="${xpc.parent!=null }">
						<option value="0" >顶级分类</option>
						</c:if>
					    <c:forEach  items="${xpcs}" var="x">
					    <c:if test="${x.id==xpc.parent }">
							<option value="${x.id}" selected="selected">
								${x.name }
							</option>
							</c:if>
							<c:if test="${x.id!=xpc.parent }">
							<option value="${x.id}" >
								${x.name }
							</option>
							</c:if>
			            </c:forEach>
								
					</select>
				</td>
			</tr>
			<tr class="brands">
				<th>
					筛选品牌:
				</th>
				<td>
				<c:forEach items="${xb}" var="c" >
						<label>
						  <input type="checkbox" name="brandIds" id="${c.id }" value="${c.id }"/>${c.name }
						</label>
						
				</c:forEach>
				
						
				</td>
			</tr>
			<tr>
				<th>
					页面标题:
				</th>
				<td>
					<input type="text" name="seoTitle" class="text" value="${xpc.seoTitle }" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					页面关键词:
				</th>
				<td>
					<input type="text" name="seoKeywords" class="text" value="${xpc.seoKeywords }" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					页面描述:
				</th>
				<td>
					<input type="text" name="seoDescription" class="text" value="${xpc.seoDescription }" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					排序:
				</th>
				<td>
					<input type="text" name="orders" class="text" value="${xpc.orders }" maxlength="9" />
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