<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/common.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="multipart/form-data;  charset=UTF-8">
<script type="text/javascript" src="${basePath}/js/jquery.form.js"></script>
<title>产品添加页面</title>
<style type="text/css">
table {
	font-size: 16px;
}

textarea {
	font-size: 16px;
}
</style>
<script type="text/javascript">
	function doServlet() { 
			$("#proForm").ajaxSubmit({
				url : "${basePath}/pro/instVipAjax",
				type : 'post',
				dataType : 'json',
				//contentType :'multipart/form-data',
				success : function(data) {
					parent.$.messager.alert('提示', data.msg);
					if (data.success == true) {
						parent.doSearch();
						parent.$('#dlg-frame').dialog("close");
					}
				},
				error : function(transport) {
					$.messager.alert('提示', "系统产生错误,请联系管理员!", "error");
				}
			});
	}
	function checkInfo() {
		return true;
	}

	function checkUnique() {
		var subType = $("#subType").val();
		if (subType == "") {
			return false;
		}
		$.ajax({
			url : "${basePath}/pro/checkUnique",
			type : 'post',
			data : {
				"subType" : subType
			},
			dataType : 'json',
			success : function(data) {
				if(data.success != true){
			   	   $.messager.alert('提示', data.msg , "error");
			   	$("#subType").val("");
				}
			},
			error : function(transport) {
				$.messager.alert('提示', "系统产生错误,请联系管理员!", "error");
			}
		});
	}
	
	
	$(function(){
		if("${pro.type}" != ""){
			   $("#type").val("${pro.type}")
					addItems("${pro.type}");
		 }
		if("${pro.subType}" != ""){
				 $("#subType").val("${pro.subType}");
	  	}
		  if("${pro.remark}" != ""){
			   $("#remark").val("${pro.remark}")
		  }
	})
	
	
	//动态绑定下拉框项  
        function addItems(opt) {  
            $.ajax({  
                url: "${basePath}/pro/getSubType?type=" + opt,    //后台webservice里的方法名称  
                type: "post",  
                dataType: "json",  
                contentType: "application/json",  
                traditional: true,  
                success: function (data) {  
                	  console.info(data.list);
                        var jsonObj =data.list;  
                        var optionstring = "";  
                        for (var j = 0; j < jsonObj.length; j++) {
                        	if("${pro.subType}" != "" && "${pro.subType}" ==  jsonObj[j].name){
                        		optionstring += "<option selected='selected' value=\"" + jsonObj[j].name + "\" >" + jsonObj[j].name  + "</option>";  
               	  			}else{
                           	   optionstring += "<option value=\"" + jsonObj[j].name + "\" >" + jsonObj[j].name  + "</option>";  
               	  			}
                        }  
                        $("#subType").html("<option value='请选择'>请选择...</option> "+optionstring);  
                },  
                error: function (msg) {  
                    alert("出错了！");  
                }  
            });            
        }; 
</script>
</head>
<body>

	<form id="proForm" action="${basePath }/pro/instVipAjax" method="post" enctype="multipart/form-data">
		<input type="hidden" name="id" id="id" value="${pro.id }" />
		<table width="100%">
			<tr>
				<td>大类：</td>
				<td style="padding: 20px">
					  <select name = "type" id="type" onchange="addItems(this.value)">
						  <option >-请选择-</option>
					      <option value="Wigs">Wigs</option>
					      <option value="Hair extensions">Hair extensions</option>
					      <option value="Hair pieces">Hair pieces</option>
					      <option value="Eyelashs">Eyelashs</option>
					  </select>
				<td>小类：</td>
				<td style="padding: 20px">
							<select name = "subType" id="subType" >
									<option >-请选择-</option>
							</select>
				</td>
			</tr>
			<tr>
				<td>hairType：</td>
				<td style="padding: 20px"> <input name="hairType" id="hairType"  value="${pro.hairType }" ></td>
				<td>permed：</td>
				<td style="padding: 20px"><select name="permed" id="permed" >
						<option value="1">YES</option>
						<option value="2">NO</option>
				</select></td>
			</tr>
			<tr>
				<td>grade：</td>
				<td style="padding: 20px"><input name="grade" id="grade" value="${pro.grade }" ></td>
				<td>texture：</td>
				<td style="padding: 20px"><input name="texture" value="${pro.texture }" ></td>
			</tr>
			<tr>
				<td>unit(g/pc)：</td>
				<td style="padding: 20px"><input  name="unit" id="unit"  value="${pro.unit }" ></td>
				<td>items：</td>
				<td style="padding: 20px"><input name="items" value="${pro.items }" ></td>
			</tr>
			<tr>
				<td>hairLen：</td>
				<td style="padding: 20px"><input name="hairLen" value="${pro.hairLen }" ></td>
				<td>hairColor：</td>
				<td style="padding: 20px"><input name="hairColor" value="${pro.hairColor }" ></td>
			</tr>
			<tr>
				<td>图片</td>
				<td><input type="file"  name="upfile" id="upfile"></td>
				<td>备注：</td>
				<td style="padding: 20px"><textarea name="remark" id="remark"  rows="4"></textarea></td>
			</tr>
			<tr>
				 <td><input type="submit" value = "提交表单"></td>
			</tr>
		</table>
	</form>
	
	
</body>
</html>