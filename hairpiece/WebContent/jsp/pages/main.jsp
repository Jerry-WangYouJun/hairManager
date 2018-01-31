<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/common/common.jsp"></jsp:include>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${basePath}/jsp/pages/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${basePath}/jsp/pages/js/common.js"></script>
<link rel="stylesheet" href="${basePath}/jsp/pages/css/css.css" type="text/css" />
<script type=text/javascript src="${basePath}/jsp/pages/js/public.js"></script>
<link rel="stylesheet" href="${basePath }/bootstrap/css/bootstrap.min.css">
<script src="${basePath }/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function msg() {
		var path = "${basePath}/msg/msgInit?role=2";
		document.getElementById('frameContent').src = path;
		$('#dlg-frame').dialog('open');
	}
	$(function(){
		$('#dlg-frame').dialog( {
			title : '用户管理',
			width :  300,
			height : 500,
			top: 100,
			right: 100,
			closed : true,
			cache : false,
			modal : true
		});
	});
</script>
<style type="text/css">
#test{
    width:300px;
    height:200px;
    margin-top:100px;
    background-color:#09C;
}
#xianshi{
    width:100px;
    height:100px;
    position:fixed;
    bottom:200px;
    left:600px;
    background-color:#36C;
    display:none;
}
</style>
</head>
<body>
<div id="top_wrap">
		<div id="header">
			<div class="logo fLeft"></div>
			<div class="tel fright">
				<c:if test="${  empty  userbean}">
					<p>
					<span class="glyphicon glyphicon-user" style="color:white;font-size:20px;"></span>
						<a href="${basePath}/user/register">register</a> / <a
							href="${basePath}/user/signup">sign in</a>
					</p>
				</c:if>
				<c:if test="${ not empty userbean }">
					<p style="color:white">
						<span class="glyphicon glyphicon-user" style="font-size:20px;"></span>
						Welcome:&nbsp;${userbean }
					</p>
					<p>
						 <span class="glyphicon glyphicon-log-out" style="color:white;font-size:20px;"></span><a
							href="${basePath}/user/loginOut">&nbsp;sign out</a>
					</p><br/>
					<p>
						<span class="glyphicon glyphicon-text-background" style="color:white;font-size:20px;"></span>
					 <a href="#" onclick="msg()">message board</a>
					</p>

				</c:if>
			</div>
			<div id="top_space">
				<ul>
					<li><a class="current_navigation" href="${basePath}/web/index"
						style=""><img src="${basePath}/jsp/pages/images/121.png">HOME</a></li>
					<li><a class="li_1" href="${basePath}/web/main?type=Wigs"
						target="_self">Wigs</a>
						<dl class="li_3_content">
							<c:forEach items="${Wigs}" var="wig">
								<dd>
									<a class="li_3_content_a"
										href="${basePath}/web/main?subType=${wig}" target="_self">${wig}</a>
								</dd>
							</c:forEach>
						</dl></li>
					<li><a class="li_1"
						href="${basePath}/web/main?type=Hair extensions" target="_self">Hair
							extensions</a>
						<dl class="li_3_content">
							<c:forEach items="${extensions}" var="extension">
								<dd>
									<a class="li_3_content_a"
										href="${basePath}/web/main?subType=${extension}"
										target="_self">${extension}</a>
								</dd>
							</c:forEach>
						</dl></li>
					<li><a class="li_1" href="${basePath}/web/main?type=Eyelashs" target="_self">Eyelashs</a>
						<dl class="li_3_content">
							<c:forEach items="${Eyelashs}" var="Eyelash">
								<dd>
									<a class="li_3_content_a"
										href="${basePath}/web/main?subType=${Eyelash}" target="_self">${Eyelash}</a>
								</dd>
							</c:forEach>
						</dl></li>
					<li><a class="li_1" href="${basePath}/web/information" target="_self">Information</a>
						<dl class="li_3_content">
							<dd>
								<a class="li_3_content_a"
									href="${basePath}/web/about_us" target="_self">About
									Us</a>
							</dd>
							<dd>
								<a class="li_3_content_a"
									href="${basePath}/web/Wholesale" target="_self">Wholesale</a>
							</dd>
							<dd>
								<a class="li_3_content_a"
									href="${basePath}/web/order" target="_self">Order
									101</a>
							</dd>
							<dd>
								<a class="li_3_content_a"
									href="${basePath}/web/acceptable" target="_self">Acceptable
									Payment </a>
							</dd>
							<dd>
								<a class="li_3_content_a"
									href="${basePath}/web/shipping" target="_self">Shipping&Delivery</a>
							</dd>
							<dd>
								<a class="li_3_content_a"
									href="${basePath}/web/contact" target="_self">Contact
									Us</a>
							</dd>
						</dl></li>
					<li style="clear: both;"></li>
				</ul>
			</div>
			<div style="clear: both;"></div>
		</div>
	</div>
