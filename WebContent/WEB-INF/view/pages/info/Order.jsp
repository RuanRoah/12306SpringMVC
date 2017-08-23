<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<script type="text/javascript">
		$(function(){
			
			
			var order={
				"user":"",
				"trainid":"",
				"starttime":"",
				"buyer":"",
				"road":"",
				"money":"",
				"order_id":""
			};
			
			
			$(".show").click(function(){		
				console.log($(this).parent().parent().find("td").eq(0).html());
				$("#userid").html($(this).parent().parent().find("input").val());
				order.user=$(this).parent().parent().find("input").val();
				$("#trainid").html($(this).parent().parent().find("td").eq(2).html());
				order.trainid=$(this).parent().parent().find("td").eq(2).html()
				$("#starttime").html($(this).parent().parent().find("td").eq(3).html());				
				order.buyer=$("#buyer").html($(this).parent().parent().find("td").eq(4).html());
				$("#road").html($(this).parent().parent().find("td").eq(1).html());				
				order.road=$(this).parent().parent().find("td").eq(1).html()
				$("#money").html($(this).parent().parent().find("td").eq(5).html());
				order.money=$(this).parent().parent().find("td").eq(5).html()
				$("#order_id").html($(this).parent().parent().find("td").eq(6).html());				
				$("#orderid").val($(this).parent().parent().find("td").eq(6).html());
				order.order_id=$(this).parent().parent().find("td").eq(6).html();
				console.log(order);				
				$('#orders').modal('show');
			});
			
			
			$("#update").click(function(){
				var order = $("#orderid").val();
				var road=$("#road").html().split("-");
				var starttime=$("#starttime").html();
				
				console.log("update"+order+road+starttime);
				$.ajax({
					type:"post",
					url:"newticket.do",
					traditional:true,
					data:{
						start:$("#road").html().split("-")[0],
						end:$("#road").html().split("-")[1],
						dates:starttime.substring(0,10),
						people:$("#buyer").html(),
						orderid:order,
					},
					dataType:'html',
					success:function(result){
						alert(result);
						location.href="gotogaiqian.do";
					}
				});		
			});			
			
			$("#delete").click(function(){
				var order = $("#orderid").val();
				console.log("delete"+order);
				var $a = $(this);
				$.ajax({
					type:"post",
					url:"deleteOrder.do",
					traditional:true,
					data:{
							
						orderid:order,
					},
					dataType:'html',
					success:function(result){
						alert(result);
					}
				});
				
			});			
			
			
			
		});
	</script>
	</head>
	<body>
	<%int i=0; %>
		<div class="container-fluid">
  			<div class="panel panel-default">
    		<div class="panel-heading">
		        <h3 class="panel-title">
		            	订单管理
		        </h3>
		    </div>
		    <div class="panel-body">
				<table class="table">
	  				<thead>
	  					<tr>
		  					<td>id</td>
		  					<td>地点</td>
		  					<td>车次</td>
		  					<td>始发时间</td>
		  					<td>乘车人</td>		  					
		  					<td>票价</td>
		  					<td>订单号</td>
		  					<td>操作</td>
	  					</tr>
	  				</thead>		  				
		  				<c:forEach items="${order}" var="oo">
		  				<tr>
		  					<td><%=++i %></td>
		  					<td>${oo.startCity}-${oo.endCity}</td>
		  					<td>${oo.train}</td>
		  					<td>${oo.startTime}</td>
		  					<td>${oo.name}</td>		  					
		  					<td>${oo.ticketPrice}</td>
		  					<td>${oo.id}</td>
		  					<input type="hidden"  value="${sessionScope.user.username}"/>
		  					<input type="hidden"  value="${oo.startCity}"/>
		  					<input type="hidden"  value="${oo.endCity}"/>
		  					
		  					<td><a class="show">查看详情</a></td>  					
		  				</tr>
		  				</c:forEach>		  				  				
				</table>
		    </div>
		</div>
	</div>
	<div class="modal fade" id="orders" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		             <div class="modal-header">
					    <a class="close" data-dismiss="modal">×</a>
					    <h3>订单详情</h3>
					    </div>
					    <form id="formm" method="post"> 
					    <div class="modal-body">
					    	<p>用户名:<span id="userid"></span></p>		
					    	<p>乘车人:<span id="buyer"></span></p>
						    <p>车次:<span id="trainid"></span></p>
						    <p>出发时间:<span id="starttime"></span></p>
						    <p>路径:<span id="road"></span></p>						    				    						    	
						 	<p>订单号:<span id="order_id"></span></p>	
						 	<p>票价:<span id="money"></span></p>		
						 	<input type="hidden" id="orderid">				 	              
					    </div>					    
					    <div class="modal-footer">
					    
					      <button type="button" class="btn btn-warning" id="update">改签</button>
					    
					      <button type="button" class="btn btn-danger" id="delete">退票</button>
					      <button type="button" class="btn btn-default" data-dismiss="modal" id="test">取消</button>			      
					    </div>
					    </form>	    
					    
		        </div><!-- /.modal-content -->
		    </div><!-- /.modal -->
		</div>
			
		</body>
		
</html>