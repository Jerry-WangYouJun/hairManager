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


	<div id="content"  class="autoHeight">
		<div id="content_body">
			<div class="article_title">
				<h2 style="color:#000">Acceptable Payment </h2>
			</div>
			<div class="article_body"><div class="about">
	<p class="table_head">
		<span style="color:#000000;font-size:14px;">1)Paypal</span> 
	</p>
	<p>
		<span style="color:#000000;font-size:14px;">Paypal email：</span><a href="mailto:sales@remyqueen.com"><span style="color:#000000;font-size:14px;">sales@dreamlacewig.com</span></a><br />
<span style="color:#000000;font-size:14px;">There is an extra 4% paypal fee if you choose to pay by paypal.</span> 
	</p>
	<p>
		<span style="color:#000000;font-size:14px;">&nbsp;</span> 
	</p>
	<p class="table_head">
		<span style="color:#000000;font-size:14px;">2)Western Union</span> 
	</p>
	<p>
		<span style="color:#000000;font-size:14px;">Our Western union&nbsp;&nbsp; Information:</span><br />
<span style="color:#000000;font-size:14px;">First Name：JINFENG</span><br />
<span style="color:#000000;font-size:14px;">Last Name：LIU</span><br />
<span style="color:#000000;font-size:14px;">City：QINGDAO</span><br />
<span style="color:#000000;font-size:14px;">State：SHANDONG</span><br />
<span style="color:#000000;font-size:14px;">Country：CHINA</span><br />
<span style="color:#000000;font-size:14px;">Tel：0086-532-67703178</span> 
	</p>
	<p>
		<span style="color:#000000;font-size:14px;">&nbsp;</span> 
	</p>
	<p class="table_head">
		<span style="color:#000000;font-size:14px;">3) MoneyGram</span> 
	</p>
	<p>
		<span style="color:#000000;font-size:14px;">Moneygram Information:</span><br />
<span style="color:#000000;font-size:14px;">First Name：JUNYAN</span><br />
<span style="color:#000000;font-size:14px;">Last Name：LI</span><br />
<span style="color:#000000;font-size:14px;">City：Qingdao</span><br />
<span style="color:#000000;font-size:14px;">State：Shandong</span><br />
<span style="color:#000000;font-size:14px;">Country：CHINA</span><br />
<span style="color:#000000;font-size:14px;">Tel：0086-532-67703178</span> 
	</p>
	<p>
		&nbsp;
	</p>
	<p>
		<span style="color:#000000;font-size:14px;">4)Bank Wires (TT)　</span> 
	</p>
	<p>
		<span style="color:#000000;font-size:14px;"> </span> 
	</p>
	<div>
		<span style="font-size:14px;color:#000000;">BANK&nbsp;OF&nbsp;CHINA&nbsp;&nbsp;JUANCHENG&nbsp;&nbsp;&nbsp;SUB-BRANCH&nbsp;(SWIFT</span><br />
<span style="font-size:14px;color:#000000;"> NO:BKCHCNBJ500)</span><br />
<span style="font-size:14px;color:#000000;"> BANK’S&nbsp;ADDRESS:N09&nbsp;RENMIN&nbsp;ROAD&nbsp;SHANDONG/JUANCHENG</span><br />
<span style="font-size:14px;color:#000000;"> BENEFICIARY’S&nbsp;NAME:&nbsp;Heze&nbsp;Yuxing&nbsp;Hair&nbsp;Products&nbsp;Co.,Ltd</span><br />
<span style="font-size:14px;color:#000000;"> BENEFICIARY’S&nbsp;A/C&nbsp;NO:220826915934</span><br />
<br />
<span style="font-size:14px;color:#000000;"> BENEFICIARY’S&nbsp;ADDRESS:&nbsp;（2nd&nbsp;Human&nbsp;Hair&nbsp;Industrial&nbsp;Park）Changcheng&nbsp;Street&nbsp;South,Fenghuanglu&nbsp;Beiduan&nbsp;Road&nbsp;East&nbsp;Juancheng,Heze,Shandong&nbsp;Province</span><br />
<span style="font-size:14px;color:#000000;"> Postal&nbsp;code:274600</span><br />
<span style="font-size:14px;color:#000000;"> Office&nbsp;phone:0530-2958222</span><br />
	</div>
<span style="color:#000000;font-size:14px;"></span> 
	<p>
		<br />
	</p>
</div> </div>
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