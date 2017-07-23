<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/backstage/css/cssnormalize-min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/backstage/css/css02.css"/>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
   $(function(){
	   $("#shuaxin").click(function(){
		   window.location.reload(true)
	   })
   })

</script>
</head>
<body>
<div id="head">
    <div id="nav">
        <span>
            <a href="">首页</a> >> <a href="">商品分类</a>
        </span>
    </div>
</div>

<div id="bodyer">
    <div class="btn-group">
        <a href="${pageContext.request.contextPath}/category/selectadd" class="btn btn-default"><span id="tianjia"></span>添加</a>
        <a href="" class="btn btn-default"><span id="shuaxin"></span>刷新</a>
    </div>
    <form class="search">
        <input type="search"/>
        <button type="submit" class="btn-search"></button>
    </form>
    <table>
        <tr>
            <th>名称</th>
            <th>排序</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${xpc }" var="x" >
        <tr>
            <td><b>${x.name }</b></td>
            <td>${x.orders }</td>
            <td>
                <a href="javascript:" class="cmodal">[查看]</a>
                <a href="${pageContext.request.contextPath}/category/selectedit?id=${x.id}" class="modal">[编辑]</a>
                <a href="${pageContext.request.contextPath}/category/delpc?id=${x.id}" class="del-btn">[删除]</a>
            </td>
        </tr>
        <c:forEach items="${x.categorys }" var="c">
        <tr>
            <td>${c.name }</td>
            <td>${c.orders }</td>
            <td>
                <a href="javascript:" class="cmodal">[查看]</a>
                <a href="${pageContext.request.contextPath}/category/selectedit?id=${c.id}" class="modal">[编辑]</a>
                <a href="${pageContext.request.contextPath}/category/delpc?id=${c.id}" class="del-btn">[删除]</a>
            </td>
        </tr>
        </c:forEach>
       </c:forEach>
        
    </table>
    
</div>
<div id="modal-1">
    <div id="dailog" class="dailog">
        <div id="modal-head">
            <span id="cha"></span>
            <p>商品分类</p>
        </div>
        <div id="modal-1-1">
            <form action="">
                <fieldset>
                    <label>
                        名称：
                    </label>
                    <input type="text"/>
                </fieldset>
                <fieldset>
                    <label>
                        排序：
                    </label>
                    <input type="text"/>
                </fieldset>
                <input type="submit" value="确定" class="modal-btn" id="okbtn"/>
                <input type="button" value="取消" class="modal-btn" id="closebtn"/>
            </form>
        </div>
    </div>
</div>
<div id="cmodal-1">
    <div id="cdailog" class="dailog">
        <div id="cmodal-head">
            <span id="ccha"></span>
            <p>分类查看</p>
        </div>
        <div id="cmodal-1-1">
            <form action="">
                <table>
                    <tr>
                        <td>
                            名称：时尚女装
                        </td>
                    </tr>
                    <tr>
                        <td>
                            排序：1
                        </td>
                    </tr>
                </table>
                <input type="button" value="确定" class="modal-btn" id="cclosebtn"/>
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
        $('.cmodal').on('click',function(){
            $("#cmodal-1").fadeIn("1000").css({"display":"block"});
            $("#cdailog").animate({
                bottom:'10%',
                top: '10%',
                opacity: '1'
            },800);
        });
        $('#ccha,#cclosebtn').on('click',function(){
            $("#cdailog").animate({
                top: '7%',
                bottom:'13%',
                opacity: '0'
            },1000,function(){
                $("#cmodal-1").css({"display":"none"});
            });
            $('#cmodal-1').fadeOut("1000");
        });
        $('#delBtn').on('click',function(){
            $(".checkAll:checked").parent().parent().remove();
        });
        $('.del-btn').on('click',function(){
            $(this).parent().parent().remove();
        });
    });
</script>

</html>