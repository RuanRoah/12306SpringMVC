<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<title></title>
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="css/bootstrap-theme.min.css">
		<link rel="stylesheet" href="style.css">
		
		<link rel="stylesheet" href="css/sand.css">
		<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
		<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			//更换验证码函数
			$(function(){	
				$('#login').click(function(){
					$('#moodal').modal('show');
				})				
				$("#test").click(function(){
		            var $a = $(this);
		            $.ajax({
		                url:"yanzheng.do",
		                type:'get',
		                data:null,
		                dataType:'html',
		                success:function(data){
		                console.log(data);
		                	var test=document.getElementById("imgcode").value;
		                	console.log("input:"+test);
		                    if(data==test){
		                    	$('#formm').submit();
		                    	//document.getElementById("imgcode").submit;
		                    }else{
		                    	alert("验证码错误");
		                    	console.log("验证码错误");            	
		                    }		                    
		                },
		                error:function(xhr,textStatus,errorThrown){
		                	console.log("出现异常");
		                }
		            });
		        });			
			})
			function change(){
 				$('#captchaImage').attr("src", "captcha.do?timestamp=" + (new Date()).valueOf());
			}
		</script>
	</head>
		
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
		
		<div class="container" style="margin-top:60px;">
		<div class="row">
				<ul class="media-list ">
			<li class="media col-sm-6">
				<a class="pull-left" href="#">
					<img class="media-object" src="img/IS-1.jpg" alt="..." style="height: 100px; width: 100px; display: block;">
				</a>
				<div class="media-body">
					<h4 class="media-heading">常见问题</h4>
					<div>常见问题常见问题常见问题常见问题常见问题</div>
				</div>
			</li>
			<li class="media col-sm-6">
				<a class="pull-left" href="#">
					<img class="media-object"  src="img/IS-2.jpg" alt="..." style="height: 100px; width: 100px; display: block;">
				</a>
				<div class="media-body">
					<h4 class="media-heading">用户须知</h4>
					<div>用户须知用户须知用户须知用户须知用户须知</div>
				</div>
			</li>
			<li class="media col-sm-6">
				<a class="pull-left" href="#">
					<img class="media-object"  src="img/IS-3.jpg" alt="..." style="height: 100px; width: 100px; display: block;">
				</a>
				<div class="media-body">
					<h4 class="media-heading">相关规章</h4>
					<div>相关规章相关规章相关规章相关规章相关规章</div>
				</div>
			</li>
			<li class="media col-sm-6">
				<a class="pull-left" href="#">
					<img class="media-object"  src="img/IS-4.jpg" alt="..." style="height: 100px; width: 100px; display: block;">
				</a>
				<div class="media-body">
					<h4 class="media-heading">铁路保险</h4>
					<div>铁路保险铁路保险铁路保险铁路保险铁路保险</div>
				</div>
			</li>
		</ul>
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
    </body>
</html>