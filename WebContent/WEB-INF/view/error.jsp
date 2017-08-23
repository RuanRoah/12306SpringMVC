<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Login</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  <body>
    <form action="login" id="formm" method="post">
    	<label>username</label><input id="username" type="text" name="username">
    	<label>passwd</label><input id="passwd" type="password" name="passwd">
    	<img id="captchaImage" src="captcha"/>
    	<input id="imgcode" type="text">
    	<button type="button" id="test">submit</button>
    </form>
    <script src="js/jquery-1.8.2.min.js">
    	
    </script>
    <script type="text/javascript">
    	 // 更换验证码
         $('#captchaImage').click(function() 
         {
             $('#captchaImage').attr("src", "captcha?timestamp=" + (new Date()).valueOf());
         }); 
         
         $(function(){         
         
        $("#test").click(function(){
            var $a = $(this);
            $.ajax({
                url:"yanzheng",
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
                    	console.log("验证码错误"); 
                    }
                    
                },
                error:function(xhr,textStatus,errorThrown){
                	console.log("出现异常");
                }
            });
        });
    });
    </script>
  </body>
</html>
