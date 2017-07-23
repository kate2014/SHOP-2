<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="itcast" uri="http://itcast.cn/common/" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta >
<title>Insert title here</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.js"></script>
    <style>
        body,ul,li,h1,form,lable,input,select{
            margin:0;
            padding:0;
            font-family:"Microsoft Yahei";
            font-weight:normal;
            font-size: 13px;
            color: #333;
        }
        body,html{
            height:100%;
            width:100%;
        }
        li{
            list-style: none;
        }
        a{
            text-decoration: none;
            color:#000000;
        }
        #top{
            height:29px;
            border-bottom: 1px solid #ccc;
            background:#e5ffed;
            line-height: 30px;
        }
        #top .shouye{
            display: inline-block;  margin-left:1%;
        }
        #add>div{
            width: 120px;height: 30px;display: inline-block;
            margin-top: 9px;border: 1px solid #CCCCCC;
            text-align: center;line-height: 30px;
            background: #f9f9f9;
        }
        .line{width: inherit;height: 35px;border-bottom: 1px solid #CCCCCC}
        .line-1{width: 200px;height: 35px;background:#e5ffed;
            display: inline-block;text-align: right;line-height: 35px}
        .input{width: 240px;height: 26px;
            box-shadow: inset 0px 1px 1px 0px #fcfcfc
        }
        .btn{
            background-image:linear-gradient(to bottom ,#e5ffed , #bdf7ff,#e5ffed) ;
            width:80px;
            height:30px;
            border:1px solid #ccc;
            outline: none;
        }
        .btn:hover{
            background-image:linear-gradient(to bottom ,#e5ffed , #32ecff,#e5ffed) ;
        }
        .line-1-b{width: 200px;height: 352px;background:#e5ffed;
            display: inline-block;text-align: right;line-height: 35px;
            float: left;
        }
        .line-b textarea{
            width: 800px;  height: 200px;
            float: left;
        }
    </style>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="editor/kindeditor.js"></script>
</head>
<body>
<div id="top">
    <span class="shouye">首页>></span>
    <span>编辑</span>
    
</div>
<div>
    <form id="addform" class="add1-1" action="${pageContext.request.contextPath}/brand/showBrands?rows=${rows }&flag=update" method="post">
        <input type="hidden" name="id" value="${xb.id }">
        <div class="line">
            <div class="line-1">*名称:&nbsp&nbsp</div>
            <input required="ture" class="input" type="text" name="name" value="${xb.name }" />
        </div>
        <div class="line">
            <div class="line-1">*类型:&nbsp&nbsp</div>
            <select required="ture" name="" id="picOrte">
                <option value="text" >文本</option>
                <option value="picture" selected="selected">图片</option>
            </select>
        </div>
        <div class="line">
            <div class="line-1">logo:&nbsp&nbsp</div>
            <input type="text" id="filepath" class="input"  name="logo" value="${xb.logo }"/>
            <input type="button" id="filebutton" value="请选择文件" class="btn"
                   onclick="browsefile.click()"/>
            <input type="file" id="browsefile"
                   style="visibility: hidden" onchange="filepath.value=this.value"/>
        </div>
        <div class="line">
            <div class="line-1">网址:&nbsp&nbsp</div>
            <input type="text" id="url" class="input" name="url" value="${xb.url }"/>
        </div>
        <div class="line">
            <div class="line-1">排序:&nbsp&nbsp</div>
            <input type="text" class="input" name="orders" value="${xb.orders }"/>
        </div>
        <div class="line-b">
            <div class="line-1-b">介绍:&nbsp&nbsp</div>
            <textarea id="editor"  name="introduction" class="editor">
              ${xb.introduction }
            </textarea>
        </div>
        <div class="line">
            <div class="line-1">&nbsp&nbsp</div>
            <input class="btn" type="submit" value="确定"/>
            <input class="btn" type="button" value="返回"/>
        </div>
    </form>
</div>
</body>
<script type="text/javascript">
  $(function(){
	  
	  $("#picOrte").change(function(){
		  var value=$(this).val();
		  if(value=="text"){
			  alert("aaaaa")
			  $("#filepath").attr("disabled","disabled");
		  }
          if(value=="picture"){
        	  alert("ccc")
			  $("#filepath").removeAttr("disabled");
		  }
		  
	  })
	  
	  $("#addform").submit(function(){
		  var url=$("#url").val();
		  var logo=$("#filepath").val();
		  var introduction=$("#editor").val();
		  if(url==""){
			  $("#url").removeAttr("name");
		  }
		  if(introduction==""){
			  $("#editor").removeAttr("name");
		  }
		  if(logo==""){
			  $("#filepath").removeAttr("name");
		  }
	  })
  })

</script>
</html>