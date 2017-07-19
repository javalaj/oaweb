<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<html>
<head>
	<title>公文管理管理</title>
	<meta name="decorator" content="default"/>
	<script src="${ctxStatic}/jquery/jquery-ui-1.10.2.custom.min.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					oaLoading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
			$("#modal-container-262575").draggable({   
			    handle: ".modal-header",   
			    cursor: 'move',   
			    refreshPositions: false  
			}); 
		});
		
		
		//判断是否选择发送人
		function choose(){
			var upper = document.getElementById("userName").value;
			if(upper==null || upper==''){
				top.$.jBox.tip.mess = 1;
				top.$.jBox.tip("请选择发送人！", "error", {
					persistent : true,
					opacity : 0
				});
				$("#messageBox").show();
				return false;
			}
			$('#flag').val('yes')
			return true;
		}
		
		function cz(){
			var checkedList1 = new Array();
			$("input[name='subChk']:checked").each(function() { 
				checkedList1.push($(this).val()); 
				}); 
			alert(checkedList1.toString());
			}
		/* function save(){$("#modal-container-262575").hide();} */
		
	</script>
	<style type="text/css">
	h3{color: red;}
	.oaArchivestop{
		text-align:right;
}

.control-label{ color:red;}
.left{ width:50%;border-right: 1px solid red;}
.all{ height: 30px;}
.note{height:100px; }
.code{color:red;margin-left: 20px;}
.modal-content{ width:100%;height:100%;}
table td{
border-bottom:1px solid red;
}	
	</style>

</head>
<body>
 
	
	<form:form id="inputForm" modelAttribute="oaArchives" action="${ctx}/oa/oaArchives/save" method="post" class="breadcrumb form-search">
		<legend>${title }</legend>
		
		<form:hidden path="id"/>
		<form:hidden path="act.taskId"/>
		<form:hidden path="act.taskName"/>
		<form:hidden path="act.taskDefKey"/>
		<form:hidden path="act.procInsId"/>
		<form:hidden path="act.procDefId"/>
		<form:hidden id="flag" path="act.flag"/>
		<sys:message content="${message}"/>
		
	<ul class="ul-form">
<%-- 	<li class="btns"><input id="btnSave" class="btn btn-primary"  onclick="window.location.href='${ctx}/oa/oaArchives/save?isdraft=1'" type="button" value="保存"/></li> --%>
	<li class="btns"><a id="modal-262575" href="#modal-container-262575" role="button" class="btn btn-primary" data-toggle="modal">编辑正文</a>
			<div class="modal fade" id="modal-container-262575" role="dialog"   aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content" >
						<div class="modal-header">
							 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							<h4 class="modal-title" id="myModalLabel">
								正文
							</h4>
						</div>
						<div class="modal-body">
						
			<form:textarea path="content" htmlEscape="false" rows="20" maxlength="20000" class="input-xxlarge required"/>
				<sys:ckeditor replace="content" uploadPath="/oa/oaArchives" />			
						</div>
						<div class="modal-footer">
							 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button> <button type="button" class="btn btn-default" data-dismiss="modal">保存</button>
						</div>
					</div>
				</div>
			</div></li>
	<li class="btns"><input id="btnView" class="btn btn-primary" type="button"  onclick="javascript:window.location.href='${ctx}/act/process/resource/read?procDefId=oaArchives_audit:1:c1f5614f049e465a965860dba2620357&resType=image'"  value="查看流程图"/></li>
	<li class="btns">
<!-- 	<div class="form-actions"> -->
			<shiro:hasPermission name="oa:oaArchives:edit">
				<input id="btnSubmit" class="btn btn-primary" type="submit" value="提交" onclick="$('#flag').val('yes')"/>&nbsp;
				<c:if test="${not empty testAudit.id}">
					<input id="btnSubmit2" class="btn btn-inverse" type="submit" value="销毁申请" onclick="$('#flag').val('no')"/>&nbsp;
				</c:if>
			</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
