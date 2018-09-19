<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%   
    String path = request.getContextPath();   
    String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>" >
	<meta charset="utf-8">
    <title>商品管理</title>
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
				<a href="Manager/index.action">后台管理</a> <span class="divider">/</span>
			</li>
			<li class="active">商品管理</li>
		</ul>
		
	</div>
	
	<div class="main-area dashboard">
	
			<div class="alert alert-info">
				<a class="close" data-dismiss="alert" href="#">x</a>
				<h4 class="alert-heading">Information</h4>
				The listing template can be used to list content that requires editing, such as pages, product catalogue, settings and members.
			</div>
			
			<div class="row">
			
				<div class="span10">
				
					<div class="slate">
					
						<div class="form-inline">
							<input type="text" id="gname" class="input-large" placeholder="Keyword...">
							<select class="span2" id="gftype">
								<option value="0"> - 大分类 - </option>
							</select>
							<select class="span2" id="gstype">
								<option value="0"> - 小分类 - </option>
							</select>
							
							<button type="submit" class="btn btn-primary" onclick="selectGoods(1)">查询</button>
						</div>
					
					</div>
				
				</div>
			
			</div>
			
			<div class="row">
				
				<div class="span10 listing-buttons">
				
					<a class="btn btn-info" href="Manager/addgoodsview.action">添加商品</a>
				
				</div>
				
				<div class="span10">
				
					<div class="slate">
					
						<div class="page-header">
							
							<h2>Listings</h2>
						</div>
					
						<table class="orders-table table">
						<thead>
							<tr>
								<th>Listing</th>
								<th class="actions">Actions</th>
							</tr>
						</thead>
						<tbody id="goodslist">
							<tr>
								<td><a href="form.html">Listing title</a> <span class="label label-info">Item Status</span><br /><span class="meta">Added Today</span></td>
								<td class="actions">
									<a class="btn btn-small btn-danger" data-toggle="modal" href="#removeItem">Remove</a>
									<a class="btn btn-small btn-primary" href="form.html">Edit</a>
								</td>
							</tr>
							<tr>
								<td><a href="form.html">Listing title</a> <span class="label label-warning">Item Status</span><br /><span class="meta">Added Today</span></td>
								<td class="actions">
									<a class="btn btn-small btn-danger" data-toggle="modal" href="#removeItem">Remove</a>
									<a class="btn btn-small btn-primary" href="form.html">Edit</a>
								</td>
							</tr>
							<tr>
								<td><a href="form.html">Listing title</a> <span class="label label-important">Item Status</span><br /><span class="meta">Added Today</span></td>
								<td class="actions">
									<a class="btn btn-small btn-danger" data-toggle="modal" href="#removeItem">Remove</a>
									<a class="btn btn-small btn-primary" href="form.html">Edit</a>
								</td>
							</tr>
							<tr>
								<td><a href="form.html">Listing title</a> <span class="label label-inverse">Item Status</span><br /><span class="meta">Added Today</span></td>
								<td class="actions">
									<a class="btn btn-small btn-danger" data-toggle="modal" href="#removeItem">Remove</a>
									<a class="btn btn-small btn-primary" href="form.html">Edit</a>
								</td>
							</tr>
							<tr>
								<td><a href="form.html">Listing title</a> <span class="label label-success">Item Status</span><br /><span class="meta">Added Today</span></td>
								<td class="actions">
									<a class="btn btn-small btn-danger" data-toggle="modal" href="#removeItem">Remove</a>
									<a class="btn btn-small btn-primary" href="form.html">Edit</a>
								</td>
							</tr>
							<tr>
								<td><a href="form.html">Listing title</a> <span class="label">Item Status</span><br /><span class="meta">Added Today</span></td>
								<td class="actions">
									<a class="btn btn-small btn-danger" data-toggle="modal" href="#removeItem">Remove</a>
									<a class="btn btn-small btn-primary" href="form.html">Edit</a>
								</td>
							</tr>
							<tr>
								<td><a href="form.html">Listing title</a><br /><span class="meta">Added Today</span></td>
								<td class="actions">
									<a class="btn btn-small btn-danger" data-toggle="modal" href="#removeItem">Remove</a>
									<a class="btn btn-small btn-primary" href="form.html">Edit</a>
								</td>
							</tr>
							<tr>
								<td><a href="form.html">Listing title</a><br /><span class="meta">Added Today</span></td>
								<td class="actions">
									<a class="btn btn-small btn-danger" data-toggle="modal" href="#removeItem">Remove</a>
									<a class="btn btn-small btn-primary" href="form.html">Edit</a>
								</td>
							</tr>
							<tr>
								<td><a href="form.html">Listing title</a><br /><span class="meta">Added Today</span></td>
								<td class="actions">
									<a class="btn btn-small btn-danger" data-toggle="modal" href="#removeItem">Remove</a>
									<a class="btn btn-small btn-primary" href="form.html">Edit</a>
								</td>
							</tr>
							<tr>
								<td><a href="form.html">Listing title</a><br /><span class="meta">Added Today</span></td>
								<td class="actions">
									<a class="btn btn-small btn-danger" data-toggle="modal" href="#removeItem">Remove</a>
									<a class="btn btn-small btn-primary" href="form.html">Edit</a>
								</td>
							</tr>
						</tbody>
						</table>

					</div>
				
				</div>
				
				<div class="modal hide fade" id="removeItem">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">×</button>
						<h3>Remove Item</h3>
					</div>
					<div class="modal-body">
						<p>Are you sure you would like to remove this item?</p>
					</div>
					<div class="modal-footer">
						<a href="#" class="btn" data-dismiss="modal">Close</a>
						<a href="#" class="btn btn-danger">Remove</a>
					</div>
				</div>
			
				<div class="span5">
				
					<div class="pagination pull-left">
						<ul id="page">
							
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

