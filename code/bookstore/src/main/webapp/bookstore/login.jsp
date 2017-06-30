<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>Welcome to Bookstore</title>
	<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/color.css">
	<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/demo/demo.css">
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.min.js"></script>
	<script type="text/javascript" src="http://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
</head>
<body>
	<h1>Welcome To HP Bookstore!</h1>
	<form action="userAction!userLogin" method="post">
		<div>
		<label>Username:</label>
		<input name="username" type="text" required="true">
		</div>
		<div>
		<label>Password:</label>
		<input name="password" type="password" required="true">
		</div>
		
		<input type="submit" value="login" />
	</form>
		
		<a href="javascript:void(0)" plain="true" onclick="newUser()" class="easyui-linkbutton">Register</a>
	
	<div id="dlg" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
			closed="true" buttons="#dlg-buttons">
		<div class="ftitle">User Information</div>
		<form id="fm" method="post" novalidate>
			<div class="fitem">
				<label>Username:</label>
				<input name="username" class="easyui-textbox" required="true">
			</div>
			<div class="fitem">
				<label>Password:</label>
				<input name="password" class="easyui-textbox" required="true" type="password">
			</div>
			<div class="fitem">
				<label>True Name:</label>
				<input name="truename" class="easyui-textbox" required = "true">
			</div>
			<div class="fitem">
				<label>Phone:</label>
				<input name="phone" class="easyui-textbox" required = "true">
			</div>
			<div class="fitem">
				<label>Email:</label>
				<input name="email" class="easyui-textbox" required = "true" validType="email">
			</div>
			<div class="fitem">
				<label>Address:</label>
				<input name="address" class="easyui-textbox" required = "true">
			</div>
			<div class="fitem">
				<label>Role:</label>
				<select name="role" > 
					<option value="admin">Admin</option> 
					<option value="user" selected = "selected">User</option> 
				</select>
			</div>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveUser()" style="width:90px">Save</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">Cancel</a>
	</div>
	
	<script type="text/javascript">
		var url;
		function newUser(){
			$('#dlg').dialog('open').dialog('setTitle','New User');
			$('#fm').form('clear');
			url = 'http://localhost:8080/myBookStore/userAction!addUser';
		}
		function saveUser(){
			$('#fm').form('submit',{
				url: url,
				onSubmit: function(){
					$('#dlg').dialog('close');
					return $(this).form('validate');
				},
				//success: function(result){
					//var result = eval('('+result+')');
					//if (result.errorMsg){
						//$.messager.show({
							//title: 'Error',
							//msg: result.errorMsg
						//});
					//} else {
						//$('#dlg').dialog('close');		// close the dialog
						//$('#dg').datagrid('reload');	// reload the book data
					//}
				//}
			});
		}
	</script>
</body>
</html>