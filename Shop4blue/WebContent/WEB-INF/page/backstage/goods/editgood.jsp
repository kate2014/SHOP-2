<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>编辑商品 - Powered By SHOP++</title>
<meta name="author" content="SHOP++ Team" />
<meta name="copyright" content="SHOP++" />
<link href="${pageContext.request.contextPath }/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/admin/js/jquery.js"></script>
 <script type="text/javascript"src="${pageContext.request.contextPath }/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/jquery.event.drag.js"></script> 

<script type="text/javascript" src="${pageContext.request.contextPath }/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/admin/editor/kindeditor.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath }/resources/admin/js/jquery.tools.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/admin/js/input.js"></script>
<style type="text/css">
	.specificationSelect {
		height: 100px;
		padding: 5px;
		overflow-y: scroll;
		border: 1px solid #cccccc;
	}
	
	.specificationSelect li {
		float: left;
		min-width: 150px;
		_width: 200px;
	}
</style>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	var $productCategoryId = $("#productCategoryId");
	var $isMemberPrice = $("#isMemberPrice");
	var $memberPriceTr = $("#memberPriceTr");
	var $memberPrice = $("#memberPriceTr input");
	var $browserButton = $("#browserButton");
	var $productImageTable = $("#productImageTable");
	var $addProductImage = $("#addProductImage");
	var $deleteProductImage = $("a.deleteProductImage");
	var $parameterTable = $("#parameterTable");
	var $attributeTable = $("#attributeTable");
	var $specificationIds = $("#specificationSelect :checkbox");
	var $specificationProductTable = $("#specificationProductTable");
	var $addSpecificationProduct = $("#addSpecificationProduct");
	var $deleteSpecificationProduct = $("a.deleteSpecificationProduct");
	var productImageIndex = 0;
	var $hiddenTable = $("#hiddenTable");
	
	
	
	// 表单验证
	$inputForm.validate({
		rules: {
			productCategoryId: "required",
			name: "required",
			/* sn: {
				pattern: /^[0-9a-zA-Z_-]+$/,
				remote: {
					url: "order",
					cache: false
				}
			}, */
			price: {
				required: true,
				min: 0,
				decimal: {
					integer: 12,
					fraction: 2
				}
			},
			cost: {
				min: 0,
				decimal: {
					integer: 12,
					fraction: 2
				}
			},
			marketPrice: {
				min: 0,
				decimal: {
					integer: 12,
					fraction: 2
				}
			},
			weight: "digits",
			stock: "digits",
			point: "digits"
		},
		messages: {
			sn: {
				pattern: "非法字符",
				remote: "已存在"
			}
		},
		submitHandler: function(form) {
			if ($specificationIds.filter(":checked").size() == 0 && $specificationProductTable.find("tr:gt(1)").size() == 0) {
				alert("必须至少添加一个规格商品");
				return false;
			} else {
				var isRepeats = false;
				var parameters = new Array();
				$specificationProductTable.find("tr:gt(1)").each(function() {
					var parameter = $(this).find("select").serialize();
					if ($.inArray(parameter, parameters) >= 0) {
						alert("商品规格值重复");
						isRepeats = true;
						return false;
					} else {
						parameters.push(parameter);
					}
				});
				if (!isRepeats) {
					$specificationProductTable.find("tr:eq(1)").find("select").prop("disabled", true);
					addCookie("previousProductCategoryId", $productCategoryId.val(), {expires: 24 * 60 * 60});
					form.submit();
				}
			}
		}
	});
	
