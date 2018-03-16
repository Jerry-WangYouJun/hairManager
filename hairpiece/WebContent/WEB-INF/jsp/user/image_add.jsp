<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="${basePath}/js/jquery.form.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
function doServlet() { 
	$("#imgForm").ajaxSubmit({
		url : "${basePath}/image/insert",
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
</head>
<body>
	 <form  id ="imgForm" action="${basePath }/pro/instVipAjax" method="post" enctype="multipart/form-data">
		<input type="hidden" name="type" value="1">
		<input type="hidden" name="contect" value="${image.contect}">
		<table  id = "tb">
			<tr>
				<th >上传图片  ${image.contect}</th>
				<td>
					<input type="file" name="file"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>