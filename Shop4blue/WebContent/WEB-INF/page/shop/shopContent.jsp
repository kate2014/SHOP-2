<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title> - Powered By SHOP++</title>
	<meta name="author" content="SHOP++ Team" />
	<meta name="copyright" content="SHOP++" />
<link href="${pageContext.request.contextPath}/resources/shop/css/common.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/shop/css/product.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/shop/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/shop/js/jquery.tools.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/shop/js/jquery.jqzoom.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/shop/js/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/shop/js/common.js"></script>
<script type="text/javascript">
//添加到货通知
function reg(){
	$.ajax({
		url: "${pageContext.request.contextPath}/gmessage/add",
		type: "POST",
		data: {productId:${xxProduct.id} , email: $("#email").val(),userid:${user.id}},
		dataType: "json",
		cache: false,
		success: function(data) {
			if(data=="success"){
				alert("添加成功！")
			}
		}
})
}

</script>
<script type="text/javascript">
$().ready(function() {

	var $historyProduct = $("#historyProduct ul");
	var $clearHistoryProduct = $("#clearHistoryProduct");
	var $zoom = $("#zoom");
	var $scrollable = $("#scrollable");
	var $thumbnail = $("#scrollable a");
	var $specification = $("#specification dl");
	var $specificationTitle = $("#specification div");
	var $specificationValue = $("#specification a");
	var $productNotifyForm = $("#productNotifyForm");
	var $productNotify = $("#productNotify");
	var $productNotifyEmail = $("#productNotify input");
	var $addProductNotify = $("#addProductNotify");
	var $quantity = $("#quantity");
	var $increase = $("#increase");
	var $decrease = $("#decrease");
	var $addCart = $("#addCart");
	var $addFavorite = $("#addFavorite");
	var $window = $(window);
	var $bar = $("#bar ul");
	var $introductionTab = $("#introductionTab");
	var $parameterTab = $("#parameterTab");
	var $reviewTab = $("#reviewTab");
	var $consultationTab = $("#consultationTab");
	var $introduction = $("#introduction");
	var $parameter = $("#parameter");
	var $review = $("#review");
	var $addReview = $("#addReview");
	var $consultation = $("#consultation");
	var $addConsultation = $("#addConsultation");
	var barTop = $bar.offset().top;
	var productMap = {};
	
 	var product = ${product};
	var listSize= ${listTwinSize};
	var listTwin= ${listTwin};
    
    productMap[0]={ path: "", specificationValues: [ product.first,product.second  ] };
	
	 $.each(listTwin,function(i,e){
		 productMap[i+1] = { path: "", specificationValues: [ e.first, e.second ] };
	 })   
	   
	
	// 锁定规格值
	lockSpecificationValue();
	
	// 商品图片放大镜
	$zoom.jqzoom({
		zoomWidth: 368,
		zoomHeight: 368,
		title: false,
		showPreload: false,
		preloadImages: false
	});
	
	// 商品缩略图滚动
	$scrollable.scrollable();
	
	$thumbnail.hover(function() {
		var $this = $(this);
		if ($this.hasClass("current")) {
			return false;
		} else {
			$thumbnail.removeClass("current");
			$this.addClass("current").click();
		}
	});
	
	// 规格值选择
	$specificationValue.click(function() {
		var $this = $(this);
		if ($this.hasClass("locked")) {
			return false;
		}
		$this.toggleClass("selected").parent().siblings().children("a").removeClass("selected");
		var selectedIds = new Array();
		$specificationValue.filter(".selected").each(function(i) {
			selectedIds[i] = $(this).attr("val");
		});
		var locked = true;
		$.each(productMap, function(i, product) {
			if (product.specificationValues.length == selectedIds.length && contains(product.specificationValues, selectedIds)) {
				if (product.path != null) {
					//location.href 
					locked = false;
				}
				return false;
			}
		});
		if (locked) {
			lockSpecificationValue();
		}
		$specificationTitle.hide();
		return false;
	});
	
	// 锁定规格值
	function lockSpecificationValue() {
		var selectedIds = new Array();
		$specificationValue.filter(".selected").each(function(i) {
			selectedIds[i] = $(this).attr("val");
		});
		$specification.each(function(i,e) {
			var $this = $(this);
			var selectedId = $this.find("a.selected").attr("val");
			if(i==0){
				var otherIds=new Array();
			}
			else{
				var otherIds = $.grep(selectedIds, function(n, i) {
					return n != selectedId;
				}); 
			}
			$this.find("a").each(function() {
				var $this = $(this);
				otherIds.push($this.attr("val"));
				var locked = true;
				$.each(productMap, function(i, product) {
					if (contains(product.specificationValues, otherIds)) {
						locked = false;
						return false;
					}
				});
				if (locked) {
					$this.addClass("locked");
				} else {
					$this.removeClass("locked");
				}
				otherIds.pop();
			});
		});
	}
	
	// 判断是否包含
	function contains(array, values) {
		var contains = false;
		var temp=0;
		for(j in array){
			for(i in values){
				if(array[j]==values[i]){
					temp++;
				}
			}
		}
		if(temp==values.length){
			contains=true;
		}
		return contains;
	}
	

	
	//到货通知
	$addProductNotify.click(function(){
		$("#addProductNotify").remove()
		$(".buy").append("<input type='text' id='email' value='${user.email}' /><input type='button' onclick='reg()' id='register' value='确认登记' class='addProductNotify'/>")
	})
	
	// 到货通知
	/* $addProductNotify.click(function() {
			var specificationValueIds = new Array();
			$specificationValue.filter(".selected").each(function(i) {
				specificationValueIds[i] = $(this).attr("val");
			});
			if (specificationValueIds.length != 2) {
				$specificationTitle.show();
				return false;
			}
		if ($addProductNotify.val() == "到货通知我") {
			$addProductNotify.val("确定登记");
			$productNotify.show();
			$productNotifyEmail.focus();
			if ($.trim($productNotifyEmail.val()) == "") {
				$.ajax({
					url: "/shopxx/product_notify/email.jhtml",
					type: "GET",
					dataType: "json",
					cache: false,
					success: function(data) {
						$productNotifyEmail.val(data.email);
					}
				});
			}
		} else {
			$productNotifyForm.submit();
		}
		return false;
	}); */
	
	// 到货通知表单验证
	/* $productNotifyForm.validate({
		rules: {
			email: {
				required: true,
				email: true
			}
		},
		submitHandler: function(form) {
			$.ajax({
				url: "/shopxx/product_notify/save.jhtml",
				type: "POST",
				data: {productId: 341, email: $productNotifyEmail.val()},
				dataType: "json",
				cache: false,
				beforeSend: function() {
					$addProductNotify.prop("disabled", true);
				},
				success: function(data) {
					if (data.message.type == "success") {
						$addProductNotify.val("到货通知我");
						$productNotify.hide();
					}
					$.message(data.message);
				},
				complete: function() {
					$addProductNotify.prop("disabled", false);
				}
			});
		}
	}); */
	
	// 购买数量
	$quantity.keypress(function(event) {
		var key = event.keyCode ? event.keyCode : event.which;
		if ((key >= 48 && key <= 57) || key==8) {
			return true;
		} else {
			return false;
		}
	});
	
	// 增加购买数量
	$increase.click(function() {
		var quantity = $quantity.val();
		if (/^\d*[1-9]\d*$/.test(quantity)) {
			$quantity.val(parseInt(quantity) + 1);
		} else {
			$quantity.val(1);
		}
	});
	
	// 减少购买数量
	$decrease.click(function() {
		var quantity = $quantity.val();
		if (/^\d*[1-9]\d*$/.test(quantity) && parseInt(quantity) > 1) {
			$quantity.val(parseInt(quantity) - 1);
		} else {
			$quantity.val(1);
		}
	});
	
	// 加入购物车
	$addCart.click(function() {
			var specificationValueIds = new Array();
			$specificationValue.filter(".selected").each(function(i) {
				specificationValueIds[i] = $(this).attr("val");
			});
			if (specificationValueIds.length != 2) {
				$specificationTitle.show();
				return false;
			}
		var quantity = $quantity.val();
		if (/^\d*[1-9]\d*$/.test(quantity) && parseInt(quantity) > 0) {
			$.ajax({
				url: "${pageContext.request.contextPath}/cart/add",
				type: "POST",
				data: {id: ${xxProduct.id}, quantity: quantity},
				dataType: "json",
				cache: false,
				success: function(message) {
					alert(message); 
					//$.message(message);
				}
			});
		} else {
			$.message("warn", "购买数量必须为正整数");
		}
	});
	
	// 添加商品收藏
	$addFavorite.click(function() {
		$.ajax({
			url: "${pageContext.request.contextPath}/webcollect/add",
			type: "POST",
			data: {id: ${xxProduct.id},userid:${user.id}},
			dataType: "json",
			cache: false,
			success: function(message) {
				//$.message(message);
				if(message=="success"){alert("收藏成功！")}
			}
		});
		return false;
	});
	
	$window.scroll(function() {
		var scrollTop = $(this).scrollTop();
		if (scrollTop > barTop) {
			if (window.XMLHttpRequest) {
				$bar.css({position: "fixed", top: 0});
			} else {
				$bar.css({top: scrollTop});
			}
			var introductionTop = $introduction.size() > 0 ? $introduction.offset().top - 36 : null;
			var parameterTop = $parameter.size() > 0 ? $parameter.offset().top - 36 : null;
			var reviewTop = $review.size() > 0 ? $review.offset().top - 36 : null;
			var consultationTop = $consultation.size() > 0 ? $consultation.offset().top - 36 : null;
			if (consultationTop != null && scrollTop >= consultationTop) {
				$bar.find("li").removeClass("current");
				$consultationTab.addClass("current");
			} else if (reviewTop != null && scrollTop >= reviewTop) {
				$bar.find("li").removeClass("current");
				$reviewTab.addClass("current");
			} else if (parameterTop != null && scrollTop >= parameterTop) {
				$bar.find("li").removeClass("current");
				$parameterTab.addClass("current");
			} else if (introductionTop != null && scrollTop >= introductionTop) {
				$bar.find("li").removeClass("current");
				$introductionTab.addClass("current");
			}
		} else {
			$bar.find("li").removeClass("current");
			$bar.css({position: "absolute", top: barTop});
		}
	});
	
		// 发表商品评论
		$addReview.click(function() {
			if ($.checkLogin()) {
				return true;
			} else {
				$.redirectLogin("/shopxx/review/add/341.jhtml", "必须登录后才能发表商品评论");
				return false;
			}
		});
	
		// 发表商品咨询
		$addConsultation.click(function() {
			if ($.checkLogin()) {
				return true;
			} else {
				$.redirectLogin("/shopxx/consultation/add/341.jhtml", "必须登录后才能发表商品咨询");
				return false;
			}
		});
	
	// 浏览记录
	var historyProduct = getCookie("historyProduct");
	var historyProductIds = historyProduct != null ? historyProduct.split(",") : new Array();
	for (var i = 0; i < historyProductIds.length; i ++) {
		if (historyProductIds[i] == "341") {
			historyProductIds.splice(i, 1);
			break;
		}
	}
	historyProductIds.unshift("341");
	if (historyProductIds.length > 6) {
		historyProductIds.pop();
	}
	addCookie("historyProduct", historyProductIds.join(","), {path: "/shopxx/"});
	$.ajax({
		url: "/shopxx/product/history.jhtml",
		type: "GET",
		data: {ids: historyProductIds},
		dataType: "json",
		traditional: true,
		cache: false,
		success: function(data) {
			$.each(data, function (index, product) {
				var thumbnail = product.thumbnail != null ? product.thumbnail : "/upload/image/default_thumbnail.jpg";
				$historyProduct.append('<li><img src="' + thumbnail + '" \/><a href="/shopxx' + product.path + '">' + product.name + '<\/a><span>' + currency(product.price, true) + '<\/span><\/li>');
			});
		}
	});
	
	// 清空浏览记录
	$clearHistoryProduct.click(function() {
		$historyProduct.empty();
		$(this).text("暂无记录");
		removeCookie("historyProduct", {path: "/shopxx/"});
	});
	
	// 点击数
	$.ajax({
		url: "/shopxx/product/hits/341.jhtml",
		type: "GET"
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
		<div class="container productContent">
		<div class="span6">
		<div class="hotProductCategory">
			<c:forEach items="${list }" var="l" >
						<dl>
							<dt>
								<a id="${l.id }" href="${pageContext.request.contextPath }/hc/main?type=${l.id}">${l.name}</a>
							</dt>
							<c:forEach items="${l.list}" var="ll" begin="0" end="3">
									<dd>
										<a href="${pageContext.request.contextPath }/hc/main?type=${l.id}&temp=${ll.id}">${ll.name }</a>
									</dd>
							</c:forEach>
						</dl>
			</c:forEach>
		</div>
			<div class="hotProduct">
				<div class="title">热销商品</div>
				<ul>
								<li>
									<a href="#" title="尚都比拉女装2013夏装新款蕾丝连衣裙 韩版修身雪纺打底裙子 春款">尚都比拉女装2013夏装新款蕾丝连</a>
									<div>销售价: <strong>￥298.00元</strong></div>
									<div>月销量: <em>0</em></div>
								</li>
								<li>
									<a href="#" title="尚都比拉2013夏装新款淑女装 春款森女系 碎花修身短袖蕾丝连衣裙">尚都比拉2013夏装新款淑女装 春款</a>
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
			<div class="path">
				<ul>
					<li>
						<a href="${pageContext.request.contextPath }/hc/index">首页</a>
					</li>
						<li id="testTop1" >
							<a href="${pageContext.request.contextPath }/hc/main?type=${xxpc.id}">${xxpc.name }</a>
						</li>
						<li id="testTop2" class="last">${xxpcs.name }</li>
				</ul>
			</div>
			<div class="productImage">
					<a id="zoom" href="${xxProduct.image }" rel="gallery">
						<img class="medium" src="${xxProduct.image }" />
					</a>
				<a href="javascript:;" class="prev"></a>
				<div id="scrollable" class="scrollable">
					<div class="items">
								<a class="current" href="javascript:;" rel="{gallery: 'gallery', smallimage: '${xxProduct.image }', largeimage: '${xxProduct.image }" title="" /></a>
								<a href="javascript:;" rel="{gallery: 'gallery', smallimage: '${xxProduct.image }', largeimage: '${xxProduct.image }'}">
								<img src="${xxProduct.image }" title="" /></a>
					</div>
				</div>
				<a href="javascript:;" class="next"></a>
			</div>
			<div class="name">${xxProduct.name }</div>
			<div class="sn">
				<div>编号:${xxProduct.sn }</div>
			</div>
			<div class="info">
				<dl>
					<dt>销售价:</dt>
					<dd>
						<strong>￥<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${xxProduct.price }"/></strong>
							市场价:
							<del>￥<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${xxProduct.marketPrice }"/></del>
					</dd>
				</dl>
					<dl>
						<dt>促销:</dt>
						<dd>
								<a href="/shopxx/promotion/content/2.jhtml" target="_blank">双倍积分</a>
						</dd>
					</dl>
					<dl>
						<dt>赠送积分:</dt>
						<dd>
							<span><fmt:formatNumber maxFractionDigits="2" minFractionDigits="0" value="${xxProduct.price }"/></span>
						</dd>
					</dl>
			</div>
				<div class="action">
						<%-- <div style="display:none ">
							<c:forEach items="${listMap }" var="lm">
								<span>${lm.color} </span>
								<input id="">
							</c:forEach>
						</div> --%>
						<div id="specification" class="specification clearfix">
							<div class="title">请选择商品规格</div>
							<c:forEach	items="${listStyle }" var="l">
								<c:if test="${l=='颜色'}">
								
								 <dl>
								<c:if test="${listColor!=null }">
									<dt>
										<span title="颜色">颜色:</span>
									</dt>
									 <c:forEach items="${listColor }" var="lc" varStatus="v">
											<dd>
											
												<a href="javascript:;" class="image <c:if test="${lc.id==mp.first }">selected</c:if> " val="${lc.id }"><img src="" alt="${lc.name }" title="${lc.name }" /><span title="点击取消选择">&nbsp;</span></a>
											</dd>
									</c:forEach> 
											
								</c:if>
								</dl>  
								<!-- <dl>
									<dt>
										<span title="颜色">颜色:</span>
									</dt>
											<dd>
												<a href="javascript:;" class="image selected" val="12"><img src="http://storage.shopxx.net/demo-image/3.0/specification/12.gif" alt="粉红色" title="粉红色" /><span title="点击取消选择">&nbsp;</span></a>
											</dd>
											<dd>
												<a href="javascript:;" class="image" val="8"><img src="http://storage.shopxx.net/demo-image/3.0/specification/12.gif" alt="hei色" title="hei色" /><span title="点击取消选择">&nbsp;</span></a>
											</dd>
											<dd>
												<a href="javascript:;" class="image" val="11"><img src="http://storage.shopxx.net/demo-image/3.0/specification/12.gif" alt="hong色" title="hong色" /><span title="点击取消选择">&nbsp;</span></a>
											</dd>
								</dl> -->
								
								
								
								
								</c:if>
								<c:if test="${l=='尺码' }">
								<dl>
								<c:if test="${listSize!=null }">
									<dt>
										<span title="尺码">尺码:</span>
									</dt>
									 <c:forEach items="${listSize }" var="ls" varStatus="v">
											<dd>
												<a href="javascript:;" class="text <c:if test="${ls.id==mp.second }">selected</c:if> " val="${ls.id }">${ls.name }<span title="点击取消选择">&nbsp;</span></a>
											</dd>
									</c:forEach> 
									
								</c:if>
								</dl>
								</c:if>
							
							</c:forEach>
								
								
								
										<!-- 	
											<dd>
												<a href="javascript:;" class="text selected" val="45">M<span title="点击取消选择">&nbsp;</span></a>
											</dd>
											<dd>
												<a href="javascript:;" class="text" val="46">L<span title="点击取消选择">&nbsp;</span></a>
											</dd>
											<dd>
												<a href="javascript:;" class="text" val="47">XL<span title="点击取消选择">&nbsp;</span></a>
											</dd> -->
								
						</div>
						<dl class="quantity">
							<dt>购买数量:</dt>
							<dd>
								<input type="text" id="quantity" name="quantity" value="1" maxlength="4" onpaste="return false;" />
								<div>
									<span id="increase" class="increase">&nbsp;</span>
									<span id="decrease" class="decrease">&nbsp;</span>
								</div>
							</dd>
							<dd>
								件
							</dd>
						</dl>
					<div class="buy">
						<c:if test="${xxProduct.stock==null||xxProduct.stock>0 }">
							<input type="button" id="addCart" class="addCart" value="加入购物车" />
						</c:if>
						<c:if test="${xxProduct.stock!=null&&xxProduct.stock==0 }">
							<input type="button" id="addProductNotify" class="addProductNotify" value="到货通知我" />
						</c:if>
						<a href="javascript:;" id="addFavorite">收藏商品</a>
					</div>
				</div>
			<div id="bar" class="bar">
				<ul>
						<li id="introductionTab">
							<a href="#introduction">商品介绍</a>
						</li>
						<li id="parameterTab">
							<a href="#parameter">商品参数</a>
						</li>
						<li id="reviewTab">
							<a href="#review">商品评论</a>
						</li>
						<li id="consultationTab">
							<a href="#consultation">商品咨询</a>
						</li>
				</ul>
			</div>
				<!-- <table class="brief">
							<tr>
						<th>板型</th>
						<td>
							<span title="修身型">修身型</span>
						</td>
						<th>面料主成分含量</th>
						<td>
							<span title="81%-90%">81%-90%</span>
						</td>
						<th>面料分类</th>
						<td>
							<span title="涤纶">涤纶</span>
						</td>
							</tr>
							<tr>
						<th>款式细节</th>
						<td>
							<span title="纽扣 纱网">纽扣 纱网</span>
						</td>
						<th>图案</th>
						<td>
							<span title="纯色">纯色</span>
						</td>
						<th>衣门襟</th>
						<td>
							<span title="一粒扣">一粒扣</span>
						</td>
							</tr>
				</table> -->
				${listStyle }
				<div id="introduction" name="introduction" class="introduction">
					<div class="title">
						<strong>商品介绍</strong>
					</div>
					<div>
						<img src="${xxProduct.introduction }" />
					</div>
				</div>
				<div id="parameter" name="parameter" class="parameter">
					<div class="title">
						<strong>商品参数</strong>
					</div>
					<table>
							<tr>
								<th class="group" colspan="2">基本参数</th>
							</tr>
								<c:forEach items="${xxProduct.parameterValue}" var="xp">
									<tr>
										<th>${xp.xxparameter.name }</th>
										<td>${xp.parameterValue }</td>
									</tr>
								</c:forEach>
									
					</table>
				</div>
				<div id="review" name="review" class="review">
					<div class="title">商品评论</div>
					<div class="content clearfix">
							<p>
								暂无商品评论信息 <a href="/shopxx/review/add/204.jhtml" id="addReview">[发表商品评论]</a>
							</p>
					</div>
				</div>
				<div id="consultation" name="consultation" class="consultation">
					<div class="title">商品咨询</div>
					<div class="content">
								<p>
									暂无商品咨询信息 <a href="/shopxx/consultation/add/204.jhtml" id="addConsultation">[发表商品咨询]</a>
								</p>
					</div>
				</div>
		</div>
	</div>
<%@include file="footer.jsp" %>
</body>
</html>