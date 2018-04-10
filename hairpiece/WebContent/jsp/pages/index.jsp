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
<link rel="stylesheet" href="${basePath }/bootstrap/css/bootstrap.min.css">
	<script src="${basePath }/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${basePath}/jsp/pages/js/header.js">
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
		<%@include file="header.jsp" %>
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
			<a id=prev class="prevBtn qq" href="javascript:void(0)"></a> 
			<a id=next class="nextBtn qq" href="javascript:void(0)"></a>
			<div id=js class="js">
				<div class="box01">
					<c:forEach items="${carouselList }" var = "carousel"  varStatus="sta">
						<c:choose>
							 <c:when test="${sta.index eq 0 }">
									 <img src="/upload/${carousel.iname}" alt="${carousel.iname }" width="800px" >
							 </c:when>
							 <c:otherwise>
							  		<img src="/upload/${carousel.iname}" alt="${carousel.iname }" width="800px" style="DISPLAY: none" >
							 </c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
				<!--<div class="bg"></div>-->
				<div id=jsNav class=jsNav>
						<c:forEach items="${carouselList }" var = "carousel"  varStatus="sta">
							<c:choose>
								 <c:when test="${sta.index eq 0 }">
										 <a class="trigger imgSelected" href="javascript:void(0)">${sta.count }</a>
								 </c:when>
								 <c:otherwise>
								  		 <a class="trigger" href="javascript:void(0)">${sta.count }</a>
								 </c:otherwise>
							</c:choose>
						</c:forEach>
				</div>
			</div>
		</div>

	</div>

	<div style="margin-top: 20px;">
		<div class="three">
			<ul>
			<c:forEach items="${carouselList }" var = "carousel">
				 <li><img src="/upload/${carousel.iname}" style="width:300px;height: 180px;">
					<p>产品介绍</p></li>
			</c:forEach>
			</ul>
		</div>
		<div id="content_body">
			<ul class="picture_list">
				<!--循环开始-->
				<c:forEach items="${hotsaleList }" var="pro">
				
					<li>
						<div class="picture_list_img_wrap">
							<a href="${basePath}/web/detail?id=${pro.id}"
								target="_self"> <img
								src="/upload/${pro.imageList[0].iname}"
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
						<span class="bottom_a"><a href="${basePath}/web/about_us">About
								Us</a></span> &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; <span class="bottom_a"><a
							href="/?channel-37.html">Wholesale</a></span>
						&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; <span class="bottom_a"><a
							href="${basePath}/web/order">Order 101</a></span>
						&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; <span class="bottom_a"><a
							href="${basePath}/web/acceptable">Acceptable Payment</a></span>
						&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; <span class="bottom_a"><a
							href="${basePath}/web/shipping">Shipping&Delivery </a></span>
						&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; <span class="bottom_a"><a
							href="${basePath}/web/contact">Contact Us</a></span> <br />
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