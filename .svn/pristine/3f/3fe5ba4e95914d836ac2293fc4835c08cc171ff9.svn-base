<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="doc" tagdir="/WEB-INF/tags/oa/doc" %>
<html>
<head>
	<title>文档信息管理</title>
	<meta name="decorator" content="default"/>
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/easyui/demo/demo.css">
	<script type="text/javascript" src="${ctxStatic}/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="${ctxStatic}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			initButton();
			$("#btnAdd").click(function() {
				openDialog("添加文档", "${ctx}/oa/doc/oaDoc/form",width="80%", height="80%");
			});
			$("#btnDel").click(function() {
				var row = $("#contentTable").datagrid("getSelected");
				if (row){
					layer.confirm("确定要删除我的文档吗？", 
							{title:['系统提示']},
							{btn: ["确定", "取消"]}, //可以无限个按钮,
						function(index, layero){
						 	//按钮【按钮一】的回调
							/* location.href="${ctx}/oa/doc/oaDoc/delete?id="+row.itemId; */
							$.ajax({
								type: "POST",
								url: "${ctx}/oa/doc/oaDoc/delete?id="+row.itemId,
								dataType: 'json',
								success: function(data){
									if(data.success){
										window.location.reload();
										top.layer.msg(data.msg);
									}
								},
								error:function(xmlr, textStatus, errorThrown){
									if(xmlr.status==403){
										top.layer.msg("您无权进行此操作");
									}else{
										
										layer.confirm("未登录或登录超时。请重新登录，谢谢！", {
										  	btn: ["确定", "取消"], //可以无限个按钮
										  	btn2: function(index, layero){
										    	//按钮【按钮二】的回调
										  		}
											},
											function(index, layero){
												top.location.reload();
												layer.close(index);
											}
										);
									}
								}
							});
							layer.close(index);
						}
					);
				}else{
					top.layer.msg("请选择一行数据");
				}
			});
			
			$("#btnEdit").click(function() {
				var row = $("#contentTable").datagrid("getSelected");
				if (row){
					openDialog("修改文档", "${ctx}/oa/doc/oaDoc/form?id="+row.itemId,width="80%", height="80%");
				}else{
					top.layer.msg("请选择一行数据");
				}
			});
			
			$("#btnView").click(function() {
				var row = $("#contentTable").datagrid("getSelected");
				if (row){
					openDialogView("查看文档", "${ctx}/oa/doc/oaDoc/form?id="+row.itemId,width="80%", height="80%");
				}else{
					top.layer.msg("请选择一行数据");
				}
			});
			$("#btnExcute").click(function() {
				var row = $("#contentTable").datagrid("getSelected");
				if (row){
					if(row.applyCount<1){
						top.layer.msg("当前文档没有需要处理的借阅申请");
					}else{
						var src="${ctx}/oa/doc/oaDocReadApply?doc.id="+row.itemId+"&doc.title="+encodeURIComponent(row.title)+"&lendStatus=0"
						top.layer.open({
							  type: 2, 
							  area: ["80%","80%"],
						      title: "文档阅读申请处理",
					          maxmin: true,
					          shadeClose: true,
							  content: src,
							  cancel: function(index, layero){
								  reset();
							  }
						});
					}
				}else{
					top.layer.msg("请选择一行数据");
				}
			});
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
		function resetForm(){
			resetSelection("docType","oaDoc_docType");
			resetSelection("isNeedLend","yes_no");
			resetSelection("isPublic","yes_no");
        }
		function resetSelection(id,typex){
			$("#"+id).val("");
			$("#s2id_"+id).children("a").children("span.select2-chosen").html("全部");
			$("#"+id).empty();
			$("#"+id).append("<option value=\"\" selected=\"selected\">全部</option>");
			$.ajax({
				type: "POST",
				url: "${ctx}/sys/dict/getDictList",
				data: {type:typex},
				dataType: 'json',
				success: function(data){
					for(var i=0;i<data.length;i++)  
					{  
						$("#"+id).append("<option value=\""+data[i].value+"\">"+data[i].label+"</option>");
					}
				}
			});
		}
		
		function initButton(){
			var row = $("#contentTable").datagrid("getSelected");
			if (row){
				stateToEnabled("#btnDel");
				stateToEnabled("#btnEdit");
				stateToEnabled("#btnView");
				if(row.applyCount>=1){
					stateToEnabled("#btnExcute");
				}else{
					stateToDisabled("#btnExcute");
				}
				
			}else{
				stateToDisabled("#btnDel");
				stateToDisabled("#btnEdit");
				stateToDisabled("#btnView");
				stateToDisabled("#btnExcute");
			}
		}
		
		function cellStylerApplyCount(value,row,index){
			if (value > 0){
				return 'color:red;';
			}
		}
		function stateToDisabled(selector){
			$(selector).hide();
			$(selector).attr("disabled","disabled");
		}
		function stateToEnabled(selector){
			$(selector).show();
			$(selector).removeAttr("disabled");
		}
	</script>
	<style>
		label + .btn{
			height:30px;
		}
		div.datagrid-wrap.panel-body.panel-body-noheader{
			border-color: #dddddd;
		}
		.btn[disabled]{
			opacity:0.5;
		}
		.pull-left a .fa{
			margin-right:4px;
		}
		.pull-left a:last-child .fa{
			margin-right:0;
		}
		.datagrid-row-selected{
			background: #35a5e7;
    		color: #ffffff;
		}
	</style>
