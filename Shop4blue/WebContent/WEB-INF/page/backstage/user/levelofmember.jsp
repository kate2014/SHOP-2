<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
			    		      $.post("${pageContext.request.contextPath}/memberRank/delete",{"str":str},function(list){
			    		    window.location.reload(true);
					    		}); 
			    		 })
			    		}
			    	})
				})
    </script>
</head>
<body>
<div id="head">
    <div id="nav">
        <span>
            <a href="">首页</a> >> <a href="">订单列表</a>
        </span>
    </div>
</div>

<div id="bodyer">
    <div class="btn-group">
        <a href="${pageContext.request.contextPath}/memberRank/update" id="btn-first" class="btn btn-default"><span id="tianjia"></span>添加</a>
        <a href="" class="btn btn-default" id="del"> <span id="shanchu"></span>删除</a>
        <a href="${pageContext.request.contextPath}/memberRank/getMemberRank" class="btn btn-default"><span id="shuaxin"></span>刷新</a>
     <!--     <a href=""><select  name="rowss" class="btn btn-default">
            <option value="">每页显示</option>
            <option value="10">10</option>
            <option value="20">20</option>
            <option value="50">50</option>
            <option value="100">100</option>
        </select>
        </a> -->
    </div>
    <form class="search">
        <input type="search"/>
        <button type="submit" class="btn-search"></button>
    </form>
    <table>
        <tr>
            <th><input type="checkbox" id="selAll" onclick="selectAll();"/></th>
            <th>名称</th>
            <th>优惠比例</th>
            <th>消费金额</th>
            <th>是否默认</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${list }" var="l">
        <tr>
            <td><input type="checkbox" name="checkAll" class="checkAll" value="${l.id }" onclick="setSelectAll();"/></td>
            <td>${l.name }</td>
            <td>${l.scale }</td>
            <td>${ l.amount}</td>
            <td>
            <c:if test="${ l.isDefault=='true'}">
            是
            </c:if>
            <c:if test="${ l.isDefault=='false'}">
            否
            </c:if>
            </td>
            <td><a href="${pageContext.request.contextPath}/memberRank/edit1/${l.id}">[编辑]</a></td>
        </tr>
           </c:forEach>
    </table>
   <!--  <ul class="pagination">
        <li><a href="">首页</a></li>
        <li class="active"><a href="">&laquo;上一页</a></li>
        <li><a href="">...</a></li>
        <li><a href="">下一页&raquo;</a></li>
        <li><a href="">尾页</a></li>
    </ul> -->
</div>
</body>
</html>