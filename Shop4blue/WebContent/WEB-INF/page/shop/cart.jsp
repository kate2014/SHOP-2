<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/shop/css/gouwuyemian.css" />
<script src="resources/shop/js/gouwuyemianJQ.js"></script>
<script src="resources/shop/js/gouwuyemian.js"></script>
<script src="resources/admin/js/jquery-2.1.4.min.js"></script>
</head>
<body>
	<div id="modal" class="modal">
		<div id="dialog" class="dialog">
			<div id="touxiang">
				<img src="222.png" alt="" id="yaoming" /> <span>&nbsp;欢迎大爷来消遣</span>
			</div>
			<p>头像</p>
			<div class="dialog-title">
				<span class="dialog-title-text">VIP集中营</span> <span
					class="dialog-close" id="cha">&times;</span>
			</div>
			<form action="../精品男装/精品男装.html" name="fm" id="fm" method="post">
				<div>
					<label for="uname">姓名:</label> <input type="text" id="uname"
						name="uname" placeholder="请输入用户名" />
				</div>
				<div>
					<label for="pwd">密码:</label> <input type="password" id="pwd"
						name="pwd" placeholder="请输入密码" />
				</div>
				<div>
					<label for="repwd">确认密码:</label> <input type="password" id="repwd"
						name="repwd" placeholder="请再次确认密码" />
				</div>
				<div>
					<label for="agress">认同意协议:</label> <label for="agress"
						class="shifou">是</label><input type="radio" value="1" name="q123"
						id="agress" /> <label for="disagress" class="shifou">否</label><input
						type="radio" value="0" name="q123" id="disagress" />
				</div>
				<div>
					<label for="">会员等级:</label> <select name="a1" id="a1">
						<option value="">--请确定身份--</option>
						<option value="4">VIP1</option>
						<option value="5">VIP2</option>
						<option value="6">VIP3</option>
						<option value="7">VIP4</option>
					</select>
				</div>
				<div>
					<label for="">备注</label>
					<textarea name="" id="a11" cols="30" rows="10" placeholder="我有好的建议"></textarea>
				</div>
			</form>
			<div id="asd">
				<a href="javascript:void(0)" class="btn" id="btn1">确定</a> <a
					href="javascript:void(0)" class="btn" id="btn2">关闭</a>
			</div>
		</div>
	</div>
	<div id="kuang">
		<div class="qubie">
			<div id="nav0">
				<img style="margin-bottom: 2px" src="header_logo.gif" alt="#">
				<img src="CN-wp3.jpg" alt="#" id="guanggao">
				<div id="nav0-first">
					<span><a href="" style="color: black; text-decoration: none">登陆</a><span
						class="xian"></span></span> <span>注册<span class="xian"></span></span> <span><a
						href="javascript:void(0)" id="huiyuanzhongxin">会员中心</a><span
						class="xian"></span></span> <span>购物指南<span class="xian"></span></span> <span>关于我们</span>
				</div>
				<div id="nav0-second">
					<span id="gouwu"></span> <a href="javascript:void(0)">购物车</a>
					<div id="cart">
						<span id="gouwucha">&times;</span>
						<div style="padding: 50px 50px 0 50px">
							您已经购买了￥9999.99元商品，余额不足，请充值！！！</div>
					</div>
				</div>
				<div id="nav0-third">
					<span id="dianhua"></span>
					<p>客服热线：400-8888888</p>
				</div>
			</div>
			<div id="shouxuan">
				<span><a href="">首页</a><span class="xian"></span></span> <span><a
					href="../精品女装2/精品女装2.html">时尚女装</a><span class="xian"></span></span> <span><a
					href="../精品男装/精品男装.html" target="ifr">精品男装</a><span class="xian"></span></span>
				<span><a href="#youshi">精致内衣</a><span class="xian"></span></span> <span><a
					href="">服饰配件</a><span class="xian"></span></span> <span><a href="">时尚女鞋</a><span
					class="xian"></span></span> <span><a href="">流行男鞋</a><span
					class="xian"></span></span> <span><a href="">童装童鞋</a></span>
			</div>
			<div id="sousuo">
				<span class="rexiao"><a href="">热销</a></span><span id="shuxian1"></span>
				<span class="rexiao"><a href="">最新</a></span><span id="shuxian2"></span>
				<div id="resou">
					热门搜索： <a href="">T恤衫</a> <a href="">衬衫</a> <a href="">西服</a> <a
						href="">西裤</a> <a href="">森马</a> <a href="">七匹狼</a> <a href="">梵希蔓</a>
					<a href="">春夏新款</a> <a href="">牛仔裤</a>
				</div>
				<span id="sousuo-1"> <input type="search" placeholder="商品搜索"
					id="search"> <input type="button" value="搜索"
					id="search-btn">
				</span>
			</div>
		</div>
		<div id="daohang">
			<a href="javascript:void(0)" class="chakanq" id="chakan"
				style="color: white">查看购物车</a> <a href="javascript:void(0)"
				class="dingdanq" id="dingdan">&nbsp;订单信息</a> <a
				href="javascript:void(0)" class="wanchengq" id="wancheng">&nbsp;完成订单</a>
			<div id="daohangtupian"></div>
		</div>
		<div id="daohang1">
			<a href="javascript:void(0)" class="chakanq" id="chakan1">查看购物车</a> <a
				href="javascript:void(0)" class="dingdanq" id="dingdan1"
				style="color: white">&nbsp;订单信息</a> <a href="javascript:void(0)"
				class="wanchengq" id="wancheng1">&nbsp;完成订单</a>
			<div id="daohangtupian1"></div>
		</div>
		<div id="daohang2">
			<a href="javascript:void(0)" class="chakanq" id="chakan2">查看购物车</a> <a
				href="javascript:void(0)" class="dingdanq" id="dingdan2">&nbsp;订单信息</a>
			<a href="javascript:void(0)" class="wanchengq" id="wancheng2"
				style="color: white">&nbsp;完成订单</a>
			<div id="daohangtupian2"></div>
		</div>
		<div id="tbl-div">
			<table id="tbl" cellspacing="0">
				<tr>
					<td width="70px">图片</td>
					<td width="500px">商品</td>
					<td>单价</td>
					<td width="80px">数量</td>
					<td>小计</td>
					<td width="90px">操作</td>
				</tr>
				<tr>
					<td>
						<div id="xianshangtupian">
							<img src="" alt="尚都比拉女装2016" />
						</div>
					</td>
					<td>尚都比拉女装2016夏装现款蕾丝连衣裙 韩版修身雪纺打底裙子...</td>
					<td>￥898.00</td>
					<td><input type="number" value="2" style="width: 50px" /></td>
					<td>￥1796.00</td>
					<td><a href="javascript:void(0)">删除</a></td>
				</tr>
			</table>
		</div>
		<div id="tbl-div1">
			<table id="tbl1">
				<tr>
					<td>订单号</td>
					<td>邮寄地址</td>
					<td>联系电话</td>
				</tr>
				<tr>
					<td>1654842032155</td>
					<td>哈尔滨市学府路251号鑫联华</td>
					<td>13845676759</td>
				</tr>
			</table>
		</div>
		<div id="tbl2">确认无误后，请点击[提交订单]按钮↘</div>
		<div id="xiangqing">
			<span>登录后确认是否享受优惠</span> <span>&nbsp;赠送积分:</span><span id="hong">596</span>
			<span>&nbsp;商品金额:</span><span id="hongda">￥5960.00</span>
		</div>
		<div style="clear: both"></div>
		<div id="zhongjicaozuo">
			<a href="../精品女装2/精品女装2.html">提交订单</a> <a href="">清空购物车</a>
		</div>
		<div id="youshi">
			<img src="" alt="我们的优势" />
		</div>
		<div id="End">
			<ul>
				<li><a href="">关于我们</a></li>
				<li><a href="">联系我们</a></li>
				<li><a href="">诚聘员才</a></li>
				<li><a href="">法律声明</a></li>
				<li><a href="">友情链接</a></li>
				<li><a href="">支付方式</a></li>
				<li><a href="">配送方式</a></li>
				<li><a href="">SHOP++官网</a></li>
				<li><a href="">SHOP++论坛</a></li>
			</ul>
		</div>
		<div style="clear: both"></div>
		<div id="biaozhu">
			<p>Copyright◎ 2016-2046 SHOP++商城 版权所有</p>
		</div>
	</div>
</body>
<script src="购物页面JQ.js"></script>
</html>