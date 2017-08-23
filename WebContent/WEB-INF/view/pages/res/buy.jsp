<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购买车票</title>
 		<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
	  	<script type="text/javascript" src="js/WdatePicker/WdatePicker.js"></script>
</head>
<body>

	
	
	<script type="text/javascript">
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
	
	
		$("#querybtn").click(function(){
			
			$("#main").load("queryticket.do",{
				startcity:$("#start").val(),
				endcity:$("#end").val(),
				date:$(".Wdate").val()
			});
			
			
			/* $.ajax({
				type:"post",
				url:"queryticket.do",
				data:{
					startcity:$("#start").val(),
					endcity:$("#end").val(),
					date:$(".Wdate").val()
				},
				
				success:function(result){					
					console.log(result);
					/* window.location.href="welcome.jsp";} */				
			}); 
	</script>
</body>
</html>