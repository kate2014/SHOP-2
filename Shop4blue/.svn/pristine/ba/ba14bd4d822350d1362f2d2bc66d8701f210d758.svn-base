<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>${xxpc.name }- Powered By SHOP++</title>
		<meta name="author" content="SHOP++ Team" />
		<meta name="copyright" content="SHOP++" />
			<meta name="keywords" content="时尚女装" />
			<meta name="description" content="时尚女装" />
<link href="${pageContext.request.contextPath }/resources/shop/css/common.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/resources/shop/css/product.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/resources/shop/css/brand.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/resources/shop/css/product_category.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/jquery.lazyload.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/common.js"></script>
<title>Insert title here</title>
</head>
<body>
<%@include file="header.jsp" %>
<div class="container brandContent">
		<div class="span6">
		<div class="hotProductCategory">
			<c:forEach items="${list }" var="l">
						<dl>
							<dt>
								<a href="${pageContext.request.contextPath }/hc/main.do?type=${l.id}">${l.name}</a>
							</dt>
							<c:forEach items="${l.list}" var="ll">
									<dd>
										<a href="${pageContext.request.contextPath }/hc/main.do?type=${ll.id}">${ll.name }</a>
									</dd>
							</c:forEach>
						</dl>
			</c:forEach>
		</div>
		</div>
		
		
		<div class="span18 last">
			
			<div id="div1" class="path">
				<ul>
					<li>
						<a href="${pageContext.request.contextPath }/hc/index.do">首页</a>
					</li>
						<c:if test="${xxpcs==null }">
							<li id="testTop1" class="last">
								${xxpc.name }
							</li>
						</c:if>
						<c:if test="${xxpcs!=null }">
							<li id="testTop1" >
								<a  
										<c:if test="${xxpc.name=='品牌'}">
										href="${pageContext.request.contextPath}/sortShop/brands.do"
										</c:if> >
										<c:if test="${xxpc.name=='分类'}">
										href=""
										</c:if> 
										
										
										${xxpc.name }</a>
							</li>
							<li id="testTop2" class="last">${xxpcs.name }</li>
						</c:if>
				</ul>
			</div>
			<c:if test="${divs==7 }">
			<div class="top">
					<img src="${xxBrand.logo }" alt="${xxBrand.name }" width="200px" height="100px"/>
				<strong>${xxBrand.name }</strong>
			</div>
			<div class="introduction">
				<div class="title">
					<strong>介绍</strong>
					<span>&nbsp;</span>
				</div>
				${xxBrand.introduction }
				<!-- <img src="" width="100px" height="80px" /> -->
			</div>
			</c:if>
			
			<!-- 品牌分类 -->
				<c:if test="${divs==6 }">
				<div id="div6" >
					<ul>
						<c:forEach items="${listBrand }" var="lb">
								<li >
									<a href="${pageContext.request.contextPath}/sortShop/brand.do?id=${lb.id}">
										<img src="${lb.logo }" width="200px" height="100px"/>
										<span title="${lb.name }">${lb.name }</span>
									</a>
								</li>
						</c:forEach>
					</ul>
				</div>
				</c:if>
		</div>
		
		<!-- 商品分类 -->
		<c:if test="${divs==5 }">
		<div class="list">
				<table cellspacing="2px">
				<c:forEach items="${list }" var="l">
						<tr>
							<th style="background-color:#C0C0C0" width="200px" height="50px">
								<a href="${pageContext.request.contextPath }/hc/main.do?type=${l.id}">${l.name}</a>
							</th>
							<c:forEach items="${l.list}" var="ll">
									<td style="background-color: #F5F5F5"  width="200px" height="50px" align="center">
										<a href="${pageContext.request.contextPath }/hc/main.do?type=${ll.id}" >${ll.name }</a>
									</td>
							</c:forEach>
						</tr>
				</c:forEach>
				</table>
		</div>
		</c:if>
	</div>
<%@include file="footer.jsp" %>
</body>
</html>