<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html >
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/mgrloginstyle.css" />
<link rel="stylesheet" type="text/css" href="css/mgrloginbody.css" />
</head>
<body>
	<div class="container">
		<section id="content">
		<form action="Manager/login.action" method="post">
			<h1>管理员登录</h1>
			<div>
				<input type="text" placeholder="账号"  id="username" name="mname" />
			</div>
			<div>
				<input type="password" placeholder="密码"  id="password"  name="mpassword"/>
			</div>
			<div class="">
				<span class="help-block u-errormessage" id="js-server-helpinfo">${error }</span>
			</div>
			<div>
				<!-- <input type="submit" value="Log in" /> -->
				<input type="submit" value="登录" class="btn btn-primary"
					id="js-btn-login" /> <a href="#">忘记密码?</a>
				<!-- <a href="#">Register</a> -->
			</div>
		</form>
		<!-- form -->
		<div class="button">
			<span class="help-block u-errormessage" id="js-server-helpinfo">&nbsp;</span>
			<a href="">进入商城</a>
		</div>
		<!-- button --> </section>
		<!-- content -->
	</div>
	<!-- container -->


	<br>
	<br>
	<br>
	<br>
	<div style="text-align: center;">
		<p>
			来源:More Templates <a href="http://www.cssmoban.com/" target="_blank"
				title="模板之家">模板之家</a> - Collect from <a
				href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a>
		</p>
	</div>
</body>
</html>