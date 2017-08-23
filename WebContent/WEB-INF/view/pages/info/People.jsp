<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%int i=0; %>
<!DOCTYPE html>
<html>
	<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>购票服务</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="../css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="style.css">
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/WdatePicker/WdatePicker.js"></script>
	<style>
		.jiange{
			padding:10px;		
		}
	</style>
  </head>
	<body>
		<div class="container-fluid">
  			<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">
            	常用联系人管理
        </h3>
		    </div>
		    <div class="panel-body">
		    	<div class="col-md-12">
					<button type="button" id="add" class="btn btn-success btn-success-act"   data-toggle="modal" data-target="#moodal">添加联系人</button>
				</div>
				<div class="col-md-12">
					<table class="table">
	  				<thead>
	  					<tr>
		  					<td>id</td>
		  					<td>姓名</td>
		  					<td>电话</td>
		  					<td>身份证号</td>
		  					<td>乘车人id</td>
		  					<td>操作</td>
	  					</tr>
	  				</thead>
	  				<c:forEach items="${userpeople}" var="up">
	  				
	  				<tr>
		  					<td><%=++i %></td>
		  					<td>${up.al_name}</td>
		  					<td>${up.al_tel}</td>
		  					<td>${up.al_id}</td>
		  					<td>${up.id}</td>
		  					<td>
		  						<button type="button" id="add" class="btn btn-warning"  data-toggle="modal" data-target="#moodal">修改</button>
		  						<button type="button" id="add" class="btn btn-danger btn-delete">删除</button>
		  					</td>  					
		  				</tr>		  					  				
	  				</c:forEach>  				
				</table> 	  
		    </div>
				
				</div>
		</div>
	</div>
	<!--添加/修改联系人联系人-->
	<div class="modal fade" id="moodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		             <div class="modal-header">
					    <a class="close" data-dismiss="modal">×</a>
					    <h3 id="title"></h3>
					    </div>
					     <form action="dopeople.do" id="formm" method="post">
					    <div class="modal-body">					  
					     		<input id="id" type="hidden" name="id" class="form-control">
					     		<input value="${sessionScope.user.userid}" id="userid" type="hidden" name="user_id" class="form-control">
						    	<div class="input-group">					            
					            	<input id="al_name" type="text"  class="form-control" placeholder="姓名"/>
					        	</div>	
					        	<div class="jiange"></div>
						    	<div class="input-group">					            
					            	<input id="al_tel" type="text"  class="form-control" placeholder="电话"/>
					        	</div>	
						    	<div class="jiange"></div>
						    	<div class="input-group">					            
					            	<input id="al_id" type="text"  class="form-control" placeholder="身份证号"/>
					        	</div>							    							            
					    </div>					    
					    <div class="modal-footer">
					      <input type="button" class="btn btn-success" id="test" value="提交">
					      <a href="#" class="btn" data-dismiss="modal">关闭</a>
					    </div>		
					     </form>	     			    
		        </div><!-- /.modal-content -->
		    </div><!-- /.modal -->
		    </div>	
		<script>
		$(function(){
			$(".btn-warning").click(function(){
				$("#title").html("修改联系人");
				
				$("#al_name").val($(this).parent().parent().find("td").eq(1).html());
				$("#al_tel").val($(this).parent().parent().find("td").eq(2).html());
				$("#al_id").val($(this).parent().parent().find("td").eq(3).html());
				$("#id").val($(this).parent().parent().find("td").eq(4).html());
			});
			$(".btn-delete").click(function(){
				var did=$(this).parent().parent().find("td").eq(4).html();
				console.log(did);
				$.ajax({
					 url:"deletepeople.do",
		                type:'post',
		                data:{		                	
		                	 id:did
		                },
		                dataType:'html',
		                success:function(data){
							alert(data);
							window.location.reload();
		                }
					
					
					
				})
			});
			
			$(".btn-success-act").click(function(){
				$("#title").html("添加联系人");
				$("#al_name").val("");
				$("#al_tel").val("");
				$("#al_id").val("");
			});
			$("#test").click(function(){
				 console.log($("#userid").val()+$("#al_name").val()+$("#al_tel").val()+$("#al_id").val());
				  $.ajax({
						 url:"dopeople.do",
		                type:'post',
		                data:{
		                	userid:$("#userid").val(),
		                	 al_name:$("#al_name").val(),
		                	 al_tel:$("#al_tel").val(),
		                	 al_id:$("#al_id").val(),
		                	 id:$("#id").val()
		                },
		                dataType:'html',
		                success:function(data){
							alert(data);
							
		                }
				 });
			});
			
			function getpeople(){
				$.ajax({
						url:"getpeople.do",
		                type:'post',
		                data:{
		                	 userid:$("#userid").val(),
		                	 al_name: $("#al_name").val($(this).parent().parent().find("td").eq(1).html()),
		                	 al_tel: $("#al_name").val($(this).parent().parent().find("td").eq(2).html()),
		                	 al_id: $("#al_name").val($(this).parent().parent().find("td").eq(3).html())
		                },
		                success:function(data){
							alert(data);
							
		                }
				 });
				return data;
			}
		});		
	</script>	
	</body>
</html>