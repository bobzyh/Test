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
<script type="text/javascript" src="js/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
	
	var gname = "${param.gname }";
	
	
	$(function(){
		
		selectGoods(1, 0, 0);
		
		getFType();
		
		getSType(null);
	});
	
	function getSType(ptid){
		$.ajax({
			url : "getSType.action",
			type : "post",
			data : {"ptid": ptid},
			dataType : "JSON",
			success : function(data){
				
				var html = "";
				$.each(data , function(index, item){
					
					html += "<div class=\"typeitem\"><a href=\"javascript:void(0)\" onclick=\"selectGoods(1, 0, "+item.tid+");\">"+item.tname+"</a></div>";
				});
				
				$("#stype").html(html);
			}
		});
		
		if (ptid!= null){
			selectGoods(1, ptid, 0);
		}
	}
	
	function getFType(){
		
		$.ajax({
			url : "getFType.action",
			type : "post",
			data : {},
			dataType : "JSON",
			success : function(data){
				
				var html = "";
				$.each(data , function(index, item){
					
					html += "<div class=\"typeitem\"><a href=\"javascript:void(0)\" onclick=\"getSType("+item.tid +")\">"+item.tname+"</a></div>";
				});
				
				$("#ftype").html(html);
			}
		});
	}
	

	function selectGoods(curpage, gftype, gstype){
		/* var gname = $("#gname").val();
		var gftype = $("#gftype").val();
		var gstype = $("#gstype").val(); */
		
		// 根据条件进行查询
		$.ajax({
			url : "getAllGoods.action",
			type : "post",
			data : {"gname": gname,  "gftype": gftype , "gstype": gstype, "pagerows" : 8, "curpage": curpage},
			dataType : "JSON",
			success : function(data){
				// 显示数据
				var html = "";
				$.each(data.list, function(index, item){
					html +=
						"<div class=\"goodsitem\">" +
					"<div class=\"goodsimg\">" +
					"	<a href=\"goods.action?gid="+item.gid+"\"><img src=\"upload/"+item.gpic+"\"></a>" +
					"</div>" +
					"<div class=\"gprice\">￥"+item.gprice.toFixed(2)+"</div>" +
					"<div class=\"gname\"><a href=\"goods.action?gid="+item.gid+"\">"+item.gname + "&nbsp;&nbsp;&nbsp;&nbsp;" + item.gdept +"</a></div>" +
					"<div class=\"gsales\">"+item.gsales+"</div>" +
					"</div>";
				});
				
				html += "<div class=\"clear\"></div>";
				
				$("#goodslist").html(html);
				
				var pageHtml = "";
				
				
				if (data.curpage > 1){
					pageHtml += "<li><a href=\"javascript:void(0)\" onclick=\"selectGoods("+(data.curpage-1)+")\">Prev</a></li>";
				} else{
					pageHtml += "<li class=\"active\"><a href=\"javascript:void(0)\" >Prev</a></li>";
				}
				
				for (var i=1; i <= data.pagecount; i++){
					
					if (data.curpage != i){
						pageHtml += "<li><a href=\"javascript:void(0)\" onclick=\"selectGoods("+i+")\">"+i+"</a></li>";
					} else {
						pageHtml += "<li class=\"active\"><a href=\"javascript:void(0)\" >"+i+"</a></li>";
					}
				}
				
				if (data.curpage == data.pagecount){
					pageHtml += "<li class=\"active\"><a href=\"javascript:void(0)\" >Next</a></li>";
				} else{
					pageHtml += "<li><a href=\"javascript:void(0)\" onclick=\"selectGoods("+(data.curpage+1)+")\">Next</a></li>";
				}
				
				$("#page").html(pageHtml);
			}
			
		});
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
				<div class="cart">
					<span class="cartimg"></span>
					<a href="#">我的购物车</a>
					<span class="cartnum">0</span>
				</div>
				<div class="clearfloat"></div>
			</div>
		</div>
	<div class="typecontainer">
		<div class="type">
			<div class="typetitle">大分类:</div>
			<div class="typelist" id="ftype">
				<div class="clear"></div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="type">
			<div class="typetitle">小分类:</div>
			<div class="typelist" id="stype">
				<div class="clear"></div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="clear"></div>
		
	</div>
	<div class="container">
		<div class="ad">广告</div>
		<div class="goods">
			<div id="goodslist">
				
			</div>
			<div id="page" class="page"></div>
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