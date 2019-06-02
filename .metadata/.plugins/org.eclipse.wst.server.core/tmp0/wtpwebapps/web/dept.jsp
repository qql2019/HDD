<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<script type="text/javascript">
	$(function() {
		//设置数据表格控制事件
		$('#dg').datagrid({
			title : '部门详细列表',
			iconCls : 'icon-edit',
			url : 'dept/getdeptsjson.do',
			queryParams : {
				page : 1,
				rows : 10
			},
			border : true,
			width : 700,
			height : 'auto',
			striped : true,//显示条纹
			nowrap : true,
			collapsible : false,//不折叠
			fit : true, //表格填充整个区域
			fitColumns : true,//表格的列填充合适的区域
			singleSelect : false,//是否单选
			rownumbers : true,//行号
			pagination : true,//分页控件
			toolbar : "#toolbar"

		});

		var p = $('#dg').datagrid('getPager');
		$(p).pagination({
			pageSize : 10,//页记录数
			pageList : [ 5, 10, 15, 20 ],//每页可选多少条记录
			beforePageText : '第',//页数文本框前显示的字
			afterPageText : '页  共{pages}页',
			displayMsg : '当前显示{from}-{to}条记录 共 {total}条记录'

		});
	});
	//对话框提交按钮提交表单
	var url;
	function newDept() {
		$('#dlg').dialog('open').dialog("setTitle", "部门信息");
		url = ("dept/save.do");
	}
	//点击save按钮事件
	function saveDept() {
		$('#fm').form("submit", {
			url : url,
			onSubmit : function() {
				return $(this).from("validate");
			},
			success : function(result) {
				if (result.errorMsg) {
					$.messager.alert("系统提示", result.errorMsg);
				} else {
					$.messager.alert("系统提示", "保存成功");
					//表格数据更新
					$("#dg").datagrid("reload");
					//清空对话框
					resetValue();
					$('#dlg').dialog("close");
					$('#dlg').dialog("roload");
				}
			}
		});
	}
	function resetValue() {
		$('#dname').val("");
		$('#loc').val("");
	}
	//删除记录
	function deleteDept() {
		//得到行号数组
		var selectedRows = $('#dg').datagrid('getSelections');
		//当没有选中
		if (selectedRows.length == 0) {
			$.messager.alert("系统提示", "请选择要删除的数据");
			return;
		}
		//记录被删除信息编号
		var strIds = [];
		var rowindex = [];
		for (var i = 0; i < selectedRows.length; i++) {
			strIds.push(selectedRows[i].deptno);
			var index = $("#dg").datagrid("getRowIndex", selectedRows[i]);
			//保存信息
			rowindex.push(index);
		}
		var ids = strIds.join(",");
		$.messager
				.confirm(
						"系统提示",
						"您确定要删除这" + selectedRows.length + "条记录吗？",
						function(r) {
							if (r) {
								$
										.ajax({
											url : 'dept/delete.do',
											type : "POST",
											dataType : "json",
											data : {
												ids : ids
											},
											beforeSend : function() {
												$.messager.progress({
													text : '处理中。。。。。'
												});
											},
											success : function(result) {
												$.messager.progress('close');
												result = eval('(' + result
														+ ')');
												console.log(result);
												if (result.success) {
													for (var i = rowindex.length - 1; i >= 0; i--) {
														$("#dg").datagrid(
																'deleteRow',
																rowindex[i]);

													}
													$.messager
															.alert(
																	"系统提示",
																	"您已经成功删除了"
																			+ selectedRows.length
																			+ "条记录");
												} else {
													$.messager
															.alert(
																	"系统提示",
																	selectedRows[result.errorIndex].deptno
																			+ "条记录出错，原因是"
																			+ result.errorMsg);
												}
											},
											async : false
										});
								//表格数据更新
								$('#dg').datagrid("reload");

							}
						});
	}

	function editDept() {
		//得到选择行号数组
		var selectedRows = $('#dg').datagrid('getSelections');
		//判断是否有一条且只能有一条记录选择
		if (selectedRows.length != 1) {
			$.messager.alert("系统提示", "请确保只选择一条记录！");
			return;
		}
		var row = selectedRows[0];
		$('#dlg').dialog("open").dialog("setTitle", "编辑部门信息");
		// 从选择记录中提取dname和loc变量的值，赋给对应输入框中
		$('#dname').val(row.dname);
		$('#loc').val(row.loc);
		// 定义提交的路径
		url = "dept/update.do?deptno=" + row.deptno;

	}
	//搜索部门
	function searchDeptByDname() {
		$('#dg').datagrid('load', {
			dname : $('#s_dname').val()
		});
	}
</script>
</head>
<body>
	<table id="dg" style="width: 100%; height: 100%">
		<thead>
			<tr>
				<th data-options="field:'ck',checkbox:true">全选</th>
				<th data-options="field:'id',align:'right'" width="80">部门编号</th>
				<th data-options="field:'name'" width="100">部门名称</th>
				<th data-options="field:'sex'" width="80">部门位置</th>

			</tr>
		</thead>
	</table>
	<div id="toolbar">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-add" plain="true" onclick="newUser()">新建用户</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-edit" plain="true" onclick="editUser()">编辑用户</a> <a
			href="javascript:void(0)" class="easyui-linkbutton"
			iconCls="icon-remove" plain="true" onclick="destroyUser()">删除用户</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;部门名称：&nbsp;<input type="text"
			name="s_dname" id="s_dname" />&nbsp; <a href="javascript:void(0)"
			class="easyui-linkbutton" iconCls="icon-search" plain="true"
			onclick="searchDeptByDname()">搜素</a>
	</div>
	<div id="dlg" class="easyui-dialog"
		style="width: 400px; height: 280px; padding: 10px 20px" closed="true"
		buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table>
				<tr>
					<td>部门名称:</td>
					<td><input type="text" name="dname" id="dname"
						class="easyui-validatebox" required="true"></td>
				</tr>
				<tr>
					<td>部门位置:</td>
					<td><input type="text" name="loc" id="loc"
						class="easyui-validatebox"></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
			onclick="saveDept()">Save</a> <a href="#" class="easyui-linkbutton"
			iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">Cancel</a>
	</div>
</body>
</html>