<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="itcast" uri="http://itcast.cn/common/" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>搜索${keyword }- Powered By SHOP++</title>
		<meta name="author" content="SHOP++ Team" />
		<meta name="copyright" content="SHOP++" />
			<meta name="keywords" content="搜索${keyword }" />
			<meta name="description" content="搜索${keyword }" />
<link href="${pageContext.request.contextPath }/resources/shop/css/common.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/resources/shop/css/product.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/resources/shop/css/brand.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/resources/shop/css/css02.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/jquery.lazyload.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/common.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $productForm = $("#productForm");
	var $brandId = $("#brandId");
	var $promotionId = $("#promotionId");
	var $orderType = $("#orderType");
	var $pageNumber = $("#pageNumber");
	var $pageSize = $("#pageSize");
	var $filter = $("#filter dl");
	var $lastFilter = $("#filter dl:eq(2)");
	var $hiddenFilter = $("#filter dl:gt(2)");
	var $moreOption = $("#filter dd.moreOption");
	var $moreFilter = $("#moreFilter a");
	var $tableType = $("#tableType");
	var $listType = $("#listType");
	var $orderSelect = $("#orderSelect");
	var $brand = $("#filter a.brand");
	var $attribute = $("#filter a.attribute");
	var $previousPage = $("#previousPage");
	var $nextPage = $("#nextPage");
	var $size = $("#layout a.size");
	var $tagIds = $("input[name='tagIds']");
	var $sort = $("#sort a");
	var $startPrice = $("#startPrice");
	var $endPrice = $("#endPrice");
	var $result = $("#result");
	var $productImage = $("#result img");
	var $keyword = $("#productSearchForm input");
	var defaultKeyword = "商品搜索";
	var $productSearchForm = $("#productSearchForm");
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
	$("#productSearchForm input").val("${keyword}");
		$filter.each(function() {
			var $this = $(this);
			var height = $this.height();
			if (height > 30) {
				$this.find("dt").height(height);
				if ($this.find("a.current").size() == 0) {
					$this.height(30);
					$this.find(".moreOption").show();
				}
			}
		});
		
		$moreOption.click(function() {
			var $this = $(this);
			if ($this.hasClass("close")) {
				$this.removeClass("close");
				$this.attr("title", "更多");
				$this.parent().height(30);
			} else {
				$this.addClass("close");
				$this.attr("title", "收起");
				$this.parent().height("auto");
			}
		});
		
		$moreFilter.click(function() {
			var $this = $(this);
			if ($this.hasClass("close")) {
				$this.removeClass("close");
				$this.text("更多选项");
				$lastFilter.addClass("last");
				$hiddenFilter.hide();
			} else {
				$this.addClass("close");
				$this.text("收起选项");
				$lastFilter.removeClass("last");
				$hiddenFilter.show();
			}
		});
		
		/* $brand.click(function() {
			var $this = $(this);
			if ($this.hasClass("current")) {
				$brandId.val("");
			} else {
				$brandId.val($this.attr("brandId"));
			}
			$pageNumber.val(1);
			$productForm.submit();
			return false;
		});
		 */
		/* $attribute.click(function() {
			var $this = $(this);
			if ($this.hasClass("current")) {
				$this.closest("dl").find("input").prop("disabled", true);
			} else {
				$this.closest("dl").find("input").prop("disabled", false).val($this.text());
			}
			$pageNumber.val(1);
			$productForm.submit();
			return false;
		}); */
	
		
		//布局
	var layoutType = getCookie("layoutType");
	if (layoutType == "listType") {
		$listType.addClass("currentList");
		$result.removeClass("table").addClass("list");
	} else {
		$tableType.addClass("currentTable");
		$result.removeClass("list").addClass("table");
	} 
	
	$tableType.click(function() {
		var $this = $(this);
		if (!$this.hasClass("currentTable")) {
			$this.addClass("currentTable");
			$listType.removeClass("currentList");
			$result.removeClass("list").addClass("table");
			addCookie("layoutType", "tableType", {path: "/shopxx/"});
		}
	});
	
	$listType.click(function() {
		var $this = $(this);
		if (!$this.hasClass("currentList")) {
			$this.addClass("currentList");
			$tableType.removeClass("currentTable");
			$result.removeClass("table").addClass("list");
			addCookie("layoutType", "listType", {path: "/shopxx/"});
		}
	});
	
	$size.click(function() {
		var $this = $(this);
		$pageNumber.val(1);
		$pageSize.val($this.attr("pageSize"));
		$productForm.submit();
		return false;
	});
	
	$previousPage.click(function() {
		$pageNumber.val(0);
		$productForm.submit();
		return false;
	});
	
	$nextPage.click(function() {
		$pageNumber.val(2);
		$productForm.submit();
		return false;
	});
	
	$orderSelect.mouseover(function() {
		var $this = $(this);
		var offset = $this.offset();
		var $menuWrap = $this.closest("div.orderSelect");
		var $popupMenu = $menuWrap.children("div.popupMenu");
		$popupMenu.css({left: offset.left, top: offset.top + $this.height()}).show();
		$menuWrap.mouseleave(function() {
			$popupMenu.hide();
		});
	});
	
	/* $tagIds.click(function() {
		$pageNumber.val(1);
		$productForm.submit();
	}); */
	
