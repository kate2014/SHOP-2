<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title>回复 - Powered By SHOP++</title>
	<meta name="author" content="SHOP++ Team" />
	<meta name="copyright" content="SHOP++" />
	<link href="${pageContext.request.contextPath}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.js"></script>
	
</head>
<body>
	<div class="path">
		<a href="">首页</a> &raquo; 回复
	</div>
	<form id="inputForm" action="${pageContext.request.contextPath}/consultreply" method="post">
		<input type="hidden" name="id" value="${map.id }" />
		<input type="hidden" name="product" value="${map.product }" />
		<input type="hidden" name="flag" value="reMess" />
		<table class="input">
			<tr>
				<th>
					商品:
				</th>
				<td colspan="2">
					<a href="${pageContext.request.contextPath}/consult?index=1&num=5" target="_blank">${map.full_name }</a>
				</td>
			</tr>
			<tr>
				<th>
					会员:
				</th>
				<td colspan="2">
						<a href="${pageContext.request.contextPath}/memberm/checkMemberMessage?id=${map.member}">${map.username}</a>
				</td>
			</tr>
			<tr>
				<th>
					内容:
				</th>
				<td colspan="2">
					${map.content }
				</td>
			</tr>
			
			
			  <c:forEach items="${reply }" var="r" varStatus="i">
			  <tr>
			  <c:if test="${ i.index==0}">
			    <th> 回复：</th>
			  </c:if>
			    <c:if test="${ i.index!=0}">
			    <th>  </th>
			  </c:if>
			    <td>${r.content }</td>
			    <td><fmt:formatDate value="${r.create_date }" pattern="yyyy-MM-dd"/></td>
			  </tr>
			  </c:forEach>
			
			<tr>
				<th>
					内容:
				</th>
				<td colspan="2">
					<textarea name="content" class="text"></textarea>
					<div id="innerdiv"></div>
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td colspan="2">
					<input type="submit" id="sub" class="button" value="确&nbsp;&nbsp;定" />
					<input type="button" class="button" value="返&nbsp;&nbsp;回" onclick="location.href='${pageContext.request.contextPath}/consult?page=1&rows=${rows }'"/>
				</td>
			</tr>
		</table>
	</form>
</body>
<script type="text/javascript">
  $(function(){
	  $("form").submit(function(){
		  var text=$("textarea").val();
		  if(text==null||text===""){
			  return false; 
		  }else{
			  return true;
		  }  
	  });
	  $("#sub").click(function() {
		  var text=$("textarea").val();
		  if(text==null||text===""){
			  $("#innerdiv").text("内容不能为空");
		  }  
	  })
	  $("textarea").focus(function(){
		  $("#innerdiv").text("");
	  })
	 
  })
</script>
</html>