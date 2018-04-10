<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="${basePath }/css/bootstrap.min.css">
	<script src="${basePath }/js/jquery-3.1.1.min.js"></script>
	<script src="${basePath }/js/bootstrap.min.js"></script>
	<script src="${basePath }/js/jquery.validate.js"></script>
	<script src="${basePath }/js/jquery.metadata.js"></script>
<script type="text/javascript">
		$(function(){
			//在submit 按钮的onclick事件中添加验证   
			$("#smt").click(function(){
				$("#signinForm").validate(
						{rules:{
							confirm: {
							    required: true,
							    equalTo: "#pwd"
							   }
						}}
						); 
			});
		});
		
</script>
<style type="text/css">
	body {
		background: #ffecec !important;
	}
</style>
</head>
<body>

   <form class="form-horizontal" style="width:600px;margin:50px auto;"
		  id="signinForm" action="${basePath }/user/instVip" >
		  <input id="id" name="id" style="display: none;" />
		<fieldset>
			<legend>Register</legend>
		</fieldset>
	
		<div class="form-group">
			<label for="account" class="col-sm-4 control-label">nickname：</label>
			<div class="col-sm-5">
				<input type="text"  name="userName" class="form-control required" id="account" />
			</div>
		</div>
	
		<div class="form-group">
			<label for="userNo" class="col-sm-4 control-label">loginname：</label>
			<div class="col-sm-5">
				<input type="text" name="userNo" id="userNo" class="form-control required">
			</div>
		</div>
	
		<div class="form-group">
			<label for="pwd" class="col-sm-4 control-label">password：</label>
			<div class="col-sm-5">
				<input type="password" class="form-control required"  name="pwd" id="pwd" >
			</div>
			
		</div>
	
		<div class="form-group">
			<label for="confirm" class="col-sm-4 control-label">confirm your password：</label>
			<div class="col-sm-5">
				<input type="password" class="form-control required" name="confirm"  id = "confirm">
			</div>
		</div>
	
		<div class="form-group">
			<label for="email" class="col-sm-4 control-label">email：</label>
			<div class="col-sm-5">
				<input type="text" class="form-control required email" name="email" >
			</div>
			<div style="color:red">${msg}</div>
		</div>
	
		<div class="form-group">
			<label for="sex" class="col-sm-4 control-label">gender：</label>
			<div class="col-sm-5">
				 	<select name="sex" id="sex" 
	                    		class="form-control" >
	                	<option value="0">male</option>
	                	<option value="1">female</option>
	                </select>
			</div>
		</div>
	
		<div class="form-group">
			<label for="position" class="col-sm-4 control-label">address：</label>
			<div class="col-sm-5">
				<input type="text" class="form-control required" name="position" >
			</div>
		</div>
	
		<div class="form-group">
			<label for="telphone" class="col-sm-4 control-label">telphone：</label>
			<div class="col-sm-5">
				<input type="text" class="form-control" name="telphone">
			</div>
		</div>
	
		<div class="form-group">
			<label for="remark" class="col-sm-4 control-label">remark：</label>
			<div class="col-sm-5">
				<textarea rows="5" cols="30" name="remark"></textarea>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-4"></div>
			<div class="col-sm-5"><input type="submit" id="smt"  class="submit" value = "提交"></div>
		</div>
	</form>

</body>
</html>