<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>项目管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		var validateForm;
		function doSubmit(){//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
		  if(validateForm.form()){
			$("#inputForm").submit();
			 return true;
		  }
		  return false;
		}
		$(document).ready(function() {
			if($("#isBid").val()=="1"){
				$("#tr_expectedBidTime").show();
			}else{
				$("#tr_expectedBidTime").hide();
			}
			var tabIndex="${param.tabIndex}";
			if(tabIndex=="4"){
				$('#myTab a:eq(4)').tab('show');
			}
			validateForm=$("#inputForm").validate({
				rules: {
					"accountManager.name": {
				        required: true
				     },
					"businessManager.name": {
				        required: true
				     },
					"technicalManager.name": {
				        required: true
				     },
					"projectManager.name": {
				        required: true
				     },
				     "expectedMoney":{
				    	 number:true,
				    	 min:0,
				    	 max:9999999
				     },
				     "projectMoney":{
				    	 number:true,
				    	 min:0,
				    	 max:9999999
				     },
				     "contractMoney":{
				    	 number:true,
				    	 min:0,
				    	 max:9999999
				     },
				     "projectBgDescription": {
				    	 extMaxLength:499
					 },
				     "planDay":{
				    	 number:true,
				    	 min:1,
				    	 max:99999
				     }
				},
			    messages: {
			    	"accountManager.name": {
			          required: "必填信息",
			        },
			        "businessManager.name": {
				      required: "必填信息",
				    },
				    "technicalManager.name": {
					  required: "必填信息",
					},
			        "projectManager.name": {
			          required: "必填信息",
			        },
			        "projectBgDescription": {
			    		extMaxLength: "长度不得超过499个字符",
				    }
			    },
				submitHandler: function(form){
					oaLoading('正在提交，请稍候...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					/*if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						element.parent("div.input-append").parent("td").find("span font").html(error);
					} else {
						element.parent("td").find("span font").html(error);
					}*/
					
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
			$("#btnSubmit").click(function(){
				$('#myTab a:eq(2)').tab('show');
				var tag=$("#inputForm").valid();
				if(tag){
					$('#myTab a:eq(1)').tab('show');
					tag=$("#inputForm").valid();
					if(tag){
						$('#myTab a:eq(0)').tab('show');
						tag=$("#inputForm").valid();
						if(tag){
							$("#inputForm").submit();
						}
					}
				}
			});
			$("#ownedIndustry").change(function(){  
				$(this).valid();  
			});
			$("#contractType").change(function(){  
				$(this).valid();  
			});
			$("#isBid").change(function(){  
				$(this).valid();
				if($(this).val()=="1"){
					$("#tr_expectedBidTime").show();
				}else{
					$("#tr_expectedBidTime").hide();
				}
			});
			$("#projectStage").change(function(){  
				$(this).valid();
			});
			$("#accountManagerName").change(function(){  
				$(this).valid();  
			});
			$("#businessManagerName").change(function(){  
				$(this).valid();  
			});
			$("#technicalManagerName").change(function(){  
				$(this).valid();  
			});
			$("#projectManagerName").change(function(){  
				$(this).valid();  
			});
			$("#projectFile").change(function(){  
				$(this).valid();  
			});
		});
		
		
		
		
		function addRow(list, idx, tpl, row){
			$(list).append(Mustache.render(tpl, {
				idx: idx, delBtn: true, row: row
			}));
			$(list+idx).find("select").each(function(){
				$(this).val($(this).attr("data-value"));
			});
			$(list+idx).find("input[type='checkbox'], input[type='radio']").each(function(){
				var ss = $(this).attr("data-value").split(',');
				for (var i=0; i<ss.length; i++){
					if($(this).val() == ss[i]){
						$(this).attr("checked","checked");
					}
				}
			});
		}
		function delRow(obj, prefix){
			var id = $(prefix+"_id");
			var delFlag = $(prefix+"_delFlag");
			if (id.val() == ""){
				$(obj).parent().parent().remove();
			}else if(delFlag.val() == "0"){
				delFlag.val("1");
				$(obj).html("&divide;").attr("title", "撤销删除");
				$(obj).parent().parent().addClass("error");
			}else if(delFlag.val() == "1"){
				delFlag.val("0");
				$(obj).html("&times;").attr("title", "删除");
				$(obj).parent().parent().removeClass("error");
			}
		}
		
		function getOrders(){
			$("#btnGetOrders").attr("disabled",true);
			$("#btnGetOrders").val("正在获取编号中...");
			$.ajax({
				type: "POST",
				url: "${ctx}/orders/getGenerateOrderNo12",
				data: {orderNamePre:"PJ"},
				dataType: 'json',
				success: function(data){
					$("#projectNo").val(data.orders);
					$("#projectNo").valid();
					$("#btnGetOrders").attr("disabled",false);
					$("#btnGetOrders").val("自动获取编号");
				}
			});
		}
		function funAddMember(projectId){
			window.location.href = "${ctx}/oa/project/oaProjectMember/form?project.id="+projectId;
		}
	</script>
		<style>
		.table.myoa-newitem-table>tbody>tr>td {
			border-top-width: 0;
		}
		.table.myoa-newitem-table>tbody>tr>td:nth-child(odd) {
			width: 20%;
			text-align: right;
		}
		.table.myoa-newitem-table>tbody>tr>td:nth-child(even) {
			width: 80%;
		}
		#projectNo {
			width: 60%;
		}
	</style>
</head>
<body>
	<form:form id="inputForm" modelAttribute="oaProject" action="${ctx}/oa/project/oaProject/save" method="post" class="form-horizontal">
	<ul class="nav nav-tabs myoa-tabs" id="myTab">
		<!--<li><a href="javascript:void(0)" onclick="history.go(-1)">返 回</a></li>-->
		<li class="active"><a href="#base" data-toggle="tab">项目基本信息</a></li>
		<li><a href="#report" data-toggle="tab">周报(${oaProject.oaProjectWeekreportList.size()})</a></li>
		<li><a href="#document" data-toggle="tab">文档(${oaProject.oaProjectDocumentList.size()})</a></li>
		<c:if test="${not empty oaProject.id}">
			<c:set var="contractCount" value="0"></c:set>
			<c:set var="contractCount" value="${contractCount+oaContractSaless.size()+oaContractPurchases.size()+oaContractSubs.size()+oaContractProtocols.size() }"></c:set>
			<li><a href="#contract" data-toggle="tab">合同(${contractCount})</a></li>
			<li><a href="#member" data-toggle="tab">成员(${oaProject.oaProjectMemberList.size()})</a></li>
		</c:if>
	</ul><br/>
	
 	<div class="tab-content">  
        <div class="tab-pane active" id="base">  
				<input type="hidden" name="token" value="${token }">
				<form:hidden path="id"/>
				<sys:message content="${message}"/>
				<table class="table table-condensed dataTables-example dataTable no-footer myoa-newitem-table">
					<tr>
						<td colspan="2" class="active"><div style='text-align:left'><fieldset><legend>项目基础信息</legend></fieldset></div></td>
					</tr>
					<tr>
						<td>项目名称 <span class="help-inline"><font color="red">*</font> </span></td>
						<td>
							<form:input path="projectName" htmlEscape="false" maxlength="64" class="form-control required "/>							
						</td>						
					</tr>
					<tr>						
						<td>项目编号<c:if test="${empty oaProject.projectNo}"> <span class="help-inline"><font color="red">*</font></span></c:if></td>
						<td>
							<c:if test="${not empty oaProject.projectNo}">
								${oaProject.projectNo}
							</c:if>
							<c:if test="${empty oaProject.projectNo}">
								<form:input path="projectNo" htmlEscape="false" maxlength="64" class="form-control required "/>								
								<shiro:hasPermission name="oa:project:oaProject:edit">
									<input id="btnGetOrders" class="btn btn-primary" type="button" value="自动获取编号" onclick="getOrders();"/>&nbsp;
								</shiro:hasPermission>
							</c:if>
						</td>
					</tr>					
					<tr>
						<td>项目开始日期<c:if test="${empty oaProject.startDate}"> <span class="help-inline"><font color="red">*</font> </span></c:if></td>
						<td>
							<c:if test="${not empty oaProject.startDate}">
								<fmt:formatDate value="${oaProject.startDate}" pattern="yyyy-MM-dd"/>
							</c:if>
							<c:if test="${empty oaProject.startDate}">
								<input name="startDate" type="text" readonly="readonly" maxlength="20" class="Wdate laydate-icon form-control layer-date input-sm required"
									value="<fmt:formatDate value="${oaProject.startDate}" pattern="yyyy-MM-dd"/>"
									onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>	
							</c:if>
						</td>						
					</tr>
					<tr>						
						<td>计划工期 (工作天)<c:if test="${empty oaProject.planDay}"><span class="help-inline"><font color="red">*</font> </span></c:if></td>
						<td>
							<c:if test="${not empty oaProject.planDay}">
								${oaProject.planDay}
							</c:if>
							<c:if test="${empty oaProject.planDay}">
								<form:input path="planDay" htmlEscape="false" min="1" max="99999" class="form-control required number"/>	
							</c:if>
														
						</td>
					</tr>
					<tr>
						<td>项目阶段 <span class="help-inline"><font color="red">*</font> </span></td>
						<td>
							<form:select path="projectStage" class="form-control selectpicker required" data-style="btn-inverse" data-live-search="true">
								<form:options items="${fns:getDictList('oa_project_projectStage')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>						
						</td>
					</tr>									
					<tr>
						<td>客户经理 <span class="help-inline"><font color="red">*</font> </span></td>
						<td>
							<sys:treeselect id="accountManager" name="accountManager.id" value="${empty oaProject.accountManager.id?fns:getUser().id:oaProject.accountManager.id}" labelName="accountManager.name" labelValue="${empty oaProject.accountManager.name?fns:getUser().name:oaProject.accountManager.name}" title="客户经理" url="/sys/office/treeData?type=3" cssClass="form-control" allowClear="true" notAllowSelectParent="true"/>							
						</td>						
					</tr>
					<tr>						
						<td>客户名称 <span class="help-inline"><font color="red">*</font> </span></td>
						<td>
							<form:input path="accountName" htmlEscape="false" maxlength="64" class="form-control required"/>							
						</td>
					</tr>
					<tr>
						<td>所属行业 <span class="help-inline"><font color="red">*</font> </span></td>
						<td>
							<form:select path="ownedIndustry" class="form-control selectpicker required" data-style="btn-inverse" data-live-search="true">
								<form:options items="${fns:getDictList('oa_project_ownedIndustry')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>							
						</td>						
					</tr>
					<tr>						
						<td>服务类别 <span class="help-inline"><font color="red">*</font> </span></td>
						<td>
							<form:select path="contractType" class="form-control selectpicker required" data-style="btn-inverse" data-live-search="true">
								<form:options items="${fns:getDictList('oa_project_contractType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>							
						</td>
					</tr>
					<tr>						
						<td>立项日期 <span class="help-inline"><font color="red">*</font> </span></td>
						<td>
							<input name="establishmentTime" type="text" readonly="readonly" maxlength="20" class="Wdate laydate-icon form-control layer-date input-sm required"
								value="<fmt:formatDate value="${oaProject.establishmentTime}" pattern="yyyy-MM-dd"/>"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>							
						</td>
					</tr>
					<tr>
						<td>是否投标 <span class="help-inline"><font color="red">*</font> </span></td>
						<td>
							<form:select path="isBid" class="form-control selectpicker required" data-style="btn-inverse" data-live-search="true">
								<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>							
						</td>
						
					</tr>
					<tr id="tr_expectedBidTime">
						<td>
							预计投标日期 
							<c:if test="${empty oaProject.expectedBidTime}"><span class="help-inline"><font color="red">*</font> </span></c:if>
						</td>
						<td>
							<c:if test="${empty oaProject.expectedBidTime}">
								<input name="expectedBidTime" type="text" readonly="readonly" maxlength="20" class="Wdate laydate-icon form-control layer-date input-sm required"
									value="<fmt:formatDate value="${oaProject.expectedBidTime}" pattern="yyyy-MM-dd"/>"
									onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
							</c:if>
							<c:if test="${not empty oaProject.expectedBidTime}">
								<fmt:formatDate value="${oaProject.expectedBidTime}" pattern="yyyy-MM-dd"/>
							</c:if>	
						</td>
					</tr>
					
					<%-- <tr>
						<td>商务支持 <span class="help-inline"><font color="red">*</font> </span></td>
						<td>
							<sys:treeselect id="businessManager" name="businessManager.id" value="${oaProject.businessManager.id}" labelName="businessManager.name" labelValue="${oaProject.businessManager.name}"
								title="商务支持" url="/sys/office/treeData?type=3" cssClass="form-control" allowClear="true" notAllowSelectParent="true"/>							
						</td>						
					</tr> --%>
					<%-- <tr>						
						<td>技术支持 <span class="help-inline"><font color="red">*</font> </span></td>
						<td>
							<sys:treeselect id="technicalManager" name="technicalManager.id" value="${oaProject.technicalManager.id}" labelName="technicalManager.name" labelValue="${oaProject.technicalManager.name}"
								title="技术支持" url="/sys/office/treeData?type=3" cssClass="form-control" allowClear="true" notAllowSelectParent="true"/>							
						</td>
					</tr> --%>
					
					<%-- <tr>
						<td>项目附件</td>
						<td>
							<oa:ckfinder input="projectFile" value="${oaProject.projectFile}" type="files" uploadPath="/oa/project/oaProjectApproval" selectMultiple="true"/>
						</td>
					</tr> --%>
					<tr>
						<td colspan="2" class="active"><div style='text-align:left'><fieldset><legend>其他信息</legend></fieldset></div></td>
					</tr>
					<tr>
						<td>项目背景描述</td>
						<td>
							<form:textarea path="projectBgDescription" htmlEscape="false" rows="4" class="form-control "/>							
						</td>
					</tr>
					<tr>
						<td>
							预计金额
						</td>
						<td>
							<c:if test="${empty oaProject.expectedMoney}">
								<form:input path="expectedMoney" htmlEscape="false" class="form-control number"/>
							</c:if>
							<c:if test="${not empty oaProject.expectedMoney}">
								${oaProject.expectedMoney}
							</c:if>							
						</td>						
					</tr>
					<tr>
						<td>项目金额 </td>
						<td>
							<form:input path="projectMoney" htmlEscape="false" max="9999999" class="form-control number "/>							
						</td>
					</tr>
					
					
					<%-- <tr>
						<td>工程经理 <span class="help-inline"><font color="red">*</font> </span></td>
						<td>
							<sys:treeselect id="projectManager" name="projectManager.id" value="${oaProject.projectManager.id}" labelName="projectManager.name" labelValue="${oaProject.projectManager.name}"
							title="用户" url="/sys/office/treeData?type=3" cssClass="form-control" allowClear="true" notAllowSelectParent="true"/>							
						</td>
					</tr> --%>
					
					<tr>
						<td>实际投标日期 </td>
						<td>
							<oa:datePicker pattern="yyyy-MM-dd" id="actualBidTime" value="${oaProject.actualBidTime}" isShowClear="true" cssClass="" />
						</td>
					</tr>
					<tr>
						<td>
							预计签约时间
						</td>
						<td>
							<c:if test="${empty oaProject.bookContractTime}">
								<oa:datePicker pattern="yyyy-MM-dd" id="bookContractTime" value="${oaProject.bookContractTime}" isShowClear="true" cssClass="" />
							</c:if>
							<c:if test="${not empty oaProject.bookContractTime}">
								<fmt:formatDate value="${oaProject.bookContractTime}" pattern="yyyy-MM-dd"/>
							</c:if>	
						</td>
					</tr>					
					<%-- <tr>
						<td>项目启动日期 <span class="help-inline"><font color="red">*</font> </span></td>
						<td>
							<input name="projectStartTime" type="text" readonly="readonly" maxlength="20" class="Wdate laydate-icon form-control layer-date input-sm required"
							value="<fmt:formatDate value="${oaProject.projectStartTime}" pattern="yyyy-MM-dd"/>"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>							
						</td>
					</tr> --%>
				</table>
				<br>
				<c:if test="${oaProject.oaProjectOperationList.size()>0}">
				<table id="contentTable" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
					<thead>
						<tr>
							<th colspan="3"><div style='text-align:left'><fieldset><legend>项目数据变更情况</legend></fieldset></div></th>
						</tr>
						<tr>
							<th>变更描述</th>
							<th>变更时间</th>
							<th>变更人</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${oaProject.oaProjectOperationList}" var="oaProjectOperation">
						<tr>
							<td title="${oaProjectOperation.operationDescription}">
								${fns:abbr2(oaProjectOperation.operationDescription,64)}
							</td>
							<td>
								<fmt:formatDate value="${oaProjectOperation.operationTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
							</td>
							<td>
								${oaProjectOperation.operationPerson.name}
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				</c:if>				
        </div>  
        <div class="tab-pane" id="report" >
			<table id="contentTable" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
				<thead>
					<tr>
						<th class="hide"></th>
						<th>标题 <span class="help-inline"><font color="red">*</font></span></th>
						<th>周报文档</th>
						<th>编号</th>
						<th>填写人</th>
						<th>完成任务数 <span class="help-inline"><font color="red">*</font> </span></th>
						<th>新增任务数 <span class="help-inline"><font color="red">*</font> </span></th>
						<th>更新人</th>
						<shiro:hasPermission name="oa:project:oaProject:edit"><th width="10">&nbsp;</th></shiro:hasPermission>
					</tr>
				</thead>
				<tbody id="oaProjectWeekreportList">
				</tbody>
				<shiro:hasPermission name="oa:project:oaProject:edit">
				<c:if test="${(fns:getUser().id eq oaProject.createBy.id and param.operation ne 'view') or empty oaProject.id}"><tfoot>
					<tr>
						<td colspan="10">
							<a href="javascript:void(0);"
								class="btn btn-white btn-sm" onclick="addRow('#oaProjectWeekreportList', oaProjectWeekreportRowIdx, oaProjectWeekreportTpl);oaProjectWeekreportRowIdx = oaProjectWeekreportRowIdx + 1;"><i class="fa fa-plus"> 新增</i> </a> 
						</td>
					</tr>
				</tfoot></c:if></shiro:hasPermission>
			</table>
			<script type="text/template" id="oaProjectWeekreportTpl">//<!--
						<tr id="oaProjectWeekreportList{{idx}}">
							<td class="hide">
								<input id="oaProjectWeekreportList{{idx}}_id" name="oaProjectWeekreportList[{{idx}}].id" type="hidden" value="{{row.id}}"/>
								<input id="oaProjectWeekreportList{{idx}}_delFlag" name="oaProjectWeekreportList[{{idx}}].delFlag" type="hidden" value="0"/>
							</td>
							<td>
								<input id="oaProjectWeekreportList{{idx}}_title" name="oaProjectWeekreportList[{{idx}}].title" type="text" value="{{row.title}}" maxlength="64" class="form-control required"/>
															
							</td>
							<td style="width:115px">
								<input id="oaProjectWeekreportList{{idx}}_projectReportFile" name="oaProjectWeekreportList[{{idx}}].projectReportFile" type="hidden" value="{{row.projectReportFile}}" maxlength="1000"/>
								<sys:ckfinder input="oaProjectWeekreportList{{idx}}_projectReportFile" type="files" uploadPath="/oa/project/oaProject" selectMultiple="true"/>
							</td>
							<td>
								{{row.reportNo}}
							</td>
							<td>
								{{row.writeUser.name}}</td>
							<td>
								<input id="oaProjectWeekreportList{{idx}}_completedTask" name="oaProjectWeekreportList[{{idx}}].completedTask" type="text" value="{{row.completedTask}}" maxlength="64" class="form-control number required"/>
															
							</td>
							<td>
								<input id="oaProjectWeekreportList{{idx}}_addedTask" name="oaProjectWeekreportList[{{idx}}].addedTask" type="text" value="{{row.addedTask}}" maxlength="64" class="form-control number required"/>
								
							</td>
							<td>
								{{row.updateUser.name}}								
							</td>
							<shiro:hasPermission name="oa:project:oaProject:edit"><td class="text-center" width="10">
								{{#delBtn}}<span class="close" onclick="delRow(this, '#oaProjectWeekreportList{{idx}}')" title="删除">&times;</span>{{/delBtn}}
							</td></shiro:hasPermission>
						</tr>//-->
					</script>
			<script type="text/javascript">
				var oaProjectWeekreportRowIdx = 0, oaProjectWeekreportTpl = $("#oaProjectWeekreportTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
				$(document).ready(function() {
					var data = ${fns:toJson(oaProject.oaProjectWeekreportList)};
					for (var i=0; i<data.length; i++){
						addRow('#oaProjectWeekreportList', oaProjectWeekreportRowIdx, oaProjectWeekreportTpl, data[i]);
						oaProjectWeekreportRowIdx = oaProjectWeekreportRowIdx + 1;
					}
				});
			</script>       	  
        </div>
        <div class="tab-pane" id="document" >  
			<table id="contentTable" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
				<thead>
					<tr>
						<th class="hide"></th>
						<th>文档名称</th>
						<th>上传人</th>
						<th>上传时间</th>
						<th>更新人</th>
						<th>更新时间</th>
						<th>版本号</th>
						<shiro:hasPermission name="oa:project:oaProject:edit"><th width="10">&nbsp;</th></shiro:hasPermission>
					</tr>
				</thead>
				<tbody id="oaProjectDocumentList">
				</tbody>
				
				
				<shiro:hasPermission name="oa:project:oaProject:edit">
				<c:if test="${(fns:getUser().id eq oaProject.createBy.id and param.operation ne 'view') or empty oaProject.id}">
				<tfoot>
					<tr>
						<td colspan="10">
							<a href="javascript:"
								class="btn btn-white btn-sm" onclick="addRow('#oaProjectDocumentList', oaProjectDocumentRowIdx, oaProjectDocumentTpl);oaProjectDocumentRowIdx = oaProjectDocumentRowIdx + 1;"><i class="fa fa-plus"> 新增</i> </a> 
						</td>
					</tr>
				</tfoot></c:if></shiro:hasPermission>
			</table>
			<script type="text/template" id="oaProjectDocumentTpl">//<!--
						<tr id="oaProjectDocumentList{{idx}}">
							<td class="hide">
								<input id="oaProjectDocumentList{{idx}}_id" name="oaProjectDocumentList[{{idx}}].id" type="hidden" value="{{row.id}}"/>
								<input id="oaProjectDocumentList{{idx}}_delFlag" name="oaProjectDocumentList[{{idx}}].delFlag" type="hidden" value="0"/>
							</td>
							<td>
								<input id="oaProjectDocumentList{{idx}}_projectFile" name="oaProjectDocumentList[{{idx}}].projectFile" type="hidden" value="{{row.projectFile}}" maxlength="1000"/>
								<sys:ckfinder input="oaProjectDocumentList{{idx}}_projectFile" type="files" uploadPath="/oa/project/oaProject" selectMultiple="true"/>
							</td>
							<td>
								{{row.uploadUser.name}}	
							</td>
							<td>
								{{row.createDate}}
							</td>
							<td>
								{{row.updateUser.name}}
							</td>
							<td>
								{{row.updateDate}}
							</td>
							<td>
								{{row.fileVersion}}
							</td>
							<shiro:hasPermission name="oa:project:oaProject:edit"><td class="text-center" width="10">
								{{#delBtn}}<span class="close" onclick="delRow(this, '#oaProjectDocumentList{{idx}}')" title="删除">&times;</span>{{/delBtn}}
							</td></shiro:hasPermission>
						</tr>//-->
					</script>
			<script type="text/javascript">
				var oaProjectDocumentRowIdx = 0, oaProjectDocumentTpl = $("#oaProjectDocumentTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
				$(document).ready(function() {
					var data = ${fns:toJson(oaProject.oaProjectDocumentList)};
					for (var i=0; i<data.length; i++){
						addRow('#oaProjectDocumentList', oaProjectDocumentRowIdx, oaProjectDocumentTpl, data[i]);
						oaProjectDocumentRowIdx = oaProjectDocumentRowIdx + 1;
					}
				});
			</script>
		</div>
		
		<div class="tab-pane" id="contract" >
			<c:if test="${contractCount<1}">
				<div style='text-align:left'><fieldset><legend>目前没有相关的合同信息</legend></fieldset></div>
			</c:if>
			<c:if test="${oaContractSaless.size()>0}">
				<table id="contentTable" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
					<thead>
						<tr>
							<th colspan="5"><div style='text-align:left'><fieldset><legend>销售合同</legend></fieldset></div></th>
						</tr>
						<tr>
							<th>序号</th>
							<th>合同编号</th>
							<th>合同名称</th>
							<th>签订日期</th>
							<th>合同金额</th>
						</tr>
					</thead>
					<tbody>
					<c:set var="count" value="0"></c:set>
					<c:forEach items="${oaContractSaless}" var="oaContractSales" varStatus="status">
						<tr>
							<td style="width:24px">
								${status.count}
							</td>
							<td style="width:24%">
								${oaContractSales.contractNo}
							</td>
							<td title="${oaContractSales.contractName}"  style="width:24%">
								${fns:abbr2(oaContractSales.contractName,32)}
							</td>
							<td style="width:24%">
								<fmt:formatDate value="${oaContractSales.contractTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
							</td>
							<td>
								${oaContractSales.contractMoney}
							</td>
						</tr>
						<c:set var="count" value="${count+oaContractSales.contractMoney }"></c:set>
					</c:forEach>
						<tr>
							<td colspan="4">
								合计
							</td>
							<td>
								${count}
							</td>
						</tr>
					</tbody>
				</table>
			</c:if>
			<c:if test="${oaContractPurchases.size()>0}">
				<table id="contentTable" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
					<thead>
						<tr>
							<th colspan="5"><div style='text-align:left'><fieldset><legend>采购合同</legend></fieldset></div></th>
						</tr>
						<tr>
							<th>序号</th>
							<th>合同编号</th>
							<th>合同名称</th>
							<th>签订日期</th>
							<th>合同金额</th>
						</tr>
					</thead>
					<tbody>
					<c:set var="count" value="0"></c:set>
					<c:forEach items="${oaContractPurchases}" var="oaContractPurchase" varStatus="status">
						<tr>
							<td style="width:24px">
								${status.count}
							</td>
							<td style="width:24%">
								${oaContractPurchase.contractNo}
							</td>
							<td title="${oaContractPurchase.contractName}" style="width:24%">
								${fns:abbr2(oaContractPurchase.contractName,32)}
							</td>
							<td style="width:24%">
								<fmt:formatDate value="${oaContractPurchase.contractTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
							</td>
							<td>
								${oaContractPurchase.contractMoney}
							</td>
						</tr>
						<c:set var="count" value="${count+oaContractPurchase.contractMoney }"></c:set>
					</c:forEach>
						<tr>
							<td colspan="4">
								合计
							</td>
							<td>
								${count}
							</td>
						</tr>
					</tbody>
				</table>
			</c:if>
			<c:if test="${oaContractSubs.size()>0}">
				<table id="contentTable" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
					<thead>
						<tr>
							<th colspan="5"><div style='text-align:left'><fieldset><legend>分包合同</legend></fieldset></div></th>
						</tr>
						<tr>
							<th>序号</th>
							<th>合同编号</th>
							<th>合同名称</th>
							<th>签订日期</th>
							<th>合同金额</th>
						</tr>
					</thead>
					<tbody>
					<c:set var="count" value="0"></c:set>
					<c:forEach items="${oaContractSubs}" var="oaContractSub" varStatus="status">
						<tr>
							<td style="width:24px">
								${status.count}
							</td>
							<td style="width:24%">
								${oaContractSub.contractNo}
							</td>
							<td title="${oaContractSub.contractName}" style="width:24%">
								${fns:abbr2(oaContractSub.contractName,32)}
							</td>
							<td style="width:24%">
								<fmt:formatDate value="${oaContractSub.contractTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
							</td>
							<td>
								${oaContractSub.contractMoney}
							</td>
						</tr>
						<c:set var="count" value="${count+oaContractSub.contractMoney }"></c:set>
					</c:forEach>
						<tr>
							<td colspan="4">
								合计
							</td>
							<td>
								${count}
							</td>
						</tr>
					</tbody>
				</table>
			</c:if>
			<c:if test="${oaContractProtocols.size()>0}">
				<table id="contentTable" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
					<thead>
						<tr>
							<th colspan="5"><div style='text-align:left'><fieldset><legend>协议框架</legend></fieldset></div></th>
						</tr>
						<tr>
							<th>序号</th>
							<th>合同编号</th>
							<th>合同名称</th>
							<th>签订日期</th>
							<th>合同金额</th>
						</tr>
					</thead>
					<tbody>
					<c:set var="count" value="0"></c:set>
					<c:forEach items="${oaContractProtocols}" var="oaContractProtocol" varStatus="status">
						<tr>
							<td style="width:24px">
								${status.count}
							</td>
							<td style="width:24%">
								${oaContractProtocol.contractNo}
							</td>
							<td title="${oaContractProtocol.contractName}" style="width:24%">
								${fns:abbr2(oaContractProtocol.contractName,32)}
							</td>
							<td style="width:24%">
								<fmt:formatDate value="${oaContractProtocol.contractTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
							</td>
							<td>
								${oaContractProtocol.contractMoney}
							</td>
						</tr>
						<c:set var="count" value="${count+oaContractProtocol.contractMoney }"></c:set>
					</c:forEach>
						<tr>
							<td colspan="4">
								合计
							</td>
							<td>
								${count}
							</td>
						</tr>
					</tbody>
				</table>
			</c:if>
		</div>
		
		<div class="tab-pane" id="member" >
			<shiro:hasPermission name="oa:project:oaProjectMember:edit">
				<c:if test="${fns:getUser().id eq oaProject.createBy.id and param.operation ne 'view'}">
				<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
					<tr>
						<td class="width-15 active" >操作</td>
						<td><input id="btnAddMember" class="btn btn-primary" type="button" value="添加成员" onclick="funAddMember('${oaProject.id}');"/></td>
					</tr>
				</table>
				</c:if>
			</shiro:hasPermission>
			<c:if test="${oaProject.oaProjectMemberList.size()<1}">
				<div style='text-align:left'><fieldset><legend>目前没有相关的成员信息</legend></fieldset></div>
			</c:if>
			<c:if test="${oaProject.oaProjectMemberList.size()>0}">
				<table id="contentTable" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
					<thead>
						<tr>
							<th>成员名称</th>
							<th>成员类别</th>
							<th>职责</th>
							<th>创建时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${oaProject.oaProjectMemberList}" var="oaProjectMember">
							<tr>
								<td>
									${oaProjectMember.user.name}
								</td>
								<td>
									${fns:getDictLabel(oaProjectMember.type, 'OaProjectMember_type', '')}
								</td>
								
								<td>
									${oaProjectMember.duty}
								</td>
								<td>
									<fmt:formatDate value="${oaProjectMember.createDate}" pattern="yyyy-MM-dd"/>
								</td>
								
								<td style="width:120px">
									<shiro:hasPermission name="oa:project:oaProjectMember:edit">
										<c:if test="${fns:getUser().id eq oaProject.createBy.id and param.operation ne 'view' and oaProjectMember.sourceType ne '0'}">
											<a href="${ctx}/oa/project/oaProjectMember/form?id=${oaProjectMember.id}"
													class="btn btn-success btn-xs"><i class="fa fa-edit"></i>修改</a>
											<a href="${ctx}/oa/project/oaProjectMember/delete?id=${oaProjectMember.id}" onclick="return confirmx('确认要删除该成员吗？', this.href)"
													class="btn btn-danger btn-xs"><i class="fa fa-trash"></i>删除</a>	
										</c:if>
									</shiro:hasPermission>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
		</div>		
    </div> 
    </form:form>
</body>
</html>