/* 	$sort.click(function() {
		var $this = $(this);
		if ($this.hasClass("current")) {
			$orderType.val("");
		} else {
			$orderType.val($this.attr("orderType"));
		}
		$pageNumber.val(1);
		$productForm.submit();
		return false;
	}); */
	
	$startPrice.add($endPrice).focus(function() {
		$(this).siblings("button").show();
	});
	
	$startPrice.add($endPrice).keypress(function(event) {
		var $this = $(this);
		var key = event.keyCode?event.keyCode:event.which;
		if (key == 13 || (key >= 48 && key <= 57) || (key == 46 && $this.val().indexOf(".") == -1)) {
			return true;
		} else {
			return false;
		}
	});
	
	$productForm.submit(function() {
		if ($brandId.val() == "") {
			$brandId.prop("disabled", true)
		}
		if ($promotionId.val() == "") {
			$promotionId.prop("disabled", true)
		}
		if ($orderType.val() == "" || $orderType.val() == "topDesc") {
			$orderType.prop("disabled", true)
		}
		if ($pageNumber.val() == "" || $pageNumber.val() == "1") {
			$pageNumber.prop("disabled", true)
		}
		if ($pageSize.val() == "" || $pageSize.val() == "20") {
			$pageSize.prop("disabled", true)
		}
		if ($startPrice.val() == "" || !/^\d+(\.\d+)?$/.test($startPrice.val())) {
			$startPrice.prop("disabled", true)
		}
		if ($endPrice.val() == "" || !/^\d+(\.\d+)?$/.test($endPrice.val())) {
			$endPrice.prop("disabled", true)
		}
	});
	
	$productImage.lazyload({
		threshold: 100,
		effect: "fadeIn"
	});
	
	$.pageSkip = function(pageNumber) {
		$pageNumber.val(pageNumber);
		$productForm.submit();
		return false;
	}

	$productSearchForm.submit(function() {
		if ($.trim($keyword.val()) == "" || $keyword.val() == defaultKeyword) {
			return false;
		}
	});
});
</script>

