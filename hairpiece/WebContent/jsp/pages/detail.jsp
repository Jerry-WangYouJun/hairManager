<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:include page="/common/common.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	<link href="css/xiangce.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="js/common.js"></script>
	<script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
	<script src="js/xiangce.js" type="text/javascript"></script>
	<link rel="stylesheet" href="css/css.css" type="text/css" />
	<script type=text/javascript src="js/public.js"></script>
<title>Insert title here</title>
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


	<div id="content" class="autoHeight">
		<div id="content_body">
            <div id="left"  style="overflow:hidden;"><div class="bodymodal"> </div>
				<div class="firsttop">
					<div class="firsttop_right">
						<div class="close2"> <a class="closebtn1" title="关闭" href="javascript:void(0)"></a> </div>
						<div class="replay">
							<h2 id="div-end-h2"> 已到第一张图片了。 </h2>
						</div>
					</div>
				</div>
				<!--图片结束出现的-->
				<div class="endtop">
					<div class="firsttop_right">
						<div class="close2"> <a class="closebtn2" title="关闭" href="javascript:void(0)"></a> </div>
						<div class="replay">
							<h2 id="H1"> 已到最后一张图片了。 </h2>
						</div>
					</div>
				</div>
				<!--轮播过程-->
				<div class="detail_context_pic">
					<div class="detail_context_pic_top"> <a href="#"><img src="" alt="" id="pic1" curindex="0" /></a> <a id="preArrow" href="javascript:void(0)" class="contextDiv" title="上一张"><span id="preArrow_A"></span></a> <a id="nextArrow" href="javascript:void(0)" class="contextDiv" title="上一张"><span id="nextArrow_A"></span></a>
						<div id="miaoshuwarp">
							<div class="miaoshu"> </div>
						</div>
					</div>
					<!--图片轮播-->
					<div class="detail_context_pic_bot">
						<div class="detail_picbot_left"> <a href="javascript:void(0)" id="preArrow_B"><img src="images/left1.jpg" alt="上一个" /></a> </div>
						<div class="detail_picbot_mid">
							<ul>
								<li> <a href='javascript:void(0);'> <img src='images/meifa (1).jpg' width='90px'  title='' alt='' bigimg='images/meifa (1).jpg' /> </a> </li>
								<li> <a href='javascript:void(0);'> <img src='images/meifa (2).jpg' width='90px'  title='' alt='' bigimg='images/meifa (2).jpg' /> </a> </li>
								<li> <a href='javascript:void(0);'> <img src='images/meifa (3).jpg' width='90px'  title='' alt='' bigimg='images/meifa (3).jpg' /> </a> </li>
								<li> <a href='javascript:void(0);'> <img src='images/meifa (4).jpg' width='90px'  title='' alt='' bigimg='images/meifa (4).jpg' /> </a> </li>
								<li> <a href='javascript:void(0);'> <img src='images/meifa (5).jpg' width='90px'  title='' alt='' bigimg='images/meifa (5).jpg' /> </a> </li>
								<li> <a href='javascript:void(0);'> <img src='images/meifa (6).jpg' width='90px'  title='' alt='' bigimg='images/meifa (6).jpg' /> </a> </li>
							</ul>
						</div>
						<div class="detail_picbot_right"> <a href="javascript:void(0)" id="nextArrow_B"><img src="images/right1.jpg" alt="下一个" /></a> </div>
					</div>
				</div>
            </div> 
			<div id="right">
						<h1 id="info_name" style="">DE-001</h1>
						<div id="info_intro"></div>
						
						<div id="info_content"><p>
	<span style="color:#666666;font-size:13px;">Length:8mm-1<span style="font-size:13px;">4</span>mm</span>
</p>
<p>
	<span style="color:#666666;font-size:13px;"><span style="color:#666666;"><span style="color:#663333;font-size:16px;"><span style="color:#666666;"><span style="color:#663333;font-size:16px;"><span style="color:#666666;font-size:13px;"><span style="color:#666666;font-size:13px;"><span style="color:#666666;font-size:13px;"><span style="color:#666666;font-size:13px;">----------------------------------------------</span></span><span style="color:#666666;font-size:13px;"><span style="color:#666666;font-size:13px;">----------------------------------------------</span></span><span style="color:#666666;font-size:13px;"><span style="color:#666666;font-size:13px;">---------------------------------------</span></span></span></span></span></span></span></span><br />
</span> 
</p>
<p class="p_top">
	<span style="color:#666666;font-size:13px;">Thickness:0.1mm,0.15mm,0.20mm,0.25m</span>
</p>
<p class="p_top">
	<span style="color:#666666;font-size:13px;"><span style="color:#666666;"><span style="color:#663333;font-size:16px;"><span style="color:#666666;"><span style="color:#663333;font-size:16px;"><span style="color:#666666;font-size:13px;"><span style="color:#666666;font-size:13px;"><span style="color:#666666;font-size:13px;"><span style="color:#666666;font-size:13px;">----------------------------------------------</span></span><span style="color:#666666;font-size:13px;"><span style="color:#666666;font-size:13px;">----------------------------------------------</span></span><span style="color:#666666;font-size:13px;"><span style="color:#666666;font-size:13px;">---------------------------------------</span></span></span></span></span></span></span></span><br />
</span> 
</p>
<p class="p_top">
	<span style="color:#666666;"><span style="font-size:13px;">Specification: All eyelashes are 100% Handmade</span></span>
</p>
<p class="p_top">
	<span style="color:#666666;"><span style="font-size:13px;"><span style="color:#666666;"><span style="color:#663333;font-size:16px;"><span style="color:#666666;"><span style="color:#663333;font-size:16px;"><span style="color:#666666;font-size:13px;"><span style="color:#666666;font-size:13px;"><span style="color:#666666;font-size:13px;"><span style="color:#666666;font-size:13px;">----------------------------------------------</span></span><span style="color:#666666;font-size:13px;"><span style="color:#666666;font-size:13px;">----------------------------------------------</span></span><span style="color:#666666;font-size:13px;"><span style="color:#666666;font-size:13px;">---------------------------------------</span></span></span></span></span></span></span></span><br />
</span></span> 
</p>
<p class="p_top">
	<span style="color:#666666;"><span style="font-size:13px;">Material:100% Real bird's feathe</span></span>
</p>
<p class="p_top">
	<span style="color:#666666;"><span style="font-size:13px;"><span style="color:#666666;"><span style="color:#663333;font-size:16px;"><span style="color:#666666;"><span style="color:#663333;font-size:16px;"><span style="color:#666666;font-size:13px;"><span style="color:#666666;font-size:13px;"><span style="color:#666666;font-size:13px;"><span style="color:#666666;font-size:13px;">----------------------------------------------</span></span><span style="color:#666666;font-size:13px;"><span style="color:#666666;font-size:13px;">----------------------------------------------</span></span><span style="color:#666666;font-size:13px;"><span style="color:#666666;font-size:13px;">---------------------------------------</span></span></span></span></span></span></span></span><br />
</span></span> 
</p></div>
		<br/><br/><br/><br/>
                       <img src="images/detail.png" width="316" height="67" />
              <div id="info_comment">Looking into becoming our wholesalers and distributors, <br />
              please email to <a href="mailto:sales@dreamlacewig.com"   style="text-decoration:underline; color:#000">sales@dreamlacewig.com</a>.<br />
              A company representative will contact you by email or phone within 24</div>
			</div>
			<div style="clear: both"></div>
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