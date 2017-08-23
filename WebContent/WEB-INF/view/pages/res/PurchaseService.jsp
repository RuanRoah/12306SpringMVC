<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>购票服务</title>
    
		<link rel="stylesheet" href="css/sand.css">
    <!--<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">-->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css"/>
  	<script type="text/javascript" src="js/WdatePicker/WdatePicker.js"></script>
  </head>
  <body>
  
    <div class="">
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
		
    </div>

	    <div class="container" style="margin-top:100px">
		    	<div class="container-fluid">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
			            	查询车次
			        </h3>
						</div>
						<div class="panel-body">
							<form class="form-inline" action="index.html" method="post">
						        <label for="arrive">出发地</label>
						        <select class="form-control" id="start" name="">
						          <option value="">请选择目的地</option>
						          <option value="北京">北京</option>
						          <option value="上海">上海</option>
						          <option value="广州">广州</option>
						          <option value="深圳">深圳</option>
						          <option value="成都">成都</option>
						          <option value="杭州">杭州</option>
						          <option value="南京">南京</option>
						          <option value="武汉">武汉</option>
						          <option value="天津">天津</option>
						          <option value="西安">西安</option>
						          <option value="重庆">重庆</option>
						          <option value="青岛">青岛</option>
						          <option value="沈阳">沈阳</option>
						          <option value="长春">长春</option>
						          <option value="长沙">长沙</option>
						          <option value="大连">大连</option>
						          <option value="厦门">厦门</option>
						          <option value="无锡">无锡</option>
						          <option value="福州">福州</option>
						          <option value="济南">济南</option>
						        </select>
						        <label for="">目的地</label>
						        <select class="form-control" id="end" name="">
						          <option value="">请选择目的地</option>
						          <option value="北京">北京</option>
						          <option value="上海">上海</option>
						          <option value="广州">广州</option>
						          <option value="深圳">深圳</option>
						          <option value="成都">成都</option>
						          <option value="杭州">杭州</option>
						          <option value="南京">南京</option>
						          <option value="武汉">武汉</option>
						          <option value="天津">天津</option>
						          <option value="西安">西安</option>
						          <option value="重庆北">重庆北</option>
						          <option value="青岛">青岛</option>
						          <option value="沈阳">沈阳</option>
						          <option value="长沙">长沙</option>
						          <option value="大连">大连</option>
						          <option value="厦门">厦门</option>
						          <option value="无锡">无锡</option>
						          <option value="福州">福州</option>
						          <option value="济南">济南</option>
						        </select>
						        <label for="datetimepicker">出发时间</label>
						        <input size="16" type="text" value="2017-07-15 14:45" class="form-control" id="dates" onclick="WdatePicker()">
						        <button type="button" class="btn btn-info" id="querybtn">查询余票</button>
						      </form>
					</div>
				</div>
			</div>
      
	      <div id="mainBody">	      		      	
	      			
	      </div>
    </div>



    <!-- jQuery first, then Bootstrap JS. -->
    <script src="js/jquery-1.11.1.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script type="text/javascript" src="js/bootstrap-datetimepicker.js"></script>
    <script type="text/javascript" src="js/bootstrap-datetimepicker.js"></script>
    <script type="text/javascript" src="js/locales/bootstrap-datetimepicker.fr.js"></script>
    <script>
        $("#datetimepicker").datetimepicker(
          {
            format: 'yyyy-mm-dd hh:ii',
            autoclose:true,
            todayBtn: true,
            pickerPosition: "bottom"
        }
      );
      $(function(){	  
      	/*$("#showmap").load("pages/map.html",function(){ $("#showmap").fadeIn(100);});*/
		$("#querybtn").click(function(){		
			$.ajax({
				type:"post",
				url:"queryticket.do",
				data:{
					startcity:$("#start").val(),
					endcity:$("#end").val(),
					date:$("#dates").val()
				},
				success:function(result){				
					console.log(result);
					/* window.location.href="welcome.jsp"; */
				}								
			});						
		});
      })
    </script>
  </body>
</html>
