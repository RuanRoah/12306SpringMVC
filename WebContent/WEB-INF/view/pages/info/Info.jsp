<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>购票服务</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="style.css">
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/WdatePicker/WdatePicker.js"></script>
	<script type="text/javascript">
	$(function(){
		
		
		
		
	})
	
	</script>
  </head>
	<body>
		<div class="container-fluid">
  	<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">
            	用户信息
        </h3>
		    </div>
		    <div class="panel-body">
				姓名：${userinfo.name}<br>
				性别：男<br>
				电话：${userinfo.tel}<br>
				身份证号：${userinfo.id}<br>
		    </div>
		    
		    <div class="panel-footer">
		    	<button type="button" class="btn btn-warning"  data-toggle="modal" data-target="#moodal">
		    		修改个人信息		    	
		    	</button>
		    </div>
		</div>
		<div class="panel panel-default">
	    <div class="panel-heading">
	        <h3 class="panel-title">
	            	账号操作
	        </h3>
			    </div>
			    <div class="panel-body">
					更改绑定信息
					<img src="../img/bangding.png"/>
			    </div>
			    
			    <div class="panel-footer">
			    	<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#mooodal">
			    		修改密码		    	
			    	</button>
			    </div>
		</div>	
	</div>
	
	<!--修改个人信息-->
	<div class="modal fade" id="moodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		             <div class="modal-header">
					    <a class="close" data-dismiss="modal">×</a>
					    <h3 id="title">修改个人信息</h3>
					    </div>
					    <form action="updateinfo.do" id="formm" method="post">
					    <div class="modal-body">
					     	
						    	<div class="input-group">					            
					            	<input id="name" type="text" name="name" class="form-control" placeholder="姓名" value="${userinfo.name}">
					        	</div>	
						    	<div class="input-group">					            
					            	<input id="tel" type="text" name="tel" class="form-control" placeholder="电话" value="${userinfo.tel}">
					        	</div>
					        	<div class="input-group">	
										<select class="form-control" name="sex" id="list1">
											<option value="男">男</option>
											<option value="女">女</option>											
										</select>
								</div>
					        		
						    	<div class="input-group">					            
					            	<input id="id" type="text" name="id" class="form-control" placeholder="身份证" value="${userinfo.id}">
					        	</div>	
					        	
					        	<div class="input-group">					            
					            	<input id="age" type="text" name="age" class="form-control" placeholder="年龄" value="${userinfo.age}">
					        	</div>	
					        	
						    	<input id="id" type="hidden" name="userid" class="form-control"  value="${sessionScope.user.userid}">      
					    </div>					    
					    <div class="modal-footer">
					      <input type="submit" class="btn btn-success" id="test" value="提交">
					      <a href="#" class="btn" data-dismiss="modal">关闭</a>
					    </div>		
					     </form>	 			    
		        </div><!-- /.modal-content -->
		    </div><!-- /.modal -->
		    </div>
		    
		    <!--修改密码-->
		    <div class="modal fade" id="mooodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		             <div class="modal-header">
					    <a class="close" data-dismiss="modal">×</a>
					    <h3 id="title">修改密码</h3>
					    </div>
					    <div class="modal-body">
					    <form action="updatepasswd.do" id="formm" method="post">
						    	   	
						    	<div class="input-group">					            
					            	<input id="name" type="oldpassword" name="name" class="form-control" placeholder="原始密码">
					        	</div>	
						    	<div class="input-group">					            
					            	<input id="tel" type="newpassword" name="tel" class="form-control" placeholder="新密码">
					        	</div>	
						    	<div class="input-group">					            
					            	<input id="id" type="password" name="address" class="form-control" placeholder="确认密码">
					        	</div>	
						    	
						    </form>	              
					    </div>					    
					    <div class="modal-footer">
					      <button type="button" class="btn btn-success" id="test">提交</button>
					      <a href="#" class="btn" data-dismiss="modal">关闭</a>
					    </div>					    
		        </div><!-- /.modal-content -->
		    </div><!-- /.modal -->
		    </div>
	</body>
</html>