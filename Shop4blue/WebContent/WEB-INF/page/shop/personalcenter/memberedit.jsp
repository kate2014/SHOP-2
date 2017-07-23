<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>个人资料 - Powered By SHOP++</title>
<meta name="author" content="SHOP++ Team" />
<meta name="copyright" content="SHOP++" />
<link href="${pageContext.request.contextPath }/resources/shop/css/common.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/resources/shop/css/member.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/datePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/jquery.lSelect.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	var $areaId = $("#areaId");
	
	
	// 地区选择
	$areaId.lSelect({
		url: "${pageContext.request.contextPath }/area/area"
	});
	
	// 表单验证
	/* $inputForm.validate({
		rules: {
			email: {
				required: true,
				email: true
					,remote: {
						url: "check_email.jhtml",
						cache: false
					}
			}
					,memberAttribute_1: {
						required: true
					}
		}
			,messages: {
				email: {
					remote: "已存在"
				}
			}
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
			<div class="input">
				<div class="title">个人资料</div>
				<form id="inputForm" action="${pageContext.request.contextPath }/pandu/updatep?userid=${user.id}" method="post">
					<table class="input">
						<tr>
							<th>
								<span class="requiredField">*</span>E-mail:
							</th>
							<td>
								<input type="text" name="email" class="text" value="${xxMember.email }" maxlength="200" />
							</td>
						</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>姓名:
								</th>
								<td>
										<input type="text" name="memberAttribute_1" class="text" value="${xxMember.name }" maxlength="200" />
								</td>
							</tr>
							<tr>
								<th>
									性别:
								</th>
								<td>
										<span class="fieldSet">
										<c:if test="${xxMember.gender==1 }">
												<label>
													<input type="radio" name="memberAttribute_2" value="1" checked="checked" />男
												</label>
												</c:if>
												<c:if test="${xxMember.gender!=1 }">
												<label>
													<input type="radio" name="memberAttribute_2" value="1"  />男
												</label>
												</c:if>
												<c:if test="${xxMember.gender==0 }">
												<label>
													<input type="radio" name="memberAttribute_2" value="0" checked="checked"/>女
												</label>
												</c:if>
												<c:if test="${xxMember.gender!=0 }">
												<label>
													<input type="radio" name="memberAttribute_2" value="0" />女
												</label>
												</c:if>
										</span>
								</td>
							</tr>
							<tr>
								<th>
							出生日期:
						</th>
						<td>
								<input type="text" name="memberAttribute_3" class="text Wdate" value="<fmt:formatDate value="${xxMember.birth }" pattern="yyyy-MM-dd"/>" onfocus="WdatePicker();" />
						</td>
					</tr>
					<tr>
						<th>
							地区:
						</th>
						<td>
								<span class="fieldSet">
									<input type="hidden" id="areaId" name="memberAttribute_4" value="${xxMember.area }" treePath="${treepath }" />
								</span>
						</td>
							</tr>
							<tr>
								<th>
									地址:
								</th>
								<td>
										<input type="text" name="memberAttribute_5" class="text" value="${xxMember.address }" maxlength="200" />
								</td>
							</tr>
							<tr>
								<th>
									邮编:
								</th>
								<td>
										<input type="text" name="memberAttribute_6" class="text" value="${xxMember.zipCode }" maxlength="200" />
								</td>
							</tr>
						<tr>
							<th>
								&nbsp;
							</th>
							<td>
								<input type="submit" class="button" value="提&nbsp;&nbsp;交" />
								<input type="button" class="button" value="返&nbsp;&nbsp;回" onclick="location.href=''" />
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<%@include file="../footer.jsp" %>
</body>
</html>