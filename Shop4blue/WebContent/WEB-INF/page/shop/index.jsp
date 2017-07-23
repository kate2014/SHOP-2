<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title>SHOP商城</title>
	<meta name="author" content="SHOP++ Team" />
	<meta name="copyright" content="SHOP++" />
		<meta name="keywords" content="SHOP商城" />
		<meta name="description" content="SHOP商城" />
<link rel="icon" href="/shopxx/favicon.ico" type="image/x-icon" />
<link href="${pageContext.request.contextPath }/resources/shop/slider/slider.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/resources/shop/css/common.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/resources/shop/css/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/jquery.tools.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/jquery.lazyload.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/slider/slider.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/common.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $slider = $("#slider");
	var $newArticleTab = $("#newArticle .tab");
	var $promotionProductTab = $("#promotionProduct .tab");
	var $promotionProductInfo = $("#promotionProduct .info");
	var $hotProductTab = $("#hotProduct .tab");
	var $newProductTab = $("#newProduct .tab");
	var $hotProductImage = $("#hotProduct img");
	var $newProductImage = $("#newProduct img");
	
	$slider.nivoSlider({
		effect: "random",
		animSpeed: 1000,
		pauseTime: 6000,
		controlNav: true,
		keyboardNav: false,
		captionOpacity: 0.4
	});
	
	$newArticleTab.tabs("#newArticle .tabContent", {
		tabs: "li",
		event: "mouseover",
		initialIndex: 1
	});
	
	$promotionProductTab.tabs("#promotionProduct .tabContent", {
		tabs: "li",
		event: "mouseover"
	});
	
	$hotProductTab.tabs("#hotProduct .tabContent", {
		tabs: "li",
		event: "mouseover"
	});
	
	$newProductTab.tabs("#newProduct .tabContent", {
		tabs: "li",
		event: "mouseover"
	});
	
	function promotionInfo() {
		$promotionProductInfo.each(function() {
			var $this = $(this);
			var beginDate = $this.attr("beginTimeStamp") != null ? new Date(parseFloat($this.attr("beginTimeStamp"))) : null;
			var endDate = $this.attr("endTimeStamp") != null ? new Date(parseFloat($this.attr("endTimeStamp"))) : null;
			if (beginDate == null || beginDate <= new Date()) {
				if (endDate != null && endDate >= new Date()) {
					var time = (endDate - new Date()) / 1000;
					$this.html("剩余时间:<em>" + Math.floor(time / (24 * 3600)) + "<\/em> 天 <em>" + Math.floor((time % (24 * 3600)) / 3600) + "<\/em> 时 <em>" + Math.floor((time % 3600) / 60) + "<\/em> 分");
				} else if (endDate != null && endDate < new Date()) {
					$this.html("活动已结束");
				} else {
					$this.html("正在进行中...");
				}
			}
		});
	}
	
	promotionInfo();
	setInterval(promotionInfo, 60 * 1000);
	
	$hotProductImage.lazyload({
		threshold: 100,
		effect: "fadeIn",
		skip_invisible: false
	});
	
	$newProductImage.lazyload({
		threshold: 100,
		effect: "fadeIn",
		skip_invisible: false
	});

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

<%@include file="header.jsp" %>
<div class="container index">
			<div class="span18">
<div id="slider" class="slider">
			<a href="${pageContext.request.contextPath }/article.do?id=11">	<img src="/pic/qcamrs.jpg" width="770" height="290" alt="骑出奥妙人生" title="骑出奥妙人生" /></a>
			<a href="${pageContext.request.contextPath }/article.do?id=22">	<img src="/pic/Love.jpg" width="770" height="290" alt="浪漫时尚季" title="浪漫时尚季" /></a>
			<a href="${pageContext.request.contextPath }/article.do?id=33"> <img src="/pic/qmkjj.jpg" width="770" height="290" alt="全民砍价季" title="全民砍价季" /></a>
