<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<title></title>
		
		<link rel="stylesheet" href="css/sand.css">
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="css/bootstrap-theme.min.css">
		<link rel="stylesheet" href="style.css">
		<script src="js/jquery-3.2.1.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/WdatePicker/WdatePicker.js"></script>

	</head>

	<body>
				<div class="header">
		
					<div class="h_top">
		
						<div class="h_logo">
		
						</div>
		
						<div class="h_nav">
		
							<ul>
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
								<li>
									<a href="register.do">新用户注册</a>
								</li>
							</ul>
		
						</div>
			
						<div class="h_search">
		
							<input type="text" class="h_text" />
		
							<a href="#" class="h_btn"></a>
		
						</div>
		
						<div class="h_message">
		
							<div class="h_info">
		
								
								
								<a href="#" class="">
								
								<img src="images/t1.png" alt="phone" height="25" width="25">
								
								</a>
								
							</div>
							
		
							<div class="h_pic" >
							<div style="padding-top:15px;"></div>
								<span id="login" class="login" style="display: ${sessionScope.user.username==null?'block':'none'}">登录</span>
								<span class="login" style="display: ${sessionScope.user.username!=null?'block':'none'}">${sessionScope.user.username}</span>
						
						
							</div>
							
								
						</div>
		
					</div>
		
				</div>
				

		<div class="tm" style="margin-top: 60px;">
			<div>
				<div class="m_left col-md-2">
					<ul class="list-group ju">
						<li class="list-group-item">
							<div id="pic">
								<img class="img-rounded" alt="140x140" src="http://placehold.it/140x140">
							</div>
						</li>
						
						<li class="list-group-item">
							<a href="##" id="userinfo">个人信息</a>
						</li>
						<li class="list-group-item">
							<a href="##" id="people">联系人列表</a>
						</li>
						<li class="list-group-item">
							<a href="##" id="order">查看订单</a>
						</li>
						<li class="list-group-item">
							<a href="##" id="address">修改地址</a>
						</li>
						
					</ul>
					</div>
					<div class="m_right col-md-10" id="mainBody">
					</div>
				</div>				
			</div>			
			
		<div class="modal fade" id="moodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		             <div class="modal-header">
					    <a class="close" data-dismiss="modal">×</a>
					    <h3>登录模块</h3>
					    </div>
					    <div class="modal-body">
					    <form action="login.do" id="formm" method="post"> 	
						    	<div class="input-group">					            
					            	<input id="username" type="text" name="username" class="form-control" placeholder="用户名">
					        	</div>	
						    	<div class="input-group">
					            
					            	<input id="passwd" type="password" name="passwd" class="form-control" placeholder="密码">
					        	</div>						    							    	
						    	<div class="input-group">
						    	
						    	<input id="imgcode" type="text" class="form-control" placeholder="验证码">
						    	</div>	
						    	<label><img id="captchaImage" src="captcha.do"/><a href="javascript:change();">看不清？换一个</a></label>						    						    	
						    </form>	              
					    </div>					    
					    <div class="modal-footer">
					      <button type="button" class="btn btn-success" id="test">submit</button>
					      <a href="#" class="btn" data-dismiss="modal">Close</a>
					    </div>					    
		        </div><!-- /.modal-content -->
		    </div><!-- /.modal -->
		    </div>			
		    
	<script>
		$(function(){			
			//zhanghao message people address renzheng						
			$("#mainBody").load("toinfo.do",function(){ $("#mainBody").fadeIn(100);});
			$("#userinfo").click(function(){
				$("#mainBody").load("toinfo.do",function(){ $("#mainBody").fadeIn(100);});				
				}
			)
			
			$("#people").click(function(){
				$("#mainBody").load("topeople.do",function(){ $("#mainBody").fadeIn(100);});	
			})
			$("#address").click(function(){
				$("#mainBody").load("toaddress.do",function(){ $("#mainBody").fadeIn(100);});

			})
			$("#order").click(function(){
				$("#mainBody").load("toorder.do",function(){ $("#mainBody").fadeIn(100);});		
			})
		})		
	</script>
	</body>
</html>