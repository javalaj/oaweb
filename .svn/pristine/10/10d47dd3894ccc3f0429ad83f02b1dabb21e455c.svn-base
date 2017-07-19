<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>我的项目管理</title>
	<meta name="decorator" content="default"/>
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/easyui/demo/demo.css">
	<script type="text/javascript" src="${ctxStatic}/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="${ctxStatic}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript">
		var cuserId="${fns:getUser().id}";
		$(document).ready(function() {
			initButton();
			$("#btnAdd").click(function() {
				openDialog("添加项目", "${ctx}/oa/project/oaProject/form",width="80%", height="80%");
			});
			$("#btnDel").click(function() {
				var row = $("#contentTable").datagrid("getSelected");
				if (row){
					if(checkPermission(row.projectCreateById)){
						layer.confirm("操作不可逆，确定删除吗？", {
						  	btn: ["确定", "取消"],
						  	btn2: function(index, layero){
						  		//取消
						  		}
							},
							function(index, layero){
								//确定
								location.href="${ctx}/oa/project/oaProject/delete?id="+row.itemId;
							}
						);
					}else{
						top.layer.msg("该操作需要项目创建者权限");
					}
				}else{
					top.layer.msg("请选择一行数据");
				}
			});
			
			$("#btnEdit").click(function() {
				var row = $("#contentTable").datagrid("getSelected");
				if (row){
					if(checkPermission(row.projectCreateById)){
						openDialog("项目文档", "${ctx}/oa/project/oaProject/form?id="+row.itemId,width="80%", height="80%");
					}else{
						top.layer.msg("该操作需要项目创建者权限");
					}
				}else{
					top.layer.msg("请选择一行数据");
				}
			});
			
			$("#btnView").click(function() {
				var row = $("#contentTable").datagrid("getSelected");
				if (row){
					openDialogView("查看项目", "${ctx}/oa/project/oaProject/form?operation=view&id="+row.itemId,width="80%", height="80%");
				}else{
					top.layer.msg("请选择一行数据");
				}
			});
			$("#btnComplete").click(function() {
				var row = $("#contentTable").datagrid("getSelected");
				if (row){
					if(checkPermission(row.projectCreateById)){
						if(permit(row.state,"0")||permit(row.state,"2")){
							layer.confirm("操作不可逆，确定完成吗？", {
							  	btn: ["确定", "取消"],
							  	btn2: function(index, layero){
							  		//取消
							  		}
								},
								function(index, layero){
									//确定
									location.href="${ctx}/oa/project/oaProject/complete?id="+row.itemId;
								}
							);
						}else{
							top.layer.msg("只可对项目状态为【新、进行、暂停】的记录进行该操作");
						}
					}else{
						top.layer.msg("该操作需要项目创建者权限");
					}
				}else{
					top.layer.msg("请选择一行数据");
				}
			});
			
			$("#btnCancel").click(function() {
				var row = $("#contentTable").datagrid("getSelected");
				if (row){
					if(checkPermission(row.projectCreateById)){
						if(permit(row.state,"0")||permit(row.state,"2")){
							layer.confirm("操作不可逆，确定取消吗？", {
							  	btn: ["确定", "取消"],
							  	btn2: function(index, layero){
							  		//取消
							  		}
								},
								function(index, layero){
									//确定
									location.href="${ctx}/oa/project/oaProject/cancel?id="+row.itemId;
								}
							);
						}else{
							top.layer.msg("只可对项目状态为【新、进行、暂停】的记录进行该操作");
						}
					}else{
						top.layer.msg("该操作需要项目创建者权限");
					}
				}else{
					top.layer.msg("请选择一行数据");
				}
			});
			
			$("#btnPause").click(function() {
				var row = $("#contentTable").datagrid("getSelected");
				if (row){
					if(checkPermission(row.projectCreateById)){
						if(permit(row.realState,"02")){
							layer.confirm("确定暂停吗？", {
							  	btn: ["确定", "取消"],
							  	btn2: function(index, layero){
							  		//取消
							  		}
								},
								function(index, layero){
									//确定
									location.href="${ctx}/oa/project/oaProject/pause?id="+row.itemId;
								}
							);
						}else{
							top.layer.msg("只可对项目状态为【进行】的记录进行该操作");
						}
					}else{
						top.layer.msg("该操作需要项目创建者权限");
					}
				}else{
					top.layer.msg("请选择一行数据");
				}
			});
			
			$("#btnContinue").click(function() {
				var row = $("#contentTable").datagrid("getSelected");
				if (row){
					if(checkPermission(row.projectCreateById)){
						if(permit(row.state,"2")){
							layer.confirm("确定继续吗？", {
							  	btn: ["确定", "取消"],
							  	btn2: function(index, layero){
							  		//取消
							  		}
								},
								function(index, layero){
									//确定
									location.href="${ctx}/oa/project/oaProject/start?id="+row.itemId;
								}
							);
						}else{
							top.layer.msg("只可对项目状态为【暂停】的记录进行该操作");
						}
					}else{
						top.layer.msg("该操作需要项目创建者权限");
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
			resetSelection("projectStage","oa_project_projectStage");
			resetSelection("contractType","oa_project_contractType");
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
				
				var tag=checkPermission(row.projectCreateById);
				stateToEnabled("#btnView");
				if(tag){
					stateToEnabled("#btnDel");
					stateToEnabled("#btnEdit");
				}else{
					stateToDisabled("#btnDel");
					stateToDisabled("#btnEdit");
				}
				if(tag&&(permit(row.state,"0")||permit(row.state,"2"))){
					stateToEnabled("#btnComplete");
				}else{
					stateToDisabled("#btnComplete");
				}
				if(tag&&(permit(row.state,"0")||permit(row.state,"2"))){
					stateToEnabled("#btnCancel");
				}else{
					stateToDisabled("#btnCancel");
				}
				if(tag&&(permit(row.realState,"02"))){
					stateToEnabled("#btnPause");
				}else{
					stateToDisabled("#btnPause");
				}
				if(tag&&(permit(row.state,"2"))){
					stateToEnabled("#btnContinue");
				}else{
					stateToDisabled("#btnContinue");
				}
			}else{
				stateToDisabled("#btnDel");
				stateToDisabled("#btnEdit");
				stateToDisabled("#btnView");
				stateToDisabled("#btnComplete");
				stateToDisabled("#btnCancel");
				stateToDisabled("#btnPause");
				stateToDisabled("#btnContinue");
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
		function cellStylerProjectCreateByName(value,row,index){
			var tag=$.trim(row.projectCreateById)==cuserId;
			if (tag){
				return 'color:#inherit;';
			}
		}
		function checkPermission(checkId){
			return $.trim(checkId)==cuserId;
		}
		function permit(checkItem,checkState){
			return $.trim(checkItem)==checkState;
		}
	</script>
	<style>
		div.datagrid-wrap.panel-body.panel-body-noheader{
			border-color: #dddddd;
		}
		.datagrid-row-selected{
			background: #35a5e7;
    		color: #ffffff;
		}
		.progressbar {
		    border-color: #1ab394;
		}
		.progressbar-value .progressbar-text {
		    background-color: #1ab394;
		}
	</style>
</head>
<body style="padding: 0px"  class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<div class="ibox-title">
				<h5>我的项目列表</h5>
				<div class="ibox-tools">
					<div class="tabbable myoa-project-tabs">
						<ul>
							<li class="active">
								<a href="#projectTable" data-toggle="tab"><i class="fa fa-list"></i></a>
							</li>
							<li>
								<a href="#projectCards" data-toggle="tab" onclick="$('#contentTable').datagrid('clearSelections');initButton();"><i class="fa fa-th"></i></a>
							</li>
						</ul>
					</div>
				</div>
			</div>
    		<div class="ibox-content">
				<div class="row">
					<div class="col-sm-12">
						<form:form id="searchForm" modelAttribute="oaProject" action="${ctx}/oa/project/oaProject/myList" method="post" class="form-inline">
							<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
							<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
							<oa:searchGroup id="searchGroup">
								<label class="oa-search-group-alwaysVisible">项目编号：
									<form:input path="projectNo" htmlEscape="false" maxlength="64" class="form-control"/>
								</label>
								<label>项目名称：
									<form:input path="projectName" htmlEscape="false" maxlength="64" class="form-control"/>
								</label>
								<label>项目金额：
									<form:input path="beginProjectMoney" htmlEscape="false" class="form-control"/>-
									<form:input path="endProjectMoney" htmlEscape="false" class="form-control"/>
								</label>
								<label>项目阶段：
									<form:select path="projectStage" class="selectpicker " data-style="btn-inverse" data-live-search="true">
										<form:option value="" label="全部"/>
										<form:options items="${fns:getDictList('oa_project_projectStage')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
									</form:select>
								</label>
								<label>服务类别：
									<form:select path="contractType" class="selectpicker " data-style="btn-inverse" data-live-search="true">
										<form:option value="" label="全部"/>
										<form:options items="${fns:getDictList('oa_project_contractType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
									</form:select>
								</label>
								<label>立项日期：
									<input name="beginEstablishmentTime" type="text" readonly="readonly" maxlength="20" class="form-control Wdate laydate-icon layer-date input-sm"
										value="<fmt:formatDate value="${oaProject.beginEstablishmentTime}" pattern="yyyy-MM-dd"/>"
										onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true});"/> - 
									<input name="endEstablishmentTime" type="text" readonly="readonly" maxlength="20" class="form-control Wdate laydate-icon layer-date input-sm"
										value="<fmt:formatDate value="${oaProject.endEstablishmentTime}" pattern="yyyy-MM-dd"/>"
										onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true});"/>
								</label>
							</oa:searchGroup>
						</form:form>
					</div>
				</div>
				<sys:message content="${message}"/>
				<!-- 工具栏 -->
				<div class="row">
					<div class="col-sm-12">
						<div class="pull-left">
							<shiro:hasPermission name="oa:project:oaProject:edit"> 
								<a id="btnAdd" href="javascript:void(0);" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i> 添加</a>
							</shiro:hasPermission>
							<shiro:hasPermission name="oa:project:oaProject:edit"> 
								<a id="btnDel" href="javascript:void(0);" class="btn btn-primary btn-sm"><i class="fa fa-trash-o"></i> 删除</a>
							</shiro:hasPermission>
							<shiro:hasPermission name="oa:project:oaProject:edit"> 
								<a id="btnEdit" href="javascript:void(0);" class="btn btn-primary btn-sm"><i class="fa fa-edit"></i> 修改</a>
							</shiro:hasPermission>
							<shiro:hasPermission name="oa:project:oaProject:view">
								<a id="btnView" href="javascript:void(0);" class="btn btn-primary btn-sm"><i class="fa fa-search-plus"></i> 查看</a>
							</shiro:hasPermission>
							<shiro:hasPermission name="oa:project:oaProject:edit"> 
								<a id="btnComplete" href="javascript:void(0);" class="btn btn-primary btn-sm"><i class="fa"></i>完结</a>
							</shiro:hasPermission>	
							<shiro:hasPermission name="oa:project:oaProject:edit"> 
								<a id="btnCancel" href="javascript:void(0);" class="btn btn-primary btn-sm"><i class="fa"></i>取消</a>
							</shiro:hasPermission>
							<shiro:hasPermission name="oa:project:oaProject:edit"> 
								<a id="btnPause" href="javascript:void(0);" class="btn btn-primary btn-sm"><i class="fa"></i>暂停</a>
							</shiro:hasPermission>
							<shiro:hasPermission name="oa:project:oaProject:edit"> 
								<a id="btnContinue" href="javascript:void(0);" class="btn btn-primary btn-sm"><i class="fa"></i>继续</a>
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
				<div class="tab-content">
					<div class="tab-pane  active" id="projectTable">
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
									<th data-options="field:'state',width:'13%',sortable:true,hidden:true"></th>
									<th data-options="field:'realState',width:'13%',sortable:true,hidden:true"></th>
									<th data-options="field:'projectCreateById',width:'13%',sortable:true,hidden:true"></th>
									<th data-options="field:'projectNo',width:'13%',sortable:true">项目编号</th>
									<th data-options="field:'projectName',width:'13%',sortable:true">项目名称</th>
									<th data-options="field:'stateDescription',width:'70px',sortable:true">项目状态</th>
									<th data-options="field:'projectCreateByName',width:'70px',sortable:true,styler:cellStylerProjectCreateByName">项目创建者</th>
								</tr>
							</thead>
							<thead>
								<tr>
									<th data-options="field:'progress',width:'110px'">项目进度</th>
									<th data-options="field:'startDate',width:'100px',sortable:true">项目开始日期</th>
									<th data-options="field:'endDate',width:'100px',sortable:true">项目结束日期</th>
									<th data-options="field:'planDay',width:'90px',align:'right'">计划完成天数</th>
									
									<th data-options="field:'expectedMoney',width:'90px',align:'right'">预计金额</th>
									<th data-options="field:'projectMoney',width:'90px',align:'right'">项目金额</th>
									<th data-options="field:'projectStage',width:'70px',sortable:true">项目阶段</th>
									<th data-options="field:'contractType',width:'70px',sortable:true">服务类别</th>
									<th data-options="field:'writeTime',width:'100px',sortable:true">录入时间</th>
									<th data-options="field:'writeWay',width:'70px',sortable:true">录入方式</th>
									<th data-options="field:'accountManagerName',width:'70px',sortable:true">客户经理</th>
									<th data-options="field:'projectManagerName',width:'70px',sortable:true">工程经理</th>
									<th data-options="field:'businessManagerName',width:'70px',sortable:true">商务支持</th>
									<th data-options="field:'establishmentTime',width:'100px',sortable:true">立项日期</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${page.list}" var="oaProject"  varStatus="status">
								<tr>
									<td>
										${oaProject.id}
									</td>
									<td>
										${oaProject.state}
									</td>
									<td>
										${fns:getRealState(oaProject)}
									</td>
									<td>
										${oaProject.createBy.id}
									</td>
									<td>
										${oaProject.projectNo}
									</td>
									<td>
										${oaProject.projectName}
									</td>
									<td>
										${fns:getDictLabel(fns:getRealState(oaProject), 'OaProject_state', '')}
									</td>
									<td>
										${oaProject.createBy.name}
									</td>
									<td>
										<c:if test="${not empty oaProject.startDate and not empty oaProject.planDay}"><div id="p" class="easyui-progressbar" data-options="value:'${fns:getRealProjectTimeProgress(oaProject)}'.replace(/%/, '')" style="width:100px;"></div></c:if>
									</td>
									<td>
										<fmt:formatDate value="${oaProject.startDate}" pattern="yyyy-MM-dd"/>
									</td>
									<td>
										<c:if test="${not empty oaProject.startDate and not empty oaProject.planDay}">${fns:getRealEndDate(oaProject,'yyyy-MM-dd')}</c:if>
									</td>
									<td>
										${oaProject.planDay}
									</td>
									
									<td>
										${oaProject.expectedMoney}
									</td>
									<td>
										${oaProject.projectMoney}
									</td>
									<td>
										${fns:getDictLabel(oaProject.projectStage, 'oa_project_projectStage', '')}
									</td>
									<td>
										${fns:getDictLabel(oaProject.contractType, 'oa_project_contractType', '')}
									</td>
									<td>
										<fmt:formatDate value="${oaProject.writeTime}" pattern="yyyy-MM-dd"/>
									</td>
									<td>
										${fns:getDictLabel(oaProject.writeWay, 'OaProject_writeWay', '')}
									</td>
									<td>
										${oaProject.accountManager.name}
									</td>
									<td>
										${oaProject.projectManager.name}
									</td>
									<td>
										${oaProject.businessManager.name}
									</td>
									<td>
										<fmt:formatDate value="${oaProject.establishmentTime}" pattern="yyyy-MM-dd"/>
									</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="tab-pane" id="projectCards">
						<div class="row" style="margin: 0;">
							<c:forEach items="${page.list}" var="oaProject" varStatus="status">
								<div class="col-xs-6 col-sm-4 col-lg-3">
									<div class="myoa-project-list ${fns:getRealStateStyle(fns:getRealState(oaProject))}">
										<div class="myoa-project" title="${oaProject.projectName}" style="cursor: pointer;" onclick="openDialogView('查看项目', '${ctx}/oa/project/oaProject/form?operation=view&id=${oaProject.id}','80%', '80%')" >
											<div class="myoa-project-name">
												<div >${oaProject.projectName}</div>
											</div>
												<div class="myoa-project-state">${fns:getDictLabel(fns:getRealState(oaProject), 'OaProject_state', '旧')}</div>
											<div class="myoa-progress">
												<div class="progress progress-striped">
													<div class="progress-bar" role="progressbar"
														 aria-valuenow="90" aria-valuemin="10" aria-valuemax="100"
														 style="width: <c:if test="${not empty oaProject.startDate and not empty oaProject.planDay}">${fns:getRealProjectTimeProgress(oaProject)}</c:if>;">
													</div>
												</div>
												<span style="display: inline-block;"><c:if test="${not empty oaProject.startDate and not empty oaProject.planDay}">${fns:getRealProjectTimeProgress(oaProject)}</c:if></span>
											</div>
											<ul class="myoa-project-time" style="height: 86px;'">
												<li><span>开始：</span>&nbsp;<span><c:if test="${not empty oaProject.startDate and not empty oaProject.planDay}"><fmt:formatDate value="${oaProject.startDate}" pattern="yyyy-MM-dd"/></c:if></span></li>
												<li><span>结束：</span>&nbsp;<span><c:if test="${not empty oaProject.startDate and not empty oaProject.planDay}">${fns:getRealEndDate(oaProject,'yyyy-MM-dd')}</c:if></span></li>
												<li><span>任务：</span>&nbsp;<span>${oaProject.oaPlanCount}</span></li>
											</ul>
											<p>${oaProject.accountName}</p>
											<p><span><i class="fa fa-circle" style="font-size: 8px;"></i>&nbsp;${fns:getDictLabel(oaProject.contractType, 'oa_project_contractType', '')}</span>
												&nbsp;&nbsp;&nbsp;&nbsp;
												<span><i class="fa fa-circle" style="font-size: 8px;"></i>&nbsp;${fns:getDictLabel(oaProject.ownedIndustry, 'oa_project_ownedIndustry', '')}</span>
											</p>
										</div>
										<div class="myoa-project-bot">
											<span class="pull-left" style="display: inline-block;"><fmt:formatDate value="${oaProject.createDate}" pattern="yyyy-MM-dd"/></span>
											<span class="pull-right" style="display: inline-block;">${oaProject.createBy.name}&nbsp;<span>创建</span></span>
										</div>
									</div>
								</div>	
							</c:forEach>
						</div>
					</div>					
				</div>
				<table:page page="${page}"></table:page>
			</div>
		</div>
	</div>
</body>
</html>