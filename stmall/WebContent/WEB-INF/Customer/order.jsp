<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%   
    String path = request.getContextPath();   
    String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html >
<html>
<head>
<base href="<%=basePath%>" >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>京东商城</title>

<link rel="stylesheet" href="css/product.css"/>
<link rel="stylesheet" href="css/order.css" />
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
		<div class="tab">我的订单</div>
		<div class="carttitle">
			<div class="col col-1">
				 &nbsp;
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
			
			
			<c:forEach items="${requestScope.list}" var="order" >				
				<div class="order">
					<div class="ordertitle">
						<div class="odate"><fmt:formatDate value="${order.odate }" pattern="yyyy-MM-dd HH:mm:ss"/></div>
						<div class="onum">订单号： <span>${order.onum }</span></div>
						<div style="clear:left"></div>
					</div>
				</div>
				<table class="goodslist">
				
					<c:forEach items="${order.list }" var="details" varStatus="status">
						<tr>
							<td>
								<div class="goodsitem">
									<a href="goods.action?gid=${details.gid }" target="_blank"><img src="upload/${details.goods.gpic }" /></a>
									<div class="gname"><a href="goods.action?gid=${details.gid }" target="_blank">${details.goods.gname } <br/>${details.goods.gdept }</a></div>
									<div class="gprice">￥${details.goods.gprice }</div>
									<div class="gcount">X${details.gcount }</div>
									<div class="clear"></div>
								</div>
							</td>
							
							<c:if test="${status.index==0 }">
								<td rowspan="${fn:length(order.list)}"><div class="oprice">￥${order.oprice }</div></td>
								<td rowspan="${fn:length(order.list)}"><div class="option">评价</div></td>
							</c:if>
						</tr>
					</c:forEach>
				</table>
			</c:forEach>

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