<div id="content" >
	<div id="content" class="autoHeight" style="margin:30px 0;">
		<div id="content_body_main">
			<div class="content_body_main_l">
				<ul>
					<li class="on"><a href="${basePath}/web/main?type=Wigs">Wigs</a></li>
					<li><a href="${basePath}/web/main?type=Hair extensions">Hair extensions</a></li>
					<li><a href="${basePath}/web/main?type=Hair pieces" >Hair pieces</a></li>
				</ul>
			</div>
			<div class="content_body_main_r">
				<ul class="picture_list">
					<!--循环开始-->
					<c:forEach items="${productList }" var = "pro">
						<li>
							<div class="picture_list_img_wrap">
								<a href="${basePath}/web/detail?id=${pro.id}" target="_self">
									<img src="/upload/${pro.imageList[0].iname }" />
								</a>
							</div>
							<p>
								<a style="" href="${basePath}/web/query?proName=${pro.proName}" target="_self" title="${pro.proName}">${pro.proName }
								</a>
							</p>
						</li>
					</c:forEach>
					<!--循环结束-->
				  </ul>
				<div class="clear"></div>
			</div>
          <!--   <div class="page_ct">
				<div class="page_turner"><a title="第1页" class="c">1</a>
					<a title="第2页" href="?channel-1.html=&page=2">2</a>
					<a title="第3页" href="?channel-1.html=&page=3">3</a>
					<a title="第4页" href="?channel-1.html=&page=4">4</a>
					<a title="第5页" href="?channel-1.html=&page=5">5</a>
					<a title="第6页" href="?channel-1.html=&page=6">6</a>
					<a title="第7页" href="?channel-1.html=&page=7">7</a>
					<a title="第8页" href="?channel-1.html=&page=8">8</a>
					<a title="末页" href="?channel-1.html=&page=8">...8</a>
					<a title="last" href="javascript:void(0)"><<</a><a title="next" href="?channel-1.html=&page=2">>></a>
					<span>18iteam/page&nbsp;total<label id="total">130</label>iteam</span>
				</div>
			</div> -->

			<div class="clear"></div>
		</div>
	</div>

	<div id="bottom_wrap">
		<div id="bottom">
			<div style="width:1000px;height:100px;" class="fLeft">

				<p>
					<span class="bottom_a"><a  href="${basePath}/web/about_us">About Us</a></span>
					&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;  <span class="bottom_a"><a  href="${basePath}/web/Wholesale">Wholesale</a></span>
					&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;  <span class="bottom_a"><a  href="${basePath}/web/order">Order 101</a></span>
					&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;  <span class="bottom_a"><a  href="${basePath}/web/acceptable">Acceptable Payment</a></span>
					&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;  <span class="bottom_a"><a  href="${basePath}/web/shipping">Shipping&Delivery </a></span>
					&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;        <span class="bottom_a"><a  href="${basePath}/web/contact">Contact Us</a></span>
					<br /><br />
					<font style=" font-size:14px; "> Copyright © 2007 DREAM LACE WIGS All Right Reserved<br /><br />
						Phone:0086-532-67703178        Email:sales@dreamlacewig.com</font></p><br />
			</div>

		</div>
</div>
 
</div>
 <div id="dlg-frame">
			<iframe width="99%" height="98%" name="frameContent" id="frameContent"
				frameborder="0"></iframe>
	</div>
</body>
</html>