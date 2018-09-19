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
<script type="text/javascript">

	$(function(){
		// 页面加载完成时, 读取Cookie
		getCartCount();
		
		// 绑定全选按钮的事件
		
		$(".checkAll").click(function(){
			var checked = $(this).prop("checked");

			if (checked){
				// 全选
				$("input[type='checkbox']").prop("checked", true);
			} else{
				// 全取消
				$("input[type='checkbox']").prop("checked", false);
			}
			
		});
		
		$("input[type='checkbox']").click(function(){
			// 重新计算数量和总价
			computeCountAndPrice();
		});
		
		// 绑定-号
		$(".sub").click(function(){
			var count = $(this).siblings("input").val();
			
			if (count > 1){
				$(this).siblings("input").val(count-1);
			}
			
			// 重新计算小计
			// 获取价格
			var price = $(this).parents(".cartitem").find(".col-3").find("input").val();
			count = $(this).siblings("input").val();
			
			var sumPrice = price*count;
			
			$(this).parents(".cartitem").find(".col-5").find("span").text("￥" + sumPrice.toFixed(2));
			
			
			// 复选框
			$(this).parents(".cartitem").find("input[type='checkbox']").prop("checked", true);
			
			// 重新计算数量和总价
			computeCountAndPrice();
		});
		
		// 绑定+号
		$(".add").click(function(){
			var count = $(this).siblings("input").val();
			
			var gid = $(this).parents(".cartitem").find("input[type='checkbox']").val();
			
			var input = $(this).siblings("input");
			
			var item = $(this).parents(".cartitem");
			
			//$(this).siblings("input").val(parseInt(count)+1);
			
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
						input.val(parseInt(count)+1);
					} else{
						input.val(data.gcount);
					}
					// 重新计算小计
					
					// 获取价格
					var price = item.find(".col-3").find("input").val();
					count = input.val();
					
					var sumPrice = price*count;
					
					item.find(".col-5").find("span").text("￥" + sumPrice.toFixed(2));
					
					
					// 复选框
					item.find("input[type='checkbox']").prop("checked", true);
					// 重新计算数量和总价
					computeCountAndPrice();
				}
			});
			
		});
	});
	
	function computeCountAndPrice() {
		
		var items = $(".cartitem");	// items不是一个数组, JQuery对象集合
		
		var sumCount = 0;
		var sumPrice = 0;
		
		items.each(function(){
			// 判断复选框是否被选中
			var checked = $(this).find("input[type='checkbox']").prop("checked");
			
			if (checked){
				// 取单价
				price = $(this).find("input[type='hidden']").val();
				// 取数量
				count = $(this).find("input[type='text']").val();
				
				// 计算总数量
				sumCount += parseInt(count);
				
				// 计算总价格
				sumPrice += parseFloat(price)*parseInt(count);
			}
			
		});
		
		$(".count span").text(sumCount);
		$(".price span").text("¥"+sumPrice.toFixed(2));
		
	}
	
	function getCartCount(){
		// 
		// 先取cookie
		var ckiCart = $.cookie("cart");
		
		var cart;
		// 判断Cookie中是否有数据
		if (ckiCart == undefined){
			
		} else {
			// 当已有购物信息时, 获取已有的信息, 生成数组
			cart = JSON.parse(ckiCart);
			
			//alert(ckiCart);
			
			// 遍历数组, 获取每个商品的详细信息
			for (var i=0; i<cart.length; i++){
				var gid = cart[i].gid;
				var count = cart[i].count;
				
				// ajax 获取商品的详情
				$.ajax({
					url : "goodsJSON.action",
					async: false,
					type : "post",
					data : {"gid" : gid},
					dataType : "JSON",
					success : function (data){
						// 获取到详细信息
						var html =
						"<div class=\"cartitem\"> " +
						"	<div class=\"col col-1\">" +
						"		<div><input type=\"checkbox\" value=\""+data.gid+"\"/></div>" +
						"		<img src=\"upload/"+data.gpic+"\"/>" +
						"	</div>" +
						"	<div class=\"col col-2\">" +
						"		<a class=\"gname\" href=\"goods.action?gid="+data.gid+"\" target=\"_blank\">"+data.gname +"&nbsp;&nbsp;&nbsp;"+ data.gdept +"</a>" +
						"		<br/>" +
						"		<span class=\"service\">۞</span> <span>选服务</span>" +
						"	</div>" +
						"	<div class=\"col col-3\">" +
						"		<input type='hidden' value='"+data.gprice+"'/>"+
						"		<span>¥"+data.gprice.toFixed(2)+"</span><br/>" +
						"		<span class=\"cx\">白条6期免息</span>" +
						"		<span class=\"cx\">促销▽</span>" +
						"	</div>" +
						"	<div class=\"col col-4\">" + 
						"		<a href=\"javascript:void(0)\" class=\"sub\">-</a>" + 
						"		<input type=\"text\" value=\""+count+"\"/>" + 
						"		<a href=\"javascript:void(0)\" class=\"add\">+</a>" + 
						"	</div>" +
						"	<div class=\"col col-5\">" +
						"		<span>¥"+(data.gprice*count).toFixed(2)+"</span>" +
						"	</div>" +
						"	<div class=\"col col-6\">" +
						"		<a href=\"\">删除</a>" +
						"	</div>" +
						"	<div class=\"clear\"></div>" +
						"</div>" +
						"<div class=\"cartsp\"></div>";
						
						$(".cartlist").append(html);
					}
				});
			}
		}
	}
	
	function checkAll(){

		
	}
	
	function subOrder(){
		
		// 动态创建表单
		var form = $("<form action=\"Customer/subOrder.action\" method=\"post\"></form>");
		
		// 获取被选中的商品
		var items = $(".cartitem");
		
		var index = 0;
		items.each(function(){
			var checked = $(this).find("input[type='checkbox']").prop("checked");
			
			if (checked){
				// 取商品的ID
				gid = $(this).find("input[type='checkbox']").val();
				// 商品的数量
				count = $(this).find("input[type='text']").val();
				
				form.append("<input type=\"text\" value=\""+gid+"\" name=\"list["+index+"].gid\"/>");
				form.append("<input type=\"text\" value=\""+count+"\"  name=\"list["+index+"].gcount\"/>");
				
				index ++;
			}
		});

		$(".cartlist").append(form);
		
		// 提交表单
		form.submit();
		

	}
</script>

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
			<a class="check" href="javascript:void(0)" onclick="subOrder()">去结算</a>
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