<script type="text/javascript">
	$(function(){
		var str="${param.str}";
		var strs=str.split("-");
		var tagIds="${param.tagIds}";
		/* alert(tagIds); */
	/* 	alert(str);
	 	alert(strs[0]+","+strs[1]); */
	 	/* alert("${listShop}"); */
	 	//跳回页面改变按钮样式
	 	if(strs[1]=="asc"){
	 		if(strs[0]=="price"){
	 			$("#price").attr("class","asc");
	 		}
	 		if(strs[0]=="sales"){
	 			$("#sales").attr("class","asc");
	 		}
	 		if(strs[0]=="score"){
	 			$("#score").attr("class","asc");
	 		}
	 	}else{
	 		if(strs[0]=="price"){
	 			$("#price").attr("class","desc");
	 		}
	 		if(strs[0]=="sales"){
	 			$("#sales").attr("class","desc");
	 		}
	 		if(strs[0]=="score"){
	 			$("#score").attr("class","desc");
	 		}
	 	}
	 	 if(tagIds=="month_sales"){
	 		$("#tag1").prop("checked",true);
	 	}
	 	if(tagIds=="modify_date"){
	 		$("#tag2").prop("checked",true);
	 	} 	
	 	//热销  最新checkbox
	 	$("#tag1").click(function(){
	 		window.location.href="${pageContext.request.contextPath }/sortShop/search.do?&keyword=${keyword}&tagIds=month_sales";
	 	})
	 	$("#tag2").click(function(){
	 		window.location.href="${pageContext.request.contextPath }/sortShop/search.do?&keyword=${keyword}&tagIds=modify_date";
	 	})
	 	//价格区间提交按钮
	 	$("#btn").click(function(){
	 		var startprice=$("#startPrice").val();
	 		var endprice=$("#endPrice").val();
	 		 window.location.href="${pageContext.request.contextPath }/sortShop/search.do?str=price-desc&keyword=${keyword}&startPrice="+$("#startPrice").val()+"&endPrice="+$("#endPrice").val(); 
	 	})
	 	
		$("#price").click(function(){
			// asc desc
			if($(this).prop("class")=="asc"){
				 window.location.href="${pageContext.request.contextPath }/sortShop/search.do?str=price-desc&keyword=${keyword}"; 
			}
			else{
				 window.location.href="${pageContext.request.contextPath }/sortShop/search.do?str=price-asc&keyword=${keyword}"; 
			}
			})
		$("#sales").click(function(){
			// asc desc
			if($(this).prop("class")=="asc"){
				window.location.href="${pageContext.request.contextPath }/sortShop/search.do?str=sales-desc&keyword=${keyword}";
			}
			else{
				window.location.href="${pageContext.request.contextPath }/sortShop/search.do?str=sales-asc&keyword=${keyword}";
			}
		})
		$("#score").click(function(){
			// asc desc
			if($(this).prop("class")=="asc"){
				window.location.href="${pageContext.request.contextPath }/sortShop/search.do?str=score-desc&keyword=${keyword}";
			}
			else{
				window.location.href="${pageContext.request.contextPath }/sortShop/search.do?str=score-asc&keyword=${keyword}";
			}
		})
		
		/* var a="${param.type}";
		var b="${param.temp}";
		a=a>b?a:b; */
		/*
		$("#topDesc").click(function(){
			$.post("${pageContext.request.contextPath }/sortShop/sort.do",{str:"top-desc",type:a},function(data){
				window.location.reload(true);
			})
		})
		$("#priceAsc").click(function(){
			$.post("${pageContext.request.contextPath }/sortShop/sort.do",{str:"price-asc",type:a},function(data){
				window.location.reload(true);
			})
		})
		$("#priceDesc").click(function(){
			$.post("${pageContext.request.contextPath }/sortShop/sort.do",{str:"price-desc",type:a},function(data){
				$.each(data,function(i,n){
					alert(i+","+n);
				});
			})
		})
		$("#salesDesc").click(function(){
			$.post("${pageContext.request.contextPath }/sortShop/sort.do",{str:"sales-desc",type:a},function(data){
				$.each(data,function(i,n){
					alert(i+","+n);
				});
			})
		})
		$("#scoreDesc").click(function(){
			$.post("${pageContext.request.contextPath }/sortShop/sort.do",{str:"score-desc",type:a},function(data){
				$.each(data,function(i,n){
					alert(i+","+n);
				});
			})
		})
		$("#dateDesc").click(function(){
			$.post("${pageContext.request.contextPath }/sortShop/sort.do",{str:"create_date-desc",type:a},function(data){
				$.each(data,function(i,n){
					alert(i+","+n);
				});
			})
		}) */
		
		
		/* $("#1").click(function(){
			var v=$(this).text();
			$("#testTop").text(v);
		}) */
	
	})
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

