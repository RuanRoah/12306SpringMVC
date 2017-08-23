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
		                    	
		                    	Login();
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
			function Login(){
				 var $a = $(this);
		            $.ajax({
		                url:"login.do",
		                type:'post',
		                data:{username:$("#username").val(),passwd:$("#passwd").val()},
		                dataType:'html',
		                success:function(data){
		                	if(data=="success"){
		                		alert("登录成功");
		                		location.href = "default.do";
		                	}else{
		                		alert(data);
		                	}
		                
		                },
		                error:function(xhr,textStatus,errorThrown){
		                	console.log("出现异常");
		                }
		            });
			}
			
			function change(){
 				$('#captchaImage').attr("src", "captcha.do?timestamp=" + (new Date()).valueOf());
			}
			
			function test(){
				alert("请先登录");
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
							<a href= ${sessionScope.user.username==null?'javaScript:test()':"userinfo.do"}>个人信息</a>
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
		<div id="slidershow" class="carousel slide" data-ride="carousel" data-interval="2000">
			<!-- 设置图片轮播的顺序 -->
			<ol class="carousel-indicators">
				<li class="active" data-target="#slidershow" data-slide-to="0"></li>
				<li data-target="#slidershow" data-slide-to="1"></li>
				<li data-target="#slidershow" data-slide-to="2"></li>
				<li data-target="#slidershow" data-slide-to="3"></li>
			</ol>
			<!-- 设置轮播图片 -->
			<div class="carousel-inner">
				<div class="item active">
					<a href="##"><img src="img/pic1.png" style="height: 300px;width: 100%"></a>
					<div class="carousel-caption">
						
					</div>
				</div>
				<div class="item">
					<a href="##"><img src="img/pic1.png" style="height: 300px;width: 100%"></a>
					<div class="carousel-caption">
						
					</div>
				</div>
				<div class="item">
					<a href="##"><img src="img/pic1.png" style="height: 300px;width: 100%"></a>
					<div class="carousel-caption">
						
					</div>
				</div>
				<div class="item">
					<a href="##"><img src="img/pic1.png" style="height: 300px;width: 100%"></a>
					<div class="carousel-caption">
						
					</div>
				</div>
			</div>
			<!-- 设置轮播图片控制器 -->
			<a class="left carousel-control" href="#slidershow" role="button" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#slidershow" role="button" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
		<div class="container" id="rec" align="center"><h1><hr></hr>推荐景点<hr></hr></h1></div>
		
			<div class="container">
			<div class="row">
				<div class="col-xs-6 col-md-3">
					<a href="#" class="thumbnail">
						<img src="img/pic5.jpg" style="height: 180px; width: 100%; display: block;" alt="">
					</a>
					<div class="caption">
						<h3 align="center">北京 颐和园</h3>
						<p>颐和园是现今保存最完整的皇家园林，北方的皇室园林更体现出大方的特色。昆明湖的湖水很清澈，视野也辽阔...</p>
						<p>
							<a href="##" class="btn btn-primary">前往购票</a>
						</p>
					</div>
				</div>
				<div class="col-xs-6 col-md-3">
					<a href="#" class="thumbnail">
						<img alt="100%x180" src="img/pic6.jpg" style="height: 180px; width: 100%; display: block;">
					</a>
					<div class="caption">
						<h3 align="center">成都 锦里</h3>
						<p> 地理位置很优越，建筑风格很好，现在是成都市著名的步行商业街，这个古典的地方有很多成都的传统小吃...</p>
						<p>
							<a href="##" class="btn btn-primary">前往购票</a>
						</p>
					</div>
				</div>
				<div class="col-xs-6 col-md-3">
					<a href="#" class="thumbnail">
						<img alt="100%x180" src="img/pic7.jpg" style="height: 180px; width: 100%; display: block;">
					</a>
					<div class="caption">
						<h3 align="center">杭州 西湖</h3>
						<p> 西湖是杭州最著名的景点，推荐租辆自行车骑行。西湖的荷花很漂亮，泛舟湖面也是不错的选择...</p>
						<p>
							<a href="##" class="btn btn-primary">前往购票</a>
						</p>
					</div>
				</div>
				<div class="col-xs-6 col-md-3">
					<a href="#" class="thumbnail">
						<img alt="100%x180" src="img/pic8.jpg" style="height: 180px; width: 100%; display: block;">
					</a>
					<div class="caption">
						<h3 align="center">上海 东方明珠</h3>
						<p> 东方明珠是很漂亮很高的建筑，附近既繁华又景色优美。在甲板上游外滩太惬意，而且上海历史陈列馆值得看看...</p>
						<p>
							<a href="##" class="btn btn-primary">前往购票</a>
						</p>
					</div>
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
					    <form id="formm" method="post"> 	
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
					      <a href="#" class="btn" style="margin-left:-10px;" data-dismiss="modal">Close</a>
					    </div>					    
		        </div><!-- /.modal-content -->
		    </div><!-- /.modal -->
		    <footer class="bs-docs-footer">
				  <div class="container">
				    				
				    <p>Designed by GG</p>
				
				
				  </div>
				</footer>
		    
		    </div>
    </body>
</html>