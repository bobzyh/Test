<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%   
    String path = request.getContextPath();   
    String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>" >
	<meta charset="utf-8">
    <title>686 Adminize</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <!-- Le styles -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/css/font-awesome.css" rel="stylesheet">
    <link href="assets/css/admin.css" rel="stylesheet">
    
    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
	    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

</head>    
<body>

<div class="container">
		
	<div class="row">
		
		<div class="span2">
		
		<div class="main-left-col">
		
			<jsp:include page="menu.jsp"></jsp:include>
		
		</div> <!-- end main-left-col -->
	
	</div> <!-- end span2 -->
	
	<div class="span10">
		
	<div class="secondary-masthead">
	
		<ul class="nav nav-pills pull-right">
			<li>
				<a href="#"><i class="icon-globe"></i> View Website</a>
			</li>
			<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="icon-user"></i> John Smith <b class="caret"></b>
				</a>
				<ul class="dropdown-menu">
					<li><a href="profile.html">Your Profile</a></li>
					<li class="active"><a href="form.html">Account Settings</a></li>
					<li class="divider"></li>
					<li><a href="">Logout</a></li>
				</ul>
			</li>
		</ul>

		<ul class="breadcrumb">
			<li>
				<a href="#">后台管理</a> <span class="divider">/</span>
			</li>
			<li class="active">订单统计</li>
		</ul>
		
	</div>
	
	<div class="main-area dashboard">
	
			<div class="alert alert-info">
				<a class="close" data-dismiss="alert" href="#">x</a>
				<h4 class="alert-heading">信息</h4>
				统计最近一天, 最近一周, 最近一月的销售量
			</div>
			
			<div class="row">
			
				<div class="span10">
				
					<div class="slate">
						<a href="javascript:void(0)" onclick="showOrder(1)" class="btn btn-info">最近一天</a>
						<a href="javascript:void(0)" onclick="showOrder(2)" class="btn btn-success">最近一周</a>
						<a href="javascript:void(0)" onclick="showOrder(3)" class="btn btn-primary">最近一月</a>
						
					
					</div>
				
				</div>
			
			</div>
			
			<div class="row">
				<div class="span10">
				
					<div class="slate">
					
						<div class="page-header">
							<div class="btn-group pull-right">
								<button class="btn dropdown-toggle" data-toggle="dropdown">
									<i class="icon-download-alt"></i> Export
									<span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="">CSV</a></li>
									<li><a href="">Excel</a></li>
									<li><a href="">PDF</a></li>
								</ul>
							</div>
							<h2>Orders</h2>
						</div>
					
						<table class="orders-table table">
						<thead>
							<tr>
								<th>Orders</th>
								<th class="value">Value</th>
								<th class="actions">Actions</th>
							</tr>
						</thead>
						<tbody id="orderlist">
							
						</tbody>
						</table>

					</div>
				
				</div>
				
				<div class="span5">
				
					<div class="pagination pull-left">
						<ul>
							<li><a href="#">Prev</a></li>
							<li class="active">
							  <a href="#">1</a>
							</li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">Next</a></li>
						</ul>
					</div>
				
				</div>
				
				<div class="span5 listing-buttons pull-right">
				
					<button class="btn btn-info">Action</button>
				
					<button class="btn btn-success">Action</button>
				
					<button class="btn btn-primary">Add New Item</button>
				
				</div>
				
			</div>
			
		<div class="row">
		
			<div class="span10 footer">
			
				<p>&copy; Website Name 2014</p>
			
			</div>
		
		</div>
		
	</div>
	
	</div> <!-- end span10 -->
		
	</div> <!-- end row -->
		
</div> <!-- end container -->

<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/bootstrap.js"></script>

<script type="text/javascript">

	showOrder(1);
	function showOrder(type){
		$.ajax({
			url : "Manager/orderJSON.action",
			type : "post",
			data : {"type" : type},
			dataType : "JSON",
			success : function(data){
				
				var html = "";
				$.each(data, function(index, item){
					html += 
					"<tr>" +
					"	<td><a href=\"vieworder.html\">"+item.onum+" - "+item.cid+"</a> "+
					"		<span class=\"label label-info\">New</span><br /><span class=\"meta\">"+item.odate+"</span></td>" +
					"	<td class=\"value\">" +
					"		￥" + item.oprice.toFixed(2) +
					"	</td>" +
					"	<td class=\"actions\">" +
					"		<a class=\"btn btn-small btn-primary\" href=\"vieworder.html\">View Order</a>" +
					"	</td>" +
					"</tr>";
				});
				
				$("#orderlist").html(html);
			}
		});
	}

</script>

</body>
</html>