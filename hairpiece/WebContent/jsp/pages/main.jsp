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
		<%@include file="header.jsp" %>
</div>
<div id="content" >
	<div id="content" class="autoHeight" style="margin:30px 0;">
		<div id="content_body_main">
			<div class="content_body_main_l">
				<ul>
					<li class="on"><a href="${basePath}/web/main?type=Wigs">Wigs</a></li>
					<li><a href="${basePath}/web/main?type=Hair Extensions">Hair Extensions</a></li>
					<li><a href="${basePath}/web/main?type=Hair Wefts" >Hair Wefts</a></li>
					<li><a href="${basePath}/web/main?type=Eyelashs" >Eyelashs</a></li>
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
		<%@include file="footer.jsp" %>
	</div>
 
</div>
 <div id="dlg-frame">
			<iframe width="99%" height="98%" name="frameContent" id="frameContent"
				frameborder="0"></iframe>
	</div>
</body>
</html>