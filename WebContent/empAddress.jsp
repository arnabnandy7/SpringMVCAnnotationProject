<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%
	response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
	response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
	response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
	response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv='cache-control' content='no-cache'>
<meta http-equiv='expires' content='0'>
<meta http-equiv='pragma' content='no-cache'>
<title>Address Information</title>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

.input {
	width: 200px;
	height: 28px;
}

.input1 {
	width: 750px;
	height: 28px;
}
</style>
<script type="text/javascript" src="<c:url value='/resources/js/jqueryAjax.js'/>" ></script>
<script type="text/javascript">
$(document).ready(function() {	
    //alert("Onready the page");
    OnRadioChange();
    
    });
function OnRadioChange()  {	
    var addType=$('input[type="radio"]:checked').val();
    var email=$("#email").val();  
    //alert('addType= '+addType+' email= '+email);
        $.ajax({
            url : "${pageContext.request.contextPath}/insertUpdateAddressInfo",
            type : "GET",
            data : {addType:addType,email:email},
            success : function(data) {
            	//alert(data);
            	debugger;
            	var myJson=JSON.parse(data);
            	//alert(myJson);
            	$.each(myJson, function(i, v) { 
            		//alert(i+" *** "+v);
            		$('#'+i).val(v);
            	});            	
            },
            error: function(){
                alert("error");
            }
        });
        return false; 
    }
</script>

</head>
<body>
	<div
		style="width: 100%; height: 30px; background-color: gray; line-height: 30px;">
		<div style="height: 30px; float: right; text-align: right;">
			<table>
				<tr>
					<td style="text-align: right;"><b>Welcome! ${welcomeMessage}</b></td>
					<td style="text-align: right;"><a href=${pageContext.request.contextPath}/logout>Logout</a></td>			
				</tr>
			</table>
		</div>
	</div>
	<header>
		<h2>Address Information</h2>
	</header>
	<br>
	<div>
		<c:set var="empaddr" value="${key1}" />
		<form id="Form1" name="Form1" action=${pageContext.request.contextPath}/insertUpdateUserAddress method="post">

			<table>
				<tr>
					<td width="150px"><label>Address Type</label></td>
					<td><input type="radio" id="home" name="addType" value="H" onchange="OnRadioChange();" checked>
						<label for="home">Home Address</label></td>
					<td><input type="radio" id="work" name="addType" value="W" onchange="OnRadioChange();" >
						<label for="work">Work Address</label></td>
				</tr>
			</table>
			<table>
				<tr height="30px">
					<td width="150px"><label>Address</label></td>
					<td width="350px"><input type="text" id="address" value="${empaddr.address}"
						name="address" class="input1" required></td>
				</tr>
				<tr height="30px">
					<td width="150px"><label>City</label></td>
					<td width="350px"><input type="text" id="city" name="city" value="${empaddr.city}"
						class="input" required></td>
				</tr>
				<tr height="30px">
					<td width="150px"><label>Pin</label></td>
					<td width="350px"><input type="text" id="pin" name="pin" value="${empaddr.pin}"
						class="input" required></td>
				</tr>
				<tr height="30px">
					<td width="150px"><label>State</label></td>
					<td width="350px"><input type="text" id="state" name="state" value="${empaddr.state}"
						class="input" required></td>
				</tr>
				<tr height="30px">
					<td width="150px"><label>Country</label></td>
					<td width="350px"><input type="text" id="country" value="${empaddr.country}"
						name="country" class="input" required></td>
				</tr>
				<tr>
					<td><input type="hidden" id="email" name="email"
						value="${empaddr.email}"></td>
				</tr>
			</table>
			<br>
			<table>
				<tr>
					<td width="150px"></td>
					<td><input type="submit" value="Save"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>