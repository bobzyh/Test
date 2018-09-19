<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%   
    String path = request.getContextPath();   
    String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<h1><i class="icon-shopping-cart icon-large"></i>后台管理</h1>
			
			<ul class="side-nav">
						<li class="active"><a href="index.html"><i
								class="icon-home"></i> 首页</a></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="collapse" data-target="#website-dropdown" href="#"><i
								class="icon-sitemap"></i> 分类管理 <b class="caret"></b></a>
							<ul id="website-dropdown" class="collapse">
								<li><a href="listing.html">Pages</a></li>
								<li><a href="listing.html">Menus</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="collapse" data-target="#store-dropdown" href="Manager/goodsmgr.action"><i
								class="icon-shopping-cart"></i> 商品管理 <b class="caret"></b></a>
							<ul id="store-dropdown" class="collapse">
								<li><a href="listing.html">Catalogue</a></li>
								<li><a href="orders.html">Orders</a></li>
								<li><a href="listing.html">Enquiries</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="collapse" data-target="#reports-dropdown" href="javascript:void(0)"><i
								class="icon-signal"></i> 数据统计 <b class="caret"></b></a>
							<ul id="reports-dropdown" class="collapse">
								<li><a href="Manager/order.action">订单统计</a></li>
								<li><a href="report.html">Product Popularity</a></li>
								<li><a href="report.html">Member Registrations</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="collapse" data-target="#members-dropdown" href="#"><i
								class="icon-group"></i> 修改密码 <b class="caret"></b></a>
							<ul id="members-dropdown" class="collapse">
								<li><a href="listing.html">Members</a></li>
								<li><a href="listing.html">User Groups</a></li>
								<li><a href="listing.html">Permissions</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="collapse" data-target="#settings-dropdown" href="#"><i
								class="icon-remove-circle"></i> 退出登录 <b class="caret"></b></a>
							<ul id="settings-dropdown" class="collapse">
								<li><a href="listing.html">Payment Processors</a></li>
								<li><a href="listing.html">Order Statuses</a></li>
								<li><a href="listing.html">Shipping Methods</a></li>
								<li><a href="listing.html">Emails</a></li>
							</ul></li>
						<li><a href="#"><i class="icon-bullhorn"></i> Alerts <span
								class="badge badge-warning">2</span></a></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="collapse" data-target="#help-dropdown" href="#"><i
								class="icon-info-sign"></i> Help <b class="caret"></b></a>
							<ul id="help-dropdown" class="collapse">
								<li><a href="content.html">FAQ</a></li>
								<li class="active"><a href="content.html">User Guide</a></li>
								<li><a href="content.html">Support</a></li>
							</ul></li>
				</ul>	