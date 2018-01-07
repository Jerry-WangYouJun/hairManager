<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>图片管理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
   <jsp:include page="/common/common.jsp"></jsp:include>
  </head>
  <body id="mainpanel" >
 	<div id="tb" region="north" title="查询条件区" class="easyui-panel"  iconCls="icon-search"  style="padding:5px; height:60px; width: 80%;margin-bottom: 3px "  >
		<span>用户名:</span>
		<input id="search-imageNo" name="imageNo"/>
		<a  href="javascript:void(0)"
			class="easyui-linkbutton" plain="true" iconCls="icon-search"
			onclick="doSearch()">查询</a> 
	</div>
 	<div id="main_layout" data-options="region:'center',border:false,showHeader:false" style="width:80%;height:70%;">
 		<table id="data_table" class="easyui-datagrid" fit="true" ></table>
 	</div>
	<div data-options="region:'south',border:false,showHeader:false" style="width:900px;height:20%;">
 		 &nbsp;
 	</div>
    <script type="text/javascript">
    	$(function(){
			$('#data_table').datagrid({
				url:'${basePath}/image/image_query?type=1',
				pagination: true,
				fitColumns: true,
				singleSelect: true,
				columns:[[
					{field:'id', align : 'center',halign:'center',checkbox : true}, 
					{field:'iname',title:'图片名称',align:'center' , formatter:function(value,rowData,rowIndex){
						  return value.substring(16);
					}},
					{field:'ipath',title:'路径',align:'center'},
					{field:'img',title:'图片',align:'center' ,formatter:showImg},
				]],
				toolbar: [
				{
					text:'添加',
					iconCls: 'icon-add',
					handler: function(){addUser();}
				},'-',{
					text:'删除',
					iconCls: 'icon-remove',
					handler: function(){deleteUser();}
				}]
			});
	    	$('#data_table').datagrid('getPager').pagination({  
	            pageSize: 10,  
	            pageList: [ 5 ,10 , 30, 50],  
	            showRefresh:false ,
	            onSelectPage:function(pageNumber, pageSize){
	            		doSearch();
		        	}
	    });
	    	
	    	$("input:checkbox:not(input:checkbox[name])").click(function(){
	    			      $("input:checkbox").each(function(){
	    			    	   	     $(this).attr("checked","checked");
	    			      })
	    		});
	    	
	    	$('#dlg-frame').dialog( {
				title : '用户管理',
				width :  400,
				height : 300,
				top:50,
				left:100,
				closed : true,
				cache : false,
				modal : true,
				buttons : [ {
					text : '确定',
					iconCls : 'icon-ok',
					handler : function() {
						if (confirm("确定执行下一步操作？")) {
							frameContent.window.doServlet();
						}
					}
				}, {
					text : '关闭',
					iconCls : 'icon-cancel',
					handler : function() {
						$('#dlg-frame').dialog("close");
					}
				} ]
			});
	 });
    	//图片展示  
    	function showImg(value, row, index){  
    	        return '<img style="width:50px;length:50px" border="1" src="/upload/' + row.iname +'"/>';  
    	} 
	    	function doSearch(){
	    		var pageNo = $(".pagination-num").val(); 
			var pageSize = $(".pagination-page-list").val();
	    		var imageName = $("#search-imageNo").val();
		    $('#data_table').datagrid('reload',{
		    		imageName : imageName,pageNo:pageNo,pageSize:pageSize
			} );
		 }
	    	function addUser() {
	    		var path = "${basePath}/image/addInit";
	    		document.getElementById('frameContent').src = path;
	    		$('#dlg-frame').dialog('open');
	    	}

	    	function deleteUser() {
	    		var del = confirm("确认删除？");
	    		if (!del) {
	    			return false;
	    		}
	    		var id = getChecked();
	    		if (id > 0) {
	    			var url = "${basePath}/image/image_delete/" + id;
	    			$.ajax({
	    				url : url,
	    				type : 'delete',
	    				data : $("#dataForm").serialize(),
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
	    	
			function getChecked() {
				var id;
				var checkTotal = 0;
				$("input[type=checkbox]").each(function() {
					if (this.checked && $(this).val() != "on" ) {
						id = $(this).val();
						checkTotal++;
					}
				});
				if (checkTotal == 0) {
					$.messager.alert('提示', "请先选中一行(只允许单行操作)", 'error');
					return 0;
				} else if (checkTotal > 1) {
					$.messager.alert('提示', "只能选中一行(只允许单行操作)", 'error');
					return 0;
				}
				return id;
			}
    </script>
    
    <div id="dlg-frame">
			<iframe width="99%" height="98%" name="frameContent" id="frameContent"
				frameborder="0"></iframe>
	</div>
</body>
</html>
