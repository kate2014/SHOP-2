<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
</head>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/backstage/css/css01.css"/>
<body>
    <div id="nav-left">
        <div id="left-dingdan" class="lf">
            <ul>
                <span><b>订单管理</b></span>
                <br/>
                <span id="ge"></span>
                <li>
                    <a href="${pageContext.request.contextPath}/ordermanage/list" target="订单">订单管理</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/orderGet/getMoney" target="订单">收款管理</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/orderReturn/returnMoney" target="订单">退款管理</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/orderShipping/getShipping" target="订单">发货管理</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/orderReturns/getReturns" target="订单">退货管理</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/deliveryManage/todeliveryManage" target="订单">发货点管理</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/orderExpressModel/getExpressModel" target="订单">快递单模板</a>
                </li>
            </ul>
        </div>
    </div>
    <!--内容-->
    <div id="container">
        <iframe src="${pageContext.request.contextPath}/ordermanage/list" frameborder="0" name="订单"
                width="100%" height="100%">

        </iframe>
    </div>
</body>
</html>