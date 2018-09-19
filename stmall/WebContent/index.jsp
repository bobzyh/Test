<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%   
    String path = request.getContextPath();   
    String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html>
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title>京东(JD.COM)</title>
		
		<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.css" />
		<link rel="stylesheet" href="css/index.css" />
		
		<script type="text/javascript" src="js/jquery-2.2.4.min.js" ></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		
		<script type="text/javascript" src="bootstrap-3.3.7-dist/js/bootstrap.js" ></script>
		
		<script>
			
			var inval;
			$(function(){
				
				$(".imglist img").hide();
				$("img[src='img/1.jpg']").show();
				
				inval = setInterval("nextImg()", 2000); // 注意setInterval的第一个参数
				
				
				$(".imglist").mouseover(function(){
					clearInterval(inval);
				});
				$(".imglist").mouseout(function(){
					inval = setInterval("nextImg()", 2000);
				});
				
				// 计算购物车商品数量
				getCartCount();
			});
			
			var index = 1;
			
			function lastImg(){
				
				index--;
				
				if (index < 1){
					index = 4;
				}
				
				showImgByIndex(index); 
			}
			function nextImg(){
				
				index ++;
				
				if (index >4){
					index = 1
				}
				
				showImgByIndex(index);
			}
			
			function showImgByIndex(i){
				$(".imglist img").fadeOut(1000);
				
				if (i == 1){
					$("img[src='img/1.jpg']").fadeIn(1000);
				}
				
				if (i == 2){
					$("img[src='img/2.jpg']").fadeIn(1000);
				}
				
				if (i == 3){
					$("img[src='img/3.jpg']").fadeIn(1000);
				}
				
				if (i == 4){
					$("img[src='img/4.jpg']").fadeIn(1000);
				}
			}
			
			function getCartCount(){
				// 
				// 先取cookie
				var ckiCart = $.cookie("cart");
				
				var cart;
				// 判断Cookie中是否有数据
				if (ckiCart == undefined){
					// 当没有购物车信息时, 设置显示数量为0
					$("#cartNum").text(0);
				} else {
					// 当已有购物信息时, 获取已有的信息, 生成数组
					cart = JSON.parse(ckiCart);
					
					// 计算数量
					var sum = 0;
					for (var i=0; i<cart.length; i++){
						sum += parseInt(cart[i].count);
					}
					
					$("#cartNum").text(sum);
				}
			}
		</script>
	</head>
	<body>
		<div class="navbg">
			<div class="nav">
				<div class="navleft">
					<a class="glyphicon glyphicon-map-marker" href="#">北京</a>
					<div class="citylist">
						<a href=#>北京</a>
						<a href=#>北京</a>
						<a href=#>北京</a>
					</div>
				</div>
				<div class="navright">
					
					<!-- 当用户已经登录时, 显示 用户名和 退出 JSTL -->
					<c:if test="${sessionScope.customer !=null }">
					<a href="Customer/center.action">你好,${sessionScope.customer.cname }</a>
					<a href="Customer/logout.action">退出</a>
					</c:if>
					
					<!-- 当用户没有登录时, 显示登录和注册 -->
					<c:if test="${sessionScope.customer ==null }">
					<a href="login.jsp">你好,请登录</a>
					<a href="register.jsp">免费注册</a>
					</c:if>
					
					<span>|</span>
					<a href="Customer/myOrder.action">我的订单</a>
					<span>|</span>
					<a href="#">我的订单</a>
					<span>|</span>
					<a href="#">我的订单</a>
					<span>|</span>
					<a href="#">我的订单</a>
					<span>|</span>
					<a href="#">我的订单</a>
				</div>
				<div class="clear"></div>
			</div>
			
		</div>
		<div class="search">
			<a class="logo" href="#">
				
			</a>
			<div class="searchbar">
				<div>
					<div class="searchinput">
						<form action="search.action" method="post">
							<input type="text" name="gname"/>
							<span class="glyphicon glyphicon-camera"></span>
							<button type="submit" class="glyphicon glyphicon-search"></button>
						</form>
					</div>
					<div class="cart">
						<a href="cart.jsp" class="glyphicon glyphicon-shopping-cart">我的购物车</a>
						<span id="cartNum">0</span>
					</div>
				</div>
				<div class="ad">
					<a class="active" href="#">App产品</a>
					<a href="#">坚果手机</a>
					<a href="#">坚果手机</a>
					<a href="#">坚果手机</a>
					<a href="#">坚果手机</a>
					<a href="#">坚果手机</a>
					<a href="#">坚果手机</a>
					<a href="#">坚果手机</a>
				</div>
				<div class="menu">
					<a href="#">秒杀</a>
					<a href="#">优惠券</a>
					<a href="#">PLUS会员</a>
					<a href="#">闪购</a>
					<a href="#">秒杀</a>
					<a href="#">优惠券</a>
					<a href="#">PLUS会员</a>
					<a href="#">闪购</a>
				</div>
			</div>
			<div class="clear"></div>
		</div>
		
		<div class="type">
			<div class="productlist">
				<ul>
					<li><a href="#">家用电器</a><ul><li>电视</li><li>空调</li><li>洗衣机</li></ul></li>
					<li><a href="#">手机</a> / <a href="#">运营商</a> / <a href="#">数码</a><ul><li>电视</li><li>空调</li><li>洗衣机</li></ul></li>
					<li><a href="#">电脑</a> / <a href="#">办公</a><ul><li>电视</li><li>空调</li><li>洗衣机</li></ul></li>
					<li><a href="#">家居</a> / <a href="#">家具</a> / <a href="#">家装</a> / <a href="#">厨具</a><ul><li>电视</li><li>空调</li><li>洗衣机</li></ul></li>
					<li><a href="#">家用电器</a><ul><li>电视</li><li>空调</li><li>洗衣机</li></ul></li>
					<li><a href="#">家用电器</a><ul><li>电视</li><li>空调</li><li>洗衣机</li></ul></li>
					<li><a href="#">家用电器</a><ul><li>电视</li><li>空调</li><li>洗衣机</li></ul></li>
					<li><a href="#">家用电器</a><ul><li>电视</li><li>空调</li><li>洗衣机</li></ul></li>
					<li><a href="#">家用电器</a><ul><li>电视</li><li>空调</li><li>洗衣机</li></ul></li>
					<li><a href="#">家用电器</a><ul><li>电视</li><li>空调</li><li>洗衣机</li></ul></li>
					<li><a href="#">家用电器</a><ul><li>电视</li><li>空调</li><li>洗衣机</li></ul></li>
					<li><a href="#">家用电器</a><ul><li>电视</li><li>空调</li><li>洗衣机</li></ul></li>
					<li><a href="#">家用电器</a><ul><li>电视</li><li>空调</li><li>洗衣机</li></ul></li>
					<li><a href="#">家用电器</a><ul><li>电视</li><li>空调</li><li>洗衣机</li></ul></li>
					<li><a href="#">家用电器</a><ul><li>电视</li><li>空调</li><li>洗衣机</li></ul></li>
					<li><a href="#">家用电器</a><ul><li>电视</li><li>空调</li><li>洗衣机</li></ul></li>
					<li><a href="#">家用电器</a><ul><li>电视</li><li>空调</li><li>洗衣机</li></ul></li>
				</ul>
			</div>
		
			<div class="imglist">
				<img src="img/1.jpg" />
				<img src="img/2.jpg" />
				<img src="img/3.jpg" />
				<img src="img/4.jpg" />
				<button onclick="lastImg()" id="btnleft" class="glyphicon glyphicon-chevron-left"></button>
				<button onclick="nextImg()" id="btnright" class="glyphicon glyphicon-chevron-right"></button>
			
				<div class="imgpoint">
					<i onmouseover="showImgByIndex(1)"></i>
					<i onmouseover="showImgByIndex(2)"></i>
					<i onmouseover="showImgByIndex(3)"></i>
					<i onmouseover="showImgByIndex(4)"></i>
				</div>
			</div>
			<div class="imgad">
				<img src="img/ad1.jpg" />
				<img src="img/ad2.jpg" />
				<img src="img/ad3.jpg" />
			</div>
			<div class="info"></div>
		
		</div>
	</body>
</html>