</head>
<body style="padding: 0px"  class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<doc:oaDocTitleNav activeIndex="1"></doc:oaDocTitleNav>
    		<div class="ibox-content">
				<div class="row">
					<div class="col-sm-12">
						<form:form id="searchForm" modelAttribute="oaDoc" action="${ctx}/oa/doc/oaDoc/" method="post" class="form-inline">
							<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
							<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
							<oa:searchGroup id="searchGroup">
								<oa:searchGroupCell label="标题：" isAlwaysVisible="true">
									<form:input path="title" htmlEscape="false" maxlength="64" class="form-control input-sm"/>
								</oa:searchGroupCell>
								<oa:searchGroupCell label="关键词：" >
									<form:input path="keyword" htmlEscape="false" maxlength="200" class="form-control input-sm"/>
								</oa:searchGroupCell>
								<oa:searchGroupCell label="文档归类：">
									<form:select path="docType" class="selectpicker " data-style="btn-inverse" data-live-search="true">
										<form:option value="" label="全部"/>
										<form:options items="${fns:getDictList('oaDoc_docType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
									</form:select>
								</oa:searchGroupCell>
								<oa:searchGroupCell label="是否需借阅：">
									<form:select path="isNeedLend" class="selectpicker " data-style="btn-inverse" data-live-search="true">
										<form:option value="" label="全部"/>
										<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
									</form:select>
								</oa:searchGroupCell>
								<oa:searchGroupCell label="归属部门：">
									<sys:treeselect id="office" name="office.id" value="${oaDoc.office.id}" labelName="office.name" labelValue="${oaDoc.office.name}"
										title="部门" url="/sys/office/treeData?type=2" cssClass="form-control" allowClear="true" notAllowSelectParent="true"/>
								</oa:searchGroupCell>
								<oa:searchGroupCell label="是否共享：">
									<form:select path="isPublic" class="selectpicker " data-style="btn-inverse" data-live-search="true">
										<form:option value="" label="全部"/>
										<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
									</form:select>
								</oa:searchGroupCell>
							</oa:searchGroup>
						</form:form>
						<br/>
					</div>
				</div>
				<sys:message content="${message}"/>
				<!-- 工具栏 -->
				<div class="row">
					<div class="col-sm-12">
						<div class="pull-left">
							<shiro:hasPermission name="oa:doc:oaDoc:edit"> 
								<a id="btnAdd" href="javascript:void(0);" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i> 添加</a>
								<a id="btnDel" href="javascript:void(0);" class="btn btn-primary btn-sm"><i class="fa fa-trash-o"></i> 删除</a>
								<a id="btnEdit" href="javascript:void(0);" class="btn btn-primary btn-sm"><i class="fa fa-edit"></i> 修改</a>
							</shiro:hasPermission>
							<shiro:hasPermission name="oa:doc:oaDoc:view">
								<a id="btnView" href="javascript:void(0);" class="btn btn-primary btn-sm"><i class="fa fa-search-plus"></i> 查看</a>
							</shiro:hasPermission>
							<shiro:hasPermission name="oa:doc:oaDoc:edit"> 
								<a id="btnExcute" href="javascript:void(0);" class="btn btn-primary btn-sm"><i class="fa"></i>处理借阅申请</a>
							</shiro:hasPermission>
						</div>
						<div class="pull-right">
							<button class="btn btn-primary btn-rounded btn-outline btn-sm "
								onclick="search()">
								<i class="fa fa-search"></i> 查询
							</button>
							<button id="btnReset" class="btn btn-primary btn-rounded btn-outline btn-sm "
								onclick="reset()">
								<i class="fa fa-refresh"></i> 重置
							</button>
						</div>
					</div>
				</div>
				<br>
				<table id="contentTable" style="width:100%;min-height:277px;max-height:387px;"  class="easyui-datagrid" 
							data-options="striped:true,
							rownumbers:true,
							singleSelect:true,
							remoteSort:false,
							idField:'itemId',
							onSelect:function(rowIndex, rowData){
								initButton();
							}">
					<thead data-options="frozen:true">
						<tr>
							<th data-options="field:'itemId',width:'13%',sortable:true,hidden:true"></th>
							<th data-options="field:'title',width:'13%',sortable:true">标题</th>
							<th data-options="field:'applyCount',sortable:true,width:'60px',align:'right',styler:cellStylerApplyCount">待处理数</th>
						</tr>						
					</thead>
					<thead>
						<tr>
							<th data-options="field:'keyword',sortable:true,width:'13%',resizable:true">关键词</th>
							<th data-options="field:'docType',sortable:true,width:'13%'">文档归类</th>
							<th data-options="field:'isNeedLend',sortable:true,width:'13%'">是否需要借阅</th>
							<th data-options="field:'isPublic',sortable:true,width:'100px'">是否共享</th>
							<th data-options="field:'office.name',sortable:true,width:'100px'">归属部门</th>
							<th data-options="field:'createDate',sortable:true">创建时间</th>
							<th data-options="field:'updateDate',sortable:true">更新时间</th>
							<th data-options="field:'downloadCount',sortable:true,width:'60px',align:'right'">下载次数</th>
						</tr>						
					</thead>
					<tbody>
						<c:forEach items="${page.list}" var="oaDoc" varStatus="status">
							<tr>
								<td>
									${oaDoc.id}
								</td>
								<td>
									${oaDoc.title}
								</td>
								<td>
									${not empty oaDoc.applyCount?oaDoc.applyCount:'0'}
								</td>
								<td>
									${oaDoc.keyword}
								</td>
								<td>
									${fns:getDictLabel(oaDoc.docType, 'oaDoc_docType', '')}
								</td>
								<td>
									${fns:getDictLabel(oaDoc.isNeedLend, 'yes_no', '')}
								</td>
								<td>
									${fns:getDictLabel(oaDoc.isPublic, 'yes_no', '')}
								</td>
								<td>
									<c:if test="${oaDoc.isPublic ne '1'}">
										${oaDoc.office.name}
									</c:if>
								</td>
								<td>
									<fmt:formatDate value="${oaDoc.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
								</td>
								<td>
									<fmt:formatDate value="${oaDoc.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
								</td>
								<td>
									${oaDoc.downloadCount}
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<table:page page="${page}"></table:page>
			</div>
		</div>
	</div>
</body>
</html>