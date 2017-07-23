<%@ page language="java" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Shop4Blue</title>
</head>
<style>
	body{
    background:-webkit-gradient(linear, 0 0, 0 bottom, from(#72EABC), to(rgba(14, 65, 118, 1)));  
	margin:0px; 
	padding:0px; 
	font-size:12px; 
	color:#FFFFFF; 
	text-align:center; 
}
 input,select,option,textarea{
 	outline: none;
 }
#png{
	height:230px;  
	width:420px; 
	text-align:center;
	background: transparent;
	position:fixed;
	left:50%;
	top:50%;
	margin-left:-200px;
	margin-top:-115px;
}

.bqxx a:link,a:visited, a:active{ 
	color:white; 
	text-decoration:none;
}
a:hover {
	color:#FED03F; 
	text-decoration:underline;
} 

.box{ 
	height:200px;  
	text-align:center; 
	background: transparent;
}
.inputstyle{
	width: 420px;
	height: 100px;
	text-align: center;
	background: transparent;
}
.inputlable{
	height:40px; 
	margin-top:10px;
	font-size: 18px;
	color: white;
}
.inputstyle_in{
	height:35px;
	width: 250px;
	margin-top:10px;
	font-size: 16px; 
	text-indent: 20px;
	background-color:transparent;
	border-radius: 20px;
	border:2px solid white;
}
.inputstyle_in::-webkit-input-placeholder{
	color: white;
}
.btnstyle{
	width: 350px;
	height: 100px;
	background: transparent;
	margin:0 auto;
}
.loginImgOut {
	display:inline-block;
	margin-top: 25px;
	height: 40px;
	width: 140px;
	text-align :center;
	background: white;
	color: #338090;
	font-size: 18px;
	font-weight: bold;
	border: 2px solid white;
	border-radius: 20px;
}
.resetImgOut {
	display:inline-block;
	margin-top: 25px;
	height: 40px;
	width: 140px;
	text-align :center;
	background: white;
	color: #338090;
	font-size: 18px;
	font-weight: bold;
	border: 2px solid white;
	border-radius: 20px;
}
.btnstyle_left{
	float: left;
}
.btnstyle_right{
	float: right;
}
</style>
<body>
<form id="login_main" method="post" action="${pageContext.request.contextPath}/login">
<div id="png">
	<div class="box">
		 <div class="inputstylek">
			  <div class="inputstyle">
					<div class="inputlable">
						<input class="inputstyle_in" placeholder="用户名"type="text" value="${userName}" name="username" id="userName"
						 onFocus="this.select();"
						 autocomplete="off" title="请您输入用户名"/><div id="ts" style="z-index:1;"></div>
					 </div>
					 
					 
				    <div class="inputlable">
						<input class="inputstyle_in" placeholder="用户密码" type="password" value="" name="password" id="password" onfocus="$('#ts').css('display','none');this.select();"					
						 onKeyDown="javascript:if(event.keyCode==13){ submitFind(); }"
						 title="请您输入密码"/>
					 </div>
					 
				
				
			  </div>
			<div class="btnstyle">
				<input  class="loginImgOut" value="登录" type="submit"/>
				
				<input class="resetImgOut" value="重置" type="reset"/>
			
			</div>
		</div>
	</div>
</div>
</form>
<script type="text/JavaScript">
	document.getElementById('login_main').userName.focus();
</script>
</body>
</html>

