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
		<%@include file="header.jsp" %>
	</div>


	<div id="content"  class="autoHeight">
		<div id="content_body">
			<div class="article_title">
				<h2 style="color:#000">Wholesale</h2>
			</div>
			 <div >${fn:replace(info.wholesale,vEnter,"<br>")}</div>
		</div>
	</div>
<div id="bottom_wrap">
	<%@include file="footer.jsp" %>
</div>
 <div id="dlg-frame">
			<iframe width="99%" height="98%" name="frameContent" id="frameContent"
				frameborder="0"></iframe>
	</div>
</body>
</html>