<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/common/common.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="${basePath}/css/style.css">
  <link rel="stylesheet" href="${basePath }/css/bootstrap.min.css">
	<script src="${basePath }/js/jquery-3.1.1.min.js"></script>
	<script src="${basePath }/js/bootstrap.min.js"></script>
	<script src="${basePath }/js/jquery.validate.js"></script>
	<script src="${basePath }/js/jquery.metadata.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
		$(function(){
			//在submit 按钮的onclick事件中添加验证   
			$("#smt").click(function(){
				$("#signinForm").validate(); 
			});
		});
		
</script>
</head>
<body>
    <div class="wrapper">
    <form id="signinForm" class="form-signin" action="${basePath}/user/signin">       
      <h2 class="form-signin-heading">登 录</h2>
      <input type="text" class="form-control required" name="userNo" placeholder="账号" class="required" autofocus="" />
      <input type="password" class="form-control required" name="pwd" placeholder="密码" class="required"/>
      <button id="smt" class="btn btn-lg btn-primary btn-block btn-pink" type="submit">登录</button>
    </form>
  </div>
</body>
</html>