<!-- 		</div> -->
	</li>
	</ul>
	
	<table class="table table-bordered">
	<caption><h3>${fns:getConfig('oaArchivesCaption')}</h3></caption>				
				<tbody>
				<tr>
				<td class="all" >
				
				<label class="control-label">发文字号：</label>	
				<form:select path="code" class="input-xlarge " id="code" >
					<form:option value="楚誉【】" label="楚誉字" />
					<form:options items="${fns:getDictList('code')}"  maxlength="64"  itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				
				
					</td>
					<td><label class="control-label">紧急程度：</label>
					<form:select path="urgency" class="input-xlarge ">
					<form:option value="2" label="普通"/>
					<form:options items="${fns:getDictList('urgency')}"  itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>	
				</td>
				
						
											
					</tr>
					<tr class="note">
						<td class="left" ><label class="control-label" for="manager">核稿：</label>			
				${oaArchives.leadText}
						<td class="right" colspan="2">
							<label class="control-label">拟稿部门和拟稿人：</label>
							${fns:getUser().office.name}&nbsp;${fns:getUser().name}
						</td>										
					</tr>
					<tr >
						<td class="all" colspan="3">
						<label class="control-label"  for="tilte">事由：</label>
						
						<form:input path="title" htmlEscape="false" id="title" maxlength="255" class="input-xlarge "/>
			<span class="help-inline"><font color="red">*</font> </span>
						</td></tr>
					<tr >
						<td class="all" colspan="3">
						<label class="control-label"  for="tilte">发文日期：</label>
						
						<input name="exeDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${oaArchives.exeDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
				<span class="help-inline"><font color="red">*</font> </span>
						</td></tr>
					<tr >
						<td class="all" colspan="3">
<!-- 						<label class="control-label">发送：</label> -->
<%-- 						<sys:treeselect id="user" name="user.id" --%>
<%-- 							 value="${oaArchives.user.id}" labelName="user.name"  --%>
<%-- 							 labelValue="${oaArchives.user.name}" --%>
<%-- 							 title="用户" url="/sys/office/treeData?type=3"  --%>
<%-- 							 cssClass="" allowClear="true" notAllowSelectParent="true" />
				 --%>
				 	
<!-- 				 		<div class="control-group"> -->
				<label class="control-label">接受人：</label>
				<div class="controls">
					<sys:treeselect id="oaArchivesRecord" name="oaArchivesRecordIds"
						value="${oaArchives.oaArchivesRecordIds}"
						labelName="oaArchivesRecordNames"
						labelValue="${oaArchives.oaArchivesRecordNames}" title="接收人"
						url="/sys/office/treeData?type=3" cssClass="required"
						
						notAllowSelectParent="true" notAllowSelectRoot="true"  
						checked="true" allowClear="true" />
					<span class="help-inline" id="tip"><font color="red">*</font> </span>
				</div>
<!-- 			</div> -->
				 		
						</td>											
					</tr>
<%-- 					<tr >
						<td class="all" colspan="3"> 
						<label class="control-label">抄送：</label>
						<sys:treeselect id="user" name="user.id" value="${oaArchives.user.id}" labelName="user.name" labelValue="${oaArchives.user.name}"
					title="用户" url="/sys/office/treeData?type=3" cssClass="" allowClear="true" notAllowSelectParent="true" />
					
						</td> 
												
					</tr> --%>
					<tr >
						<td class="all" colspan="3">
						<label class="control-label" for="contenthref">正文：</label>
						<a id="contenthref" href="">正文内容</a>	
						</td>											
					</tr>
					<tr>
					<td class="all" colspan="3">
						<label class="control-label">密级：</label>
					<form:select path="secrets" class="input-xlarge ">
					<form:option value="0" label="秘密"/>
					<form:options items="${fns:getDictList('secrets')}"  itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				</td>
					</tr>
					
					<tr >
						<td class="all" colspan="3">
 							<label class="control-label" for="files">相关部门会签：</label> 
