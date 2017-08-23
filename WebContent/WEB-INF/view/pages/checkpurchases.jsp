<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<title></title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="css/sand.css">
	<link rel="stylesheet" href="css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="css/style.css">
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/WdatePicker/WdatePicker.js"></script>
	</head>
	<body>
		<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<div class="navbar-header col-md-2">
				<a href="##" class="navbar-brand">12306</a>
			</div>
			<ul class="nav navbar-nav col-md-7">
				<li>
					<a href="default.do">首页</a>
				</li>				
				<li>
					<a href="order.do">车票查询</a>
				</li>
				<li>
					<a href="information.do">信息服务</a>
				</li>
				<li>
					<a href="userinfo.do">个人信息</a>
				</li>				
			</ul>
			<ul class="nav navbar-nav col-md-3">
				<li>
					<a id="login" style="display: ${sessionScope.user.username==null?'block':'none'}">登录</a>
					<div style="display: ${sessionScope.user.username!=null?'block':'none'}">${sessionScope.user.username}</div>	
				</li>
				<li>
					<a href="register.do">注册</a>
				</li>
			</ul>
		</div>
	</body>
</html>