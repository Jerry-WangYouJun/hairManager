<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

		<form id="company_form" action="${basePath }/user/instVip" style="padding-left: 30%;padding-top:50px;width:30%;">
			<div class="form-group col-md-12">
				<label class="col-md-4"
					style="display: inline-block; height: 34px; line-height: 34px; text-align: left; width: 30%">用户名称：</label>
				<input name="userName" class=" form-control"
					style="display: inline-block; width: 70%">
			</div>
			<div class="form-group col-md-12">
				<label class="col-md-4"
					style="display: inline-block; height: 34px; line-height: 34px; text-align: left; width: 30%">登录账号：</label>
				<input name="userNo" id="userNo" class=" form-control"
					style="display: inline-block; width: 70%">
			</div>
			<div class="form-group col-md-12">
				<label class="col-md-4"
					style="display: inline-block; height: 34px; line-height: 34px; text-align: left; width: 30%">密码：</label>
				<input name="pwd" id="pwd" class=" form-control"
					style="display: inline-block; width: 70%">
			</div>
			<div class="form-group col-md-12">
				<label class="col-md-4"
					style="display: inline-block; height: 34px; line-height: 34px; text-align: left; width: 30%">确认密码：</label>
				<input name="confirm"  id = "confirm" class=" form-control"
					style="display: inline-block; width: 70%">
			</div>
			<div class="form-group col-md-12">
				<label class="col-md-4"
					style="display: inline-block; height: 34px; line-height: 34px; text-align: left; width: 30%">邮箱：</label>
				<input name="email" class=" form-control" 
					style="display: inline-block; width: 70%">
			</div>
			<div class="form-group col-md-12">
				<label class="col-md-4"
					style="display: inline-block; height: 34px; line-height: 34px; text-align: left; width: 30%">性别：</label>
				<select name="sex" id="roleId" 
                    		class="form-control select2 easyui-combobox" style="width: 70%;height: 86%" editable="false">
                	<option value="0">男</option>
                	<option value="1">女</option>
                </select>
			</div>
			<div class="form-group col-md-12">
				<label class="col-md-4"
					style="display: inline-block; height: 34px; line-height: 34px; text-align: left; width: 30%">地址：</label>
				<input name="position" class=" form-control" 
					style="display: inline-block; width: 70%">
			</div>
			<div class="form-group col-md-12">
				<label class="col-md-4"
					style="display: inline-block; height: 34px; line-height: 34px; text-align: left; width: 30%">电话：</label>
				<input name="telphone" class=" form-control"
					style="display: inline-block; width: 70%">
			</div>
			<div class="form-group col-md-12">
				<label class="col-md-4"
					style="display: inline-block; height: 34px; line-height: 34px; text-align: left; width: 30%">备注：</label>
				<textarea name="remark" class=" form-control" rows="4"
					style="display: inline-block; width: 70%"></textarea>
			</div>
			
			<div class="form-group col-md-12">
				<label class="col-md-4"
					style="display: inline-block; text-align: left; width: 30%">备注：</label>
			</div>
			<div>
				<input type="submit"  value = "提交">
			</div>
			<input id="id" name="id" style="display: none;" />
		</form>
</body>
</html>