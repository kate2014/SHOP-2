<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/backstage/css/cssnormalize-min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/backstage/css/css02.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.4.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/backstage/js/js02.js"></script>
    <script type="text/javascript">
    $(function(){
    	
    
    $("#del").click(function(){
    	
		var str="";
		var len=$("input[name='ids']:checked").length;
		if(len==0){
			alert("请选择想要删除的会员");
		}
		else{
			$("input[name='ids']:checked").each(function(i){
		     if(i!=len-1){
		    	 str+=$(this).val();
		    	 str+=",";
		     }else{
		    	 str+=$(this).val();
		     }
		 })
		}
		$.post("${pageContext.request.contextPath}/memberr/deldate",{"str":str},function(list){
			 window.location.reload(true); 
		});
    	})
    })
    </script>
</head>
<body>
<div id="head">
    <div id="nav">
        <span>
            <a href="">首页</a> >> <a href="">会员注册项</a>
        </span>
    </div>
</div>

<div id="bodyer">
    <div class="btn-group">
        <a href="${pageContext.request.contextPath}/user/memberregisteradd" id="btn-first" class="btn btn-default"><span id="tianjia"></span>添加</a>
         <a href="" class="btn btn-default" id="del"><span id="shanchu"></span>删除</a> 
        <a href="${pageContext.request.contextPath}/memberr/selectall" class="btn btn-default"><span id="shuaxin"></span>刷新</a>
       
       <!--  <a  href="#" class="btn btn-default">每页显示<span class="xiasanjiao"></span></a> -->
    
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
            <th>是否必填</th>
            <th>是否启用</th>
            <th>排序</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${list }" var="l" >
				<tr>
				<c:if test="${l.id<=8 }">
					<td>
						<input type="checkbox" name="ids" title="系统内置会员注册项不允许删除" disabled="disabled" />
					</td>
					</c:if>
					<c:if test="${l.id>8 }">
					<td>
						<input type="checkbox" name="ids" value="${l.id }"  />
					</td>
					</c:if>
					<td>
						${l.name}
					</td>
					<td>
						<c:if test="${l.type==0 }">文本</c:if>
						<c:if test="${l.type==1 }">单选项</c:if>
						<c:if test="${l.type==2 }">多选项</c:if>
					</td>
					<td>
					<c:if test="${l.isRequired=='false' }">否</c:if>
					<c:if test="${l.isRequired=='true' }">是</c:if>
					</td>
					<td>
					<c:if test="${l.isEnabled=='true' }"><span class="duihao"></span></c:if>
					<c:if test="${l.isEnabled=='false' }"><span class="cuohao"></span></c:if>
					</td>
					<td>
						${l.orders }
					</td>
					<td>
						<a href="${pageContext.request.contextPath}/memberr/selectbyid?id=${l.id}">[编辑]</a>
					</td>
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