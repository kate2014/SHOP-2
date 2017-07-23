<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/backstage/css/css01.css"/>
</head>
<body>
<div id="nav-left">
    <div id="left-dingdan" class="lf">
        <ul>
            <span><b>会员管理</b></span>
            <br/>
            <span id="ge"></span>
            <li>
                <a href="${pageContext.request.contextPath}/memberm/getMember" target="会员">会员管理</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/memberRank/getMemberRank" target="会员">会员等级</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/memberr/selectall" target="会员">会员注册项</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/comment/comment" target="会员">评论管理</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/consult?page=1&rows=5" target="会员">咨询管理</a>
            </li>
        </ul>
    </div>
</div>
<!--内容-->
<div id="container">
    <iframe src="${pageContext.request.contextPath}/memberm/getMember" frameborder="0" name="会员"
            width="100%" height="100%">

    </iframe>
</div>
</body>
</html>