<!-- 异步请求 -->
<script type="text/javascript">

	selectGoods(1);
	
	getFType();
	
	function getFType(){
		
		$.ajax({
			url : "getFType.action",
			type : "post",
			data : {},
			dataType : "JSON",
			success : function(data){
				
				var html = "<option value=\"0\"> - 大分类 - </option>";
				$.each(data , function(index, item){
					
					html += "<option value=\""+item.tid+"\">"+item.tname+"</option>";
				});
				
				$("#gftype").html(html);
			}
		});
	}
	
	$("#gftype").change(function(){

		// 获取值
		var ftype = $("#gftype").val();
		
		if (ftype == 0){
			// 清除小分类
			var html = "<option value=\"0\"> - 小分类 - </option>";
			$("#gstype").html(html);
		} else {
			// 获取该分类下的所有小分类 , 并且显示出来.
			getSType(ftype);
		}
		
	});
	
	function getSType(ptid){
		$.ajax({
			url : "getSType.action",
			type : "post",
			data : {"ptid": ptid},
			dataType : "JSON",
			success : function(data){
				
				var html = "<option value=\"0\"> - 小分类 - </option>";
				$.each(data , function(index, item){
					
					html += "<option value=\""+item.tid+"\ >"+item.tname+"</option>";
				});
				
				$("#gstype").html(html);
			}
		});
		
	}
	
	function selectGoods(curpage){
		var gname = $("#gname").val();
		var gftype = $("#gftype").val();
		var gstype = $("#gstype").val();
		
		// 根据条件进行查询
		$.ajax({
			url : "getAllGoods.action",
			type : "post",
			data : {"gname": gname, "gftype": gftype , "gstype": gstype, "curpage": curpage},
			dataType : "JSON",
			success : function(data){
				// 显示数据
				var html = "";
				$.each(data.list, function(index, item){
					html +=
						"<tr>" +
						"<td> <img height=\"50px\" src=\"upload/"+item.gpic+"\">"+item.gid +"<a href=\"form.html\">"+ item.gname +"</a> <span class=\"label label-info\">￥"+item.gprice+"</span><br /><span class=\"meta\">"+item.gdept	+"</span></td>" +
						"<td class=\"actions\">" +
						"	<a class=\"btn btn-small btn-danger\" data-toggle=\"modal\" href=\"#removeItem\">Remove</a>" +
						"	<a class=\"btn btn-small btn-primary\" href=\"form.html\">Edit</a>" +
						"</td>" +
						"</tr>";
				});
				
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
</body>
</html>