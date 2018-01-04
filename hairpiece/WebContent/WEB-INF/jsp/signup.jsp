<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/common/common.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel='stylesheet prefetch' href='${basePath}/css/bootstrap.min.css'>
  <link rel="stylesheet" href="${basePath}/css/style.css">
<title>Insert title here</title>
</head>
<body>
    <div class="wrapper">
    <form class="form-signin">       
      <h2 class="form-signin-heading">登 录</h2>
      <input type="text" class="form-control" name="username" placeholder="账号" required="" autofocus="" />
      <input type="password" class="form-control" name="password" placeholder="密码" required=""/>
      <label class="checkbox">
        <input type="checkbox" value="remember-me" id="rememberMe" name="rememberMe"> 记住密码
      </label>
      <button class="btn btn-lg btn-primary btn-block btn-pink" type="submit">登录</button>
    </form>
  </div>
</body>
</html>