/* 	var previousProductCategoryId = getCookie("previousProductCategoryId");
	if (previousProductCategoryId != null) {
		$productCategoryId.val(previousProductCategoryId);
	} else {
		previousProductCategoryId = $productCategoryId.val();
	}
	
	loadParameter();
	loadAttribute();
	
	$browserButton.browser(); 
	*/
	
	// 会员价
	$isMemberPrice.click(function() {
		if ($(this).prop("checked")) {
			$memberPriceTr.show();
			$memberPrice.prop("disabled", false);
		} else {
			$memberPriceTr.hide();
			$memberPrice.prop("disabled", true);
		}
	});
	
	// 增加商品图片
	$addProductImage.click(function() {
var trHtml = '<tr> <td> <input type="file" name="files" class="productImageFile" \/> <\/td> <td> <input type="text" name="titles" class="text" maxlength="200" \/> <\/td> <td> <input type="text" name="orders" class="text productImageOrder" maxlength="9" style="width: 50px;" \/> <\/td> <td> <a href="javascript:;" class="deleteProductImage">[删除]<\/a> <\/td> <\/tr>';		
          $productImageTable.append(trHtml);
		productImageIndex ++;
	});
	
	// 删除商品图片
	$deleteProductImage.live("click", function() {
		var $this = $(this);
		$.dialog({
			type: "warn",
			content: "您确定要删除吗？",
			onOk: function() {
				$this.closest("tr").remove();
			}
		});
	});
	
	// 修改商品分类
	$productCategoryId.change(function() {
		var hasValue = false;
		$parameterTable.find(":input").each(function() {
			if ($.trim($(this).val()) != "") {
				hasValue = true;
				return false;
			}
		});
		if (!hasValue) {
			$attributeTable.find(":input").each(function() {
				if ($.trim($(this).val()) != "") {
					hasValue = true;
					return false;
				}
			});
		}
		if (hasValue) {
			$.dialog({
				type: "warn",
				content: "修改商品分类后当前参数、属性数据将会丢失，是否继续？",
				width: 450,
				onOk: function() {
					loadParameter();
					loadAttribute();
					previousProductCategoryId = $productCategoryId.val();
				},
				onCancel: function() {
					$productCategoryId.val(previousProductCategoryId);
				}
			});
		} else {
			loadParameter();
			loadAttribute();
			previousProductCategoryId = $productCategoryId.val();
		}
	});
	
	// 加载参数	
	function loadParameter() {
		$.ajax({
			url: "ajaxGetParameter",
			type: "GET",
			data: {id: $productCategoryId.val()},
			dataType: "json",
			beforeSend: function() {
				$parameterTable.empty();
			},
			success: function(data) {
				var trHtml = "";
				var hiddens = ""
					var node = document.getElementById("hiddenTable");
				while (node.hasChildNodes()) {
				    node.removeChild(node.firstChild);
				}
				$.each(data, function(i,parameterGroup) {
					trHtml += '<tr><td style="text-align: right;"><strong>' + parameterGroup.name + ':<\/strong><\/td><td>&nbsp;<\/td><\/tr>';
					$.each(parameterGroup.parameters, function(i, parameter) {
                     trHtml += '<tr> <th>' + parameter.name + ': <\/th> <td> <input type="text" name="parameters" class="text" maxlength="200" \/> <\/td> <\/tr>';	
                     hiddens += '<input type="hidden" name="hiddens" value="'+parameter.id+'"> </input>'
					});
				});
				$hiddenTable.append(hiddens);
				$parameterTable.append(trHtml);
			}
		});
	}
	
	// 加载属性
	function loadAttribute() {
		$.ajax({
			url: "ajaxGetProperty",
			type: "GET",
			data: {id: $productCategoryId.val()},
			dataType: "json",
			beforeSend: function() {
				$attributeTable.empty();
			},
			success: function(data) {
				var trHtml = "";
				var hiddens = "";
				$.each(data, function(i, attribute) {
					var optionHtml = '<option value="">请选择...<\/option>';
					$.each(attribute.xxAttributeOptions, function(j, option) {
						optionHtml += '<option value="' + option.options + '">' + option.options + '<\/option>';
					});
				hiddens += '<input type="hidden" name="hiddenAttributes" value="'+attribute.id+'"> </input>';
                trHtml += '<tr> <th>' + attribute.name + ': <\/th> <td> <select name="attributeValue_' + attribute.id + '"> ' + optionHtml + ' <\/select> <\/td> <\/tr>';
                });
				$attributeTable.append(trHtml);
				$hiddenTable.append(hiddens);
			}
		});
	}
	
	// 修改商品规格
	$specificationIds.click(function() {
		if ($specificationIds.filter(":checked").size() == 0) {
			$specificationProductTable.find("tr:gt(1)").remove();
		}
		var $this = $(this);
		if ($this.prop("checked")) {
			$specificationProductTable.find("td.specification_" + $this.val()).show().find("select").prop("disabled", false);
		} else {
			$specificationProductTable.find("td.specification_" + $this.val()).hide().find("select").prop("disabled", true);
		}
	});
	
	// 增加规格商品
	$addSpecificationProduct.click(function() {
		if ($specificationIds.filter(":checked").size() == 0) {
			
			alert("必须至少选择一个规格");
			return false;
		}
		if ($specificationProductTable.find("tr:gt(1)").size() == 0) {
			$tr = $specificationProductTable.find("tr:eq(1)").clone().show().appendTo($specificationProductTable);
			$tr.find("td:first").text("当前规格");
			$tr.find("td:last").text("-");
		} else {
			$specificationProductTable.find("tr:eq(1)").clone().show().appendTo($specificationProductTable);
		}
	});
	
	// 删除规格商品
	$deleteSpecificationProduct.live("click", function() {
		var $this = $(this);
		$.dialog({
			type: "warn",
			content: "您确定要删除吗？",
			onOk: function() {
				$this.closest("tr").remove();
			}
		});
	});
	
	$.validator.addClassRules({
		memberPrice: {
			min: 0,
			decimal: {
				integer: 12,
				fraction: 2
			}
		},
		productImageFile: {
			required: true,
			extension: "jpg,jpeg,bmp,gif,png"
		},
		productImageOrder: {
			digits: true
		}
	});
	

	
});
</script>
<script >
$(function(){
	var $priceFlag=${isMemberPriceFlag};
	var temp = $("#memberPriceTr");
	var $productImageTable = $("#productImageTable");
	var parameterValue = ${parameterValue};
	var $specificationIds = $("#specificationSelect :checkbox");
	var $specificationProductTable = $("#specificationProductTable");
    $.each(parameterValue,function(i,e){
	    var parameterss = $("#parameter"+i+"");
	    parameterss.attr("value",e.parameter_value);
   })
  
   
   
   
   
   
   
   
   var xxSpecificationValueRoll = ${xxSpecificationValueRoll};
   var xxSpecificationValueKeyRoll = ${xxSpecificationValueKeyRoll};
   $.each(xxSpecificationValueRoll,function(i,e){
	    var specificationIds = $("input[name='specificationIds']");
	    $.each(specificationIds,function(j,k){
	    	if($(k).attr("value")==e.specifications){
	    		$(k).attr("checked","checked");
	    		$specificationProductTable.find("td.specification_" + $(k).attr("value")).show().find("select").prop("disabled", false);
	    	
	    	}

	    })
   })
   	    	if ($specificationProductTable.find("tr:gt(1)").size() == 0) {
    			$tr = $specificationProductTable.find("tr:eq(1)").clone().show().appendTo($specificationProductTable);
    			$tr.find("td:first").text("当前规格");
    			$tr.find("td:last").text("-");
    		} else {
    			$specificationProductTable.find("tr:eq(1)").clone().show().appendTo($specificationProductTable);
    		}
   $.each(xxSpecificationValueRoll,function(i,e){
	   var cc =   $("select[name='specification_"+e.specifications+"']");
	    $.each(xxSpecificationValueKeyRoll,function(j,k){
	   	if(i==j){
	    		cc.val(k.specification_values);
	    	}
	    })
	    
	   
   })
	
	if($priceFlag==true){
		temp.show();
		$("#isMemberPrice").attr("checked","checked");
	 	var prices = ${memberprice}; 
	   $.each(prices,function(i,e){
		    var s=i+1;
		    var memberPrice = $("#memberPrice"+s+"");
		    memberPrice.removeAttr("disabled");
		    memberPrice.attr("value",e.member_price);
	   })
	}
	
	var $tags  = ${tags};
	 $.each($tags,function(i,e){
		    var temp= e.tags;
		    var tag = $("#tag"+temp+"");
		    if(tag!=null){
		    	tag.attr("checked","checked");
		    }
		    
	   })
	
	
	
	//点击出发文件域
		   //图片发生改变时就会触发这个函数
		   $("#file").change(function(){
			   //formdata对象，用来模拟表单 只对文件进行处理 
			   var formData=new FormData($("#inputForm")[0]);
			   $.ajax({
				   url:"${pageContext.request.contextPath}/product/uploadPic",
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
					  // alert(data);
					   $("#image").attr("value","/pic/"+data);
				   }
			   })
		   })
		   $("#pic").click(function(){
			   //应该在这里加上ajax 来删除ajax上传的图片
			   $("#image").attr("value","");
			   $("#file").attr("value","");
		   })
		   
		   
		   
		   
})
</script>

