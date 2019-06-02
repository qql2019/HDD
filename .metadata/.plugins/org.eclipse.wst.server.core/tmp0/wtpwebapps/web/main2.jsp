<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Basic Layout - jQuery EasyUI Demo</title>
	<link rel="stylesheet" type="text/css" href="css/easyui.css">
	<link rel="stylesheet" type="text/css" href="css/icon.css">
	<link rel="stylesheet" type="text/css" href="css/icon.css">
	<link rel="stylesheet" type="text/css" href="css/demo.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
</head>
<body class="easyui-layout">
	

		<div data-options="region:'north'" style="height:102px;background-color:#F9F7F8 ">
		<img alt="" src="images/main.jpg" style="height:98px;width:700px;float:left"> 
		<div style="margin: 60px 50px 20px;float:right">当前登录用户;&nbsp;<font color="red">${currentUser.userName}</font></div>
		</div>
		<div data-options="region:'south'" style="height:30px;padding:5px;" align="center"  >版权所有&nbsp;&nbsp;<a href="http://www.cissst.com">www.cissst.com</a></div>
		<div data-options="region:'south',split:true" style="height:50px;"></div>
		<div data-options="region:'west',split:true" title="功能菜单" style="width:13%;">
		<ul class="easyui-tree">
			<li>
				<span>My Documents</span>
				<ul>
					<li data-options="state:'closed'">
						<span>Photos</span>
						<ul>
							<li>
								<span>Friend</span>
							</li>
							<li>
								<span>Wife</span>
							</li>
							<li>
								<span>Company</span>
							</li>
						</ul>
					</li>
					<li>
						<span>Program Files</span>
						<ul>
							<li>Intel</li>
							<li>Java</li>
							<li>Microsoft Office</li>
							<li>Games</li>
						</ul>
					</li>
					<li>index.html</li>
					<li>about.html</li>
					<li>welcome.html</li>
				</ul>
			</li>
		</ul>
		
		</div>
		<div data-options="region:'center',title:'Main Title',iconCls:'icon-ok'">
			<table class="easyui-datagrid"
					data-options="url:'user/getUsersjson.do',method:'get',border:false,singleSelect:true,fit:true,fitColumns:true,toolbar:'#toolbar',pagination:true">
				<thead>
					<tr>
					<th data-options="field:'ck',checkbox:true">全选</th>
						<th data-options="field:'id',align:'right'" width="80">编号</th>
						<th data-options="field:'name'" width="100">姓名</th>
						<th data-options="field:'sex'" width="80">性别</th>
						<th data-options="field:'age',align:'right'" width="80">年龄</th>
						</tr>
				</thead>
			</table>
			<div id="toolbar">
				<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">新建用户</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">编辑用户</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">删除用户</a>
			</div>
		</div>
	

</body>
</html>