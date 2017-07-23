<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/backstage/css/reset.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/backstage/css/supersized.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/backstage/css/style.css">
<script type="text/javascript" src="resources/shop/js/jquery.js"></script>
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <script type="text/javascript">
          $(function(){
        	  var $captchaImage = $("#captchaImage");
        	  $("#btn").click(function(){	
        			$.get("${pageContext.request.contextPath}/identity/check","word="+$("input[name='identity']").val(),function(d){
        				if(d==0){
        					alert("验证码输入错误");
        				}else{
        					$("form").submit()
        				}
        			})
        		})
        		
        		$captchaImage.click(function() {
        			$captchaImage.attr("src","${pageContext.request.contextPath}/identity/iden?i="+Math.random());
        		});
          })
        </script>

    </head>

    <body>

        <div class="page-container">
            <h1>登录</h1>
            <form action="${pageContext.request.contextPath}/login" method="post">
                <input type="text" name="username" class="username" placeholder="用户名">
                <input type="password" name="password" class="password" placeholder="密码">
                <input type="text" name="identity" class="username" placeholder="验证码">
                <img id="captchaImage" class="captchaImage" src="${pageContext.request.contextPath}/identity/iden"  />
                <button type="button" id="btn">提交</button>
                <div class="error"><span>+</span></div>
            </form>
            
        </div>
		
        <!-- Javascript -->
        <script src="${pageContext.request.contextPath}/resources/backstage/js/jquery-1.8.2.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/backstage/js/supersized.3.2.7.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/backstage/js/supersized-init.js"></script>
        <script src="${pageContext.request.contextPath}/resources/backstage/js/scripts.js"></script>

    </body>

</html>


