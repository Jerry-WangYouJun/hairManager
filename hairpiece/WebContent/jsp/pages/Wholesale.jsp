<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:include page="/common/common.jsp"></jsp:include>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link href="${basePath}/jsp/pages/css/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/jsp/pages/css/xiangce.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${basePath}/jsp/pages/js/common.js"></script>
	<script src="${basePath}/jsp/pages/js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
	<script src="${basePath}/jsp/pages/js/xiangce.js" type="text/javascript"></script>
	<link rel="stylesheet" href="${basePath}/jsp/pages/css/css.css" type="text/css" />
	<script type=text/javascript src="${basePath}/jsp/pages/js/public.js"></script>
	<link rel="stylesheet" href="${basePath }/bootstrap/css/bootstrap.min.css">
	<script src="${basePath }/bootstrap/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	function msg() {
		var path = "${basePath}/msg/msgInit?role=2";
		document.getElementById('frameContent').src = path;
		$('#dlg-frame').dialog('open');
	}
	$(function(){
		$('#dlg-frame').dialog( {
			title : 'message board',
			width :  300,
			height : 500,
			top: 100,
			right: 100,
			closed : true,
			cache : false,
			modal : true
		});
	});
	function addCart(id) {
		var del = confirm("confirm？");
		if (!del) {
			return false;
		}
		if (id > 0) {
			var url = "${basePath}/cart/insert?productid" + id;
			$.ajax({
				url : url,
				type : 'post',
				dataType : 'json',
				success : function(data) {
					if (data.success) {
						$.messager.alert('提示', data.msg);
						doSearch();
					} else {
						$.messager.alert('提示', data.msg, "error");
					}

				},
				error : function(transport) {
					$.messager.alert('提示', "系统产生错误,请联系管理员!", "error");
				}
			});
		}
	}
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
									href="${basePath}/web/acceptable" target="_self">Wholesale</a>
							</dd>
							<dd>
								<a class="li_3_content_a"
									href="${basePath}/web/contact" target="_self">Order
									101</a>
							</dd>
							<dd>
								<a class="li_3_content_a"
									href="${basePath}/web/order" target="_self">Acceptable
									Payment </a>
							</dd>
							<dd>
								<a class="li_3_content_a"
									href="${basePath}/web/shipping" target="_self">Shipping&Delivery</a>
							</dd>
							<dd>
								<a class="li_3_content_a"
									href="${basePath}/web/Wholesale" target="_self">Contact
									Us</a>
							</dd>
						</dl></li>
					<li style="clear: both;"></li>
				</ul>
			</div>
			<div style="clear: both;"></div>
		</div>
	</div>


	<div id="content"  class="autoHeight">
		<div id="content_body">
			<div class="article_title">
				<h2 style="color:#000">Wholesale</h2>
			</div>
			<div class="article_body"><p>
	<img alt="" src="http://lihuiqiang1212.idc.505b.com/_uploadfile/image/20130907/20130907141870007000.jpg" /> 
</p>
<p>
	&nbsp;
</p>
<p>
	<span style="font-family:Verdana;color:#666666;font-size:13px;"><span style="color:#000000;font-size:14px;">Welcome to join the supply chain of Dream lace wig Group! </span><br />
</span> 
</p>
<p>
	<span style="font-family:Verdana;color:#666666;font-size:13px;"><span style="color:#000000;font-size:14px;">If you are looking into becoming a wholesaler， Dream lace wig is one of your best choices! As a reputable wholesale supplier, we can provide you with all the unique services you need. </span><br />
</span> 
</p>
<p>
	<span style="font-family:Verdana;color:#000000;font-size:14px;">We supply our hair products at true wholesale costs and   sell our product as represented</span> 
</p>
<p>
	<span style="font-family:Verdana;color:#000000;font-size:14px;">We offer timely shipments that you can rely on </span> 
</p>
<p>
	<span style="font-family:Verdana;color:#000000;font-size:14px;">We keep the largest amount of stock lace wigs and   weft hair in China for immediate shipping.&nbsp;</span> 
</p>
<p>
	<span style="font-family:Verdana;color:#000000;font-size:14px;">All our sales representative have more than 5 years working experiences on hair line and   are very professional to answer your questions and   give constructive advices. </span> 
</p>
<p>
	<span style="font-family:Verdana;color:#000000;font-size:14px;">Simply send email to </span><a href="mailto:sales@remyqueen.com"><span style="font-family:Verdana;color:#003399;font-size:14px;"><strong>sales@dreamlacewig.com</strong></span></a><span style="font-family:Verdana;color:#000000;font-size:14px;"> with your inquiry. A company representative will contact you by email or phone within 24 hours.</span> 
</p>
<p>
	<span style="background-color:#ffffff;color:#333333;font-size:14px;"></span><span>&nbsp;</span> 
</p>
<p>
	<br />
</p>
<p>
	&nbsp;
</p> </div>
		</div>
	</div>
<div id="bottom_wrap">
	<div id="bottom">
		<div style="width:1000px;height:100px;" class="fLeft">
			<p>
				<span class="bottom_a"><a  href="/?channel-36.html">About Us</a></span>
				&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;  <span class="bottom_a"><a  href="/?channel-37.html">Wholesale</a></span>
				&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;  <span class="bottom_a"><a  href="/?channel-38.html">Order 101</a></span>
				&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;  <span class="bottom_a"><a  href="/?channel-39.html">Acceptable Payment</a></span>
				&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;  <span class="bottom_a"><a  href="/?channel-40.html">Shipping&Delivery </a></span>
				&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;  <span class="bottom_a"><a  href="/?channel-41.html">Contact Us</a></span>
				<br/><br/>
				<font style=" font-size:14px; "> Copyright © 2007 DREAM LACE WIGS All Right Reserved<br/><br/>
					Phone:0086-532-67703178        Email:sales@dreamlacewig.com</font></p><br />
		</div>
	</div>
</div>
 <div id="dlg-frame">
			<iframe width="99%" height="98%" name="frameContent" id="frameContent"
				frameborder="0"></iframe>
	</div>
</body>
</html>