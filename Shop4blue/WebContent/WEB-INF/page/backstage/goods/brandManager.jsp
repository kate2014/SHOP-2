<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="itcast" uri="http://itcast.cn/common/" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/backstage/css/cssnormalize-min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/backstage/css/css02.css"/>
     <script  src="${pageContext.request.contextPath}/resources/backstage/js/pagging.js"></script>
     <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.js"></script>
     <style type="text/css">
	       .divsw{
	          width: 110px;
	          height: 94px;
	          
	          border: 1px solid;
	          
	          background-color: #FFFFFF;
	       }
	       .page{
	       
	          width: 110px;
	          height:30px;
	          border-top-style:Ridge;
	          border-right-style:Ridge;
	          border-left-style:Ridge;
	          border-bottom-style:Ridge;
	          border-width:2pt; 
	          
         
          
       }
    </style>
</head>
<body>
<div id="head">
    <div id="nav">
        <span>
            <a href="">首页</a> >> <a href="">品牌列表</a>（共${page.total }条记录）
        </span>
    </div>
</div>

<div id="bodyer">
    <div class="btn-group">
        <a href="${pageContext.request.contextPath}/brand/addBrand" id="btn-first" class="btn btn-default"><span id="tianjia"></span>添加</a>
        <a href="#"  id="del" class="btn btn-default"><span id="shanchu"></span>删除</a>
        <a href="${pageContext.request.contextPath}/brand/showBrands?rows=${rows}" class="btn btn-default"><span id="shuaxin"></span>刷新</a>
        <a  href="#" id="paggingShow" class="btn btn-default">每页显示<span class="xiasanjiao"></span></a>
    </div>
    <form class="search">
        <input type="search"/>
        <button type="submit" class="btn-search"></button>
        <script src="../js/js02.js"></script>
    </form>
    <form id="delBrand" action="${pageContext.request.contextPath}/brand/showBrands?rows=${rows }" method="post">
     <input type="hidden" name="flag" value="delBrand">
    <table>
        <tr>
            <th><input type="checkbox" id="selAll" onclick="selectAll();"/></th>
            <th>名称</th>
            <th>logo</th>
            <th>网址</th>
            <th>排序</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${page.rows }" var="p">
         <tr>
            <td><input type="checkbox" name="ids" class="checkAll" value="${p.id}"/></td>
            <td>${p.name }</td>
            <td><a href="${p.logo }">查看</a></td>
            <td>
                <c:if test="${p.url==null }">--</c:if>
                <c:if test="${p.url!=null }"><a href="${p.url }">${p.url }</a></c:if>
            </td>
            <td>${p.orders }</td>
            <td><a href="${pageContext.request.contextPath}/brand/editBrand?rows=${rows }&id=${p.id}">[编辑]</a></td>
        </tr>
        
        </c:forEach>
    </table>
    </form>
    <itcast:page url="${pageContext.request.contextPath}/brand/showBrands"/>
</div>
</body>
<script type="text/javascript">
  $(function(){
      $("#paggingShow").hover(function(e){
    	  
    	  var div=$("<div class='divsw' ><div class='page'><a href='${pageContext.request.contextPath}/brand/showBrands?rows=5'>5</a></div><div class='page'><a href='${pageContext.request.contextPath}/brand/showBrands?rows=10'>10</a></div><div class='page'><a href='${pageContext.request.contextPath}/brand/showBrands?rows=20'>20</a></div></div>");
    	  
		    div.css({
		    	position:"absolute",
		    	left:"264px",
		    	top:"72px",
		    	display:"none"
		    })
		    $(this).append(div);
		    div.show();
		    
		 },function(){
			 $(".divsw").hide();
		 })
		 
		 $("#del").click(function(){
			 $("#delBrand").submit();
		 })
  })

</script>
</html>