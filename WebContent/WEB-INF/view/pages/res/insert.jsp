<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<title></title>
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="css/bootstrap-theme.min.css">
		<link rel="stylesheet" href="style.css">
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
					<a href="Index.html">首页</a>
				</li>
				<li >
					<a href="PurchaseService.html">购票服务</a>
				</li>
				<li >
					<a href="CheckPurchase.html">查看订单</a>
				</li>
				<li>
					<a href="InformationService.html">信息服务</a>
				</li>
				<li class="active">
					<a href="PersonalInformation.html">个人信息</a>
				</li>
				<li >
					<a href="#">返回顶部</a>
				</li>
			</ul>

			<ul class="nav navbar-nav col-md-3">
				<li>
					<a href="##">登录</a>
				</li>
				<li>
					<a href="##">注册</a>
				</li>
			</ul>
		</div>
		<br><br><br><br><br>
			<h1>您尚未完善个人信息，请完善个人信息</h1>
			<a href="insertinfo.do">完善个人信息</a>
	</body>
	<script>	
		$(function(){
			location.href ="touserinfo.do";			
		})		
	</script>
</html>