<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/common.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户添加页面</title>
<style type="text/css">
table {
	font-size: 16px;
}

textarea {
	font-size: 16px;
}
</style>
<script type="text/javascript">
	
</script>
</head>
<body style="text-align: center">

	<form id="userForm" action="${basePath}/web/insertInfo" method="post">
		<div  style="height:1000px; overflow: scroll;">
			<table width="100%" style="margin: 0 auto;" cellspacing="0">
				<tr>
					<th>About_us</th>
					<td style="padding: 20px" colspan="3"><textarea
							name="about_us" id="about_us" rows="5" cols="100">${info.about_us }</textarea>
					</td>
				</tr>
				<tr>
					<th>Wholesale</th>
					<td style="padding: 20px" colspan="3"><textarea
							name="wholesale" id="wholesale" rows="5" cols="100">${info.wholesale }</textarea>
					</td>
				</tr>
				<tr>
					<th>Order</th>
					<td style="padding: 20px" colspan="3"><textarea name="order"
							id="order" rows="5" cols="100">${info.order }</textarea></td>
				</tr>
				<tr>
					<th>Acceptable Payment</th>
					<td style="padding: 20px" colspan="3"><textarea
							name="acceptable" id="acceptable" rows="5" cols="100">${info.acceptable }</textarea>
					</td>
				</tr>
				<tr>
					<th>Shipping&Delivery</th>
					<td style="padding: 20px" colspan="3"><textarea
							name="shipping" id="shipping" rows="5" cols="100">${info.shipping }</textarea>
					</td>
				</tr>
				<tr>
					<th>Contact us</th>
					<td style="padding: 20px" colspan="3"><textarea name="contact"
							id="contact" rows="5" cols="100">${info.contact }</textarea></td>
				</tr>
				<tr>
					<td><input type="submit" value="修改"></td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>