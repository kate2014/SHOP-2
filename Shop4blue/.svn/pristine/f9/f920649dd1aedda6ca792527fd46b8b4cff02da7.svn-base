<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="itcast" uri="http://itcast.cn/common/" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/backstage/css/cssnormalize-min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/backstage/css/css02.css"/>
    <script src="${pageContext.request.contextPath}/resources/backstage/js/js02.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-1.4.2.min.js"></script>

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
	    		$.post("${pageContext.request.contextPath}/parameter/delete",{"str":str,"pages":"${page}"},function(page){
	    			window.location.reload(true);
	    		});
			})
			
			$("#selCount").change(function(){
	  	      var size = $("option:selected").val();
	    	  window.location.href="${pageContext.request.contextPath}/parameter/list?size="+size;
	     	})
	     	
	     
		})
		
		
	
	</script>

</head>
<body>
<div id="head">
    <div id="nav">
        <span>
            <a href="">首页</a> >> <a href="">商品参数</a> （共${totalParam }条记录）
        </span>
    </div>

</div>

<div id="bodyer">
    <div class="btn-group">
        <a href="${pageContext.request.contextPath}/parameter/toadd" class="btn btn-default"><span id="tianjia"></span>添加</a>
        <a href="javascript:" class="btn btn-default" id="del"><span id="shanchu"></span>删除</a>
        <a  href="" class="btn btn-default" ><span id="shuaxin"></span>刷新</a>
        <select name="" class="myxs" id="selCount">
            <option value="5">每页显示</option>
            <option value="2">2</option>
            <option value="5">5</option>
            <option value="10">10</option>
            <option value="15">15</option>
            <option value="20">20</option>
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
            <th>绑定分类</th>
            <th>参数</th>
            <th>排序</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${page.rows }" var="l">
        <tr>
            <td><input value="${l.id}" type="checkbox" name="checkAll" class="checkAll" onclick="setSelectAll();"/></td>
            <td>${l.name}</td>
            <td>${l.category.name }</td>
            <td>
            <c:forEach items="${l.parameters }" var="pp" end="6" varStatus="i">
            	${pp.name} &nbsp
            	 <c:if test="${i.count==7 }">
            		...
            	</c:if>
            </c:forEach>
            </td>
            <td>${l.orders }</td>
            <td><a href="${pageContext.request.contextPath }/parameter/edit?id=${l.id}">[编辑]</a></td>
        </tr>
        </c:forEach>
    </table>
    <itcast:page url="${pageContext.request.contextPath }/parameter/list"/>
</div>
<div id="modal-1">
    <div id="dailog" class="dailog">
        <div id="modal-head">
            <span id="cha"></span>
            <p>订单更改</p>
        </div>
        <div id="modal-1-1">
            <form action="">
                <fieldset>
                    <label>
                        编号：
                    </label>
                    <input type="text"/>
                </fieldset>
                <fieldset>
                    <label>
                        名称：
                    </label>
                    <input type="text"/>
                </fieldset>
                <fieldset>
                    <label>
                        商品分类：
                    </label>
                    <input type="text"/>
                </fieldset>
                <fieldset>
                    <label>
                        销售价：
                    </label>
                    <input type="number"/>
                </fieldset>
                <fieldset>
                    <label>
                        成本：
                    </label>
                    <input type="number"/>
                </fieldset>
                <fieldset>
                    <label>
                        库存：
                    </label>
                    <input type="number"/>
                </fieldset>
                <fieldset>
                    <label>
                        是否上架：
                    </label>
                    是：<input type="radio" name="1" value="是"/>
                    否：<input type="radio" name="1"/>
                </fieldset>
                <fieldset>
                    <label>
                        创建日期：
                    </label>
                    <input type="datetime-local"/>
                </fieldset>
                <input type="submit" value="确定" class="modal-btn" id="okbtn"/>
                <input type="button" value="取消" class="modal-btn" id="closebtn"/>
            </form>
        </div>
    </div>
</div>
</body>
<script>
    $(document).ready(function(){
        $('.modal').on('click',function(){
            $("#modal-1").fadeIn("1000").css({"display":"block"});
            $("#dailog").animate({
                bottom:'10%',
                top: '10%',
                opacity: '1'
            },800);
        });
        $('#cha,#closebtn').on('click',function(){
            $("#dailog").animate({
                top: '7%',
                bottom:'13%',
                opacity: '0'
            },1000,function(){
                $("#modal-1").css({"display":"none"});
            });
            $('#modal-1').fadeOut("1000");
        });
        $('#delBtn').on('click',function(){
            $(".checkAll:checked").parent().parent().remove();
        });
    });
</script>
</html>