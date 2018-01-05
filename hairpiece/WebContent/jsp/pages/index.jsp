<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/common/common.jsp"></jsp:include>
<title>Insert title here</title>
<link href="${basePath}/jsp/pages/css/style.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="${basePath}/jsp/pages/js/common.js"></script>
<link rel="stylesheet" href="${basePath}/jsp/pages/css/css.css"
	type="text/css" />
<script type=text/javascript src="${basePath}/jsp/pages/js/public.js"></script>
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
<body>
	<div id="top_wrap">
		<div id="header">
			<div class="logo fLeft"></div>
			<div class="tel fright">
				<c:if test="${  empty  userbean}">
					<p>
						<img src="${basePath}/jsp/pages/images/msg.png"> <a
							href="${basePath}/user/register">register</a> / <a
							href="${basePath}/user/signup">sign in</a>
					</p>
				</c:if>
				<c:if test="${ not empty userbean }">
					<p>
						<img src="${basePath}/jsp/pages/images/msg.png">Welcome:
						${userbean }
					</p>
					<p>
						<img src="${basePath}/jsp/pages/images/msg.png"> <a
							href="${basePath}/user/loginOut">sign out</a>
					</p>

					<p>
						<img src="${basePath}/jsp/pages/images/msg.png"> <a href="#"
							onclick="msg()">message</a>
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
					<li><a class="li_1" href="main.html" target="_self">Eyelashs</a>
						<dl class="li_3_content">
							<c:forEach items="${Eyelashs}" var="Eyelash">
								<dd>
									<a class="li_3_content_a"
										href="${basePath}/web/main?subType=${Eyelash}" target="_self">${Eyelash}</a>
								</dd>
							</c:forEach>
						</dl></li>
					<li><a class="li_1" href="Information.html" target="_self">Information</a>
						<dl class="li_3_content">
							<dd>
								<a class="li_3_content_a"
									href="${basePath}/jsp/pages/about_us.html" target="_self">About
									Us</a>
							</dd>
							<dd>
								<a class="li_3_content_a"
									href="${basePath}/jsp/pages/Wholesale.html" target="_self">Wholesale</a>
							</dd>
							<dd>
								<a class="li_3_content_a"
									href="${basePath}/jsp/pages/Order101.html" target="_self">Order
									101</a>
							</dd>
							<dd>
								<a class="li_3_content_a"
									href="${basePath}/jsp/pages/Acceptable.html" target="_self">Acceptable
									Payment </a>
							</dd>
							<dd>
								<a class="li_3_content_a"
									href="${basePath}/jsp/pages/Shipping.html" target="_self">Shipping&Delivery</a>
							</dd>
							<dd>
								<a class="li_3_content_a"
									href="${basePath}/jsp/pages/Contact_us.html" target="_self">Contact
									Us</a>
							</dd>
						</dl></li>
					<li style="clear: both;"></li>
				</ul>
			</div>
			<div style="clear: both;"></div>
		</div>
	</div>
	<div id="content">

		<script type="text/javascript">
			$(document).ready(function() {
				$(".area").hover(function() {
					$(this).find(".qq").show(100);
				}, function() {
					$(this).find(".qq").hide(100);
				});
			});
		</script>

		<div class="area">
			<a id=prev class="prevBtn qq" href="javascript:void(0)"></a> <a
				id=next class="nextBtn qq" href="javascript:void(0)"></a>
			<div id=js class="js">
				<div class="box01">
					<img onClick="location.href=''" alt="dream lace wig"
						src="${basePath}/jsp/pages/images_banner/01.jpg"> <img
						onClick="location.href=''" alt="products of dream lace wig"
						style="DISPLAY: none"
						src="${basePath}/jsp/pages/images_banner/02.jpg">
				</div>
				<!--<div class="bg"></div>-->
				<div id=jsNav class=jsNav>
					<a class="trigger imgSelected" href="javascript:void(0)">1</a> <a
						class="trigger" href="javascript:void(0)">2</a>
				</div>
			</div>
		</div>

	</div>

	<div style="margin-top: 20px;">
		<div class="three">
			<ul>
				<li><img src="${basePath}/jsp/pages/images/chanpin.png">
					<p>产品介绍</p></li>
				<li><img src="${basePath}/jsp/pages/images/chanpin.png">
					<p>产品介绍</p></li>
				<li><img src="${basePath}/jsp/pages/images/chanpin.png">
					<p>产品介绍</p></li>
			</ul>
		</div>
		<div id="content_body">
			<ul class="picture_list">
				<!--循环开始-->
				<c:forEach items="${productList }" var="pro">
					<li>
						<div class="picture_list_img_wrap">
							<a href="${basePath}/web/query?subType=${pro.subType}"
								target="_self"> <img
								src="${basePath}/jsp/pages/images/hear.jpg"
								title="${pro.proName }" alt="${pro.proName }" />
							</a>
						</div>
						<p>
							<a style="" href="${basePath}/web/query?proName=${pro.proName}"
								target="_self" title="${pro.proName}">${pro.proName } </a>
						</p>
					</li>
				</c:forEach>
				<!--循环结束-->
			</ul>
			<div class="clear"></div>
		</div>
		<!-- <div id="bottom_wrap">
			<div id="bottom">
				<div style="width: 1000px; height: 100px;" class="fLeft">
					<p>
						<span class="bottom_a"><a href="/?channel-36.html">About
								Us</a></span> &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; <span class="bottom_a"><a
							href="/?channel-37.html">Wholesale</a></span>
						&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; <span class="bottom_a"><a
							href="/?channel-38.html">Order 101</a></span>
						&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; <span class="bottom_a"><a
							href="/?channel-39.html">Acceptable Payment</a></span>
						&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; <span class="bottom_a"><a
							href="/?channel-40.html">Shipping&Delivery </a></span>
						&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; <span class="bottom_a"><a
							href="/?channel-41.html">Contact Us</a></span> <br />
						<br /> <font style="font-size: 14px;"> Copyright © 2007
							DREAM LACE WIGS All Right Reserved<br />
						<br /> Phone:0086-532-67703178 Email:sales@dreamlacewig.com
						</font>
					</p>
					<br />
				</div>
			</div>
		</div> -->
	</div>
	 <div id="dlg-frame">
			<iframe width="99%" height="98%" name="frameContent" id="frameContent"
				frameborder="0"></iframe>
	</div>
</body>
</html>