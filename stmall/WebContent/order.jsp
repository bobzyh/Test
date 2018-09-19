<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%   
    String path = request.getContextPath();   
    String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html >
<html>
<head>
<base href="<%=basePath%>" >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>京东商城</title>

<link rel="stylesheet" href="css/product.css"/>
<link rel="stylesheet" href="css/search.css"/>
<link rel="stylesheet" href="css/carts.css" />
<script type="text/javascript" src="js/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>


</head>
<body>
	
	<div class="jd">
		<div class="navbg">
			<div class="nav">
				<div class="state">
					送至：北京
				</div>
				
				<div class="menu">
					<a href="#">你好，请登录</a>
					<span>|</span>
					<a href="#">免费注册</a>
					<span>|</span>
					<a href="#">我的订单</a>
					<span>|</span>
					<a href="#">我的京东</a>
					<span>|</span>
					<a href="#">京东会员</a>
					<span>|</span>
					<a href="#">企业采购</a>
					<span>|</span>
					
					<a href="#">
						<span class="phonejd"></span>
						手机京东</a>
					<span>|</span>
					<a href="#">关注京东</a>
					<span>|</span>
					<a href="#">客户服务</a>
					<span>|</span>
					<a href="#">网站导航</a>
				</div>
			</div>
			
		</div>
		<div class="logo">
			
			<div class="logoimg">
				<img src="img/logo.png" />
			</div>
			<div class="type">
				<a href="#">全部分类</a>
			</div>
			<div class="search">
				<div>
					<form action="search.action" method="post">
						<input type="text" name="gname"/><input type="submit" value="搜全站" />
					</form>
				</div>
				<div class="menu">
					<a href="#">企业购</a>
					<a href="#">企业信贷</a>
					<a href="#">直邮全球</a>
					<a href="#">企悦服务</a>
				</div>
			</div>
			
			<div class="clearfloat"></div>
		</div>
	</div>
	
	<div class="cartcontainer">
		<div class="tab">全部商品</div>
		<div class="carttitle">
			<div class="col col-1">
				<div><input type="checkbox" class="checkAll"/></div>全选
			</div>
			<div class="col col-2">
				商品
			</div>
			<div class="col col-3">
				单价
			</div>
			<div class="col col-4">
				数量
			</div>
			<div class="col col-5">
				小计
			</div>
			<div class="col col-6">
				操作
			</div>
			<div class="clear"></div>
		</div>
		
		<div class="cartlist">
			
		</div>
		
		<div class="bar">
			<input type="checkbox" class="checkAll"/> 全选
			<a href="javascript:void(0)">删除选中商品</a>
			<a href="javascript:void(0)">清理购物车</a>
			<span class="count">已选择<span>0</span>件商品</span>
			<span class="price">总价:<span>¥0.00</span></span>
			<a class="check" href="javascript:void(0)" >去结算</a>
		</div>
	
	</div>

	
	<div class="bottom">
			<div class="about">
				<a href="#">关于我们</a>
				<span>|</span>
				<a href="#">关于我们</a>
				<span>|</span>
				<a href="#">关于我们</a>
				<span>|</span>
				<a href="#">关于我们</a>
				<span>|</span>
				<a href="#">关于我们</a>
				<span>|</span>
				<a href="#">关于我们</a>
				<span>|</span>
				<a href="#">关于我们</a>
				<span>|</span>
				<a href="#">关于我们</a>
				
			</div>
			<div class="copyright">Copyright©2004-2018  京东JD.com 版权所有</div>
		</div>
</body>
</html>