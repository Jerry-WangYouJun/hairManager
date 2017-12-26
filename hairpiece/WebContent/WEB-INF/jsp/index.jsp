<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>信息管理系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<jsp:include page="/common/common.jsp"></jsp:include>
	<script type="text/javascript">
		
		function loginOut(){
			$.ajax({
				url : "${basePath}/user/loginOut",
				type : 'post',
				success:function(data){
					window.location.href = "${basePath}/login.jsp" ;
				},
				error : function(transport) {
					$.messager.alert('提示', "系统产生错误,请联系管理员!", "error");
				}
			});
		}
		
		
		$(function(){
			var treeData = [{
				text:"基本信息管理",
				children:[{
					text:"用户管理",
					attributes:{
						url:"${basePath}/jsp/user/user_list.jsp"
					}
				},{
					text:"字典管理",
					attributes:{
						url:"${basePath}/jsp/user/dictionary_list.jsp"
					}
				},{
					text:"产品信息管理",
					attributes:{
						url:"${basePath}/init/status_list"
					}
				},{
					text:"基本信息修改",
					attributes:{
						url:"${basePath}/init/status_list"
					}
				}]
			},{
				text:"机场服务",	
				children:[{
					text:"机场巴士",
					attributes:{
						url:"${basePath}/init/bus_list"
					}
				},{
					text:"VIP乘客",
					attributes:{
						url:"${basePath}/init/passenger_list"
					}
				},{
					text:"机场酒店",
					attributes:{
						url:"${basePath}/init/hotel_list"
					}
				}]
			},{
				text:"系统设置",	
				children:[{
					text:"票价管理",
					attributes:{
						url:"${basePath}/init/price_list"
					}
				},{
					text:"航空公司信息",
					attributes:{
						url:"${basePath}/init/company_list"
					}
				},{
					text:"机场信息",
					attributes:{
						url:"${basePath}/init/airport_list"
					}
				},{
					text:"管理员设置",
					attributes:{
						url:"${basePath}/init/user_list"
					}
				}]
			}];
			
			$("#tree").tree({
				data:treeData,
				lines:true,
				onClick:function(node){
					if(node.attributes){
						openTab(node.text,node.attributes.url);
					}
				}
			});
			
			function openTab(text,url){
				if($("#tabs").tabs('exists',text)){
					$("#tabs").tabs('select',text);
					//$("#tabs").tabs('getSelected').panel('refresh',url);
					
					/* $("#tabs").tabs('update',{
						tab:$("#tabs").tabs('getSelected'),
						closable:true,
						options 
					}); */
				}else{
					var content="<iframe frameborder='0' scrolling='auto' style='width:100%;height:100%' src="+url+"></iframe>";
					$("#tabs").tabs('add',{
						id:text,
						title:text,
						closable:true,
						content:content
					});
				}
			}
		});
	</script>
  </head>
  
 <body class="easyui-layout">
	<div region="north" style="height:150px; background-color:#13A7D5;">
		<table width="100%">
			<tr>
				<td align="center" style="padding-top: 20px;"> 
					<font color="white" style="font-family: STHupo;font-size: 80px">后台管理系统</font>
				</td>
			</tr>
			<tr>
				<td align="right">
					<font color="white" size="2">当前用户： </font>
					<font color="red" size="4">${sessionScope.userName }</font>
					<a href="javascript:loginOut();" style="text-decoration: none;font-size: 12px; color:black;">
						<img alt="" src="${basePath}/images/login_out.png"> 退出
					</a>
					
					 &nbsp;&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
		</table>
	
	</div>
	
	<div region="west" style="width:200px;" title="导航菜单" split="true">
		<ul id="tree">
		
		</ul>
	</div>
	
	<div region="center" class="easyui-tabs" fit="true" border="false" id="tabs">
		<div title="首页" >
			<div align="center"  style="padding-top: 100px;"><font color="red" size="10">
					台管理系统</font>
		    </div>		
		</div>
	</div>
</body>
</html>
