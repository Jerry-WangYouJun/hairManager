<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/common.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>字典添加页面</title>
<style type="text/css">
table {
	font-size: 16px;
}

textarea {
	font-size: 16px;
}
</style>
<script type="text/javascript">
	function doServlet() {
		if (checkInfo()) {
			$.ajax({
				url : "${basePath}/dic/instVipAjax",
				type : 'post',
				data : $("#dicForm").serialize(),
				dataType : 'json',
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
	}
	function checkInfo() {
		if ($("#name").val() == "") {
			$.messager.alert("提示", "字典名称不能为空!", "error");
			return false;
		}
		if ($("#code").val() == "") {
			$.messager.alert("提示", "字典代码不能为空!", "error");
			return false;
		}
		return true;
	}

	function checkPwd() {
		var pwd = $("#pwd").val();
		var confirm = $("#confirm").val();
		if (pwd != "" && confirm != "") {
			if (pwd != confirm) {
				$.messager.alert("提示", "两次输入的密码不一致!", "error");
				return '1';
			}
		}
	}

	function checkUnique() {
		var code = $("#code").val();
		if (code == "") {
			return false;
		}
		$.ajax({
			url : "${basePath}/dic/checkUnique",
			type : 'post',
			data : {
				"code" : code
			},
			dataType : 'json',
			success : function(data) {
				if(data.success != true){
			   	   $.messager.alert('提示', data.msg , "error");
			   	$("#dicNo").val("");
				}
			},
			error : function(transport) {
				$.messager.alert('提示', "系统产生错误,请联系管理员!", "error");
			}
		});
	}
	
	
	$(function(){
		  if("${dic.remark}" != ""){
			   $("#remark").val("${dic.remark}")
		  }
		  if("${dic.code}" != ""){
			   $("#code").val("${dic.code}")
		 }
	})
</script>
</head>
<body>

	<form id="dicForm" action="${basePath }/dic/instVip">
		<input type="hidden" name="id" id="id" value="${dic.id }" />
		<table width="100%">
			<tr>
				<td>字典代码：</td>
				 <td style="padding: 20px">
				  <select name = "code" id="code" >
					  <option >-请选择-</option>
				      <option value="Wigs">Wigs</option>
				      <option value="Hair extensions">Hair extensions</option>
				      <option value="Hair pieces">Hair pieces</option>
				      <option value="Eyelashs">Eyelashs</option>
				  </select>
			     </td>
				<td>字典名称：</td>
				<td style="padding: 20px"><input name="name" id= "name" value="${dic.name }"
					></td>
			</tr>
			<tr>
				<td>备注：</td>
				<td style="padding: 20px"><textarea name="remark" id="remark"  rows="4"></textarea></td>
			</tr>
			<tr>
			</tr>
		</table>
	</form>
</body>
</html>