</div>		</div>
		<div class="span6 last">
			<div id="newArticle" class="newArticle">
					<ul class="tab">
					<c:forEach items="${articleCategory }" var="arti" begin="0" end="2">
							<li>
								<a href="${pageContext.request.contextPath }/articleByTag.do?id=${arti.id}" target="_blank">${arti.name }</a>
							</li>
					</c:forEach>
					</ul>
							<ul class="tabContent">
							<c:forEach items="${article1 }" var="ar">
									<li>
										<a href="${pageContext.request.contextPath }/article.do?id=${ar.id}" title="${ar.title }" target="_blank">${ar.title }</a>
									</li>
							</c:forEach>
							</ul>
							<ul class="tabContent">
							<c:forEach items="${article2 }" var="ar">
									<li>
										<a href="${pageContext.request.contextPath }/article.do?id=${ar.id}" title="${ar.title }" target="_blank">${ar.title }</a>
									</li>
							</c:forEach>
							</ul>
							<ul class="tabContent">
							<c:forEach items="${article3 }" var="ar">
									<li>
										<a href="${pageContext.request.contextPath }/article.do?id=${ar.id}" title="${ar.title }" target="_blank">${ar.title }</a>
									</li>
							</c:forEach>
							</ul>
							
			</div>
	</div>
		

		<div class="span18">
			<div class="hotBrand clearfix">
				<div class="title">
					<a href="${pageContext.request.contextPath}/sortShop/brands.do">所有品牌</a>
					<strong>热门品牌</strong>BRAND
				</div>
				<ul>
				<c:forEach items="${list }" var="l" >
					<li>									
					<a href="${pageContext.request.contextPath }/sortShop/brand.do?id=${l.id}" title="${l.name }"><img src="${l.logo }" alt="${l.name }" /></a>
				</li>
				</c:forEach>
				</ul>
			</div>
			<div class="hotProductCategory">
				<div class="title">
					<a href="${pageContext.request.contextPath}/sortShop/category.do">所有分类</a>
					<strong>热门分类</strong>CATEGORY
				</div>
				<div class="content">
						<table>
							<c:forEach items="${listShop }" var="l" begin="0" end="3">
								<tr>
									<th>
										<a href="${pageContext.request.contextPath }/hc/main.do?type=${l.id}">${l.name }</a>
									</th>
								<c:forEach items="${l.list }" var="ll">
									<td>
										<a href="${pageContext.request.contextPath }/hc/main.do?type=${l.id}&temp=${ll.id}">${ll.name }</a>
									</td>
								</c:forEach>
								</tr>
							</c:forEach>
						</table>
				</div>
			</div>
		</div>
		<div class="span6 last">
			<div id="promotionProduct" class="promotionProduct">
				<ul class="tab">
							<li>
								<a href="/shopxx/product/list.jhtml?promotionId=2" target="_blank">双倍积分</a>
							</li>
				</ul>
						<ul class="tabContent">
									<li>
										<span class="info">
										</span>
										<div>
											<img src="/pic/womandress.jpg" alt="伊芙丽2013春款新款女士西装领一粒扣短款小西装外套女1161024-2" />
											<div>
												<a href="/shopxx/product/content/201705/205.html" title="伊芙丽2013春款新款女士西装领一粒扣短款小西装外套女1161024-2" target="_blank">伊芙丽2013春款新款女士西</a>
													<span>
														市场价:
														<del>￥429.60</del>
													</span>
												<span>
													销售价:
													<strong>￥358.00</strong>
												</span>
											</div>
										</div>
									</li>
									<li class="last">
										<span class="info">
										</span>
										<div>
											<img src="/pic/womanlianyiqun6.jpg" alt="伊芙丽 2013春装新款 女装OL通勤修身长袖小外套女小西装1211120" />
											<div>
												<a href="/shopxx/product/content/201705/194.html" title="伊芙丽 2013春装新款 女装OL通勤修身长袖小外套女小西装1211120" target="_blank">伊芙丽 2013春装新款 女装</a>
													<span>
														市场价:
														<del>￥681.60</del>
													</span>
												<span>
													销售价:
													<strong>￥568.00</strong>
												</span>
											</div>
										</div>
									</li>
						</ul>
			</div>
			<div class="newReview">
				<div class="title">最新评论</div>
				<ul>
							<li>
								<a href="/shopxx/review/content/150.jhtml" title="不错，很好，质量很好。穿着也很合身。" target="_blank">不错，很好，质量很好。穿着也很合</a>
							</li>
							<li>
								<a href="/shopxx/review/content/142.jhtml" title="东西收到了，第一次购买杰克琼斯买的衣服，虽然贵，但是质量很满意，大小合适、面料很舒服、样式很新颖、真的不..." target="_blank">东西收到了，第一次购买杰克琼斯</a>
							</li>
							<li>
								<a href="/shopxx/review/content/137.jhtml" title="整体上还不错,就是颜色没有想象的那么好，面料很舒服，应该穿着会很舒服。" target="_blank">整体上还不错,就是颜色没有想象的</a>
							</li>
							<li>
								<a href="/shopxx/review/content/2.jhtml" title="衣服很漂亮，做工质量都不错，面料很舒适，裁剪很合身。是那种特别淑女特别有范儿的样式。只是希望快递能给力..." target="_blank">衣服很漂亮，做工质量都不错，面</a>
							</li>
							<li>
								<a href="/shopxx/review/content/76.jhtml" title="一拆开就喜欢，衣服包装很好，很精致，同事们看了都说漂亮，衣服的质地也很好，就是物流太不给力了" target="_blank">一拆开就喜欢，衣服包装很好，很</a>
							</li>
				</ul>
			</div>
		</div>
	<!-- 	<div class="span24">
<div class="middleAd">
					<img src="http://storage.shopxx.net/demo-image/3.0/ad/index_top.jpg" width="1000" height="120" alt="特卖会专场" title="特卖会专场" />
