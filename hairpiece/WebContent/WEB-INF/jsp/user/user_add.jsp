<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/common.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户添加页面</title>
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
				url : "${basePath}/user/instVipAjax",
				type : 'post',
				data : $("#userForm").serialize(),
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
		if ($("#userNo").val() == "") {
			$.messager.alert("提示", "用户名不能为空!", "error");
			return false;
		}
		if ($("#userName").val() == "") {
			$.messager.alert("提示", "所属代理商不能为空!", "error");
			return false;
		}
		if ($("#pwd").val() == "") {
			$.messager.alert("提示", "密码不能为空!", "error");
			return false;
		}
		if ($("#confirm").val() == "") {
			$.messager.alert("提示", "确认密码不能为空!", "error");
			return false;
		}
		if (checkPwd() == "1") {
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
		var userNo = $("#userNo").val();
		if (userNo == "") {
			return false;
		}
		$.ajax({
			url : "${basePath}/user/checkUnique",
			type : 'post',
			data : {
				"userNo" : userNo
			},
			dataType : 'json',
			success : function(data) {
				if(data.success != true){
			   	   $.messager.alert('提示', data.msg , "error");
			   	$("#userNo").val("");
				}
			},
			error : function(transport) {
				$.messager.alert('提示', "系统产生错误,请联系管理员!", "error");
			}
		});
	}
	
	
	$(function(){
		  if("${user.sex}" == "1"){
			    $("#sex").val(1);
		  }
		  if("${user.roleId}" == "2"){
			   $("#roleId").val(2);
		  }
		  if("${user.remark}" != ""){
			   $("#remark").val("${user.remark}")
		  }
	})
</script>
</head>
<body>

	<form id="userForm" action="${basePath }/user/instVip">
		<input type="hidden" name="id" id="id" value="${user.id }" />
		<table width="100%">
			<tr>
				<td>用户名称：</td>
				<td style="padding: 20px"><input name="userName" value="${user.userName }"
					></td>
				<td>登录账号：</td>
				<td style="padding: 20px"><input name="userNo" id="userNo" value="${user.userNo }"
					 onchange="checkUnique();"></td>
			</tr>
			<tr>
				<td>密码：</td>
				<td style="padding: 20px"> <input name="pwd" id="pwd"  value="${user.pwd }" ></td>
				<td>确认密码：</td>
				<td style="padding: 20px"><input  name="confirm" id="confirm"  value="${user.pwd }" ></td>
			</tr>
			<tr>
				<td>邮箱：</td>
				<td style="padding: 20px"><input name="email" id="email" value="${user.email }" ></td>
				<td>性别：</td>
				<td style="padding: 20px"><select name="sex" id="sex" >
						<option value="0">男</option>
						<option value="1">女</option>
				</select></td>
			</tr>
			<tr>
				<td>地址：</td>
				<td style="padding: 20px"><input name="position" value="${user.position }" ></td>
				<td>电话：</td>
				<td style="padding: 20px"><input name="telphone" value="${user.telphone }" ></td>
			</tr>
			<tr>
				<td>角色：</td>
				<td style="padding: 20px"><select name="roleId" id="roleId">
						<option value="1">管理员</option>
						<option value="2">用户</option>
				</select></td>
				<td>备注：</td>
				<td style="padding: 20px"><textarea name="remark" id="remark"  rows="4"></textarea></td>
			</tr>
			<tr>
			</tr>
		</table>
	</form>
</body>
</html>