<div class="container productList">

		<!-- 左侧商品列表及热销商品  -->
		<div class="span6">
		<div class="hotProductCategory">
			<c:forEach items="${list }" var="l" >
						<dl>
							<dt>
								<a id="${l.id }" href="${pageContext.request.contextPath }/hc/main.do?type=${l.id}">${l.name}</a>
							</dt>
							<c:forEach items="${l.list}" var="ll" begin="0" end="3">
									<dd>
										<a href="${pageContext.request.contextPath }/hc/main.do?type=${l.id}&temp=${ll.id}">${ll.name }</a>
									</dd>
							</c:forEach>
						</dl>
			</c:forEach>
		</div>
			
			<div class="hotProduct">
				<div class="title">热销商品</div>
				<ul>
								<li>
									<a href="/shopxx/product/content/201705/300.html" title="尚都比拉女装2013夏装新款蕾丝连衣裙 韩版修身雪纺打底裙子 春款">尚都比拉女装2013夏装新款蕾丝连</a>
									<div>销售价: <strong>￥298.00元</strong></div>
									<div>月销量: <em>0</em></div>
								</li>
								<li>
									<a href="/shopxx/product/content/201705/298.html" title="尚都比拉2013夏装新款淑女装 春款森女系 碎花修身短袖蕾丝连衣裙">尚都比拉2013夏装新款淑女装 春款</a>
										<div>
											<div>评分: </div>
											<div class="score8"></div>
											<div>4.0</div>
										</div>
									<div>销售价: <strong>￥289.00元</strong></div>
									<div>月销量: <em>0</em></div>
								</li>
								
				</ul>
			</div>
		</div>
		
		<div class="span18 last">
		
			<!-- 头信息  -->
			
			<div id="div1" class="path">
				<ul>
					<li>
						<a href="${pageContext.request.contextPath }/hc/index.do">首页</a>
					</li>
						<li id="testTop1" class="last">
							搜索
						</li>
				</ul>
			</div>
			
					<!-- 筛选列表 -->
					<c:if test="${type!=null}">
					<div id="div2" class="filter">
						<div class="title">筛选商品</div>
						<div class="content clearfix">
								<dl class="last">
									<dt>分类:</dt>
									<c:forEach items="${list }" var="l" begin="${type-1}" end="${type-1}">
										<c:forEach items="${l.list}" var="ll" >
											<dd>
												<a href="${pageContext.request.contextPath }/hc/main.do?type=${l.id}&temp=${ll.id}">${ll.name }</a>
											</dd>
										</c:forEach> 
									</c:forEach>
									
										
									<dd class="moreOption" title="更多">&nbsp;</dd>
								</dl>
						</div>
						<div id="moreFilter" class="moreFilter">
								&nbsp;
						</div>
					</div>
					</c:if>
					
					
				<!-- 所有查询标签  -->
				<c:if test="${page.rows!='[]'}" >
				<div id="div3" class="bar">
					<div id="layout" class="layout">
						<label>布局:</label>
						<a href="javascript:;" id="tableType" class="tableType">
							<span>&nbsp;</span>
						</a>
						<a href="javascript:;" id="listType" class="listType">
							<span>&nbsp;</span>
						</a>
						<label>数量:</label>
						<a href="javascript:;" class="size current" pageSize="20">
							<span>20</span>
						</a>
						<a href="javascript:;" class="size" pageSize="40">
							<span>40</span>
						</a>
						<a href="javascript:;" class="size" pageSize="80">
							<span>80</span>
						</a>
						<span class="page">
							<label>共${fn:length(listShop)}个商品 </label>
									<!-- <a href="javascript:;" id="nextPage" class="nextPage">
										<span>下一页</span>
									</a> -->
						</span>
					</div>
					<div id="sort" class="sort">
						<div id="orderSelect" class="orderSelect">
								<span id="sort" >置顶降序</span>
							<div class="popupMenu">
								<ul>
										<li>
											<a href="${pageContext.request.contextPath }/sortShop/search.do?str=is_top-desc&keyword=${keyword}" id="topDesc">置顶降序</a>
										</li>
										<li>
											<a href="${pageContext.request.contextPath }/sortShop/search.do?str=price-asc&keyword=${keyword}" id="priceAsc">价格升序</a>
										</li>
										<li>
											<a href="${pageContext.request.contextPath }/sortShop/search.do?str=price-desc&keyword=${keyword}" id="priceDesc">价格降序</a>
										</li>
										<li>
											<a href="${pageContext.request.contextPath }/sortShop/search.do?str=sales-desc&keyword=${keyword}" id="salesDesc">销量降序</a>
										</li>
										<li>
											<a href="${pageContext.request.contextPath }/sortShop/search.do?str=score-desc&keyword=${keyword}" id="scoreDesc">评分降序</a>
										</li>
										<li>
											<a href="${pageContext.request.contextPath }/sortShop/search.do?str=modify_date-desc&keyword=${keyword}" id="dateDesc">日期降序</a>
										</li>
								</ul>
							</div>
						</div>
						<!-- orderType="priceAsc" -->
						<a id="price" href="javascript:;" class="desc" >价格</a>
						<!-- orderType="salesDesc" -->
						<a id="sales" href="javascript:;" class="desc" >销量</a>
						<!-- orderType="scoreDesc" -->
						<a id="score" href="javascript:;" class="desc" >评分</a>
						<input type="text" id="startPrice" name="startPrice" class="startPrice" value="" maxlength="16" title="价格过滤最低价格" onpaste="return false" />-<input type="text" id="endPrice" name="endPrice" class="endPrice" value="" maxlength="16" title="价格过滤最高价格" onpaste="return false" />
						<button id="btn">确&nbsp;&nbsp;定</button>
					</div>
					<div class="tag">
						<label>只查看:</label>
								<label>
									<input id="tag1" type="checkbox" name="tagIds" value="1" />热销
								</label>
								<label>
									<input id="tag2" type="checkbox" name="tagIds" value="2" />最新
								</label>
					</div>
				</div>
				<!-- 返回数据列表 -->
				<div id="div4" class="result table clearfix" >
						<ul id="shopList">
							<c:forEach items="${page.rows}" var="l">
									<li>
										<a href="${pageContext.request.contextPath }/shopContent/shop.do?id=${l.id }">
										<!-- data-original="http://storage.shopxx.net/demo-image/3.0/201301/0ff130db-0a1b-4b8d-a918-ed9016317009-thumbnail.jpg" -->
											<img src="${l.image }" width="170" height="170"  />
											<span id="price" class="price">
											￥<fmt:formatNumber value="${l.price}" maxFractionDigits="4" minFractionDigits="2"></fmt:formatNumber>
													<del>￥<fmt:formatNumber value="${l.marketPrice}" maxFractionDigits="4" minFractionDigits="2"></fmt:formatNumber></del>
											</span>
											<span title="${l.name }">${l.name }</span>
										</a>
									</li>
							</c:forEach>
						</ul>
				</div>
					<itcast:page url="${pageContext.request.contextPath }/search/searchAll.do" />
				</c:if>
				<c:if test="${page.rows=='[]'}">
					<div id="result" class="result table clearfix">
						<dl>
							<dt>对不起，没有找到符合您检索条件的商品</dt>
							<dd>1、请确认设置的检索条件是否正确</dd>
							<dd>2、可尝试修改检索条件，以获得更多的搜索结果</dd>
						</dl>
					</div>
				</c:if>
				
				
				
		</div>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>