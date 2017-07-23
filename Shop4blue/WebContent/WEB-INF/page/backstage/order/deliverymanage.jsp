<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="itcast" uri="http://itcast.cn/common/" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/backstage/css/cssnormalize-min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/backstage/css/css02.css"/>
    	 <script src="${pageContext.request.contextPath}/resources/backstage/js/js02.js"></script>
    	    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.js"></script>
    <script type="text/javascript">
	$(function(){
	 	$("#selCount").change(function(){
	  	      var size = $("option:selected").val();
	  	
	    	  location.href="${pageContext.request.contextPath }/deliveryManage/showdeliveryByCount?rows="+size;
	     	})
		$("#del").click(function(){
    		var str="";
    		var len=$("input[name='checkAll']:checked").length;
    		if(len==0){
    			alert("请选择想要删除的会员");
    		}
    		else{
    			$("input[name='checkAll']:checked").each(function(i){
    		     if(i!=len-1){
    		    	 str+=$(this).val();
    		    	 str+=",";
    		     }else{
    		    	 str+=$(this).val();
    		     }
    		     /* window.location.href="${pageContext.request.contextPath}/memberRank/delete?str="+str; */
    		      $.post("${pageContext.request.contextPath}/deliveryManage/delete",{"str":str},function(list){
    		    window.location.reload(true);
		    		}); 
    		 })
    		}
    	})
	})
</script>
</head>
<body>
<div id="nav">
        <span>
            <a href="">首页</a> >> <a href="">发货点列表</a> （共${page.total}条记录）
        </span>
</div>
<div id="bodyer">
    <div id="container">
        <div class="btn-group">
            <a href="${pageContext.request.contextPath}/deliveryManage/deliverymanageadd" class="btn"><span id="tianjia"></span>添加</a>
            <a href="" class="btn btn-default" id="del"> <span id="shanchu"></span>删除</a>
            <a href="${pageContext.request.contextPath}/deliveryManage/todeliveryManage" class="btn btn-default"><span id="shuaxin"></span>刷新</a>
            <select name="selCount" id="selCount" class="myxs">
            <option value="">每页显示</option>
             <option value="2">2</option>
            <option value="10">10</option>
            <option value="20">20</option>
            <option value="30">30</option>
            <option value="40">40</option>
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
                <th>联系人</th>
                <th>地区名称</th>
                <th>地址</th>
                <th>邮编</th>
                <th>电话</th>
                <th>手机</th>
                <th>是否默认</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${page.rows }" var="l">
            <tr>
            <td><input type="checkbox" name="checkAll" class="checkAll" value="${l.id }" onclick="setSelectAll();"/></td>
                <td>${l.name}</td>
                <td>${l.contact}</td>
                <td>${l.area_name}</td>
                <td>${l.address}</td>
                <td>${l.zip_code}</td>
                <td>${l.phone}</td>
                <td>${l.mobile}</td>
                <td>
                <c:if test="${ l.is_default=='true'}">
                <span class="duihao"></span>
                </c:if>
                <c:if test="${ l.is_default=='false'}">
                <span class="cuohao"></span>
                </c:if>
                </td>
                <td><a href="${pageContext.request.contextPath}/deliveryManage/edit1/${l.id}">[编辑]</a></td>
            </tr>
            
            
          
           
            </c:forEach>
        </table>
        <itcast:page url="${pageContext.request.contextPath }/deliveryManage/showdeliveryByCount"/>
    </div>
</div>

</body>
</html>