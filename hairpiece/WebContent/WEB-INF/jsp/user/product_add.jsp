<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/common.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>产品添加页面</title>
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
				url : "${basePath}/pro/instVipAjax",
				type : 'post',
				data : $("#proForm").serialize(),
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
		if ($("#subType").val() == "") {
			$.messager.alert("提示", "用户名不能为空!", "error");
			return false;
		}
		if ($("#type").val() == "") {
			$.messager.alert("提示", "所属代理商不能为空!", "error");
			return false;
		}
		if ($("#hairType").val() == "") {
			$.messager.alert("提示", "密码不能为空!", "error");
			return false;
		}
		if ($("#confirm").val() == "") {
			$.messager.alert("提示", "确认密码不能为空!", "error");
			return false;
		}
		return true;
	}

	function checkPwd() {
		var hairType = $("#hairType").val();
		var confirm = $("#confirm").val();
		if (hairType != "" && confirm != "") {
			if (hairType != confirm) {
				$.messager.alert("提示", "两次输入的密码不一致!", "error");
				return '1';
			}
		}
	}

	function checkUnique() {
		var subType = $("#subType").val();
		if (subType == "") {
			return false;
		}
		$.ajax({
			url : "${basePath}/pro/checkUnique",
			type : 'post',
			data : {
				"subType" : subType
			},
			dataType : 'json',
			success : function(data) {
				if(data.success != true){
			   	   $.messager.alert('提示', data.msg , "error");
			   	$("#subType").val("");
				}
			},
			error : function(transport) {
				$.messager.alert('提示', "系统产生错误,请联系管理员!", "error");
			}
		});
	}
	
	
	$(function(){
		  if("${pro.remark}" != ""){
			   $("#remark").val("${pro.remark}")
		  }
	})
</script>
</head>
<body>

	<form id="proForm" action="${basePath }/pro/instVip">
		<input type="hidden" name="id" id="id" value="${pro.id }" />
		<table width="100%">
			<tr>
				<td>大类：</td>
				<td style="padding: 20px"><input name="type" value="${pro.type }"></td>
				<td>小类：</td>
				<td style="padding: 20px"><input name="subType" id="subType" value="${pro.subType }"></td>
			</tr>
			<tr>
				<td>hairType：</td>
				<td style="padding: 20px"> <input name="hairType" id="hairType"  value="${pro.hairType }" ></td>
				<td>permed：</td>
				<td style="padding: 20px"><select name="permed" id="permed" >
						<option value="1">YES</option>
						<option value="2">NO</option>
				</select></td>
			</tr>
			<tr>
				<td>grade：</td>
				<td style="padding: 20px"><input name="grade" id="grade" value="${pro.grade }" ></td>
				<td>texture：</td>
				<td style="padding: 20px"><input name="texture" value="${pro.texture }" ></td>
			</tr>
			<tr>
				<td>unit(g/pc)：</td>
				<td style="padding: 20px"><input  name="unit" id="unit"  value="${pro.unit }" ></td>
				<td>items：</td>
				<td style="padding: 20px"><input name="items" value="${pro.items }" ></td>
			</tr>
			<tr>
				<td>hairLen：</td>
				<td style="padding: 20px"><input name="hairLen" value="${pro.hairLen }" ></td>
				<td>hairColor：</td>
				<td style="padding: 20px"><input name="hairColor" value="${pro.hairColor }" ></td>
			</tr>
			<tr>
				<td>备注：</td>
				<td style="padding: 20px"><textarea name="remark" id="remark"  rows="4"></textarea></td>
			</tr>
		</table>
	</form>
</body>
</html>