</div>		</div> -->
		<div class="span24">
			<div id="hotProduct" class="hotProduct clearfix">
					<div class="title">
						<strong>热门商品</strong>
						<a href="${pageContext.request.contextPath }/sortShop/shopSort.do?tagIds=month_sales" target="_blank"></a>
					</div>
					<ul class="tab">
							<li>
								<a href="${pageContext.request.contextPath }/hc/main.do?type=1" target="_blank">时尚女装</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath }/hc/main.do?type=2">精品男装</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath }/hc/main.do?type=3">精致内衣</a>
							</li>
					</ul>
					<div class="hotProductAd">
			<img src="/pic/qls.jpg" width="260" height="343" alt="热门商品" title="热门商品" />
					</div>
						<ul class="tabContent">
						<!-- data-original="/pic/womandress.jpg" -->
						<c:forEach items="${listShopHot1 }" var="l">
									<li>
										<a href="${pageContext.request.contextPath }/shopContent/shop.do?id=${l.id }" title="${l.name }" target="_blank">
										<img src="${l.image }" width="150px" height="160px" />
										</a>
									</li>
						</c:forEach>
						</ul>
						<ul class="tabContent">
									<c:forEach items="${listShopHot2 }" var="l">
									<li>
										<a href="${pageContext.request.contextPath }/shopContent/shop.do?id=${l.id }" title="${l.name }" target="_blank">
										<img src="${l.image }" width="150px" height="160px" />
										</a>
									</li>
						</c:forEach>
						</ul>
						<ul class="tabContent">
									<c:forEach items="${listShopHot3 }" var="l">
									<li>
										<a href="${pageContext.request.contextPath }/shopContent/shop.do?id=${l.id }" title="${l.name }" target="_blank">
										<img src="${l.image }" width="150px" height="160px" />
										</a>
									</li>
						</c:forEach>
						</ul>
			</div>
		</div>
		<div class="span24">
			<div id="newProduct" class="newProduct clearfix">
					<div class="title">
						<strong>最新商品</strong>
						<a href="${pageContext.request.contextPath }/sortShop/shopSort.do?tagIds=modify_date" target="_blank"></a>
					</div>
					<ul class="tab">
							<li>
								<a href="/shopxx/product/list/1.jhtml?tagIds=2" target="_blank">时尚女装</a>
							</li>
							<li>
								<a href="/shopxx/product/list/2.jhtml?tagIds=2" target="_blank">精品男装</a>
							</li>
							<li>
								<a href="/shopxx/product/list/3.jhtml?tagIds=2" target="_blank">精致内衣</a>
							</li>
					</ul>
					<div class="newProductAd">
			<img src="/pic/clock.jpg" width="260" height="343" alt="最新商品" title="最新商品" />
					</div>
						<ul class="tabContent">
								<c:forEach items="${listShopNew1 }" var="l">
									<li>
										<a href="${pageContext.request.contextPath }/shopContent/shop.do?id=${l.id }" title="${l.name }" target="_blank">
										<img src="${l.image }" width="150px" height="160px" />
										</a>
									</li>
								</c:forEach>
						</ul>
						<ul class="tabContent">
									<c:forEach items="${listShopNew2 }" var="l">
									<li>
										<a href="${pageContext.request.contextPath }/shopContent/shop.do?id=${l.id }" title="${l.name }" target="_blank">
										<img src="${l.image }" width="150px" height="160px" />
										</a>
									</li>
								</c:forEach>
									
						</ul>
						<ul class="tabContent">
									<c:forEach items="${listShopNew3 }" var="l">
									<li>
										<a href="${pageContext.request.contextPath }/shopContent/shop.do?id=${l.id }" title="${l.name }" target="_blank">
										<img src="${l.image }" width="150px" height="160px" />
										</a>
									</li>
								</c:forEach>
						</ul>
			</div>
		</div>
		<div class="span24">
			<div class="friendLink">
				<dl>
					<dt>合作伙伴</dt>
							<dd>
								<a href="http://www.shopxx.net" target="_blank">SHOP++官网</a>
								|
							</dd>
							<dd>
								<a href="http://bbs.shopxx.net" target="_blank">SHOP++论坛</a>
								|
							</dd>
							<dd>
								<a href="http://www.alipay.com" target="_blank">支付宝</a>
								|
							</dd>
							<dd>
								<a href="http://www.tenpay.com" target="_blank">财付通</a>
								|
							</dd>
							<dd>
								<a href="http://www.chinapay.com" target="_blank">银联在线</a>
								|
							</dd>
							<dd>
								<a href="http://www.99bill.com" target="_blank">快钱支付</a>
								|
							</dd>
							<dd>
								<a href="http://down.admin5.com" target="_blank">A5下载</a>
								|
							</dd>
							<dd>
								<a href="http://www.kuaidi100.com" target="_blank">快递100</a>
								|
							</dd>
							<dd>
								<a href="http://www.cnzz.com" target="_blank">站长统计</a>
								
							</dd>
					<dd class="more">
						<a href="/shopxx/friend_link.jhtml">更多</a>
					</dd>
				</dl>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>