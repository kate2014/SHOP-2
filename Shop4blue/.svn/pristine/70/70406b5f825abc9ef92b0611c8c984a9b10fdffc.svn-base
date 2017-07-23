<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form id="shippingForm" action="shipping.jhtml" method="post">
		 <input type="hidden" name="token" value="2edd8242-d8c6-4b6e-bd26-dd8b69e4a9ce" \/>
		<inputtype="hidden" name="orderId" value="${order.id}" \/>
		<div style="height: 380px; overflow-x: hidden; overflow-y: auto;">
			<table class="input" style="margin-bottom: 30px;">
				<tr>
					<th>商品编号:<\/th>
					<td width="300">${order.sn} <\/td>
					<th>创建日期: <\/th>
					<td><fmt:formatDate value="${order.createDate }" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate> <\/td>
						<\/tr>
				<tr>
					<th>配送方式: <\/th>
					<td><select name="shippingMethodId">
							<option value="">请选择...<\/option>
							<c:forEach items="${shippingMethods }" var="shippingMethod">
							<option value="${shippingMethod.id}" 
							<c:if test="${shippingMethod==order.shippingMethod }>
							 selected="selected" </c:if>>${shippingMethod.name}<\/option>
								</c:forEach><\/select> <\/td>
							<th>物流公司: <\/th>
						<td><select name="deliveryCorpId"> [#list
									deliveryCorps as deliveryCorp]
									<option value="${deliveryCorp.id}" [#if
										order.shippingMethod?? && deliveryCorp==
										order.shippingMethod.defaultDeliveryCorp] selected="selected"[/#if]>${deliveryCorp.name}<\/option>
										[/#list] <\/select> <\/td> <\/tr>
									<tr>
										<th>${message("Shipping.trackingNo")}: <\/th>
										<td><input type="text" name="trackingNo" class="text"
											maxlength="200" \/> <\/td>
										<th>${message("Shipping.freight")}: <\/th>
										<td><input type="text" name="freight" class="text"
											maxlength="16" \/> <\/td> <\/tr>
									<tr>
										<th>${message("Shipping.consignee")}: <\/th>
										<td><input type="text" name="consignee" class="text"
											value="${order.consignee}" maxlength="200" \/> <\/td>
										<th>${message("Shipping.zipCode")}: <\/th>
										<td><input type="text" name="zipCode" class="text"
											value="${order.zipCode}" maxlength="200" \/> <\/td> <\/tr>
									<tr>
										<th>${message("Shipping.area")}: <\/th>
										<td><span class="fieldSet"> <input type="hidden"
												id="areaId" name="areaId" value="${(order.area.id)!}"
												treePath="${(order.area.treePath)!}" \/> <\/span> <\/td>
												<th>${message("Shipping.address")}: <\/th>
											<td><input type="text" name="address" class="text"
													value="${order.address}" maxlength="200" \/> <\/td> <\/tr>
											
											<tr>
													<th>${message("Shipping.phone")}: <\/th>
													<td><input type="text" name="phone" class="text"
														value="${order.phone}" maxlength="200" \/> <\/td>
													<th>${message("Shipping.memo")}: <\/th>
													<td><input type="text" name="memo" class="text"
														maxlength="200" \/> <\/td> <\/tr> <\/table>
														<table class="input">
															<tr class="title">
																<th>${message("ShippingItem.sn")} <\/th>
																<th>${message("ShippingItem.name")} <\/th>
																<th>${message("admin.order.productStock")} <\/th>
																<th>${message("admin.order.productQuantity")}
																	<\/th>
																<th>${message("OrderItem.shippedQuantity")} <\/th>
																
																<th>${message("admin.order.shippingQuantity")}
																	<\/th> <\/tr> [#list order.orderItems as orderItem]
															<tr>
																<td><input type="hidden"
																	name="shippingItems[${orderItem_index}].sn"
																	value="${orderItem.sn}" \/> ${orderItem.sn} <\/td>
																<td width="300"><span title="${orderItem.fullName}">${abbreviate(orderItem.fullName, 50, "...")}<\/span>
																		[#if orderItem.isGift] <span class="red">[${message("admin.order.gift")}]<\/span>
																			[/#if] <\/td>
																			<td>${(orderItem.product.stock)!"-"} <\/td>
																		<td>${orderItem.quantity} <\/td>
																		<td>${orderItem.shippedQuantity} <\/td>
																		<td>[#if orderItem.product?? &&
																				orderItem.product.stock??] [#if
																				orderItem.product.stock <= 0 || orderItem.quantity -
																				orderItem.shippedQuantity <= 0] <input type="text"
																				name="shippingItems[${orderItem_index}].quantity"
																				class="text" value="0" style="width: 30px;"
																				disabled="disabled" \/> [#elseif
																				orderItem.product.stock < orderItem.quantity -
																				orderItem.shippedQuantity] <input type="text"
																				name="shippingItems[${orderItem_index}].quantity"
																				class="text shippingItemsQuantity"
																				value="${orderItem.product.stock}" maxlength="9"
																				style="width: 30px;"
																				max="${orderItem.product.stock}" \/> [#else] <input
																				type="text"
																				name="shippingItems[${orderItem_index}].quantity"
																				class="text shippingItemsQuantity"
																				value="${orderItem.quantity - orderItem.shippedQuantity}"
																				maxlength="9" style="width: 30px;"
																				max="${orderItem.quantity - orderItem.shippedQuantity}" \/>
																				[/#if] [#else] <input type="text"
																				name="shippingItems[${orderItem_index}].quantity"
																				class="text shippingItemsQuantity"
																				value="${orderItem.quantity - orderItem.shippedQuantity}"
																				maxlength="9" style="width: 30px;"
																				max="${orderItem.quantity - orderItem.shippedQuantity}" \/>
																				[/#if] <\/td> <\/tr> [/#list]
																		<tr>
																				<td colspan="6" style="border-bottom: none;">
																					&nbsp; <\/td> <\/tr> <\/table> <\/div> <\/form>


content: ' <form id="shippingForm" action="shipping.jhtml" method="post"> <input type="hidden" name="token" value="ae0c0139-5887-4c1c-ad02-a6cf4c0f5646" \/> <input type="hidden" name="orders" value="${order.id}" \/> <div style="height: 380px; overflow-x: hidden; overflow-y: auto;"> <table class="input" style="margin-bottom: 30px;"> <tr> <th> 订单编号: <\/th> <td width="300"> ${order.sn} <\/td> <th> 创建日期: <\/th> <td> '+now+' <\/td> <\/tr> <tr> <th>'+
'配送方式: <\/th> <td> <select name="shippingMethod" > <option value="普通快递" <c:if test="${order.shippingMethod==1}">selected="selected"</c:if> >普通快递<\/option> <option value="顺丰速递" <c:if test="${order.shippingMethod==2}">selected="selected"</c:if>>顺丰速递<\/option> <\/select> <\/td> <th> 物流公司: <\/th> <td> <select name="deliveryCorp"> <option value="">请选择...<\/option><option value="圆通速递">圆通速递<\/option> <option value="申通快递">申通快递<\/option> <option value="韵达快运">韵达快运<\/option> <option value="顺丰速递" >顺丰速递<\/option> <\/select> <\/td> <\/tr> <tr> <th> 运单号: <\/th> <td> <input type="text" name="trackingNo" class="text" maxlength="200" \/> <\/td> <th> 物流费用: <\/th> <td> <input type="text" name="freight" value="${order.freight}" class="text" maxlength="16" \/> <\/td> <\/tr> <tr> <th> 收货人: <\/th> <td> <input type="text" name="consignee" class="text" value="${order.consignee}" maxlength="200" \/> <\/td> <th> 邮编: <\/th> <td> <input type="text" name="zipCode" class="text" value="${order.zipCode}" maxlength="200" \/> <\/td> <\/tr> <tr> <th> 地区: <\/th> <td> <span class="fieldSet"> <input type="hidden" id="areaId" name="areaId" value="21" treePath=",18," \/> <\/span> <\/td> <th> 地址: <\/th> <td> <input type="text" name="address" class="text" value="${order.address}" maxlength="200" \/> <\/td> <\/tr> <tr> <th> 电话: <\/th> <td> <input type="text" name="phone" class="text" value="${order.phone}" maxlength="200" \/> <\/td> <th> 备注: <\/th> <td> <input type="text" name="memo" class="text" maxlength="200" \/> <\/td> <\/tr> <\/table> <table class="input"> <tr class="title"> <th> 商品编号 <\/th> <th> 商品名称 <\/th> <th> 商品库存 <\/th> <th> 购买数量 <\/th> <th> 已发货数量 <\/th> <th> 发货数量 <\/th> <\/tr>'+
 '     <c:forEach items="${orderItem}" var="l" varStatus="status">   <tr> <td> <input type="hidden" name="shippingItems[${status.count-1 }].sn" value="${l.sn}" \/> ${l.sn} <\/td> <td width="300"> <span title="${l.fullName}">${l.name}<\/span> <\/td> <td> - <\/td> <td> ${l.quantity} <\/td> <td> ${l.shippedQuantity}<\/td> <td> <input type="text" name="shippingItems[${status.count-1 }].quantity" class="text shippingItemsQuantity" value="1" maxlength="9" style="width: 30px;" max="1" \/> <\/td> <\/tr> <tr> <td colspan="6" style="border-bottom: none;"> &nbsp; <\/td> <\/tr></c:forEach> <\/table> <input type="submit" value="确定" \/><\/div> <\/form>',				width: 900,

<select>
<c:forEach items="${deliveryCorps }" var="deliveryCorp"><option value="${deliveryCorp.id }" <c:if test="${order.shipMethod.defaultDeliveryCorp==deliveryCorp.id}">selected="selected"</c:if> >${deliveryCorp.name }<\/option> </c:forEach>
</select>
</body>
</html>