<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看会员 - Powered By SHOP++</title>
<meta name="author" content="SHOP++ Team" />
<meta name="copyright" content="SHOP++" />
<link href="${pageContext.request.contextPath}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/jquery.tools.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/input.js"></script>
</head>
<body>
	<div class="path">
		<a href="/shopxx/admin/common/index.jhtml">首页</a> &raquo; 查看会员
	</div>
	<ul id="tab" class="tab">
		<li>
			<input type="button" value="基本信息" />
		</li>
			<li>
				<input type="button" value="个人资料" />
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
				E-mail:
			</th>
			<td>
				${xm.email }
			</td>
		</tr>
		<tr>
			<th>
				会员等级:
			</th>
			<td>
				${xm.memberRank==1?"普通会员":(xm.memberRank==2?"银牌会员":(xm.memberRank==3?"金牌会员":(xm.memberRank==4?"白金会员":"贵宾会员"))) }
			</td>
		</tr>
		<tr>
			<th>
				状态:
			</th>
			<td>
					<span class="green">${xm.isEnabled==true?'正常':'未启用' }</span>
			</td>
		</tr>
		<tr>
			<th>
				积分:
			</th>
			<td>
				${xm.point}
			</td>
		</tr>
		<tr>
			<th>
				余额:
			</th>
			<td>
			<!-- 
			<fmt:formatDate value="${xm.createDate }" pattern="yyyy-MM-dd"/>
			 <fmt:formatNumber maxFractionDigits="4" minFractionDigits="2"> ${l.price } </fmt:formatNumber>
			 -->
			  
			  <fmt:formatNumber maxFractionDigits="4" minFractionDigits="2"> ${xm.balance } </fmt:formatNumber>
				<a href="../deposit/list.jhtml?memberId=1">[查看预存款]</a>
			</td>
		</tr>
		<tr>
			<th>
				消费金额:
			</th>
			<td>
			${xm.amount }
				
			</td>
		</tr>
		<tr>
			<th>
				创建日期:
			</th>
			<td>
			<fmt:formatDate value="${xm.createDate }" pattern="yyyy-MM-dd"/>	
			</td>
		</tr>
		<tr>
			<th>
				最后登录日期:
			</th>
			<td>
			<fmt:formatDate value="${xm.loginDate }" pattern="yyyy-MM-dd"/>	
			</td>
		</tr>
		<tr>
			<th>
				注册IP:
			</th>
			<td>
				${xm.registerIp }
			</td>
		</tr>
		<tr>
			<th>
				最后登录IP:
			</th>
			<td>
				${xm.loginIp }
			</td>
		</tr>
		<!-- <tr>
			<th>
				评论数:
			</th>
			<td>
				27
			</td>
		</tr>
		<tr>
			<th>
				咨询数:
			</th>
			<td>
				11
			</td>
		</tr>
		<tr>
			<th>
				收藏商品数:
			</th>
			<td>
				0
			</td>
		</tr> -->
	</table>
		<table class="input tabContent">
				<tr>
					<th>
						姓名:
					</th>
					<td>
							${xm.name }
					</td>
				</tr>
				<tr>
					<th>
						性别:
					</th>
					<td>
							${xm.gender==1?'男':'女' }
					</td>
				</tr>
				<tr>
					<th>
						出生日期:
					</th>
					<td>
				<fmt:formatDate value="${xm.birth }" pattern="yyyy-MM-dd"/>			
					</td>
				</tr>
				<tr>
					<th>
						地区:
					</th>
					<td>
								${xm.area }
					</td>
				</tr>
				<tr>
					<th>
						地址:
					</th>
					<td>
							${xm.address }
					</td>
				</tr>
		</table>
	<table class="input">
		<tr>
			<th>
				&nbsp;
			</th>
			<td>
				<input type="button" id="backButton" class="button" value="返&nbsp;&nbsp;回" />
			</td>
		</tr>
	</table>
</body>
</html>