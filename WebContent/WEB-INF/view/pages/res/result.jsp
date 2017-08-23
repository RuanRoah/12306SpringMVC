<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link href="css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="style.css">
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/WdatePicker/WdatePicker.js"></script>
	</head>
	<body>
	
		<div class="container-fluid">
  			<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">
            	查询结果
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
		  					<td>票价</td>
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
		  					<td>${res.money}</td>
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
		        <div class="modal-content">
		             <div class="modal-header">
					    <a class="close" data-dismiss="modal">×</a>
					    <h3>确认购买</h3>
					    </div>
					    <div class="modal-body">
					    <form id="formm" method="post">
					    	<p>账号:${sessionScope.user.username}</p>
					    	<p>车次:<span id="train_name" name=""></span></p>
					    	<p>出发地点:<span id="starts" name=""></span></p>
					    	<p>到达地点:<span id="arrive" name=""></span></p>
					    	<p>出发时间:<span id="starttime" name=""></span></p>
					    	<p>到达时间:<span id="arrivetime" name=""></span></p>
					    	<p>票价:<span id="money"></span></p>
					    	<input type="hidden"/>
					    	<label>选择乘车人</label>
					    	<div class="checkbox">
					    	<c:forEach items="${sessionScope.userpeoples}" var="up">
							  <label>							  	
							    <input name="cus" type="checkbox" value="${up.al_name}"/><span class="choice">${up.al_name}</span>							    	
							  	
							  </label>
							 </c:forEach> 
							</div>					    	
					    	
						</form>	              
					    </div>					    
					    <div class="modal-footer">
					      <button type="button" class="btn btn-success" id="bookbtn">购买</button>
					      <a href="#" class="btn" style="margin-left:-10px;" data-dismiss="modal">取消</a>
					    </div>					    
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
			//$("input[name='keleyicom']").val();
			var test =[];//定义一个数组  
		      $('input[name="cus"]:checked').each(function(){//遍历每一个名字为interest的复选框，其中选中的执行函数  
		      	test.push($(this).val());//将选中的值添加到数组chk_value中  
		      });
			
			
			$.ajax({
				type:"post",
				url:"buyTickets.do",
				traditional:true,
				data:{
					train_name:$("#train_name").html(),

					human_name:test
				},
				success:function(result){
					alert(result);
				}
				
				
			});
			
			
		});
	
	
	</script>
	</body>
</html>
