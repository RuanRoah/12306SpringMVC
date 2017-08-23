<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>my12306</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Template by FREEHTML5" />
	<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">

	<!-- <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'> -->

	<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="css/sand.css">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<!-- Superfish -->
	<link rel="stylesheet" href="css/superfish.css">

	<link rel="stylesheet" href="css/style.css">
	<style>
	.middle{
		display:flex;
		padding-left:45%;
		padding-right:50%;
	}
	</style>

	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
	<script type="text/javascript">
			//更换验证码函数
			$(function(){
				$('#loginsuccess').click(function(){
					alert("hello!");
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
		</script>

	</head>
	<body>
		<div id="fh5co-wrapper">
		<div id="fh5co-page">
		<div id="fh5co-header">
			<header id="fh5co-header-section">
				<div class="container">
					<div class="nav-header">
						<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle"><i></i></a>
						<!-- 用来跳到首页的链接，可以换成12306的图片 -->
						<h1 id="fh5co-logo"><a href="default.do">12306</a></h1>
						<!-- START #fh5co-menu-wrap -->
						<nav id="fh5co-menu-wrap" role="navigation">
							<ul class="sf-menu" id="fh5co-primary-menu">
								<li>
									<a href="order.do">车票查询</a>
								</li>
								
								<li>
									<a href="userinfo.do">个人信息</a>
								</li>
								<li><a href="register.do">新用户注册</a>
								</li>
							</ul>

						</nav>
					</div>
				</div>
			</header>
		</div>


		<div class="fh5co-hero">
			<div class="fh5co-overlay"></div>
			<div class="fh5co-cover text-center" data-stellar-background-ratio="0.5" style="background-image: url(images/cover_bg_1.jpg);">
				<div class="desc animate-box">
					<h2>心能到达的远方，现在，动车也能带你达到</h2>
					<!-- <span>Lovely Crafted by <a href="#" target="_blank" class="fh5co-site-name">FREEHTML5.co</a></span> -->
					<span class="middle">
					
					<button id="login" class="btn btn-primary btn-lg"   data-toggle="modal" data-target="#moodal" style="display: ${sessionScope.user.username==null?'block':'none'}">现在订票</button> 
					<button id="loginsuccess" class="btn btn-primary btn-lg" style="display: ${sessionScope.user.username!=null?'block':'none'}">欢迎:${sessionScope.user.username}</button>
					
					
					</span>
				</div>
			</div>

		</div>


		<div class="fh5co-listing">
			<div class="container">
				<div class="row">
					<div class="col-md-4 col-sm-4 fh5co-item-wrap">
						<a class="fh5co-listing-item">
							<img src="images/img-1.jpg" alt="Free HTML5 Bootstrap Template by FreeHTML5.co" class="img-responsive">
							<div class="fh5co-listing-copy">
								<h2>北京故宫</h2>
								<span class="icon">
									<i class="icon-chevron-right"></i>
								</span>
							</div>
						</a>
					</div>
					<div class="col-md-4 col-sm-4 fh5co-item-wrap">
						<a class="fh5co-listing-item">
							<img src="images/img-2.jpg" alt="Free HTML5 Bootstrap Template by FreeHTML5.co" class="img-responsive">
							<div class="fh5co-listing-copy">
								<h2>上海外滩</h2>
								<span class="icon">
									<i class="icon-chevron-right"></i>
								</span>
							</div>
						</a>
					</div>
					<div class="col-md-4 col-sm-4 fh5co-item-wrap">
						<a class="fh5co-listing-item">
							<img src="images/img-3.jpg" alt="Free HTML5 Bootstrap Template by FreeHTML5.co" class="img-responsive">
							<div class="fh5co-listing-copy">
								<h2>杭州西湖</h2>
								<span class="icon">
									<i class="icon-chevron-right"></i>
								</span>
							</div>
						</a>
					</div>
					<!-- END 3 row -->

					<div class="col-md-4 col-sm-4 fh5co-item-wrap">
						<a class="fh5co-listing-item">
							<img src="images/img-4.jpg" alt="Free HTML5 Bootstrap Template by FreeHTML5.co" class="img-responsive">
							<div class="fh5co-listing-copy">
								<h2>江西庐山</h2>
								<span class="icon">
									<i class="icon-chevron-right"></i>
								</span>
							</div>
						</a>
					</div>
					<div class="col-md-4 col-sm-4 fh5co-item-wrap">
						<a class="fh5co-listing-item">
							<img src="images/img-5.jpg" alt="Free HTML5 Bootstrap Template by FreeHTML5.co" class="img-responsive">
							<div class="fh5co-listing-copy">
								<h2>苏州园林</h2>
								<span class="icon">
									<i class="icon-chevron-right"></i>
								</span>
							</div>
						</a>
					</div>
					<div class="col-md-4 col-sm-4 fh5co-item-wrap">
						<a class="fh5co-listing-item">
							<img src="images/img-6.jpg" alt="Free HTML5 Bootstrap Template by FreeHTML5.co" class="img-responsive">
							<div class="fh5co-listing-copy">
								<h2>西藏布达拉宫</h2>
								<span class="icon">
									<i class="icon-chevron-right"></i>
								</span>
							</div>
						</a>
					</div>
					<!-- END 3 row -->


				</div>
			</div>
		</div>

        <div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >手机网站模板</a></div>


		<div class="fh5co-section">
			<div class="container">
				<div class="row">
					<div class="col-md-6 fh5co-news">
						<h3>信息服务</h3>
						<ul>
							<li>
								<a href="#">
									<span class="fh5co-date">Sep. 10, 2016</span>
									<h3>个人信息</h3>
									<p>个人信息个人信息个人信息个人信息个人信息个人信息个人信息!</p>
								</a>
							</li>
							<li>
								<a href="#">
									<span class="fh5co-date">Sep. 10, 2016</span>
									<h3>相关规章</h3>
									<p>相关规章相关规章相关规章相关规章相关规章相关规章</p>
								</a>
							</li>
							<li>
								<a href="#">
									<span class="fh5co-date">Sep. 10, 2016</span>
									<h3>铁路保险</h3>
									<p>铁路保险铁路保险铁路保险铁路保险铁路保险铁路保险</p>
								</a>
							</li>
						</ul>
					</div>
					<div class="col-md-6 fh5co-testimonial">
						<img src="images/cover_bg_1.jpg" alt="Free HTML5 Bootstrap Template by FreeHTML5.co" class="img-responsive mb20">
						<img src="images/cover_bg_1.jpg" alt="Free HTML5 Bootstrap Template by FreeHTML5.co" class="img-responsive">
					</div>
				</div>
			</div>
		</div>

		<footer>
			<div id="footer">
				<div class="container">
					<div class="row">
						<div class="col-md-6 col-md-offset-3 text-center">
							<p class="fh5co-social-icons">
								<!-- <a href="#"><i class="icon-twitter2"></i></a>
								<a href="#"><i class="icon-facebook2"></i></a>
								<a href="#"><i class="icon-instagram"></i></a>
								<a href="#"><i class="icon-dribbble2"></i></a>
								<a href="#"><i class="icon-youtube"></i></a> -->
							</p>
							<p>Copyright 2017 Northeastern University. All Rights Reserved. <br> More information <a href="http://www.neu.edu.cn" target="_blank" title="东北大学">东北大学</a> - Collect from <a href="javascript:void(0)" title="网页模板" target="_blank">Roah</a> / Images from: <a href="#" target="_blank">Long</a></p>
						</div>
					</div>
				</div>
			</div>
		</footer>


	</div>
	<!-- END fh5co-page -->

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
	<!-- END fh5co-wrapper -->
	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Stellar -->
	<script src="js/jquery.stellar.min.js"></script>
	<!-- Superfish -->
	<script src="js/hoverIntent.js"></script>
	<script src="js/superfish.js"></script>
	<!-- Main JS -->
	<script src="js/main.js"></script>
	</body>
</html>
