<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="itcast" uri="http://itcast.cn/common/"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/backstage/css/cssnormalize-min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/backstage/css/css02.css"/>
    <script src="${pageContext.request.contextPath}/resources/backstage/js/js02.js"></script>
</head>
<body>
<div id="head">
    <div id="nav">
        <span>
            <a href="">首页</a> >> <a href="">规格管理</a>
        </span>
    </div>
</div>
<div id="bodyer">
    <div class="btn-group">
        <a href="${pageContext.request.contextPath}/gggl/toAddGggl" id="btn-first" class="btn btn-default"><span id="tianjia"></span>添加</a>
        <a href="" class="btn btn-default"><span id="shanchu"></span>删除</a>
        <a id="reflash" class="btn btn-default"><span id="shuaxin"></span>刷新</a>
        <!-- <a  href="#" class="btn btn-default">每页显示<span class="xiasanjiao"></span></a> -->
        <select name="rowss" class="myxs">
            <option value="">每页显示</option>
            <option value="10">10</option>
            <option value="20">20</option>
            <option value="50">50</option>
            <option value="100">100</option>
        </select>
    </div>
    <form class="search">
        <input type="search"/>
        <button type="submit" class="btn-search"></button>
    </form>
    <table>
        <tr>
            <th><input type="checkbox" id="selAll" onclick="selectAll();"/></th>
            <th>名称</th>
            <th>类型</th>
            <th>规格值</th>
            <th>排序</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${page.rows}" var="a">
        	<tr>
	        	<td><input type="checkbox" name="checkAll" class="checkAll" onclick="setSelectAll();"/></td>
	            <td>${a.name}[${a.memo}]</td>
	            <td>
	            	<c:if test="${a.type==1}">
	            		图片
	            	</c:if>
	            	<c:if test="${a.type==0}">
	            		文本
	            	</c:if>
	            </td>
	            <td>
	            	<c:forEach items="${a.xxSpecificationValue}" var="b">
	            		${b.name}
	            	</c:forEach>
	            </td>
	            <td>${a.orders}</td>
	            <td><a href="${pageContext.request.contextPath }/gggl/toEditGg?id=${a.id}" >[编辑]</a></td>
            </tr>
        </c:forEach>
    </table>
    <itcast:page url="${pageContext.request.contextPath }/gggl/toGggl" />
    <!-- <ul class="pagination">
        <li><a href="">首页</a></li>
        <li class="active"><a href="">&laquo;上一页</a></li>
        <li><a href="">...</a></li>
        <li><a href="">下一页&raquo;</a></li>
        <li><a href="">尾页</a></li>
    </ul> -->
</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("select[name='rowss'] option").click(function(){
			var x=$("select[name='rowss'] option:selected").val();
			location.href="${pageContext.request.contextPath}/gggl/toGggl?rows="+x;
		})
		$("#reflash").click(function(){
			window.location.reload();
		})
		/* $("#del").click(function(){
			var s=[];
			var i=0;
			var x=$("input[name='check']:checked");
			$.each(x,function(){
				s[i++]=$(this).val();
			})
			if(s==""){
				alert("请选择要删除的商品规格");
			}else{
				alert(s);
				location.href="${pageContext.request.contextPath}/spsx/deleteSpsx?del="+s;
			}
		}) */
	})
</script>
</html>