</head>
<body>
	<div class="path">
		<a href="/admin/common/index.jhtml">首页</a> &raquo; 编辑商品
	</div>
	<form id="inputForm" action="${pageContext.request.contextPath}/product/editproduct" method="post" enctype="multipart/form-data">
		<input type="hidden" name="id" value="${product.id }" />
		<ul id="tab" class="tab">
			<li>
				<input type="button" value="基本信息" />
			</li>
			<li>
				<input type="button" value="商品介绍" />
			</li>
			<li>
				<input type="button" value="商品图片" />
			</li>
			<li>
				<input type="button" value="商品参数" />
			</li>
			<li>
				<input type="button" value="商品属性" />
			</li>
			<li>
				<input type="button" value="商品规格" />
			</li>
		</ul>
		<table class="input tabContent">
			<tr>
				<th>
					商品分类:
				</th>
				<td>
					<select id="productCategoryId" name="productCategory">
                      <c:forEach items="${xxProductCategory }" var="l">
                      
							<option value="${l.id }">
										&nbsp;
								<b>${l.name }</b>
							</option>
							<c:forEach items="${l.categorys }"   var="c"  >
							<option value="${c.id }"  ${product.productCategory==c.id?'selected':'' }>
										&nbsp;&nbsp;
								${c.name }
							</option>
							</c:forEach>
					  </c:forEach>
					</select>
					
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>名称:
				</th>
				<td>
					<input type="text" name="name" class="text" maxlength="200" value="${product.name }"/>
				</td>
			</tr>
			<tr>
				<th>
					编号:
				</th>
				<td>
					<input type="text" name="sn" class="text" maxlength="100" title="若留空则由系统自动生成" value="${product.sn }"/>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>销售价:
				</th>
				<td>
				 <input type="text" name="price" class="text" maxlength="16" value="<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${product.price }"> </fmt:formatNumber>" />
				</td>
			</tr>
			<tr>
				<th>
					会员价:
				</th>
				<td>
					<label>
						<input type="checkbox" id="isMemberPrice" name="isMemberPrice" />启用会员价
					</label>
				</td>
			</tr>
			<tr id="memberPriceTr" class="hidden">
				<th>
					&nbsp;
				</th>
				<c:forEach  items="${memberRank }" var="m">
				<td>
				           <input type="hidden" name="memberPriceIds" value="${m.id }"/>
				${m.name }:<input  type="text" name="memberPrice1"  id="memberPrice${m.id}"   class="text memberPrice" maxlength="16" style="width: 60px; margin-right: 6px;" value="1" />
			    </td>
				</c:forEach>
			</tr>
			<tr>
				<th>
					成本价:
				</th>
				<td><!--  <fmt:formatNumber maxFractionDigits="4" minFractionDigits="2"> ${l.price } </fmt:formatNumber> -->
				 <input type="text" name="cost" class="text" maxlength="16" title="前台不会显示，仅供后台使用" value="<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${product.cost }"> </fmt:formatNumber>"/>
				
				</td>
			</tr>
			<tr>
				<th>
					市场价:
				</th>
				<td>
				  <input type="text" name="marketPrice" class="text" maxlength="16" title="若留空则由系统自动计算" value="<fmt:formatNumber maxFractionDigits="4" minFractionDigits="2" value="${product.marketPrice }"></fmt:formatNumber>" /> 
					
				</td>
			</tr>
			<tr>
				<th>
					展示图片:
				</th>
				<td>
					<span class="fieldSet">
						<input type="text" id="image"name="image" class="text" maxlength="200" readonly="readonly" title="应用于首页、宣传页，留空则由系统自动生成" value="${product.image }"/>
						<input type="file" id="file" name="file" class="button" value="选择文件" />
						<input type="button"  id="pic" value="取消上传"/>
					</span>
				</td>
			</tr>
			<tr>
				<th>
					单位:
				</th>
				<td>
					<input type="text" name="unit" class="text" maxlength="200" value="${product.unit }" />
				</td>
			</tr>
			<tr>
				<th>
					重量:
				</th>
				<td>
					<input type="text" name="weight" class="text" maxlength="9" title="单位: 克" value="${product.weight }" />
				</td>
			</tr>
			<tr>
				<th>
					库存:
				</th>
				<td>
					<input type="text" name="stock" class="text" maxlength="9" title="留空表示不计库存" value="${product.stock }"/>
				</td>
			</tr>
			<tr>
				<th>
					库存备注:
				</th>
				<td>
					<input type="text" name="stockMemo" class="text" maxlength="200" value="${product.stockMemo }"/>
				</td>
			</tr>
			<tr>
				<th>
					赠送积分:
				</th>
				<td>
					<input type="text" name="point" class="text" maxlength="9" title="若留空则由系统自动计算" value="${product.point }"/>
				</td>
			</tr>
			<tr>
				<th>
					品牌:
				</th>
				<td>
					<select name="goods">
						<option value="">请选择...</option>
						<c:forEach items="${list }" var="l">
						<option value="${l.id }" ${product.productCategory==l.id?'selected':'' }>
								${l.name }
							</option>
						
						</c:forEach>
							
					</select>
				</td>
			</tr>
			<tr>
				<th>
					标签:
				</th>
				<td>
				   <c:forEach items="${tag }" var="t">
				         <label>
							<input type="checkbox" name="tagIds" id="tag${t.id }" value="${t.id }" />${t.name }
						</label>
				   </c:forEach>
				<!-- 
						<label>
							<input type="checkbox" name="tagIds" value="1" />热销
						</label>
						<label>
							<input type="checkbox" name="tagIds" value="2" />最新
						</label> -->
				</td>
			</tr>
			<tr>
				<th>
					设置:
				</th>
				<td>
					<label>
						<input type="checkbox" name="isMarketable" value="true" ${product.isMarketable==true?'checked':'' } />是否上架
						<input type="hidden" name="_isMarketable" value="false" />
					</label>
					<label>
						<input type="checkbox" name="isList" value="true" ${product.isList==true?'checked':'' } />是否列出
						<input type="hidden" name="_isList" value="false" />
					</label>
					<label>
						<input type="checkbox" name="isTop" value="true" ${product.isTop==true?'checked':'' }/>是否置顶
						<input type="hidden" name="_isTop" value="false" />
					</label>
					<label>
						<input type="checkbox" name="isGift" value="true" ${product.isGift==true?'checked':'' }/>是否为赠品
						<input type="hidden" name="_isGift" value="false" />
					</label>
				</td>
			</tr>
			<tr>
				<th>
					备注:
				</th>
				<td>
					<input type="text" name="memo" class="text" maxlength="200" value="${product.memo }"/>
				</td>
			</tr>
			<tr>
				<th>
					搜索关键词:
				</th>
				<td>
					<input type="text" name="keyword" class="text" maxlength="200" title="应用于前台商品搜索，多个关键字以(,)分隔" value="${product.keyword }" />
				</td>
			</tr>
			<tr>
				<th>
					页面标题:
				</th>
				<td>
					<input type="text" name="seoTitle" class="text" maxlength="200" value="${product.seoTitle }" />
				</td>
			</tr>
			<tr>
				<th>
					页面关键词:
				</th>
				<td>
					<input type="text" name="seoKeywords" class="text" maxlength="200" value="${product.seoKeywords }"/>
				</td>
			</tr>
			<tr>
				<th>
					页面描述:
				</th>
				<td>
					<input type="text" name="seoDescription" class="text" maxlength="200"  value="${product.seoDescription }"/>
				</td>
			</tr>
		</table>
		<table class="input tabContent">
			<tr>
				<td>
					<textarea id="editor"   name="introduction" class="editor" style="width: 100%;"  >
					${product.introduction }
					</textarea>
				</td>
			</tr>
		</table>
		<table id="productImageTable" class="input tabContent">
			<tr>
				<td colspan="4">
					<a href="javascript:;" id="addProductImage" class="button">增加图片</a>
				</td>
			</tr>
			<tr class="title">
				<td>
					文件
				</td>
				<td>
					标题
				</td>
				<td>
					排序
				</td>
				<td>
					删除
				</td>
				<c:forEach items="${product.productImages }" var="pImg" >
			      <tr>
                     <td> <input type="text" name="Oldfiles" class="productImageFile"   value="${pImg.source }"/> </td>
                     <td> <input type="text" name="titles" class="text" maxlength="200" value="${pImg.title }" /> </td> 
                     <td> <input type="text" name="orders" class="text productImageOrder" value="${pImg.orders }" maxlength="9" style="width: 50px;" /> </td> 
                     <td> <a href="javascript:;" class="deleteProductImage">[删除]</a> </td>
                 </tr>
				</c:forEach>
			</tr>
		</table>
		<table id="parameterTable" class="input tabContent">
		<c:forEach items="${parameterGroup }" var="pp">
                 
           <tr>
		     <td style="text-align: right;">
		      <strong>${pp.name }</strong>
		       </td><td>&nbsp;</td>
		   </tr>
		       <c:forEach items="${pp.parameters }" var="ppp" varStatus="i">
              	 <tr>
                <th> ${ppp.name}</th> <td> <input type="text" id="parameter${i.index }" name="parameters" class="text" maxlength="200" /> </td> 
                </tr>
		       </c:forEach>
		</c:forEach>
		</table>
		<table id="attributeTable" class="input tabContent">
		    <c:forEach items="${attribute }" var="a">
		     <tr>
		        <th> ${a.name }  </th>
		        <td>
		        <select name="attributeValue_${a.id}" id="${a.id}">
		        <option value="">请选择...</option>
		        <c:forEach items="${a.xxAttributeOptions }" var="aa">
		          <option value="${aa.options }" >${aa.options }</option>
		        </c:forEach>
		        </select>
		         </td>
		     </tr>
		     </c:forEach>
		</table>
		<table id="hiddenTable">
		<c:forEach items="${parameterValueKey }" var="ll">
		<input type="hidden" name="hiddens" value="${ll.parameter_value_key }" /> 
		</c:forEach>
		</table>
		<table class="input tabContent">
			<tr class="title">
				<th>
					请选择商品规格:
				</th>
			</tr>
			<tr>
				<td>
					<div id="specificationSelect" class="specificationSelect">
						<ul>
						<c:forEach items="${xxSpecification }" var="l">
						        <li>
									<label>
										<input type="checkbox" name="specificationIds" value="${l.id }" />
											<span class="gray">${l.name }${l.memo }</span>
									</label>
								</li>
						</c:forEach>
						</ul>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<a href="javascript:;" id="addSpecificationProduct" class="button">增加规格商品</a>
				</td>
			</tr>
			<tr>
				<td>
					<table id="specificationProductTable" class="input">
						<tr class="title">
							<td width="60">
								&nbsp;
							</td>
								<c:forEach items="${xxSpecification }" var="l">
								    <td class="specification_${l.id } hidden">
									${l.name }
										<span class="gray">${l.memo }</span>
							      	</td>
								</c:forEach>
							<td>
								操作
							</td>
						</tr>
						<tr class="hidden">
							<td>
								&nbsp;
							</td>
							<c:forEach items="${xxSpecification }" var="l">
							<td class="specification_${l.id } hidden">
									<select name="specification_${l.id }" disabled="disabled">
									<option value="1">无</option>
									<c:forEach items="${l.xxSpecificationValue }" var="xx">
									<option value="${xx.id }">${xx.name }</option>
									</c:forEach>
									</select>
							</td>
							</c:forEach>
							<td>
								<a href="javascript:;" class="deleteSpecificationProduct">[删除]</a>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<table class="input">
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
<script type="text/javascript">
$(function(){
	var $hiddenTable = $("#hiddenTable");
	var hiddens = "";
	
	
	  var attributeTablee =   $("#attributeTable  select");
	  $.each(attributeTablee,function(i,e){
		if(i==0){
			hiddens += '<input type="hidden" name="hiddenAttributes" value="'+$(this).attr("id")+'"> </input>';
			var childs = $(this).children();
			$.each(childs,function(j,k){
				if($(this).val()=='${product.attributeValue0}'){
					$(this).attr("selected","selected");
					
				}
			})
		}
		else	if(i==1){
			hiddens += '<input type="hidden" name="hiddenAttributes" value="'+$(this).attr("id")+'"> </input>';
			var childs = $(this).children();
			$.each(childs,function(j,k){
				if($(this).val()=='${product.attributeValue1}'){
					$(this).attr("selected","selected");
					
				}
			})
		}
		else if(i==2){
			hiddens += '<input type="hidden" name="hiddenAttributes" value="'+$(this).attr("id")+'"> </input>';
			var childs = $(this).children();
			$.each(childs,function(j,k){
				if($(this).val()=='${product.attributeValue2}'){
					$(this).attr("selected","selected");
					
				}
			})
		}
		else if(i==3){
			hiddens += '<input type="hidden" name="hiddenAttributes" value="'+$(this).attr("id")+'"> </input>';
			var childs = $(this).children();
			$.each(childs,function(j,k){
				if($(this).val()=='${product.attributeValue3}'){
					$(this).attr("selected","selected");
					
				}
			})
		}
		else if(i==4){
			hiddens += '<input type="hidden" name="hiddenAttributes" value="'+$(this).attr("id")+'"> </input>';
			var childs = $(this).children();
			$.each(childs,function(j,k){
				if($(this).val()=='${product.attributeValue4}'){
					$(this).attr("selected","selected");
					
				}
			})
		}
		else if(i==5){
			hiddens += '<input type="hidden" name="hiddenAttributes" value="'+$(this).attr("id")+'"> </input>';
			var childs = $(this).children();
			$.each(childs,function(j,k){
				if($(this).val()=='${product.attributeValue5}'){
					$(this).attr("selected","selected");
					
				}
			})
		}
		else 	if(i==6){
			hiddens += '<input type="hidden" name="hiddenAttributes" value="'+$(this).attr("id")+'"> </input>';
			var childs = $(this).children();
			$.each(childs,function(j,k){
				if($(this).val()=='${product.attributeValue6}'){
					$(this).attr("selected","selected");
					
				}
			})
		}
		else if(i==7){
			hiddens += '<input type="hidden" name="hiddenAttributes" value="'+$(this).attr("id")+'"> </input>';
			var childs = $(this).children();
			$.each(childs,function(j,k){
				if($(this).val()=='${product.attributeValue7}'){
					$(this).attr("selected","selected");
					
				}
			})
		}
		else if(i==8){
			hiddens += '<input type="hidden" name="hiddenAttributes" value="'+$(this).attr("id")+'"> </input>';
			var childs = $(this).children();
			$.each(childs,function(j,k){
				if($(this).val()=='${product.attributeValue8}'){
					$(this).attr("selected","selected");
					
				}
			})
		}
		else if(i==9){
			hiddens += '<input type="hidden" name="hiddenAttributes" value="'+$(this).attr("id")+'"> </input>';
			var childs = $(this).children();
			$.each(childs,function(j,k){
				if($(this).val()=='${product.attributeValue9}'){
					$(this).attr("selected","selected");
					
				}
			})
		}
		else if(i==10){
			hiddens += '<input type="hidden" name="hiddenAttributes" value="'+$(this).attr("id")+'"> </input>';
			var childs = $(this).children();
			$.each(childs,function(j,k){
				if($(this).val()=='${product.attributeValue10}'){
					$(this).attr("selected","selected");
					
				}
			})
		}
		else if(i==11){
			hiddens += '<input type="hidden" name="hiddenAttributes" value="'+$(this).attr("id")+'"> </input>';
			var childs = $(this).children();
			$.each(childs,function(j,k){
				if($(this).val()=='${product.attributeValue11}'){
					$(this).attr("selected","selected");
					
				}
			})
		}
		else if(i==12){
			hiddens += '<input type="hidden" name="hiddenAttributes" value="'+$(this).attr("id")+'"> </input>';
			var childs = $(this).children();
			$.each(childs,function(j,k){
				if($(this).val()=='${product.attributeValue12}'){
					$(this).attr("selected","selected");
					
				}
			})
		}
		else if(i==13){
			hiddens += '<input type="hidden" name="hiddenAttributes" value="'+$(this).attr("id")+'"> </input>';
			var childs = $(this).children();
			$.each(childs,function(j,k){
				if($(this).val()=='${product.attributeValue13}'){
					$(this).attr("selected","selected");
					
				}
			})
		}
		else if(i==14){
			hiddens += '<input type="hidden" name="hiddenAttributes" value="'+$(this).attr("id")+'"> </input>';
			var childs = $(this).children();
			$.each(childs,function(j,k){
				if($(this).val()=='${product.attributeValue14}'){
					$(this).attr("selected","selected");
					
				}
			})
		}
		else if(i==15){
			hiddens += '<input type="hidden" name="hiddenAttributes" value="'+$(this).attr("id")+'"> </input>';
			var childs = $(this).children();
			$.each(childs,function(j,k){
				if($(this).val()=='${product.attributeValue15}'){
					$(this).attr("selected","selected");
				}
			})
		}
		else if(i==16){
			hiddens += '<input type="hidden" name="hiddenAttributes" value="'+$(this).attr("id")+'"> </input>';
			var childs = $(this).children();
			$.each(childs,function(j,k){
				if($(this).val()=='${product.attributeValue16}'){
					$(this).attr("selected","selected");
					
				}
			})
		}
		else if(i==17){
			hiddens += '<input type="hidden" name="hiddenAttributes" value="'+$(this).attr("id")+'"> </input>';
			var childs = $(this).children();
			$.each(childs,function(j,k){
				if($(this).val()=='${product.attributeValue17}'){
					$(this).attr("selected","selected");
					
				}
			})
		}
		else if(i==18){
			hiddens += '<input type="hidden" name="hiddenAttributes" value="'+$(this).attr("id")+'"> </input>';
			var childs = $(this).children();
			$.each(childs,function(j,k){
				if($(this).val()=='${product.attributeValue18}'){
					$(this).attr("selected","selected");
					
				}
			})
		}
		else if(i==19){
			hiddens += '<input type="hidden" name="hiddenAttributes" value="'+$(this).attr("id")+'"> </input>';
			var childs = $(this).children();
			$.each(childs,function(j,k){
				if($(this).val()=='${product.attributeValue19}'){
					$(this).attr("selected","selected");
					
				}
			})
		}
	  })
	  $hiddenTable.append(hiddens);

	  
	  
})


</script>
</html>