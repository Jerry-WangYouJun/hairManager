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
		var subType = $("#subType").val();
		if (subType == "-请选择-") {
			parent.$.messager.alert('提示', "请选择具体的产品类型");
			return false;
		}
			$("#proForm").ajaxSubmit({
				url : "${basePath}/pro/instVipAjax",
				type : 'post',
				dataType : 'json',
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
			  $("#permed").val("${pro.permed}")
			  $("#hotsale").val("${pro.hotsale}")
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
                        var jsonObj =data.list;  
                        var optionstring = "";  
                        for (var j = 0; j < jsonObj.length; j++) {
                        	if("${pro.subType}" != "" && "${pro.subType}" ==  jsonObj[j].name){
                        		optionstring += "<option selected='selected' value=\"" + jsonObj[j].id + "\" >" + jsonObj[j].name  + "</option>";  
               	  			}else{
                           	   optionstring += "<option value=\"" + jsonObj[j].id + "\" >" + jsonObj[j].name  + "</option>";  
               	  			}
                        }  
                        $("#subType").html("<option value=''>请选择...</option> "+optionstring);  
                },  
                error: function (msg) {  
                    alert("出错了！");  
                }  
            });            
        };
        
        function addColumn(){
      	  var str = $("<tr><td>图片</td><td><input type='file' name='upfile'/></td></tr>");  
      	  $("#tb").append(str); //将动态创建的str元素追加到ul下面  
        }
</script>
</head>
<body>

	<form id="proForm" action="${basePath }/pro/instVipAjax" method="post" enctype="multipart/form-data">
		<input type="hidden" name="id" id="id" value="${pro.id }" />
		<table width="100%" id = "tb">
			<tr>
				<td>product：</td>
				<td style="padding: 20px"> <input name="proName" id="proName"  value="${pro.proName }" ></td>
				<td>hairType：</td>
				<td style="padding: 20px"> <input name="hairType" id="hairType"  value="${pro.hairType }" ></td>
			</tr>
			<tr>
				<td>大类：</td>
				<td style="padding: 20px">
					  <select name = "type" id="type" onchange="addItems(this.value)">
						  <option >-请选择-</option>
					      <option value="Human Hair Wigs">Human Hair Wigs</option>
					      <option value="Hair Extensions">Hair Extensions</option>
					      <option value="Hair Wefts">Hair Wefts</option>
					      <option value="Eyelashs">Eyelashs</option>
					  </select>
			     </td>
				<td>小类：</td>
				<td style="padding: 20px">
							<select name = "dicId" id="subType" >
									<option >-请选择-</option>
							</select>
				</td>
			</tr>
			<tr>
				<td>permed：</td>
				<td style="padding: 20px"><select name="permed" id="permed" >
						<option value="1">YES</option>
						<option value="2">NO</option>
				</select></td>
				<td>grade：</td>
				<td style="padding: 20px"><input name="grade" id="grade" value="${pro.grade }" ></td>
			</tr>
			<tr>
				<td>texture：</td>
				<td style="padding: 20px"><input name="texture" value="${pro.texture }" ></td>
				<td>unit：</td>
				<td style="padding: 20px"><input  name="unit" id="unit"  value="${pro.unit }" ></td>
			</tr>
			<tr>
				<td>items：</td>
				<td style="padding: 20px"><input name="items" value="${pro.items }" ></td>
				<td>hair length：</td>
				<td style="padding: 20px"><input name="hairLen" value="${pro.hairLen }" ></td>
			</tr>
			<tr>
				<td>hairColor：</td>
				<td style="padding: 20px"><input name="hairColor" value="${pro.hairColor }" ></td>
				<td>hotsale：</td>
				<td style="padding: 20px"><select name="hotsale" id="hotsale" >
						<option value="1">YES</option>
						<option value="2">NO</option>
				</select></td>
			</tr>
			<tr>
				<td colspan="4"><span style="color: red;">备用字段需要填入“**:**”的形式如 ： 密度:100 </span></td>
			</tr>
			<tr>
				<td>备用字段1：</td>
				<td style="padding: 20px"><input name="column1" value="${pro.column1 }" ></td>
				<td>备用字段2：</td>
				<td style="padding: 20px"><input name="column2" value="${pro.column2 }" ></td>
			</tr>
			<tr>
				<td>备用字段3：</td>
				<td style="padding: 20px"><input name="column3" value="${pro.column3 }" ></td>
				<td>备用字段4：</td>
				<td style="padding: 20px"><input name="column4" value="${pro.column4 }" ></td>
			</tr>
			<tr>
				<td>备用字段5：</td>
				<td style="padding: 20px"><input name="column5" value="${pro.column5 }" ></td>
				<td>备用字段6：</td>
				<td style="padding: 20px"><input name="column6" value="${pro.column6 }" ></td>
			</tr>
			<tr>
				<td>备注：</td>
				<td style="padding: 20px"><textarea name="remark" id="remark"  rows="4"></textarea></td>
			</tr>
			<tr>
				<td>图片</td>
				<td><input type="file"  name="upfile" id="upfile"></td>
				<td><input type="button" value="添加图片" onclick="addColumn()"></td>
			</tr>
		</table>
	</form>
</body>
</html>