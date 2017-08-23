<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="css/sand.css">
    <!--<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">-->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css"/>
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
	<div class="container" style="padding-top:20px;">
		<div class="container-fluid">
		<div class="panel panel-default">
		<div class="panel-heading">
        <h3 class="panel-title">
            	基本信息
        </h3>
		    </div>
		 
		  <div class="panel-body">
		  <h4>
		    <p>乘车人:<span id="human">${people}</span></p>
		    <p>出发地:</p>
		    <p>目的地:</p>
		    <p>日期:</p>
		    </h4>
		    
		   </div>
		 </div>
  			<div class="panel panel-default">
    	<div class="panel-heading">
        <h3 class="panel-title">
            	改签结果
        </h3>
        <%int i=0; %>
		    </div>
		    <div class="panel-body">
		   
				<table class="table">
	  				<thead>
	  					<tr>
		  					
		  					<td>车次</td>
		  					<td>始发站</td>
		  					<td>始发时间</td>
		  					<td>终点站</td>		  					
		  					<td>到达时间</td>
		  					<td>余票</td>
		  					<td>操作</td>
	  					</tr>
	  				</thead>
	  				
	  				<c:forEach items="${sessionScope.ticketShows}" var="res">		  				
		  				<tr>
		  					
		  					<td>${res.train_name}</td>
		  					<td>${res.start}</td>
		  					<td>${res.startTime}</td>
		  					<td>${res.end}</td>
		  					<td>${res.endTime}</td>
		  					<td>${res.tickets}</td>
		  					<input type="hidden" value="${res.money}">
		  					<td><button type="button" data-toggle="modal" href="#moodal" class="btn btn-default">预订</button></td>		  					  				
		  				</tr>		  				
					</c:forEach>
				</table> 	  
		    </div>
		</div>
	</div>
	
	<div class="modal fade" id="moodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		    <form id="formm" method="post">
		        <div class="modal-content">
		             <div class="modal-header">
					    <a class="close" data-dismiss="modal">×</a>
					    <h3>确认改签</h3>
					    </div>
					    <div class="modal-body">
					    
					    	<p>账号:${sessionScope.user.username}</p>
					    	<p>车次:<span id="train_name" name=""></span></p>
					    	<p>出发地点:<span id="starts" name=""></span></p>
					    	<p>到达地点:<span id="arrive" name=""></span></p>
					    	<p>出发时间:<span id="starttime" name=""></span></p>
					    	<p>到达时间:<span id="arrivetime" name=""></span></p>
					    	<p>票价:<span id="money"></span></p>
					    	<input type="hidden"/>
					    	<p>乘车人:<span id="people">${people}</span></p>
					    	
					    	<%-- 
					    	
					    	<div class="checkbox">					    	
					    	<c:forEach items="${sessionScope.userpeoples}" var="up">
							  <label>							  	
							    <input type="checkbox" value="${up.al_name}"/><span class="choice">${up.al_name}</span><span class="choice">${up.al_tel}</span><span class="choice">${up.al_id}</span>							    	
							  	<input type="hidden" name="cus" value="${up.al_name}">
							  </label>
							 </c:forEach>  
							 
							 --%>
							 
							</div>					    	
					    	<div class="modal-footer">
					      <button type="button" class="btn btn-success" id="bookbtn">购买</button>
					      <a href="#" class="btn" style="margin-left:-10px;" data-dismiss="modal">取消</a>
					    </div>	
						              
					    </div>					    
					    	
					    </form>	
					    			    
		        </div><!-- /.modal-content -->
		    </div><!-- /.modal -->
		    <footer class="bs-docs-footer">
				  <div class="container">
				    				
				    <p>Designed by GG</p>
				
				
				  </div>
				</footer>
		    
		    </div>
	
	<script type="text/javascript">
		$(function(){
			$(".btn-default").click(function(){
				$("#train_name").html($(this).parent().parent().find("td").eq(0).html());
				$("#starts").html($(this).parent().parent().find("td").eq(1).html());
				$("#arrive").html($(this).parent().parent().find("td").eq(3).html());
				$("#starttime").html($(this).parent().parent().find("td").eq(2).html());
				$("#arrivetime").html($(this).parent().parent().find("td").eq(4).html());	
				$("#money").html($(this).parent().parent().find("input").eq(0).val());	
				console.log($(this).parent().parent().find("td").eq(3).html());
			});			
			$("input[name='cus']").change(function(){
				var danjia=$(this).parent().parent().find("input").eq(0).val();
				var money=danjia*($("input[name='cus']").val().length);
				console.log(money);
				$("#money").html(money);
				
				
			});
			
			
		});
		$("#bookbtn").click(function(){
			human=$("#human").html();
			console.log($("#train_name").html()+human);
			$.ajax({
				type:"post",
				url:"updateOrder.do",
				traditional:true,
				data:{
					train_name:$("#train_name").html(),					
					human_name:human,
				},
				success:function(result){
					console.log(result);
				}								
			});
		});
	
	
	</script>
	</body>
</html>
