<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>车次管理</title>

<link href="/graduate/css/css.css" rel="stylesheet" type="text/css" />
<link href="/graduate/css/style.css" rel="stylesheet" type="text/css" />
<link type="text/css" rel="stylesheet" href="calendar.css" >
<script type="text/javascript" src="calendar.js" ></script>  
<script type="text/javascript" src="calendar-zh.js" ></script>
<script type="text/javascript" src="calendar-setup.js"></script>

<script type="text/javascript">
	function jump(p){
		var oForm = document.searchForm || document.forms[0];
		oForm.currentPage.value=p;
		oForm.submit();
	}
	function checnNum(){
		var goTo = document.getElementById("goTo").value;
		var checkNum = /^\d+$/; //检查输入的是否为数字
		if(checkNum.test(goTo)==false){
			jump(1);
		}else{
		jump(document.getElementById('goTo').value);
		}
	}
</script>

</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30">      
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>    
          <td height="62" background="/graduate/images/nav04.gif">
            
		   <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
		    <tr>
			  <td width="24"><img src="/graduate/images/ico07.gif" width="20" height="18" /></td>
			  <td width="519">
			  <form name="fom" id="fom" method="post" action="/graduate/BuyTicketServlet">
				<input type="hidden" name="currentPage" value="${pb.currentPage}"/>
			出发地：<input name="start" type="text" size="12" value="${condition.origin}"/>
			目的地：<input name="end" type="text" size="12" value="${condition.terminus}"/>
			   日期：<input name="leaveTime" type="text" id="EntTime" size="12" value="${condition.leaveTime}" onclick="return showCalendar('EntTime', 'y-mm-dd');"  />
			  车次：<input name="train_num" type="text" size="12" value="${condition.train_num}"/>
			    <input name="select_train" type="submit" class="right-button02" value="查 询" />
			  </form>
			  </td>
		    </tr>
          </table>
         </td>
        </tr>
    </table>
    </td>
  </tr>
    
  <tr>
    <td><table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td height="40" class="font42"><table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">

					                  <tr>
                    <td height="20" colspan="15" align="center" bgcolor="#EEEEEE"class="tablestyle_title"> &nbsp;&nbsp;购票 </td>
                    </tr>
                 <tr>
					<td  align="center" bgcolor="#EEEEEE">车次</td>
                    <td  align="center" bgcolor="#EEEEEE">发站</td>
                    <td  align="center" bgcolor="#EEEEEE">到站</td>
					<td  align="center" bgcolor="#EEEEEE">发车时间</td>
					<td  align="center" bgcolor="#EEEEEE">到站时间</td>
					<td  align="center" bgcolor="#EEEEEE">票价</td>
					<td  align="center" bgcolor="#EEEEEE">剩余票数</td>
					<td  align="center" bgcolor="#EEEEEE">操作</td>
                  </tr>
                  <c:if test="${requestScope.listTicket ne null}">
                  <c:forEach items="${requestScope.listTicket}" var="ticket" varStatus="s">
                  <tr>
                    <td  align="center" bgcolor="#FFFFFF"><a href="/graduate/GetTrainServlet?train_num=${ticket.train_num }" style="color:blue;">${ticket.train_num }</a></td>
                    <td  align="center" bgcolor="#FFFFFF">${ticket.origin }</td>
                    <td  align="center" bgcolor="#FFFFFF">${ticket.terminus }</td>
					<td  align="center" bgcolor="#FFFFFF">${ticket.g_time }</td>
					<td  align="center" bgcolor="#FFFFFF">${ticket.a_time }</td>
					<td  align="center" bgcolor="#FFFFFF">${ticket.price }</td>
					<td  align="center" bgcolor="#FFFFFF">${ticket.remainder }</td>
                    <td align="center" bgcolor="#FFFFFF">
                    	<form name="forms"  method="post" action="/graduate/ToBuyTicketServlet">
                    	<input type="hidden" name="train_num" value="${ticket.train_num}"/>
                    	<input type="hidden" name="leaveTime" value="${ticket.leaveTime}"/>
                    	<input type="hidden" name="start" value="${ticket.origin}"/>
                    	<input type="hidden" name="end" value="${ticket.terminus}"/>
                    	<input type="hidden" name="g_time" value="${ticket.g_time}"/>
                    	<input type="hidden" name="a_time" value="${ticket.a_time}"/>
                    	<input type="hidden" name="price" value="${ticket.price}"/>
                    	<input type="hidden" name="username" value="${sessionScope.username }"/>
                    	<input type="submit" name="addres" value="购票"/>
                   		</form>
                   	</td>
                  </tr>
                  </c:forEach>
                  </c:if>
                </table></td>
              </tr>
            </table></td>
        </tr>
      </table>
      <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
		<td style="text-align: left"> 
			第<font color="red">${pb.currentPage}</font>/${pb.totalPage}页
			共${pb.totalCount}条
		</td>
		<td style="text-align:right" >
			<c:choose>
				<c:when test="${pb.currentPage eq 1}">
					首页
					上一页
				</c:when>
				<c:otherwise>
					<a href="javascript:jump(1)" style="color:blue;">首页</a>
					<a href="javascript:jump(${pb.currentPage-1})" style="color:blue;">上一页</a>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${pb.currentPage eq pb.totalPage}">
					下一页
					末页
				</c:when>
				<c:otherwise>
					<a href="javascript:jump(${pb.currentPage+1})" style="color:blue;" >下一页</a>
					<a href="javascript:jump(${pb.totalPage})" style="color:blue;">末页</a>
				</c:otherwise>
			</c:choose>
			转到<input id="goTo" type="text" style="width:20px" value="${pb.currentPage }" />页
			<input type="button" value="GO" onclick="checnNum()" />
		</td>
	</tr>
		
      </table></td>
  </tr>
</table>

</body>
</html>