<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/common/common.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="${basePath}/js/jquery.form.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
function doServlet() { 
	$("#imgForm").ajaxSubmit({
		url : "${basePath}/msg/insert",
		type : 'post',
		dataType : 'json',
		//contentType :'multipart/form-data',
		success : function(data) {
			parent.$.messager.alert('提示', data.msg);
			if (data.success == true) {
				parent.doSearch();
				parent.$('#dlg-frame').dialog("close");
			}
		},
		error : function(transport) {
			$.messager.alert('提示', "系统产生错误,请联系管理员!", "error");
		}
	});
}
  
  function addColumn(){
	  var str = $("<tr><td>图片</td><td><input type='file' name='file'/></td></tr>");  
	  $("#tb").append(str); //将动态创建的str元素追加到ul下面  
  }
	  
</script>
<style type="text/css">
#table-2 thead, #table-2 tr {
border-top-width: 1px;
border-top-style: solid;
border-top-color: rgb(230, 189, 189);
}
#table-2 {
border-bottom-width: 1px;
border-bottom-style: solid;
border-bottom-color: rgb(230, 189, 189);
}

/* Padding and font style */
#table-2 td, #table-2 th {
padding: 5px 10px;
font-size: 12px;
font-family: Verdana;
color: rgb(177, 106, 104);
}

/* Alternating background colors */
#table-2 tr:nth-child(even) {
background: rgb(238, 211, 210)
}
#table-2 tr:nth-child(odd) {
background: #FFF
}


</style>
</head>
<body>
 	 <table id="table-2" >
 	 	 <c:forEach items="${messageList }" var ="msg">
 	 	  	 <tr>
 	 	  	 	 <td>${msg.name } </td>
 	 	  	 	 <td>${msg.msg } </td>
 	 	  	 	 <td>${msg.time}</td>
 	 	  	 </tr>
 	 	 </c:forEach>
 	 	  
 	 </table>
	 <form  id ="imgForm" action="${basePath }/msg/insert" method="post" >
		<input type="hidden" name="contect" value="${messageList[0].contect }">
		<table  id = "tb">
			<tr>
				<td>
					<textarea rows="5" name="msg" ></textarea>
				</td>
				<td ><input type="submit" value="submit"></td>
			</tr>
		</table>
	</form>
</body>
</html>