<!-- 							<input type="checkbox" name="subChk" value="d093d3bb4f4d4b73a505bf7f459dfa30" />研发部 -->
<!-- 							<input type="checkbox" name="subChk" value="8ebd2702dc94495cba340752afaa3aa4" />技术部 -->
<!-- 							<input type="checkbox" name="subChk" value="c6fc7df0d2544c73967680cb2ca12f2a" />财务部 -->
<!-- 							<input type="checkbox" name="subChk" value="e8b417f79a2b47c5bd86820f622f1cba" />市场部 -->
<!-- 							<input type="checkbox" name="subChk" value="aff7b13d7a4c42728b4b07238f518810" />市场拓展部 -->
<!-- 							<input type="checkbox" name="subChk" value="9ca442a6b0684d4781d4fbc4fab276f9" />人事部 -->
							
							<form:checkboxes path="departmentsign" 
						items="${fns:getDictList('departmentsign')}" value="" itemLabel="label"
						itemValue="value" htmlEscape="false" class="departmentsign"/>
						</td>												
					</tr>
					
					<tr >
						<td class="all" colspan="3">
							<label class="control-label" for="files">附件：</label>
							<form:hidden id="files" path="files" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="files" type="files" uploadPath="/oa/oaArchives" selectMultiple="true"/>
						</td>
												
					</tr>
						<tr >
						<td class="all" colspan="3">
						<label class="control-label">主题词：</label>
					<form:input path="keyword" htmlEscape="false" maxlength="255" class="input-xlarge " />
					
						</td>
												
					</tr>
						<tr >
						<td class="all" colspan="3">
							<label class="control-label" for="checkText">技术部领导意见：</label>
							${oaArchives.checkText}
						</td>
												
					</tr>
						<tr >
						<td class="all" colspan="3">
						<label class="control-label" for="checkText1">研发部领导意见：</label>	
							${oaArchives.checkText1}
						</td>
												
					</tr>
						<tr >
						<td class="all" colspan="3">
							<label class="control-label" for="checkText2">市场拓展部领导意见：</label>
								${oaArchives.checkText2}
						</td>
												
					</tr>
						<tr >
						<td class="all" colspan="3">
							<label class="control-label" for="checkText3">市场部领导意见：</label>
							${oaArchives.checkText3}
						</td>
												
					</tr>
						<tr >
						<td class="all" colspan="3">
							<label class="control-label" for="checkText4">人事行政部领导意见：</label>
							${oaArchives.checkText4}
						</td>
												
					</tr>
						<tr >
						<td class="all" colspan="3">
						<label class="control-label" for="checkText5">财务部领导意见：</label>
						${oaArchives.checkText5}
						</td>
												
					</tr>
						<tr >
						<td class="all" colspan="3">
							<label class="control-label" for="managerText">总经理签发意见：</label>
							${oaArchives.managerText}
						</td>
												
					</tr>
				
				
					<tr >
						<td class="left">
							<label class="control-label">印发时间：</label>	
						</td>
						
						<td colspan="2">
								<label class="control-label">印发份数：</label>
						</td>						
					</tr>
					
						<tr >
						<td class="all" colspan="3">
							<label class="control-label" for="managerText">是否提交：</label>
							<input type="radio" value="0" name="isdraft"/>保存为草稿暂不提交
						</td>
												
					</tr>
				</tbody>
			</table>
		
		<c:if test="${task != null}">
				&nbsp;<input
				onclick='btnPNGshow("${task.processDefinitionId}/${task.executionId}");'
				class="btn" type="button" value="流程跟踪" />
		</c:if>
		
	</form:form>
	<c:if test="${not empty oaArchives.id}">
			<act:histoicFlow procInsId="${oaArchives.act.procInsId}" />
		</c:if>
</body>
</html>