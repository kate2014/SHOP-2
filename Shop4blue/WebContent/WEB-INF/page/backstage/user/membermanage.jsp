<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="itcast" uri="http://itcast.cn/common/" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/backstage/css/cssnormalize-min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/backstage/css/css02.css"/>
    <script src="${pageContext.request.contextPath}/resources/backstage/js/js02.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.4.2.min.js"></script>
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
    			 
    		 })
    		}
    		$.post("${pageContext.request.contextPath}/memberm/delMember",{"str":str,"page":"${page.page}"},function(page){
    		});
    		
    		
    	})
    	$("#selCount").change(function(){
  	      var size = $("option:selected").val();
  	      /*
  	      $.post("${pageContext.request.contextPath}/memberm/showMemberByCount",{"rows":size,"page":"${page.page}"},function(page){
  	    	  window.location.reload();
    	  });*/
    	  location.href="${pageContext.request.contextPath}/memberm/showMemberByCount?rows="+size;
     	})
    	
    	
    	
    	
    })
    
    </script>
</head>
<body>
<div id="head">
    <div id="nav">
        <span>
            <a href="">首页</a> >> <a href="">会员管理</a> （共${page.total}条记录）
        </span> 
    </div>
</div>

<div id="bodyer">
    <div class="btn-group">
        <a href="${pageContext.request.contextPath}/memberm/membermanageadd" id="btn-first" class="btn btn-default"><span id="tianjia"></span>添加</a>
        <a href="" class="btn btn-default"  id="del"><span id="shanchu"></span>删除</a>
        <a href="" class="btn btn-default"><span id="shuaxin"></span>刷新</a>
        <select name="selCount" id="selCount" class="myxs">
            <option value="">每页显示</option>
             <option value="5">5</option>
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
            <th>用户名</th>
            <th>会员等级</th>
            <th>E-mail</th>
            <th>创建日期</th>
            <th>状态</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${page.rows }" var="l" >
        <tr>
            <td><input type="checkbox" name="checkAll" class="checkAll" onclick="setSelectAll();" value="${l.id }"/></td>
            <td>${l.username }</td>
            <td>${l.mr_name }</td>
            <td>${l.email }</td>
            <td>${l.createdate}</td>
            <td style="color: '${l.is_enabled=='true'?'black':'red'}'">${l.is_enabled=='true'?'正常':'禁用'}</td>
            <td><a href="${pageContext.request.contextPath}/memberm/updateMemberMessage?id=${l.id}">[编辑]</a><a href="${pageContext.request.contextPath}/memberm/checkMemberMessage?id=${l.id}">[查看]</a></td>
        </tr>
        </c:forEach>
        
    </table>
    <itcast:page url="${pageContext.request.contextPath }/memberm/showMemberByCount"/>
</div>
</body>
</html>