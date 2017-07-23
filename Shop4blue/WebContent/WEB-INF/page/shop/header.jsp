<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
</head>
<div class="container header">
	<div class="span5">
		<div class="logo">
			<a href="">
				<img src="${pageContext.request.contextPath }/resources/logo/shop.png" width="200px" height="50px" alt="SHOP++商城" />
			</a>
		</div>
	</div>
	<div class="span9">
<div class="headerAd">
					<img src="${pageContext.request.contextPath }/resources/logo/bz.jpg" width="320" height="50" alt="" title="正品保障" />
</div>	</div>
	<div class="span10 last">
		<div class="topNav clearfix">
			<ul>
				<c:if test="${user!=null }">
				<li id="headerLogin" class="headerLogin">欢迎您:<a href="#">${user.username }</a>|</li>
				<li id="headerRegister" class="headerRegister">
					<a href="${pageContext.request.contextPath }/proLogin/logout">[退出]</a>|
				</li>
				</c:if>
				<c:if test="${user==null }">
				<li id="headerLogin" class="headerLogin">
					<a href="${pageContext.request.contextPath }/proLogin/login">登录</a>|
				</li>
				<li id="headerRegister" class="headerRegister">
					<a href="${pageContext.request.contextPath }/proRegister/register">注册</a>|
				</li>
				</c:if>
						<li>
							<a href="${pageContext.request.contextPath }/hc/hyzx?userid=${user.id}">会员中心</a>
							|
						</li>
						<li>
							<a href="#">购物指南</a>
							|
						</li>
						<li>
							<a href="#">关于我们</a>
							
						</li>
			</ul>
		</div>
		<div class="cart">
			<a href="${pageContext.request.contextPath }/cart/tocart">购物车</a>
		</div>
			<div class="phone">
				客服热线:
				<strong>88888888</strong>
			</div>
	</div>
	<div class="span24">
		<ul class="mainNav">
					<li>
						<a href="${pageContext.request.contextPath }/hc/index">首页</a>
						|
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/hc/main?type=1">时尚女装</a>
						|
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/hc/main?type=2">精品男装</a>
						|
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/hc/main?type=3">精致内衣</a>
						|
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/hc/main?type=4">服饰配件</a>
						|
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/hc/main?type=5">时尚女鞋</a>
						|
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/hc/main?type=6">流行男鞋</a>
						|
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/hc/main?type=7">童装童鞋</a>
						
					</li>
		</ul>
	</div>
	<div class="span24">
		<div class="tagWrap">
			<ul class="tag">
						<!--  style="background: url(http://storage.shopxx.net/demo-image/3.0/tag/hot.gif) right no-repeat;" -->
						<li class="icon">
							<a href="${pageContext.request.contextPath }/sortShop/shopSort?tagIds=month_sales">热销</a>
						</li>
						<!--  style="background: url(http://storage.shopxx.net/demo-image/3.0/tag/new.gif) right no-repeat;" -->
						<li class="icon">
							<a href="${pageContext.request.contextPath }/sortShop/shopSort?tagIds=modify_date">最新</a>
						</li>
			</ul>
			<div class="hotSearch">
					热门搜索:
						<a href="${pageContext.request.contextPath }/search/searchAll?keyword=T恤">T恤</a>
						<a href="${pageContext.request.contextPath }/search/searchAll?keyword=衬衫">衬衫</a>
						<a href="${pageContext.request.contextPath }/search/searchAll?keyword=媳妇">西服</a>
						<a href="${pageContext.request.contextPath }/search/searchAll?keyword=西裤">西裤</a>
						<a href="${pageContext.request.contextPath }/search/searchAll?keyword=森马">森马</a>
						<a href="${pageContext.request.contextPath }/search/searchAll?keyword=七匹狼">七匹狼</a>
						<a href="${pageContext.request.contextPath }/search/searchAll?keyword=梵希蔓">梵希蔓</a>
						<a href="${pageContext.request.contextPath }/search/searchAll?keyword=春季新款">春夏新款</a>
						<a href="${pageContext.request.contextPath }/search/searchAll?keyword=牛仔裤">牛仔裤</a>
			</div>
			<div class="search">
				<form id="productSearchForm" action="${pageContext.request.contextPath }/search/searchAll" method="get">
					<input name="keyword" class="keyword" value="商品搜索" maxlength="30" />
					<button type="submit">搜索</button>
				</form>
			</div>
		</div>
	</div>
</div>