<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>添加快递单模板 - Powered By SHOP++</title>
<meta name="author" content="SHOP++ Team" />
<meta name="copyright" content="SHOP++" />
<link href="${pageContext.request.contextPath}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/jquery.event.drag.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/input.js"></script>
<style type="text/css">
div.popupMenu {
	height: 300px;
	padding: 2px;
	overflow: auto;
	z-index: 1000000;
}

.container {
	width: ${xdt.width}px;
	height: ${xdt.height}px;
	position: relative;
	overflow: hidden;
	border: 1px solid #dde9f5;
	[#if xdt.background??]
		background: url(${xdt.background}) 0px 0px no-repeat;
	[/#if]
}

.container .item {
	line-height: 20px;
	float: left;
	position: absolute;
	top: 0px;
	left: 0px;
	color: #666666;
	overflow: hidden;
	word-wrap: break-word;
	filter: alpha(opacity = 80);
	-moz-opacity: 0.8;
	opacity: 0.8;
	border: 1px dotted #999999;
	background: #ffffff;
}

.container .selected {
	filter: alpha(opacity = 100);
	-moz-opacity: 1;
	opacity: 1;
	border: 1px solid #dde9f5;
}

.container pre {
	height: 100%;
	float: left;
	cursor: move;
}

.container textarea {
	padding-left: 0px;
	margin: 0px;
	font-size: 12px;
	resize: none;
	outline: none;
	overflow: hidden;
	border: none;
}

.container .resize {
	height: 6px;
	width: 6px;
	position: absolute;
	bottom: 0px;
	right: 0px;
	overflow: hidden;
	cursor: nw-resize;
	background-color: #aaaaaa;
}
</style>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	var $content = $("#content");
	var $addTag = $("#addTag");
	var $tagOption = $("#tagOption a");
	var $deleteTag = $("#deleteTag");
	var $container = $("#container");
	var $browserButton = $("#browserButton");
	var $background = $("#background");
	var $width = $("#width");
	var $height = $("#height");
	var zIndex = 1;
	
	
	
	bind($container.find("div.item"));
	
	// 添加标签
	$addTag.mouseover(function() {
		var $this = $(this);
		var offset = $this.offset();
		var $menuWrap = $this.closest("div.menuWrap");
		var $popupMenu = $menuWrap.children("div.popupMenu");
		$popupMenu.css({left: offset.left, top: offset.top + $this.height() + 2}).show();
		$menuWrap.mouseleave(function() {
			$popupMenu.hide();
		});
	});
	
	// 标签选项
	$tagOption.click(function() {
		var $this = $(this);
		var value = $this.attr("name");
		if (value != "") {
			bind($('<div class="item"><pre>' +"$"+ value + '<\/pre><div class="resize"><\/div><\/div>').appendTo($container));
		}
		$this.closest("div.popupMenu").hide();
		return false;
	});
	
	// 绑定
	function bind($item) {
		$item.drag("start", function(ev, dd) {
			var $this = $(this);
			dd.width = $this.width();
			dd.height = $this.height();
			dd.limit = {
				right: $container.innerWidth() - $this.outerWidth(),
				bottom: $container.innerHeight() - $this.outerHeight()
			};
			dd.isResize = $(ev.target).hasClass("resize");
		}).drag(function(ev, dd) {
			var $this = $(this);
			if (dd.isResize) {
				$this.css({
					width: Math.max(20, Math.min(dd.width + dd.deltaX, $container.innerWidth() - $this.position().left) - 2),
					height: Math.max(20, Math.min(dd.height + dd.deltaY, $container.innerHeight() - $this.position().top) - 2)
				}).find("textarea").blur();
			} else {
				$this.css({
					top: Math.min(dd.limit.bottom, Math.max(0, dd.offsetY)),
					left: Math.min(dd.limit.right, Math.max(0, dd.offsetX))
				});
			}
		}, {relative: true}).mousedown(function() {
			$(this).css("z-index", zIndex++);
		}).click(function() {
			var $this = $(this);
			$container.find("div.item").not($this).removeClass("selected");
			$this.toggleClass("selected");
		}).dblclick(function() {
			var $this = $(this);
			if ($this.find("textarea").size() == 0) {
				var $pre = $this.find("pre");
				var value = $pre.hide().text($pre.html()).html();
				$('<textarea>' + value + '<\/textarea>').replaceAll($pre).width($this.innerWidth() - 6).height($this.innerHeight() - 6).blur(function() {
					var $this = $(this);
					$this.replaceWith('<pre>' + $this.val() + '<\/pre>');
				}).focus();
			}
		});
	}
	
	// 删除标签
	$deleteTag.click(function() {
		$container.find("div.selected").remove();
		return false;
	});
	// 表单验证
	$inputForm.validate({
		rules: {
			name: "required",
			width: {
				required: true,
				integer: true,
				min: 1
			},
			height: {
				required: true,
				integer: true,
				min: 1
			},
			offsetX: {
				required: true,
				integer: true
			},
			offsetY: {
				required: true,
				integer: true
			}
		},
		submitHandler: function(form) {
			if ($.trim($container.html()) == "") {
				$.message("warn", "内容不允许为空");
				return false;
			}
			$content.val($container.html());
			form.submit();
		}
	});
	/* // 单据背景图
	$browserButton.browser({
		callback: function(url) {
			$container.css({
				background: "url(" + url + ") 0px 0px no-repeat"
			});
		}
	});
	
	$background.bind("input propertychange change", function() {
		$container.css({
			background: "url(" + $background.val() + ") 0px 0px no-repeat"
		});
	}); */
	
	// 宽度
	$width.bind("input propertychange change", function() {
		$container.width($width.val());
	});
	
	// 高度
	$height.bind("input propertychange change", function() {
		$container.height($height.val());
	});
	
	

});
</script>
<script >
$(function(){
	//点击出发文件域
                            	
		   //图片发生改变时就会触发这个函数
		   $("#file").change(function(){
			   
			   //formdata对象，用来模拟表单 只对文件进行处理 
			   var formData=new FormData($("#inputForm")[0]);
			   $.ajax({
				   url:"${pageContext.request.contextPath}/orderExpressModel/uploadPic",
				   type:"post",
				   data:formData,
				   //请求是否异步
				   async:false,
				   cache:false,
				   //FormData值是FormData对象 不需要做数据的处理
				   processData:false,
				   //enctype="multipart/form-data"
				   contentType:false,
				   //请求成功 将数据返回给页面
				   success:function(data){
					  // $("#container").css({background:"url("+data+")"});
					   alert(data);
					   $("#background").attr("value","/pic/"+data);
					   $("#container").css({
							background: "url(/pic/" + data + ") 0px 0px no-repeat"
						});
				   }
			   })
		   })
		   $("#pic").click(function(){
			   //应该在这里加上ajax 来删除ajax上传的图片
			   $("#background").attr("value","");
			   $("#container").css({
					background: ""
				});
		   })
})
</script>
</head>
<body>
	<div class="path">
		<a href="${pageContext.request.contextPath}/resources/admin/common/index.jhtml">首页</a> &raquo; 添加快递单模板
	</div><%--  --%>
	<form id="inputForm" action="${pageContext.request.contextPath}/orderExpressModel/editExpressModel" method="post" enctype="multipart/form-date">
		<input type="hidden" name="id" value="${xdt.id}" />
		<input type="hidden" id="content" name="content" />
		<input type="hidden" name="createDate" value="${xdt.createDate }"/>
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>名称:
				</th>
				<td>
					<input type="text" name="name" class="text" value="${xdt.name}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					操作:
				</th>
				<td>
					<div class="menuWrap">
						<a href="javascript:;" id="addTag" class="button">添加标签</a>
						<div class="popupMenu">
							<ul id="tagOption">
								<li>
								
									<a href="javascript:;"  name="{deliveryCenter.name}" val="${deliveryCenter.name}">发货点 - 名称</a>
								</li>
								<li>
									<a href="javascript:;"  name="{deliveryCenter.contact}" val="${deliveryCenter.contact}">发货点 - 联系人</a>
								</li>
								<li>
									<a href="javascript:;"  name="{deliveryCenter.areaName}"val="${deliveryCenter.areaName}">发货点 - 地区</a>
								</li>
								<li>
									<a href="javascript:;"  name="{deliveryCenter.address}"val="${deliveryCenter.address}">发货点 - 地址</a>
								</li>
								<li>
									<a href="javascript:;" name="{deliveryCenter.zipCode}" val="${deliveryCenter.zipCode}">发货点 - 邮编</a>
								</li>
								<li>
									<a href="javascript:;"  name="{deliveryCenter.phone}"val="${deliveryCenter.phone}">发货点 - 电话</a>
								</li>
								<li>
									<a href="javascript:;" name="{deliveryCenter.mobile}" val="${deliveryCenter.mobile}">发货点 - 手机</a>
								</li>
								<li>
									<a href="javascript:;"  name="{order.consignee}"val="${order.consignee}">收货人 - 姓名</a>
								</li>
								<li>
									<a href="javascript:;" name="{order.areaName}" val="${order.areaName}">收货人 - 地区</a>
								</li>
								<li>
									<a href="javascript:;" name="{order.address}" val="${order.address}">收货人 - 地址</a>
								</li>
								<li>
									<a href="javascript:;" name="{order.zipCode}" val="${order.zipCode}">收货人 - 邮编</a>
								</li>
								<li>
									<a href="javascript:;"  name="{order.phone}"val="${order.phone}">收货人 - 电话/手机</a>
								</li>
								<li>
									<a href="javascript:;" name="{order.sn}" val="${order.sn}">订单 - 订单编号</a>
								</li>
								<li>
									<a href="javascript:;"  name="{order.freight}"val="${order.freight}">订单 - 配送费用</a>
								</li>
								<li>
									<a href="javascript:;" name="{order.fee}" val="${order.fee}">订单 - 手续费</a>
								</li>
								<li>
									<a href="javascript:;" name="{order.amountPaid}" val="${order.amountPaid}">订单 - 已支付费用</a>
								</li>
								<li>
									<a href="javascript:;" name="{order.weight}" val="${order.weight}">订单 - 总商品重量</a>
								</li>
								<li>
									<a href="javascript:;" name="{order.quantity}" val="${order.quantity}">订单 - 总商品数量</a>
								</li>
								<li>
									<a href="javascript:;" name="{currency(order.amount, true)}" val="<%-- ${currency(order.amount, true)} --%>">订单 - 订单总额</a>
								</li>
								<li>
									<a href="javascript:;" name="{order.memo}" val="${order.memo}">订单 - 附言</a>
								</li>
								<li>
									<a href="javascript:;" name="{setting.siteName}" val="${setting.siteName}">网站 - 名称</a>
								</li>
								<li>
									<a href="javascript:;"  name="{setting.siteUrl}"val="${setting.siteUrl}">网站 - 网址</a>
								</li>
								<li>
									<a href="javascript:;"  name="{setting.address}"val="${setting.address}">网站 - 联系地址</a>
								</li>
								<li>
									<a href="javascript:;"  name="{setting.phone}"val="${setting.phone}">网站 - 电话</a>
								</li>
								<li>
									<a href="javascript:;"  name="{setting.zipCode}"val="${setting.zipCode}">网站 - 邮编</a>
								</li>
								<li>
									<a href="javascript:;" name="{setting.email}" val="${setting.email}">网站 - Email</a>
								</li>
								<li>
									<a href="javascript:;"  name="{.now?string('yyyy-MM-dd')}" val="">当前日期</a>
								</li>
							</ul>
						</div>
					</div>
					<a href="javascript:;" id="deleteTag" class="button">删除标签</a>
				</td>
			</tr>
			<tr>
				<th>
					内容:
				</th>
				<td>
					<div id="container" class="container" style="background:url(${xdt.background})">${xdt.content}</div>
				</td>
			</tr>
			<tr>
				<th>
					背景图:
				</th>
				<td>
					<span class="fieldSet">
						<input type="text" id="background" name="background" class="text" maxlength="200" value="${xdt.background }" readonly="readonly"/>
						<input type="file" id="file" class="button"  name="file" />
						<input type="button"  id="pic" value="取消上传"/>
					</span>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>宽度:
				</th>
				<td>
					<input type="text" id="width" name="width" class="text" value="${xdt.width}" maxlength="9" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>高度:
				</th>
				<td>
					<input type="text" id="height" name="height" class="text" value="${xdt.height}" maxlength="9" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>偏移量X:
				</th>
				<td>
					<input type="text" name="offsetx" class="text" value="${xdt.offsetx}" maxlength="9" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>偏移量Y:
				</th>
				<td>
					<input type="text" name="offsety" class="text" value="${xdt.offsety}" maxlength="9" />
				</td>
			</tr>
			<tr>
				<th>
					是否默认:
				</th>
				<td>
					<input type="checkbox" name="isDefault" ${xdt.isDefault==true?"checked":"" }  />
					<input type="hidden" name="_isDefault" value="false" />
				</td>
			</tr>
			<tr>
				<th>
					备注
				</th>
				<td>
					<input type="text" name="memo" class="text" value="${xdt.memo}" maxlength="200" />
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