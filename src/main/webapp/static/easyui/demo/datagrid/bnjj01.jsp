<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/base/base.jsp"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>测试</title>
<script type="text/javascript">
	function Tbbn01() {
		this.id = null;
		this.shortDescription = null;
		this.scaleImageId = null;
		this.contentUrl = null;
		this.isAd = null;
		this.getInfo = function() {
		};
	}

	var idField = "id";

	var columns = [ [ {
		title : "摘要描述",
		field : "shortDescription",
		width : "25%",
		align : "center"
	}, {
		title : "文章链接",
		field : "contentUrl",
		width : "25%",
		align : "center"
	}, {
		title : "是否置顶",
		field : "isAd",
		width : "25%",
		align : "center"
	}, {
		title : "缩略图",
		field : "scaleImageId",
		width : "25%",
		align : "center"
	} ] ];

	function initBnInsertWindow() {
		$("#win").window({
			title : "新增商学院信息",
			width : 300,
			height : 250,
			modal : true,
			collapsible : false,
			minimizable : false,
			maximizable : false,
			closable : false,
			resizable : false,
			closed : true
		});
	}
	
	function initBnInsertWindow2() {
		$("#win2").window({
			title : "上传文件",
			width : 300,
			height : 250,
			modal : true,
			collapsible : false,
			minimizable : false,
			maximizable : false,
			closable : false,
			resizable : false,
			closed : true
		});
	}
	
	function initBnTable() {
		$("#datagrid").datagrid({
			url : "${path}/bn/getTbbn01",
			toolbar : "#toolbar",
			singleSelect : true,
			striped : true,
			nowrap : false,
			border : false,
			fit : true,
			fitColumns : true,
			rownumbers : true,
			pagination : true,
			pageSize : 18,
			pageList : [ 18, 36, 54, 72 ],
			pagePosition : "bottom",
			idField : idField,
			columns : columns,
			queryParams : {
				shortDescription : $("#shortDescription").val(),
				contentUrl : $("#contentUrl").val(),
				isAd : $("#isAd").val()
			},
			onBeforeLoad : function(param) {
				showMessageSlide("信息",param.shortDescription);
			}
		});
	}

	function initBnPager() {
		$("#datagrid").datagrid("getPager").pagination({
			showPageList : false,
			buttons : [ {
				iconCls : "icon-add",
				handler : doAdd
			}, {
				iconCls : "icon-remove",
				handler : doRemove
			}, {
				iconCls : "icon-edit",
				handler : doEdit
			} ],
			onBeforeRefresh : function() {
				return true;
			}
		});
	}

	function doSearch() {
		$("#datagrid").datagrid("reload", {
			shortDescription : $("#shortDescription").val(),
			contentUrl : $("#contentUrl").val(),
			isAd : $("#isAd").val()
		});
	}

	function doAdd() {
		$("#datagrid").datagrid("insertRow", {
			index : 0,
			row : new Tbbn01()
		});
		$("#datagrid").datagrid("selectRow", 0);
		$("#shortDescriptionTS").val(null);
		$("#scaleImageIdTS").val(null);
		$("#contentUrlTS").val(null);
		$("#isAdTS").val(null);
		$("#win").window("open");
	}

	function doRemove() {
		
	}

	function doEdit() {
	}

	function doSave() {
		var sendData = $("#datagrid").datagrid("getSelected");
		sendData.shortDescription = $("#shortDescriptionTS").val();
		sendData.scaleImageId = $("#scaleImageIdTS").val();
		sendData.contentUrl = $("#contentUrlTS").val();
		sendData.isAd = $("#isAdTS").val();
		var toSend = {
			operation : "save",
			entity : sendData
		};
		$.ajax({
			type : "POST",
			url : "${path}/bn/operationTbbn01",
			dataType : "json",
			contentType : "application/json",
			data : JSON.stringify(toSend),
			success : function(data) {
				showMessageSlide("信息", data.info);
				doSearch();
			}
		});
		$("#win").window("close");
		$("#datagrid").datagrid("deleteRow", 0);

	}

	function doCancel() {
		$("#win").window("close");
		$("#datagrid").datagrid("deleteRow", 0);
	}

	function showMessageSlide(title, message) {
		$.messager.show({
			title : title,
			msg : message,
			timeout : 3000,
			showType : "slide"
		});
	}

	$(function() {
		initBnTable();
		initBnPager();
		initBnInsertWindow();
		initBnInsertWindow2();
	});
	
	function doOpenSelectScaleWindow(){
		$("#win2").window("open");
		$("#win2").window("refresh", "${path}/jsp/dr/drjj02.jsp?groupId=0");
	}
	function setScaleImageIdTS(value) {
		$("#scaleImageIdTS").val(value);
	}
</script>
<body style="margin:0px;padding:0px;">
	<div id="toolbar" style="height:auto;">
		<br>
		<fieldset style="border:1px solid #ccc">
			<legend>查询条件</legend>
			<span>摘要:<input id="shortDescription"
				style="line-height:20px;border:1px solid #ccc"
				class="easyui-validatebox"></span> <span>链接:<input
				id="contentUrl" style="line-height:20px;border:1px solid #ccc"></span>
			<span>是否置顶:<input id="isAd"
				style="line-height:20px;border:1px solid #ccc"></span> <a
				href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-search'" onclick="doSearch()">查询</a>
		</fieldset>
		<br>
	</div>
	<table id="datagrid" class="easyui-datagrid">
	</table>

	<div id="win">
		<table style="height:85%;width:100%;">
			<tr>
				<td>链接:</td>
				<td><input id="contentUrlTS" class="easyui-validatebox"
					data-options="required:true,validType:'url'" style="width:95%;"></td>
			</tr>
			<tr>
				<td>是否置顶:</td>
				<td><input id="isAdTS" class="easyui-validatebox"
					style="width:20%;"></td>
			</tr>
			<tr>
				<td>缩略图:</td>
				<td><input id="scaleImageIdTS" class="easyui-validatebox"
					data-options="required:true" style="width:20%;"><a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-save'" onclick="doOpenSelectScaleWindow()">上传缩略图</a></td>
			</tr>
			<tr>
				<td>摘要:</td>
				<td><textarea id="shortDescriptionTS"
						class="easyui-validatebox"
						data-options="required:true,validType:'length[1,255]'"
						style="height:100px;width:95%;padding:0;margin:0;resize: none;"></textarea></td>
			</tr>
		</table>
		<div style="text-align : center;">

			<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-save'" onclick="doSave()">保存</a> <a
				href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-cancel'" onclick="doCancel()">取消</a>
		</div>
	</div>
	
	<div id="win2">
				
	</div>
</body>
</html>
