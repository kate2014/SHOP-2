<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Shop4Blue</title>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/backstage/css/cssnormalize-min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/backstage/css/css01.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/backstage/css/css02.css"/>
</head>
<body>
<div id="wai"> 
    <div id="head">
        <img src="${pageContext.request.contextPath}/resources/logo/shop.png" width="180px" height="50px" alt="#"/>
        <div class="right">
            <span><a href="">官方网站</a></span><span class="xian"></span>
            <span><a href="">交流论坛</a></span><span class="xian"></span>
            <span><a href="">关于我们</a></span>
        </div>
        <span id="xia">
            <div id="kong"></div>
            <div class="deng">
                <a href="${pageContext.request.contextPath}/good/togood" id="shangpin" target="ifr">商品</a>
            </div>
            <div class="deng">
                <a href="${pageContext.request.contextPath}/orders/toorder" id="dingdan" target="ifr">订单</a>
            </div>
            <div class="deng">
                <a href="${pageContext.request.contextPath}/user/member" id="huiyuan" target="ifr">会员</a>
            </div>
            <!-- <div class="deng">
                <a href="内容/内容.html" id="neirong" target="ifr">内容</a>
            </div>
            <div class="deng">
                <a href="营销/营销.html" id="yingxiao" target="ifr">营销</a>
            </div>
            <div class="deng">
                <a href="统计/统计.html" id="tongji" target="ifr">统计</a>
            </div>
            <div class="deng">
                <a href="系统/系统.html" id="xitong" target="ifr">系统</a>
            </div> -->
            <div class="deng">
                <a href="${pageContext.request.contextPath}/hc/index" class="deng-a" target="view_window">首页</a>
            </div>
        </span>
        <div id="left-nav" class="right">
            <a href="">${admin.username } 你好！</a>
            <a href="${pageContext.request.contextPath}/adminman/toadminmanage"  target="ifr">[账号设置]</a>
            <a href="${pageContext.request.contextPath}/tologin">[注销]</a>
        </div>
    </div>
</div>
<div style="height: 1000px" id="chuang">
    <iframe src="${pageContext.request.contextPath}/good/togood" frameborder="0" name="ifr" id="ifr"
            width="100%" height="100%">
    </iframe>
</div>
</body>
<script>

</script>
</html>