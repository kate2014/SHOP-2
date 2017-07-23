<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>会员登录 - Powered By SHOP++</title>
<meta name="author" content="SHOP++ Team" />
<meta name="copyright" content="SHOP++" />
<link href="${pageContext.request.contextPath }/resources/shop/css/common.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/resources/shop/css/login.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/jsbn.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/prng4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/rng.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/rsa.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/base64.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/shop/js/common.js"></script>
<script type="text/javascript">

$().ready(function(){
	var $loginForm = $("#loginForm");
	var $username = $("#username");
	var $password = $("#password");
	$loginForm.validate({
	        debug:false,
	        onkeyup:false,
	        rules:{
	            username:{
	                required:true, 
	                remote:{
	                    type:"POST",
	                    url:"${pageContext.request.contextPath}/proLogin/checkName", //请求地址
	                    data:{
	                        username:function(){ return $("#username").val(); }
	                    }
	                }
	                
	            },
	            password:{
	                required:true,
	                remote:{
	                	url: "${pageContext.request.contextPath}/proLogin/nameAndPass",
	    				type: "POST",
	    				data: {
	    					username:function(){ return $("#username").val(); },
	    					password:function(){ return $("#password").val(); }
	    				}
	                }
	            }
	        },
	        messages:{
	            username:{
	                remote:"用户名不存在"
	            },
	            password:{
	                remote:"密码错误"
	            }
	        },
	       
	    });
	 
	
	
})
</script>
</head>
<body>
<script type="text/javascript">
$().ready(function() {

	var $headerLogin = $("#headerLogin");
	var $headerRegister = $("#headerRegister");
	var $headerUsername = $("#headerUsername");
	var $headerLogout = $("#headerLogout");
	var $productSearchForm = $("#productSearchForm");
	var $keyword = $("#productSearchForm input");
	var defaultKeyword = "商品搜索";
	
	var username = getCookie("username");
	if (username != null) {
		$headerUsername.text("您好, " + username).show();
		$headerLogout.show();
	} else {
		$headerLogin.show();
		$headerRegister.show();
	}
	
	$keyword.focus(function() {
		if ($keyword.val() == defaultKeyword) {
			$keyword.val("");
		}
	});
	
	$keyword.blur(function() {
		if ($keyword.val() == "") {
			$keyword.val(defaultKeyword);
		}
	});
	
	$productSearchForm.submit(function() {
		if ($.trim($keyword.val()) == "" || $keyword.val() == defaultKeyword) {
			return false;
		}
	});
	

});
</script>
<%@include file="header.jsp" %>
<div class="container login">
		<div class="span12">
<div class="ad">
					<img src="http://storage.shopxx.net/demo-image/3.0/ad/login.jpg" width="500" height="330" alt="会员登录" title="会员登录" />
</div>		</div>
		<div class="span12 last">
			<div class="wrap">
				<div class="main">
					<div class="title">
						<strong>会员登录</strong>USER LOGIN
					</div>
					<form id="loginForm" action="${pageContext.request.contextPath}/proLogin/realLogin" method="post">
						<table>
							<tr>
								<th>
										用户名/E-mail:
								</th>
								<td>
									<input type="text" id="username" name="username" class="text" maxlength="20" />
								</td>
							</tr>
							<tr>
								<th>
									密&nbsp;&nbsp;码:
								</th>
								<td>
									<input type="password" id="password" name="password" class="text" maxlength="20" " />
								</td>
							</tr>
								<tr>
									<th>
										验证码:
									</th>
									<td>
										<span class="fieldSet">
											<input type="text" id="captcha" name="captcha" class="text captcha" maxlength="4" autocomplete="off" /><img id="captchaImage" class="captchaImage" src="/shopxx/common/captcha.jhtml?captchaId=313695c9-cafb-4c10-93f1-f68464faa196" title="点击更换验证码" />
										</span>
									</td>
								</tr>
							<tr>
								<th>
									&nbsp;
								</th>
								<td>
									<label>
										<input type="checkbox" id="isRememberUsername" name="isRememberUsername" value="true" />记住用户名
									</label>
									<label>
										&nbsp;&nbsp;<a href="/shopxx/password/find.jhtml">找回密码</a>
									</label>
								</td>
							</tr>
							<tr>
								<th>
									&nbsp;
								</th>
								<td>
									<input id="sub" type="submit" class="submit" value="登 录" />
								</td>
							</tr>
							<tr class="register">
								<th>
									&nbsp;
								</th>
								<td>
									<dl>
										<dt>还没有注册账号？</dt>
										<dd>
											立即注册即可体验在线购物！
											<a href="${pageContext.request.contextPath }/proRegister/register">立即注册</a>
										</dd>
									</dl>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>