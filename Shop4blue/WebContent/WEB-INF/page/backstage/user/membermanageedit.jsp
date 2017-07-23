<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑会员 - Powered By SHOP++</title>
<meta name="author" content="SHOP++ Team" />
<meta name="copyright" content="SHOP++" />
<link href="${pageContext.request.contextPath}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/jquery.tools.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/jquery.validate.js"></script> --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/jquery.lSelect.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/input.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/datePicker/WdatePicker.js"></script>
<script type="text/javascript">
$(function(){
	$("#pd1").hide();
	$("#pd2").hide();
	$("#submit1").click(function(){
		$("#treePath").attr("value",$("#areaId").attr("treePath"));
	 	$("#inputForm").submit(); 
		
		 
	})
	$("#email").blur(function(){
		if($(this).val()==""){
			$("#pd1").show();
			$("#submit1").attr("disabled","disabled");
		}else{
			$("#pd1").hide();
			$("#submit1").attr("disabled",false);
		}
	})
	$("#password").blur(function(){
		var rePassword = $("#rePassword").val();
		var password = $(this).val();
		if(rePassword!=password){
			$("#pd2").show();
			$("#submit1").attr("disabled","disabled");
		}
		else{
			$("#pd2").hide();
			$("#submit1").attr("disabled",false);
		}
	})
	$("#rePassword").blur(function(){
		var password = $("#password").val();
		var rePassword = $(this).val();
		if(rePassword!=password){
			$("#pd2").show();
			$("#submit1").attr("disabled","disabled");
		}
		else{
			$("#pd2").hide();
			$("#submit1").attr("disabled",false);
		}
	})
})
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
			password: {
				pattern: /^[^\s&\"<>]+$/,
				minlength: 4,
				maxlength: 20
			},
			rePassword: {
				equalTo: "#password"
			},
			email: {
				required: true,
				email: true
					,remote: {
						url: "check_email.jhtml?previousEmail=test%40shopxx.net",
						cache: false
					}
			},
			modifyPoint: {
				integer: true,
				min: -0
			},
			modifyBalance: {
				min: -0,
				decimal: {
					integer: 12,
					fraction: 2
				}
			}
		},
		messages: {
			password: {
				pattern: "非法字符"
			}
				,email: {
					remote: "已存在"
				}
		}
	});
	

});
</script>
</head>
<body>
	<div class="path">
		<a href="/shopxx/admin/common/index.jhtml">首页</a> &raquo; 编辑会员
	</div>
	<form id="inputForm" action="${pageContext.request.contextPath }/memberm/updateMember" method="post">
       <c:forEach items="${xm }" var="xm"> 
		<input type="hidden" name="id" value="${xm.id }" />
		<input  type="hidden" name="treePath" id="treePath" />
		<ul id="tab" class="tab">
			<li>
				<input type="button" value="基本信息" />
			</li>
				<li>
					<input type="button" value="个人资料" />
				</li>
			<li>
				<input type="button" value="积分" />
			</li>
			<li>
				<input type="button" value="预存款" />
			</li>
		</ul>
		<table class="input tabContent">
			<tr>
				<th>
					用户名:
				</th>
				<td>
					${xm.username}
				</td>
			</tr>
			<tr>
				<th>
					密码:
				</th>
				<td>
					<input type=text id="password" name="password" class="text" value="${xm.password }"maxlength="20" title="若留空则密码将保持不变" />
					
				</td>
			</tr>
			<tr>
				<th>
					确认密码:
				</th>
				<td>
					<input type="text" name="rePassword" id="rePassword" value="${xm.password }" class="text" maxlength="20" />
					<span id="pd2" style="color: red;" > 两次密码不一致</span>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>E-mail:
				</th>
				<td>
					<input type="text" id="email"name="email" class="text" value="${xm.email}" maxlength="200" />
					<span id="pd1" style="color: red;" > E-mail不能为空</span>
				</td>
			</tr>
			<tr>
				<th>
					会员等级:
				</th>
				<td>
					<select name="memberRank">
							<c:forEach items="${rank }" var="r">
					   <option value="${r.id }" ${r.id==xm.member_rank?'selected':'' }>${r.name }</option>
					</c:forEach>
					</select> 
				</td>
			</tr>
			<tr>
				<th>
					设置:
				</th>
				<td>
					<label>
						<input type="checkbox" name="isEnabled" value="true"  ${xm.is_enabled==true?'checked':'' } />是否启用
						<input type="hidden" name="_isEnabled" value="false" />
					</label>
				</td>
			</tr>
			<tr>
				<th>
					消费金额:
				</th>
				<td>
					${xm.amount}
				</td>
			</tr>
			<tr>
				<th>
					创建日期:
				</th>
				<td>
					 <fmt:formatDate value="${xm.create_date }" pattern="yyyy-MM-dd"/>
				</td>
			</tr>
			<tr>
				<th>
					注册IP:
				</th>
				<td>
					${xm.register_ip }
				</td>
			</tr>
		</table>
			<table class="input tabContent">
					<tr>
						<th>
							姓名:
						</th>
						<td>
						   <input type="text" id="name" name="name" class="text"  maxlength="200" value="${xm.name }" />
						</td>
					</tr>
					<tr>
						<th>
							性别:
						</th>
						<td>
								<span class="fieldSet">
										<label>
											<input type="radio" name="gender" value="1" ${xm.gender==1?'checked':'' } />男
										</label>
										<label>
											<input type="radio" name="gender" value="0"  ${xm.gender==0?'checked':'' }/>女
										</label>
								</span>
						</td>
					</tr>
					<tr>
						<th>
							出生日期:
						</th>
						<td><!-- <fmt:formatDate value='${xm.birth }' pattern='yyyy-MM-dd'/> -->
								<input type="text" readonly="readonly" name="birth1" class="text Wdate" value="<fmt:formatDate value='${xm.birth }' pattern='yyyy-MM-dd'/>" onfocus="WdatePicker();" />
						</td>
					</tr>
					 <tr>
						<th>
							地区:
						</th>
						<td>
								<span class="fieldSet">
									<input type="hidden" id="areaId" name="area" value="${xm.area }" treePath="${xm.tree_path }" />
								</span>
						</td>
						
					</tr>
					<tr>
						<th>
							地址:
						</th>
						<td>
								<input type="text" name="address" class="text" value="${xm.address }" maxlength="200" />
						</td>
					</tr>
			</table>
		<table class="input tabContent">
			<tr>
				<th>
					当前积分:
				</th>
				<td>
					${xm.point}
				</td>
			</tr>
			
			<tr>
				<th>
					积分调整（增/减）:
				</th>
				<td>
					<input type="text" name="changePoint" class="text" maxlength="9" title="正数代表增加积分，负数代表减少积分" />
				</td>
			</tr>
		</table>
		<table class="input tabContent">
			<tr>
				<th>
					当前余额:
				</th>
				<td>
					${xm.balance}
				</td>
			</tr>
			</c:forEach>
			<tr>
				<th>
					余额调整（充值/扣除）:
				</th>
				<td>
					<input type="text" name="changeBalance" class="text" maxlength="16" title="正数代表预存款充值，负数代表预存款扣除" />
				</td>
			</tr>
			
			 <!-- <tr>
				<th>
					备注:
				</th>
				<td>
					<input type="text" name="depositMemo" class="text" maxlength="200" />
				</td>
			</tr>  -->
		</table>
		<table class="input">
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="button" class="button" id="submit1" value="确&nbsp;&nbsp;定" />
					<input type="button" id="backButton" class="button" value="返&nbsp;&nbsp;回" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>