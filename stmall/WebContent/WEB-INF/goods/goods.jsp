<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%   
    String path = request.getContextPath();   
    String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html>
<html>
	<head>
		<base href="<%=basePath%>" >
		<meta charset="UTF-8">
		<title>${requestScope.goods.gname } ${requestScope.goods.gdept }</title>
		
		<link rel="stylesheet" href="css/product.css" />
		<script type="text/javascript" src="js/jquery-2.2.4.min.js"></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		<script type="text/javascript">
		
			var gid = ${param.gid};
			//.container .goodinfo .dd a
			$(function(){
				// 给超链接加href属性
				$(".container .goodinfo .dd a").attr("href", "javascript:void(0)");
				
				// 给所有的超链接加点击事件, 
				$(".container .goodinfo .dd a").click(function(){
					// $(this) 选择当前被点击的元素.
					// siblings() 选择所有的兄弟节点.
					$(this).siblings().removeClass("rborder");
					// 当前标签, 切换样式: 如果标签已经有了Class属性, 就删除, 如果没有就添加
					$(this).toggleClass("rborder");
				});
				
				//var num = 100;
				//alert (num.toFixed(2));
			});
			
			function add(){
				var count = parseInt($("input[name='buyCount']").val());
				
				// count 不能大于库存 
				// ajax异步请求当前库存 100
				$.ajax({
					url : "goodsJSON.action",
					type : "post",
					data : {"gid": gid},
					dataType : "JSON",
					success : function(data) {
						
						// 当前数量小于库存时 加一
						if (count < data.gcount){
							$("input[name='buyCount']").val(count+1);
						} 
					}
				});
			}
			function sub() {
				var count = parseInt($("input[name='buyCount']").val());
				
				if (count > 1){
					$("input[name='buyCount']").val(count-1);
				}
			}
			
			function countChange() {
				var count = parseInt($("input[name='buyCount']").val());
				
				// count 不能大于库存 
				// ajax异步请求当前库存 100
				$.ajax({
					url : "goodsJSON.action",
					type : "post",
					data : {"gid": gid},
					dataType : "JSON",
					success : function(data) {
						
						// 当设置值大于库存时, 强制设置为库存
						if (count > data.gcount){
							$("input[name='buyCount']").val(data.gcount);
						} 
						
						// 当count <1 库存>0时, 这时才能设置成1
						if (count < 1 && data.gcount>0){
							$("input[name='buyCount']").val(1);
						} else if(data.gcount == 0) {
							$("input[name='buyCount']").val(0);
						}
						
					}
				});
			}
			
			function putcart() {
				// 取到商品ID
				var gid = ${param.gid}; 
				// 取到购买数量
				var count = $("input[name='buyCount']").val();
				
				
				// 先取cookie
				var ckiCart = $.cookie("cart");
				
				var cart;
				// 判断Cookie中是否有数据
				if (ckiCart == undefined){
					// 当没有购物车信息时, 创建一个数组保存购物信息
					cart = new Array();
				} else {
					// 当已有购物信息时, 获取已有的信息, 生成数组
					cart = JSON.parse(ckiCart);
				}
				
				// 如果数组中已有, 查找到数据, 数量累加
				var exist = false;
				$.each(cart, function(index, item){
					
					if (item.gid == gid ){
						item.count = parseInt(item.count) + parseInt(count);
						
						exist = true;
					}
					
				});
				
				if (exist == false){
					// 创建一个对象
					var goods = new Object();
					goods.gid = gid;
					goods.count = count;
					
					cart.push(goods);
				}
				
				// 转成JSON字符串  {gid : 值, count : 值}  GSON
				var str = JSON.stringify(cart);
				
				//alert(str);
				
				// 保存到cookie中, cookie只能保存字符串
				//$.cookie("cart", str);
				$.cookie("cart", str, {expires: 7}); // 有效期为7天
				
				// 跳转到购物车页面
				window.location.href="cart.jsp";
				
			}
			
		</script>
				
	</head>
	<body>
		<div class="jdapp">
			<div class="txt">
				使用京东APP<br/>
				随时随地看商品
			</div>
			<div>
				<img src="img/jdapp.png" />
			</div>
			<div class="close">
				X
			</div>
		</div>
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
						<form action="#" method="get">
							<input type="text" name="key"/><input type="submit" value="搜全站" />
						</form>
					</div>
					<div class="menu">
						<a href="#">企业购</a>
						<a href="#">企业信贷</a>
						<a href="#">直邮全球</a>
						<a href="#">企悦服务</a>
					</div>
				</div>
				<div class="cart">
					<span class="cartimg"></span>
					<a href="#">我的购物车</a>
					<span class="cartnum">0</span>
				</div>
				<div class="clearfloat"></div>
			</div>
		</div>
		<div class="hw">
			<div class="hwimg">
			</div>
			<div class="menu">
				<ul>
					<li><a class="showall" href="#">查看所有商品</a>
						<ul>
							<li>Meta系列</li>
							<li>P系列</li>
							<li>nova系列</li>
						</ul>
					</li>
					<li><a href="#">首页</a></li>
					<li><a href="#">Mate系列</a></li>
					<li><a href="#">Mate系列</a></li>
					<li><a href="#">Mate系列</a></li>
				</ul>
			</div>
		</div>
		<div class="container">
			<div class="goodsimgs">
				<img src="upload/${requestScope.goods.gpic }"/>
			</div>
			<div class="goodinfo">
				<h1>${requestScope.goods.gname } ${requestScope.goods.gdept }</h1>
				<p>【白条6期免息+购机送叮咚智能音箱】4000万徕卡三摄/DxO评分过百818手机节开门红，您有一张818元神券待领取 >></p>
				<div class="pricearea">
					<div class="row">
						<div class="dt">京东价: </div>
						<div class="dd price">
							<fmt:formatNumber value="${requestScope.goods.gprice }" type="currency" pattern="￥.00"/>
						</div>
					</div>
					<div class="row">
						<div class="dt">促　销: </div>
						<div class="dd"><span class="redLabel">赠品</span></div>
					</div>
					<div class="row">
						<div class="dt">&nbsp;</div>
						<div class="dd"><span class="redLabel">赠品</span><span class="redLabel">换购</span></div>
					</div>
				</div>
				<div class="row">
					<div class="dt">入　围</div>
					<div class="dd">2018京东手机金机奖 查看>></div>
				</div>
				<div class="row">
					<div class="dt">配 送 至</div>
					<div class="dd">由 京东 发货, 并提供售后服务. 23:00前下单,预计明天(08月08日)送达</div>
				</div>
				<div class="row">
					<div class="dt">重　　量</div>
					<div class="dd">0.5kg</div>
				</div>
				<hr/>
				<div class="row">
					<div class="dt">选择颜色</div>
					<div class="dd">
						<a href="javascript:void(0)">极光红</a>
						<a>亮黑色</a>
						<a>宝石蓝</a>
					</div>
				</div>
				<div class="row">
					<div class="dt">选择版本</div>
					<div class="dd">
						<a>标准版</a>
						<a>分期用</a>
					</div>
				</div>
				<div class="row">
					<div class="dt">选择内存</div>
					<div class="dd">
						<a>6GB+64GB</a>
						<a>6GB+128GB</a>
						<a>6GB+256GB</a>
					</div>
				</div>
				<div class="row">
					<div class="dt">购买方式</div>
					<div class="dd">
						<a>官方标配</a>
						<a>电信优惠购</a>
						<a>联通优惠购</a>
					</div>
				</div>
				<div class="row">
					<div class="dt">套　　装</div>
					<div class="dd">
						<a>优惠套装1</a>
						<a>优惠套装2</a>
						<a>优惠套装3</a>
						<a>优惠套装4</a>
						<a>优惠套装5</a>
					</div>
				</div>
				<div class="row">
					<div class="dt">增值保障</div>
					<div class="dd">
						<a>全保修2年</a>
						<a>碎屏保1年</a>
						<a>延长保1年</a>
					</div>
				</div>
				<div class="row">
					<div class="dt">京东服务</div>
					<div class="dd">
						<a>原厂服务</a>
						<a>特色服务</a>
					</div>
				</div>
				<div class="row">
					<div class="dt">白条分期</div>
					<div class="dd">
						<a>不分期</a>
						<a>3期</a>
						<a>6期</a>
						<a>12期</a>
					</div>
				</div>
				<hr/>
				<div class="row">
					<div class="count" >
						<c:if test="${requestScope.goods.gcount>0 }">
							<input type="text" name="buyCount" value="1" onchange="countChange()"/>
						</c:if>
						<c:if test="${requestScope.goods.gcount==0 }">
							<input type="text" name="buyCount" value="0" onchange="countChange()"/>
						</c:if>
						<a href="javascript:void(0)" onclick="add()" class="add">+</a>
						<a href="javascript:void(0)" onclick="sub()" class="sub">-</a>
					</div>
					<div class="addcart">
						<a href="javascript:void(0)" onclick="putcart()">加入购物车</a>
					</div>
				</div>
				<div class="row">
					<div class="dt">温馨提示</div>
					<div class="dd">·支持7天无理由退货·此商品不可使用京券东券</div>
				</div>
			
			</div>
			<div class="clear"></div>
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
