<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%   
    String path = request.getContextPath();   
    String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html>
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>个人中心</title>
		<link rel="stylesheet" href="css/register.css" />
		
		<script>
			
			function usernameFocus(){
				//alert("获取焦点");
				//console.log("获取焦点");
				document.getElementById("unhint").innerText="账号由字母,数字,_组成, 首字符必须是字母";
			}
			
			function usernameBlur(){
				//console.log("失去焦点");
				document.getElementById("unhint").innerText="";
			}
			
			function usernameChange(){
				console.log("内容改变")
			}
			
			//
			/* 
			 * 1. 将JS写在HTML标签后,
			 * 2. 将获取对象的操作, 写在window.onload事件中
			 */
			
			window.onload = function(){
				var password = document.getElementById("password"); 
			
				/*
				 * JS 为元素绑定事件
				 */
				password.onfocus = function(){
					document.getElementById("pwdhint").innerText="密码由字母,数字,_组成, 必须包含字母";
				}; 
				
				password.onblur = function(){
					document.getElementById("pwdhint").innerText="";
				}
				
				
			};
			
			
			
		</script>
	</head>
	<body>
		<div class="topbg">
			<div class="top">
				<a href=""><img src="img/logo.png" /></a>
				<h1>个人中心</h1>
				
				<div class="clear">
					
				</div>
			</div>
		</div>
		
		<div class="center">
			<form action="Customer/update.action" method="post">
				<h1>个人中心</h1>
				<div>
					<label>账号</label><input type="text" name="cname" value="${sessionScope.customer.cname }" readonly="readonly"/>
				</div>
				<div id="unhint" class="hint"></div>
				<div>
					<label>密码</label><input type="password" name="password" id="password" />
				</div>
				<div id="pwdhint" class="hint"></div>
				<div>
					<label>重复密码</label><input type="password" name="password2" />
				</div>
				<div class="hint"></div>
				
				<div>
					<label>电话</label><input type="text" name="cphone" value="${sessionScope.customer.cphone }"/>
				</div>
				<div class="hint"></div>
				
				<div>
					<label>真实姓名</label><input type="text" name="crealname"  value="${sessionScope.customer.crealname }"/>
				</div>
				<div class="hint"></div>
				
				<div>
					<label>身份证号</label><input type="text" name="ccard"  value="${sessionScope.customer.ccard }"/>
				</div>
				<div class="hint"></div>
				
				<div>
					<label>地址</label><input type="text" name="caddr"  value="${sessionScope.customer.caddr }"/>
				</div>
				<div class="hint"></div>
				
				<div>
					
					<label>账户余额</label><input type="text"  value="<fmt:formatNumber value="${sessionScope.customer.cmoney }" pattern="￥.00"></fmt:formatNumber>" readonly="readonly"/>
				</div>
				<div class="hint"></div>
				
				
				<div>
					<c:if test="${sessionScope.customer.cstatus==0 }">
						<label>账号状态</label><input type="text" value="正常" readonly="readonly"/>
					</c:if>
					
					<c:if test="${sessionScope.customer.cstatus!=0 }">
						<label>账号状态</label><input type="text" value="异常" readonly="readonly"/>
					</c:if>
				</div>
				<div class="hint"></div>
				
				<div>
					<label>注册时间</label><input type="text" value="<fmt:formatDate value='${sessionScope.customer.cregdate }' pattern='yyyy年MM月dd日 HH:mm:ss'/>" readonly="readonly"/>
				</div>
				<div class="hint"></div>
				
				<div class="hint">${error }</div>
				
				<div><input type="submit" value="修改信息" /></div>
				<div class="regother">
					<div class="rege">
						
						<a href="#"><i></i>企业用户注册</a>					
					</div>
					<div class="regg">
						
						<a href="#"><i></i>国际站注册</a>
					</div>
					<div class="clear"></div>
				</div>
			</form>
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
