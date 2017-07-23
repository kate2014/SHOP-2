<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
          <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="itcast" uri="http://itcast.cn/common/" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="/Shop4blue/resources/backstage/css/cssnormalize-min.css"/>
    <link rel="stylesheet" href="/Shop4blue/resources/backstage/css/css02.css"/>
    <script src="/Shop4blue/resources/backstage/js/js02.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.4.2.min.js"></script>
</head>
<script type="text/javascript">
$(function(){
	$("#selCount").change(function(){
		   var option = $("#selCount > option");
		   var size=5;
		   option.each(function(){
			    if($(this).attr("selected")){
				   size=$(this).val()
			   } 
		   })
		   var zz = ${page.page};
		   location.href="${pageContext.request.contextPath}/orderGet/checkPaymentBysize?rows="+size+"&page="+${page.page}; 
		})
	$("#del").click(function(){
		var str="";
		var len=$("input[name='checkAll']:checked").length;
		if(len==0){
			alert("请选择想要删除的收款单");
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
		 $.post("${pageContext.request.contextPath}/orderGet/delPayment",{"str":str,"page":"${page.page}","size":"${page.size}"},function(page){
 	          window.location.reload(true);
		  }); 
		
	})
})


</script>
<body>
<div id="head">
    <div id="nav">
        <span>
            <a href="">首页</a> >> <a href="">收款管理</a> （共${page.total }条记录）
        </span>
    </div>

</div>

<div id="bodyer">
    <div class="btn-group">
        <a href="#" class="btn btn-default" id="del"><span id="shanchu"></span>删除</a>
        <a  href="" class="btn btn-default"><span id="shuaxin"></span>刷新</a>
         <select name="selCount" id="selCount"class="myxs">
            <option value="2" id="op1">每页显示</option>
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
            <th>编号</th>
            <th>类型</th>
            <th>方式</th>
            <th>支付方式</th>
            <th>付款金额</th>
            <th>会员</th>
            <th>订单编号</th>
            <th>状态</th>
            <th>付款日期</th>
            <th>创建时间</th>
            <th>操作</th>
        </tr>
      <c:forEach items="${page.rows }" var="l">
      <tr>
            <td><input type="checkbox" name="checkAll" class="checkAll" onclick="setSelectAll();"id="${l.id }" value="${l.id }"/></td>
            <td>${l.sn }</td>
            <td>${l.type }</td>
            <td>${l.method }</td>
            <td>${l.payment_method }</td>
            <td><fmt:formatNumber type="number" value="${l.amount }" pattern="#.00"/></td>
            <td>${l.member }</td>
            <td>${l.ddbh }</td>
            <td>${l.status }</td>
              <td>${l.payment_date }</td>
              <td>${l.create_date }</td>
            <td><a href="${pageContext.request.contextPath }/orderGet/getMoneyDetails?id=${l.id}">[查看]</a></td>
        </tr>
      </c:forEach>
    </table>
   <itcast:page url="${pageContext.request.contextPath }/orderGet/checkPaymentBysize"/>
</div>
</body>
</html>