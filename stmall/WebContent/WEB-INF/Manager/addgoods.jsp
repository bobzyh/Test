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
    <title>686 Adminize</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <!-- Le styles -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/css/font-awesome.css" rel="stylesheet">
    <link href="assets/css/admin.css" rel="stylesheet">
    
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
			<li class="active">添加商品</li>
		</ul>
		
	</div>
	
	<div class="main-area dashboard">
	
			<div class="alert alert-info">
				<a class="close" data-dismiss="alert" href="#">x</a>
				<h4 class="alert-heading">Information</h4>
				This template shows how forms can be laid out for editing content.
			</div>
			
			
			<div class="row">
				
				<div class="span10">
				
					<div class="slate">
					
						<div class="page-header">
							<h2>添加商品</h2>
						</div>
					
						<form class="form-horizontal" action="Manager/addgoods.action" method="post" enctype="multipart/form-data">
						<fieldset>
							<div class="control-group">
								<label class="control-label">商品名</label>
								<div class="controls">
									<input class="input-xlarge focused" type="text" name="gname"/>
								</div>
							</div>
							
							<div class="control-group">
								<label class="control-label">商品描述</label>
								<div class="controls">
									<textarea class="input-xlarge" rows="3" name="gdept"></textarea>
								</div>
							</div>
							
							<div class="control-group">
								<label class="control-label">价格</label>
								<div class="controls">
									<input class="input-xlarge focused" type="text" name="gprice"/>
								</div>
							</div>
							
							<div class="control-group">
								<label class="control-label">库存</label>
								<div class="controls">
									<input class="input-xlarge focused" type="text" name="gcount"/>
								</div>
							</div>
							
							<div class="control-group">
								<label class="control-label">大分类</label>
								<div class="controls">
							      <select id="select01" name="gftype">
							        <option>1</option>
							        <option>2</option>
							        <option>3</option>
							        <option>4</option>
							        <option>5</option>
							      </select>
								</div>
							</div>
							
							<div class="control-group">
								<label class="control-label">小分类</label>
								<div class="controls">
							      <select id="select01" name="gstype">
							        <option>2</option>
							        <option>3</option>
							        <option>4</option>
							        <option>5</option>
							      </select>
								</div>
							</div>
							
 							<div class="control-group">
							    <label class="control-label" for="fileInput">图片</label>
							    <div class="controls">
							      <input class="input-file" id="fileInput" type="file" name="pic">
							    </div>
						  	</div>
						  	
						  	${error }
						  	<div class="control-group">
							   
							    <div class="controls">
							      <input class="btn btn-info" type="submit" value="添加">
							    </div>
						  	</div>
						</fieldset>
						</form>

					</div>
				
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


</body>
</html>