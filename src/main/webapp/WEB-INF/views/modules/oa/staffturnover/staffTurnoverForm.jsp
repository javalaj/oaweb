<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>人员异动申请</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
	function goBack(){
		
		var strUrl=document.referrer;
		
		var arrObj=strUrl.split("//");
		var start=arrObj[1].indexOf("/");
		var end=arrObj[1].indexOf(";");
		var newurl=arrObj[1].substring(start);
		if(end>0){
			var newurl=arrObj[1].substring(start,end);
			}
		
		 if(newurl == "/oa/a/oa/staffturnover/staffTurnover" || 
			newurl == "/oa/a/oa/staffturnover/staffTurnover/?repage"){
			window.location.href="${ctx}/oa/staffturnover/staffTurnover";			
		}else{
			history.go(-1);
		} 
	}
	
	function del1line(item) 
	{
		$(item).next().val("1");
		
		$(item).parent().parent().remove();
		
		return false;
	}
	
	function onAccount()
	{
		$("#gz").show();
		
		$("#fy").hide();
	}
	
	function wonAccount()
	{
		$("#gz").hide();
		
		$("#fy").hide();
	}
	
	function fonAccount()
	{
		$("#gz").hide();
		
		$("#fy").show();
	}
	
	function add1line(obj)
	{
		var time = new Date().getTime();
	
		var project = "name='workTurnOvers[" + time +"].project'"; 
		
		var content = "name='workTurnOvers[" + time +"].content'";
		
		var number = "name='workTurnOvers[" + time +"].number'";
		
		var remarks = "name='workTurnOvers[" + time +"].remarks'";
		
		$(obj)
			.parent()
			.parent()
			.before(
					"<tr><td align='center'><input type='text'" + project + "class='form-control required' maxlength='10' style='width: 80%;'/>\
					<span class='help-inline'><font color='red'>*</font> </span></td>\
					<td align='center'><input type='text'" + content + " class='form-control required' maxlength='30' style='width: 90%;'/>\
					<span class='help-inline'><font color='red'>*</font> </span></td>\
					<td align='center'><input type='text'" + number + " class='form-control myNumber' maxlength='2'/>\
					<span class='help-inline'> </span></td>\
					<td align='center'><input type='text'" + remarks + " class='form-control' maxlength='20'/></td>\
					<td><a onclick='del1line(this)'><img class='add-del-png' src='${ctxStatic}/images/del.png'></a></td></tr>");
	}
	
	function addline(obj)
	{
		var time = new Date().getTime();
	
		var project = "name='assetsTurnOvers[" + time +"].assetsName'"; 
		
		var number = "name='assetsTurnOvers[" + time +"].number'";
		
		var remarks = "name='assetsTurnOvers[" + time +"].remarks'";
		
		$(obj)
			.parent()
			.parent()
			.before(
					"<tr><td align='center'><input type='text'" + project + " class='form-control required' maxlength='10' style='width: 90%;'/>\
					<span class='help-inline'><font color='red'>*</font> </span></td>\
					<td align='center'><input type='text'" + number + " class='form-control myNumber' maxlength='2' style='width: 50%;'/>\
					<span class='help-inline'> </span></td>\
					<td align='center'><input type='text'" + remarks + " class='form-control ' maxlength='20' style='width: 90%;'/></td>\
					<td><a onclick='del1line(this)'><img class='add-del-png' src='${ctxStatic}/images/del.png'></a></td></tr>");
	}
	
		$(document).ready(function() {
		
		//默认无挂账
		$("#wg").attr('checked',true);
		
		var type = '${staffTurnover.type}';
		
		if ('5' == type)
			$(".hxx").hide();
		
		$("#type6").click(function(){
			$(".hxx").hide();
		});
		
		$("#type1").click(function(){
			$(".hxx").show();
		});
		$("#type2").click(function(){
			$(".hxx").show();
		});
		$("#type3").click(function(){
			$(".hxx").show();
		});
		$("#type4").click(function(){
			$(".hxx").show();
		});
		$("#type5").click(function(){
			$(".hxx").show();
		});
				
		$("#btnPrint").click(function(){
			var src="${ctx}/oa/staffturnover/staffTurnover/print?id=${staffTurnover.id}";
			top.layer.open({
				  type: 2, 
				  area: [$("body").width()+'px', $("body").height()+'px'],
				  title: "打印预览", 
		          maxmin: true, 
		          shadeClose: true,
				  content: src
			});
		});
		
		 $("#btnViewCommen").click(function(){
				var src="${ctx}/act/process/resource/read?procDefId=${fns:getWorkflowVarValue('staff_turnover','procDefId','')}&resType=image";
				if("${not empty applyFixedAssets.procInsId}"=="true"){
					src="${ctx}/act/task/trace/photo/${fns:getWorkflowVarValue('staff_turnover','procDefId','')}/${staffTurnover.procInsId}";
				}
				top.layer.open({
					  type: 2, 
					  area: [$("body").width()+'px', $("body").height()+'px'],
					  title: "人员异动流程图", 
			          maxmin: true, 
			          shadeClose: true,
					  content: src
				});	
			}); 
		
		$("#btnView").click(function(){
			var src="${ctx}/act/task/trace/photo/${fns:getWorkflowVarValue('staff_turnover','procDefId','')}/${staffTurnover.procInsId}";
			top.layer.open({
				  type: 2, 
				  area: [$("body").width()+'px', $("body").height()+'px'],
				  title: "人员异动流程图",
		          maxmin: true, 
		          shadeClose: true,
				  content: src 
			});
		});			
		//添加到样式规则名
	 	jQuery.validator.addClassRules("myNumber", {  
			required: true,  
			number:true,
			min:1,
			max:999  
		});	
		//$("#name").focus();
		$("#inputForm").validate({
			rules: {
					"workTakeoverAcceptor.name": {
				        required: true
				     },
					"workTurnoverReceiver.name": {
				        required: true
				     },
				     "deptAfter.name": {
				        required: true
				     },
					"assetsTurnoverReceiver.name": {
				        required: true
				     },
					"assetsTakeoverAcceptor.name": {
				        required: true
				     }
				},
			    messages: {
			    	"workTakeoverAcceptor.name": {
			          required: "必填信息",
			        },
			        "workTurnoverReceiver.name": {
				      required: "必填信息",
				    },
				    "deptAfter.name": {
				      required: "必填信息",
				    },
				    "assetsTurnoverReceiver.name": {
					  required: "必填信息",
					},
			        "assetsTakeoverAcceptor.name": {
			          required: "必填信息",
			        }
			    },
			submitHandler: function(form){
				oaLoading('正在提交，请稍候...',3600);
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
		
		$("#workTakeoverAcceptor").change(function(){  
				$(this).valid();  
		});
		
		$("#workTurnoverReceiver").change(function(){  
				$(this).valid();  
		});
		
		$("#deptAfter").change(function(){  
				$(this).valid();  
		});
		
		$("#assetsTurnoverReceiver").change(function(){  
				$(this).valid();  
		});
		
		$("#assetsTakeoverAcceptor").change(function(){  
				$(this).valid();  
		});
		
	});
	</script>
<style type="text/css">
.add-del-png {
	width: 15px;
	height: 15px;
}	
</style>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
	<div class="ibox">
		<div class="ibox-title">
			<h5>人员异动流程</h5>		
		</div>
	    <div class="ibox-content" style="padding: 5px 0;">
			<form:form id="inputForm" modelAttribute="staffTurnover" action="${ctx}/oa/staffturnover/staffTurnover/save" method="post" class="form-horizontal">
				<form:hidden path="id"/>
				<form:hidden path="act.taskId"/>
				<form:hidden path="act.taskName"/>
				<form:hidden path="act.taskDefKey"/>
				<form:hidden path="act.procInsId"/>
				<form:hidden path="act.procDefId"/>
				<form:hidden id="flag" path="act.flag"/>
				<sys:message content="${message}"/>
				<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
					<tr>
						<td class="active" colspan="7"><div style='text-align:left'>
							<input id="btnCancel" class="btn" type="button" value="返 回" onclick="goBack();"/>&nbsp;  
							<input id="btnPrint" type="button" value="打印" class="btn btn-primary"/>&nbsp;
							<c:if test="${empty staffTurnover.act.taskDefKey}">
								<input id="btnViewCommen" class="btn btn-primary" type="button" value="查看流程图"/>&nbsp;
							</c:if>
							<c:if test="${not empty staffTurnover.act.taskDefKey}">
								<input id="btnView" class="btn btn-primary" type="button" value="查看流程图"/>&nbsp;
							</c:if>
							<shiro:hasPermission name="oa:staffturnover:staffTurnover:edit">
								<c:if test="${empty staffTurnover.act.taskDefKey}">
									<c:if test="${staffTurnover.isStart ne '1'}">
										<input id="btnSave" class="btn btn-primary" type="submit" value="存草稿" onclick="$('#flag').val('save')"/>&nbsp;
										<input id="btnSubmit" class="btn btn-primary" type="submit" value="提交申请"  onclick="$('#flag').val('true')"/>&nbsp;
									</c:if>
								</c:if>
								<c:if test="${not empty staffTurnover.act.taskDefKey}">
									<c:if test="${staffTurnover.act.taskDefKey eq 'exam1'}">
										<input id="btnSave" class="btn btn-primary" type="submit" value="存草稿" onclick="$('#flag').val('save')"/>&nbsp;
										<input id="btnSubmit" class="btn btn-primary" type="submit" value="重新提交申请"  onclick="$('#flag').val('true')"/>&nbsp;
										<input id="btnSubmit2" class="btn btn-inverse" type="submit" value="销毁申请" onclick="$('#flag').val('3')"/>&nbsp;
									</c:if>
									<c:if test="${staffTurnover.act.taskDefKey ne 'exam1'}">
										<input id="btnSubmit" class="btn btn-primary" type="submit" value="同意"  onclick="$('#flag').val('true')"/>&nbsp;
										<input id="btnSubmit2" class="btn btn-inverse" type="submit" value="驳回" onclick="$('#flag').val('false')"/>&nbsp;
									</c:if>
								</c:if>
							</shiro:hasPermission>
						</div></td>
					</tr>		
					<tr>
						<td class="active" colspan="7">
							<div style='text-align:center;'>
								<fieldset>
									<legend>人员异动申请表</legend>
								</fieldset>
							</div>
						</td>
					</tr>
					<tr>
						<td rowspan="8" class="active" style="width: 10%;">① 由员工填写</td>
						<td class="width-15 active">姓名</td>
						<td class="width-15">
							<c:if test="${staffTurnover.isStart ne '1' or staffTurnover.act.taskDefKey eq 'exam1'}">
								${empty staffTurnover.user.name?fns:getUser().name:staffTurnover.user.name}
							</c:if>
							<c:if test="${!(staffTurnover.isStart ne '1' or staffTurnover.act.taskDefKey eq 'exam1')}">
								${staffTurnover.user.name}
							</c:if>
						</td>
						<td class="width-15 active">工号 <span class="help-inline"><font color="red">*</font></span></td>
						<td class="width-15">
							<c:if test="${staffTurnover.isStart ne '1' or staffTurnover.act.taskDefKey eq 'exam1'}">
								<form:input path="employeeId" htmlEscape="false" maxlength="10" class="form-control required"/>						
							</c:if>
							<c:if test="${!(staffTurnover.isStart ne '1' or staffTurnover.act.taskDefKey eq 'exam1')}">
								${staffTurnover.employeeId}
							</c:if>
						</td> 
						<td class="width-15 active">职位 <span class="help-inline"><font color="red">*</font></span></td>
						<td class="width-15">
							<c:if test="${staffTurnover.isStart ne '1' or staffTurnover.act.taskDefKey eq 'exam1'}">
								<form:input path="position" htmlEscape="false" maxlength="10" class="form-control required"/>							
							</c:if>
							<c:if test="${!(staffTurnover.isStart ne '1' or staffTurnover.act.taskDefKey eq 'exam1')}">
								${staffTurnover.position}
							</c:if>
						</td>
					</tr>
					<tr>
						<td class="active">异动类型 <span class="help-inline"><font color="red">*</font> </span></td>
						<td colspan="5">
							<c:if test="${staffTurnover.isStart ne '1' or staffTurnover.act.taskDefKey eq 'exam1'}">
								<form:radiobuttons path="type" items="${fns:getDictList('turnover_type')}" 
									itemLabel="label" itemValue="value" htmlEscape="false" class="i-checks required" />
							</c:if>
							<c:if test="${!(staffTurnover.isStart ne '1' or staffTurnover.act.taskDefKey eq 'exam1')}">
								${fns:getDictLabel(staffTurnover.type,'turnover_type','')}
							</c:if>
						</td>
					</tr>
					<tr>
						<td class="active">异动原因 <span class="help-inline"><font color="red">*</font> </span></td>
						<td colspan="5">
							<c:if test="${staffTurnover.isStart ne '1' or staffTurnover.act.taskDefKey eq 'exam1'}">
								<form:textarea path="reason" htmlEscape="false" rows="3" maxlength="200" class="form-control required"/>							
							</c:if>
							<c:if test="${!(staffTurnover.isStart ne '1' or staffTurnover.act.taskDefKey eq 'exam1')}">
								${staffTurnover.reason}
							</c:if>
						</td>
					</tr>
					<tr>
						<td class="active" colspan="3" align="center">异动前信息</td>
						<td class="active" colspan="3" align="center">异动后信息</td>
					</tr>
					<tr>
						<td class="active">部门 <span class="help-inline"><font color="red">*</font> </span></td>
						<td colspan="2">
							<c:if test="${staffTurnover.isStart ne '1' or staffTurnover.act.taskDefKey eq 'exam1'}">
								${fns:getUser().office.name}
							</c:if>
								<input type="hidden" name="deptBefore.id" value="${fns:getUser().office.id}">
							<c:if test="${!(staffTurnover.isStart ne '1' or staffTurnover.act.taskDefKey eq 'exam1')}">
								${fns:getOfficeName(staffTurnover.deptBefore)}
							</c:if>
						</td>
						<td colspan="3">
							<c:if test="${staffTurnover.isStart ne '1' or staffTurnover.act.taskDefKey eq 'exam1'}">
							<div>
								<span class="hxx">
									<sys:treeselect id="deptAfter" name="deptAfter" value="${staffTurnover.deptAfter}" 
									labelName="deptAfter.name" labelValue="${fns:getOfficeName(staffTurnover.deptAfter)}"
									title="部门" url="/sys/office/treeData?type=2" cssClass="form-control required" 
									allowClear="true" notAllowSelectParent="true"/>
								</span>
							</div>
							</c:if>
							<c:if test="${!(staffTurnover.isStart ne '1' or staffTurnover.act.taskDefKey eq 'exam1')}">
								${fns:getOfficeName(staffTurnover.deptAfter)}
							</c:if>
						</td>
					</tr>
					<tr>
						<td class="active">岗位 <span class="help-inline"><font color="red">*</font> </span></td>
						<td colspan="2">
							<c:if test="${staffTurnover.isStart ne '1' or staffTurnover.act.taskDefKey eq 'exam1'}">
								<form:input path="postitionBefore" htmlEscape="false" maxlength="10" class="form-control required"/>							
							</c:if>
							<c:if test="${!(staffTurnover.isStart ne '1' or staffTurnover.act.taskDefKey eq 'exam1')}">
								${staffTurnover.postitionBefore}
							</c:if>
						</td>
						<td colspan="3">
							<c:if test="${staffTurnover.isStart ne '1' or staffTurnover.act.taskDefKey eq 'exam1'}">
								<span class="hxx">
								<form:input path="postitionAfter" htmlEscape="false" maxlength="10" class="form-control required"/>							
								</span>
							</c:if>
							<c:if test="${!(staffTurnover.isStart ne '1' or staffTurnover.act.taskDefKey eq 'exam1')}">
								${staffTurnover.postitionAfter}
							</c:if>
						</td>
					</tr>
					<tr>
						<td class="active">办公地点 <span class="help-inline"><font color="red">*</font> </span></td>
						<td colspan="2">
							<c:if test="${staffTurnover.isStart ne '1' or staffTurnover.act.taskDefKey eq 'exam1'}">
								<form:input path="officeLocatedBefore" htmlEscape="false" maxlength="30" class="form-control required"/>
							</c:if>
							<c:if test="${!(staffTurnover.isStart ne '1' or staffTurnover.act.taskDefKey eq 'exam1')}">
								${staffTurnover.officeLocatedBefore}
							</c:if>
						</td>
						<td colspan="3">
							<c:if test="${staffTurnover.isStart ne '1' or staffTurnover.act.taskDefKey eq 'exam1'}">
								<span class="hxx">
									<form:input path="officeLocatedAfter" htmlEscape="false" maxlength="30" class="form-control required"/>
								</span>
							</c:if>
							<c:if test="${!(staffTurnover.isStart ne '1' or staffTurnover.act.taskDefKey eq 'exam1')}">
								${staffTurnover.officeLocatedAfter}
							</c:if>
						</td>
					</tr>
					<tr>
						<td class="active">办公电话 <span class="help-inline"><font color="red">*</font> </span></td>
						<td colspan="2">
							<c:if test="${staffTurnover.isStart ne '1' or staffTurnover.act.taskDefKey eq 'exam1'}">
								<form:input path="phoneBefore" htmlEscape="false" maxlength="11" class="form-control required"/>
							</c:if>
							<c:if test="${!(staffTurnover.isStart ne '1' or staffTurnover.act.taskDefKey eq 'exam1')}">
								${staffTurnover.phoneBefore}
							</c:if>
						</td>
						<td colspan="3">
							<c:if test="${staffTurnover.isStart ne '1' or staffTurnover.act.taskDefKey eq 'exam1'}">
								<span class="hxx">
									<form:input path="phoneAfter" htmlEscape="false" maxlength="11" class="form-control required"/>
								</span>
							</c:if>
							<c:if test="${!(staffTurnover.isStart ne '1' or staffTurnover.act.taskDefKey eq 'exam1')}">
								${staffTurnover.phoneAfter}
							</c:if>
						</td>
					</tr>
					<tr>
						<td class="active" colspan="7"><div style='text-align:center;'>② 请按下列顺序办理审批手续</div></td>
					</tr>
					<c:if test="${!empty staffTurnover.act.taskDefKey}">
						<tr>
							<td class="active" colspan="4" align="center">异动前部门意见</td>
							<td class="active" colspan="3" align="center">异动后部门意见</td>
						</tr>
						
						<tr>
							<td class="active" colspan="2">主管意见 <span class="help-inline"><font color="red">*</font> </span></td>
							<td colspan="2">
								<c:if test="${staffTurnover.act.taskDefKey eq 'exam2'}">
									<form:input path="deptDirectorSuggestionBefore" htmlEscape="false" maxlength="30" class="form-control required"/>
								</c:if>
								<c:if test="${!(staffTurnover.act.taskDefKey eq 'exam2')}">
									${staffTurnover.deptDirectorSuggestionBefore}
								</c:if>
							</td>
							<td colspan="3">
								<c:if test="${staffTurnover.act.taskDefKey eq 'exam4'}">
									<form:input path="deptDirectorSuggestionAfter" htmlEscape="false" maxlength="30" class="form-control required"/>
								</c:if>
								<c:if test="${!(staffTurnover.act.taskDefKey eq 'exam4')}">
									${staffTurnover.deptDirectorSuggestionAfter}
								</c:if>
							</td>
						</tr>
						<tr>
							<td class="active" colspan="2">部门领导意见 <span class="help-inline"><font color="red">*</font> </span></td>
							<td colspan="2">
								<c:if test="${staffTurnover.act.taskDefKey eq 'exam3'}">
									<form:input path="deptManagerSuggestionBefore" htmlEscape="false" maxlength="30" class="form-control required"/>
								</c:if>
								<c:if test="${!(staffTurnover.act.taskDefKey eq 'exam3')}">
									${staffTurnover.deptManagerSuggestionBefore}
								</c:if>
							</td>
							<td colspan="3">
								<c:if test="${staffTurnover.act.taskDefKey eq 'exam5'}">
									<form:input path="deptManagerSuggestionAfter" htmlEscape="false" maxlength="30" class="form-control required"/>
									<span class="help-inline"><font color="red">*</font> </span>
								</c:if>
								<c:if test="${!(staffTurnover.act.taskDefKey eq 'exam5')}">
									${staffTurnover.deptManagerSuggestionAfter}
								</c:if>
							</td>
						</tr>
						<tr>
							<td class="active"  colspan="2">总经理意见 <span class="help-inline"><font color="red">*</font> </span></td>
							<td colspan="5">
								<c:if test="${staffTurnover.act.taskDefKey eq 'exam6'}">
									<form:input path="generalManagerSuggestion" htmlEscape="false" maxlength="30" class="form-control required"/>
								</c:if>
								<c:if test="${!(staffTurnover.act.taskDefKey eq 'exam6')}">
									${staffTurnover.generalManagerSuggestion}
								</c:if>
							</td>
						</tr>
						<tr>
							<td class="active" colspan="2">异动生效时间 <span class="help-inline"><font color="red">*</font> </span></td>
							<td colspan="5">
								<c:if test="${ staffTurnover.act.taskDefKey eq 'exam6' or staffTurnover.act.taskDefKey eq 'exam5'}">
									<input name="effectiveDate" type="text" readonly="readonly" maxlength="20" class="form-control Wdate required laydate-icon layer-date input-sm"
									value="<fmt:formatDate value="${staffTurnover.effectiveDate}" pattern="yyyy-MM-dd"/>"
									onclick="WdatePicker({minDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd',isShowClear:false, isShowToday:false});"/>
								</c:if>
								<c:if test="${!(staffTurnover.act.taskDefKey eq 'exam6' or staffTurnover.act.taskDefKey eq 'exam5')}">
									<fmt:formatDate value="${staffTurnover.effectiveDate}" pattern="yyyy-MM-dd"/>
								</c:if>
							</td>
						</tr>
					</c:if>
					<tr>
						<td class="active" colspan="7">
							<div style='text-align:center;'>③ 工作交接手续</div>
						</td>
					</tr>
					</table> 
					
					<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
						<c:if test="${staffTurnover.act.taskDefKey eq 'exam7'}">	 		
							<tr>
								<td class="active" colspan="2" align="center">移交项目 <span class="help-inline"><font color="red">*</font> </span></td>
								<td class="active" colspan="2" align="center">具体内容 <span class="help-inline"><font color="red">*</font> </span></td>
								<td class="active" align="center">数量</td>
								<td class="active" align="center">备注</td>
								<td class="active" align="center">操作</td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<input type="text" name="workTurnOvers['a'].project" maxlength="10" class="form-control required"/>
								</td>
								<td colspan="2" align="center">
									<input type="text" name="workTurnOvers['a'].content" maxlength="30" class="form-control required"/>
								</td>
								<td align="center">
									<input type="text" name="workTurnOvers['a'].number" maxlength="2" class="form-control myNumber"  />
								</td>
								<td align="center">
									<input type="text" name="workTurnOvers['a'].remarks" maxlength="30" class="form-control"/>
								</td>
								<td>
									
								</td>
							</tr>
							<tr>
								<td colspan="2"></td>
								<td colspan="2"></td>
								<td></td>
								<td></td>
								<td><a onclick="add1line(this)" class="add1line"><img class="add-del-png" src="${ctxStatic}/images/add.png" /></a></td>
							</tr>
						</c:if>				
					</table>
					<!--遍历工作交接表  -->
					<c:if test="${staffTurnover.act.taskDefKey eq 'exam8' or staffTurnover.act.taskDefKey eq 'exam9'
					or staffTurnover.act.taskDefKey eq 'exam10' or staffTurnover.act.taskDefKey eq 'exam11'
					or staffTurnover.act.taskDefKey eq 'exam12' or staffTurnover.act.taskDefKey eq 'exam13'}">
						<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
							<tr>
								<td class="active" colspan="2" align="center">移交项目</td>
								<td class="active" colspan="3" align="center">具体内容</td>
								<td class="active" align="center">数量</td>
								<td class="active" align="center">备注</td>
							</tr>
							<c:forEach items="${staffTurnover.workList}" var="vo">
								<tr>
									<td colspan="2" align="center">
										${vo.project}
									</td>
									<td colspan="3" align="center">
										${vo.content}
									</td>
									<td align="center">
										${vo.number}
									</td>
									<td align="center">
										${vo.remarks}
									</td>
								</tr>
							</c:forEach>	
						</table>
					</c:if>																		
					
					<table  class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
						<tr>
						<td class="width-15">移交人</td>
						<td>${staffTurnover.user.name}</td>	
						<td class="width-15">接收人 <span class="help-inline"><font color="red">*</font></span></td>
						<td>
							<c:if test="${staffTurnover.act.taskDefKey eq 'exam7'}">
							<div>
								<sys:treeselect id="workTurnoverReceiver" name="workTurnoverReceiver.id" 
								value="${staffTurnover.workTurnoverReceiver.id}" 
								labelName="workTurnoverReceiver.name" 
								labelValue="${staffTurnover.workTurnoverReceiver.name}" 
								title="接收人" url="/sys/office/treeData?type=3" cssClass="form-control required" 
								allowClear="true" notAllowSelectParent="true"/>
							</div>
							</c:if>
							<c:if test="${!(staffTurnover.act.taskDefKey eq 'exam7')}">
								${staffTurnover.workTurnoverReceiver.name}
							</c:if>
						</td>
						<td class="width-15">监收人 <span class="help-inline"><font color="red">*</font> </span></td>
						<td>
							<c:if test="${staffTurnover.act.taskDefKey eq 'exam7'}">
							<div>
								<sys:treeselect id="workTakeoverAcceptor" name="workTakeoverAcceptor.id" 
								value="${staffTurnover.workTakeoverAcceptor.id}" 
								labelName="workTakeoverAcceptor.name" 
								labelValue="${staffTurnover.workTakeoverAcceptor.name}" 
								title="监收人" url="/sys/office/treeData?type=3" cssClass="form-control required" allowClear="true" 
								notAllowSelectParent="true"/>
							</div>
							</c:if>
							<c:if test="${!(staffTurnover.act.taskDefKey eq 'exam7')}">
								${staffTurnover.workTakeoverAcceptor.name}
							</c:if>
						</td>
					</tr>
				</table>
				
				<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">	
					<tr>
						<td class="active" colspan="6"><div style='text-align:center;'>④ 资产移交手续</div></td>
					</tr>	
					<c:if test="${staffTurnover.act.taskDefKey eq 'exam10'}">
						<tr>
							<td colspan="3" align="center">资产名称 <span class="help-inline"><font color="red">*</font> </span></td>
							<td align="center">数量</td>
							<td align="center">备注</td>
							<td align="center">操作</td>
						</tr>
						<tr>
							<td colspan="3" align="center">
								<input type="text" name="assetsTurnOvers['b'].assetsName" maxlength="10" class="form-control required"/>
							</td>
							<td align="center">
								<input type="text" name="assetsTurnOvers['b'].number" maxlength="2" class="form-control  myNumber"/>
							</td>
							<td align="center">
								<input type="text" name="assetsTurnOvers['b'].remarks" maxlength="20" class="form-control "/>
							</td>
							<td>
								
							</td>
						</tr>
						<tr>
							<td colspan="3"></td>
							<td></td>
							<td></td>
							<td><a onclick="addline(this)" class="addline"><img class="add-del-png" src="${ctxStatic}/images/add.png" /></a></td>
						</tr>
					</c:if>		
				</table>
				<!--资产移交列表  -->
				<c:if test="${staffTurnover.act.taskDefKey eq 'exam11' or staffTurnover.act.taskDefKey eq 'exam12' 
					or staffTurnover.act.taskDefKey eq 'exam13'}">
					<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
						<tr>
							<td colspan="3" align="center">资产名称</td>
							<td align="center">数量</td>
							<td colspan="2"  align="center">备注</td>
						</tr>
						<c:forEach items="${staffTurnover.assetsList}" var="vo">
							<tr>
								<td colspan="3" align="center">
									${vo.assetsName}
								</td>
								<td align="center">
									${vo.number}
								</td>
								<td colspan="2"  align="center">
									${vo.remarks}
								</td>
							</tr>
						</c:forEach>	
					</table>
				</c:if>	
				<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
					<tr>
						<td class="width-15">移交人</td>
						<td>${staffTurnover.user.name}</td>	
						<td class="width-15">接收人 <span class="help-inline"><font color="red">*</font> </span></td>
						<td>
							<c:if test="${staffTurnover.act.taskDefKey eq 'exam10'}">
							<div>
								<sys:treeselect id="assetsTurnoverReceiver" name="assetsTurnoverReceiver.id" 
								value="${staffTurnover.assetsTurnoverReceiver.id}" 
								labelName="assetsTurnoverReceiver.name" 
								labelValue="${staffTurnover.assetsTurnoverReceiver.name}" 
								title="接收人" url="/sys/office/treeData?type=3" cssClass="form-control required" allowClear="true" 
								notAllowSelectParent="true"/>
							</div>
							</c:if>
							<c:if test="${!(staffTurnover.act.taskDefKey eq 'exam10')}">
								${staffTurnover.assetsTurnoverReceiver.name}
							</c:if>
						</td>					
						<td class="width-15">监收人 <span class="help-inline"><font color="red">*</font> </span></td>
						<td>
							<c:if test="${staffTurnover.act.taskDefKey eq 'exam10'}">
							<div>
								<sys:treeselect id="assetsTakeoverAcceptor" name="assetsTakeoverAcceptor.id" 
								value="${staffTurnover.assetsTakeoverAcceptor.id}" 
								labelName="assetsTakeoverAcceptor.name" 
								labelValue="${staffTurnover.assetsTakeoverAcceptor.name}" 
								title="监收人" url="/sys/office/treeData?type=3" cssClass="form-control required" allowClear="true" 
								notAllowSelectParent="true"/>
							</div>
							</c:if>
							<c:if test="${!(staffTurnover.act.taskDefKey eq 'exam10')}">
								${staffTurnover.assetsTakeoverAcceptor.name}
							</c:if>
						</td>
					</tr>
				</table>
				
				<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
					<tr>
						<td class="width-15 active" colspan="2"><div style='text-align: center;'>⑤ 财务结算手续</div></td>
					</tr>
					<c:if test="${staffTurnover.act.taskDefKey eq 'exam13'}">
						<tr>
							<td>
								<input id="wg" type="radio" name="financeStatus" onclick="wonAccount()" value="1"/>&nbsp;无挂账					
							</td>
							<td>
								<input type="radio" name="financeStatus" onclick="onAccount()" value="2"/>&nbsp;挂账&nbsp;
								<span id="gz" style="display: none;">
										<input type="text" class="form-control number required" name="onAccountYuan" style="width: 70px;"/>
										<span class="help-inline"><font color="red">*</font> </span>元,&nbsp;
										<span style="display: inline-block; width: 130px;">
											<sys:treeselect id="onAccountStaff" name="onAccountStaff.id" 
											value="${staffTurnover.onAccountStaff.id}" 
											labelName="onAccountStaff.name" 
											labelValue="${staffTurnover.onAccountStaff.name}" 
											title="代冲人" url="/sys/office/treeData?type=3" 
											cssClass="form-control required" allowClear="true" 
											notAllowSelectParent="true"/>
										</span>
										<span class="help-inline"><font color="red">*</font> </span>
										代为冲账
								</span>
							</td>
							<td>
								<input type="radio" name="financeStatus" onclick="fonAccount()" value="3"/>&nbsp;
								领用公司电脑，不须归还，补交剩余费用
								<span id="fy" style="display: none;">
									<input type="text" class="form-control number required" name="payInBack" maxlength="4" style="width: 70px;"/>
									<span class="help-inline"><font color="red">*</font> </span>元
								</span>
							</td>						
						</tr>
					</c:if>
					<c:if test="${!(staffTurnover.act.taskDefKey eq 'exam13')}">
						<tr>
							<c:if test="${staffTurnover.financeStatus eq '1'}">
								<td>无挂账</td>
							</c:if>	
							<c:if test="${staffTurnover.financeStatus eq '2'}">			
								 <td>挂账${staffTurnover.onAccountYuan}元,${staffTurnover.onAccountStaff.name}代为冲账</td>					
							</c:if>			
							<c:if test="${staffTurnover.financeStatus eq '3'}">
								<td>领用公司电脑，不须归还，补交剩余费用${staffTurnover.payInBack}</td>
							</c:if>
						</tr>
					</c:if>
				</table >
				
				<c:if test="${staffTurnover.act.taskDefKey eq 'exam13'}">
					<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
						<tr>
							<td class="width-15 active"  style="width:100px">财务人员</td>
							<td>${fns:getWorkflowVarValue('staff_turnover', 'financialStaff', '')}</td>	
						</tr>
					</table>
				</c:if>
				<c:if test="${staffTurnover.isStart ne '0'}">
					<act:histoicFlow procInsId="${staffTurnover.act.procInsId}" />
				</c:if>	
			</form:form>
		</div>
	</div>
</div>
</body>
</html>