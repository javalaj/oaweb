<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>发文驳回修改</title>
<meta name="decorator" content="default" />

<script type="text/javascript" src="${ctxStatic}/jquery/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				//$("#name").focus();
				$("#inputForm")
					.validate({
						submitHandler : function(form) {
							//loading('正在提交，请稍等...');
							form.submit();
						},
						errorContainer : "#messageBox",
						errorPlacement : function(error, element) {
							$("#messageBox").text("输入有误，请先更正。");
							if (element.is(":checkbox")
									|| element.is(":radio")
									|| element.parent().is(
											".input-append")) {
								error.appendTo(element.parent()
										.parent());
							} else {
								error.insertAfter(element);
							}
						}
					});				
				$("#modal-container-262575").draggable({
					handle : ".modal-header",
					cursor : 'move',
					refreshPositions : false
				});
				
				//获取添加时选中的会签副总
				var departmentsign = document.getElementById("departmentsign").value;
				var departmentsigns = new Array();
				departmentsigns = departmentsign.split(",");
				for ( var str in departmentsigns) {
					$(
							"input[name=departmentsign][value="
									+ departmentsigns[str] + "]").attr(
							"checked", true);
				}
			});
	/* function setSelectUserNo(radioObj) {

		var radioCheck = $(radioObj).val();
		if ("1" == radioCheck) {
			$(radioObj).attr("checked", false);
			$(radioObj).val("0");

		} else {
			$(radioObj).val("1");

		}
	} */
</script>
<style type="text/css">
.aa ul li {
	float: left;
	list-style: none;
	padding-left: 10px;
}
</style>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
	<div class="ibox">

		<div class="ibox-title">
		    <h5>${title }</h5> 
		    <!-- 	<h5>发文--驳回修改</h5>		 -->
		</div>
		<div class="ibox-content">
			<form:form id="inputForm" modelAttribute="oaArchives"
				action="${ctx}/oa/oaArchives/save" method="post"
				class="form-horizontal" style="margin-top: 15px;">
				<%-- <legend>${title }</legend> --%>
				<input type="hidden" name="token" value="${token }">
				<form:hidden path="id" />
				<input type="hidden" name="Fruit" value="0" />
				<input type="hidden" name="issuedate"
					value="<fmt:formatDate value="${oaArchives.issuedate}" pattern="yyyy-MM-dd HH:mm:ss" />" />
				<input type="hidden" name="draftdate"
					value="<fmt:formatDate value="${oaArchives.draftdate}" pattern="yyyy-MM-dd HH:mm:ss" />" />
				<input type="hidden" name="departmentsign2" id="departmentsign"
					value="${oaArchives.departmentsign}" />
				<sys:message content="${message}" />
				
				
				<div class="aa">
					<ul class="ul-form">
						<li class="btns"><a id="modal-262575"
							href="#modal-container-262575" role="button"
							class="btn btn-primary" style="text-decoration: none"
							data-toggle="modal">编辑正文</a>
							<div class="modal fade" id="modal-container-262575" role="dialog"
								aria-labelledby="myModalLabel"
								style="display:none;height:500px;">
								<div class="modal-dialog" style="width:750px;">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">×</button>
											<h4 class="modal-title" id="myModalLabel">正文</h4>
										</div>
										<div class="modal-body">
		
											<form:textarea path="content" htmlEscape="false" rows="20"
												maxlength="20000" class="input-xxlarge required"/>
											<sys:ckeditor replace="content" uploadPath="/oa/oaArchives" />
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">关闭</button>
											<button type="button" class="btn btn-default"
												data-dismiss="modal">保存</button>
										</div>
									</div>
								</div>
							</div></li>
						<li class="btns"><input
							onclick='btnPNGshow2("oa_Archvies:1:6552053766724510869ef1800054ad4a");'
							class="btn" type="button" value="流程图" /></li>
					</ul>
				</div>
				
				
				
				<table class="table-form">
					<caption>
						<h3 style="font-size: 20px;font-weight: bold;text-align: center;">${fns:getConfig('oaArchivesCaption')}</h3>
					</caption>				
						<tbody>
						<tr>
							<td class="all"  colspan="3">
							<label class="control-label">发文字号：</label>	
							<form:select path="code" class="selectpicker " data-style="btn-inverse" data-live-search="true" style="width:30%;" id="code" >
							<form:option value="楚誉【】" label="楚誉字" />
							<form:options items="${fns:getDictList('code')}"  maxlength="64"  itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>	
							</td>
						</tr>
						<tr>
							<td class="all">
								<label class="control-label">密级：</label>
							<form:select path="secrets" class="selectpicker " data-style="btn-inverse" data-live-search="true" style="width:50%;">
							<form:option value="0" label="秘密"/>
							<form:options items="${fns:getDictList('secrets')}"  itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
						</td>
							<td><label class="control-label">紧急程度：</label>
							<form:select path="urgency" class="selectpicker " data-style="btn-inverse" data-live-search="true" style="width:50%;">
							<form:option value="2" label="普通"/>
							<form:options items="${fns:getDictList('urgency')}"  itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>	
						</td>
											
						</tr>
		
						<tr>
						<td class="all"><label class="control-label">核稿人(时间)：</label>
							<input type="text" value=" ${oaArchives.leadName}&nbsp;<fmt:formatDate value="${oaArchives.issuedate}" pattern="yyyy-MM-dd HH:mm:ss" />" class="form-control"  style="width:50%;" readonly="readonly">
						<td><label class="control-label">拟稿部门和拟稿人：</label>
							<input type="text" value="${oaArchives.officeName}&nbsp;${oaArchives.createBy.name}&nbsp;<fmt:formatDate value="${oaArchives.draftdate}" pattern="yyyy-MM-dd HH:mm:ss" />" class="form-control" style="width:50%;" readonly="readonly"/>
						</td>
						</tr>
							<tr >
								<td class="all" colspan="3">
								<label class="control-label"  for="tilte">事由： <font color="red">*</font> </label>
								
								<form:input path="title" htmlEscape="false" id="title" maxlength="255" class="form-control" style="width:30%;"/>
									<span class="help-inline"></span>
								</td></tr>
		<!-- 					<tr > -->
		<!-- 						<td class="all" colspan="3"> -->
		<!-- 						<label class="control-label"  for="tilte">发文日期：</label> -->
								
		<!-- 						<input name="exeDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate " -->
		<%-- 					value="<fmt:formatDate value="${oaArchives.exeDate}" pattern="yyyy-MM-dd HH:mm:ss"/>" --%>
		<!-- 					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> -->
		<!-- 				<span class="help-inline"><font color="red">*</font> </span> -->
		<!-- 						</td></tr> -->
							<tr >
							<td class="all" colspan="3">
								<label class="control-label">主送：</label>
		 						<div class="controls" style="width:30%;margin-left: -20px;">
								<sys:treeselect id="oaArchivesRecord" name="oaIds"						
									value="${oaArchives.oaIds}"
									labelName="oaArchivesNames"
									labelValue="${oaArchives.oaArchivesNames}" title="接收人"
									url="/sys/office/treeData?type=3" cssClass="form-control"
									notAllowSelectParent="true" notAllowSelectRoot="true"  
									checked="true" allowClear="true"/>
								<!-- <span class="help-inline" id="tip"><font color="red">*</font> </span> -->
		 						</div>				
							</td>											
						</tr>
		
							<tr>
							<td class="all" colspan="3"><label class="control-label">抄送：</label>
								<form:input path="ccunit" htmlEscape="false" maxlength="100"
									  class="form-control"  style="width:30%;"/></td>
							</tr>
						
							<tr >
								<td class="all" colspan="3">
		 							<label class="control-label" for="files" style="padding-top:0;">相关部门会签：</label> 				
									<form:checkboxes path="departmentsign" 
								items="${fns:getDictList('departmentsign')}" value="" itemLabel="label"
								itemValue="value" htmlEscape="false" class="departmentsign i-checks" />
								</td>												
							</tr>
						<tr >
								<td class="all" colspan="3">
									<label class="control-label" for="files">附件：</label>
									<form:hidden id="files" path="files" htmlEscape="false" maxlength="255" class="input-xlarge"/>
									<div style="margin-left: 10px;float: left;">
									<sys:ckfinder input="files" type="files" uploadPath="/oa/oaArchives" selectMultiple="true"/>
									</div>
								</td>
					</tr>
					<tr >
						<td class="all" colspan="3">
							<label class="control-label">主题词：</label>
							<form:input path="keyword" htmlEscape="false" maxlength="255" class="form-control"  style="width:30%;"/>
						</td>												
					</tr>								
					<tr>
						<td class="all" colspan="3"><label class="control-label">部门负责人意见：</label>
							<textarea rows="0" class="form-control" style="width:30%; height:35px;" readonly="readonly">${oaArchives.leadText}</textarea>
					</tr>
					
					<c:if test="${not empty oaArchives.signYfOpinion }">
						<tr>
							<td class="all" colspan="3"><label class="control-label">研发部副总意见：</label>
							<textarea rows="0" class="form-control" style="width:30%; height:35px;" readonly="readonly">${oaArchives.signYfOpinion}</textarea>
						</tr>
					</c:if>
					<c:if test="${not empty oaArchives.signJsOpinion }">
						<tr>
							<td class="all" colspan="3"><label class="control-label">技术部副总意见：</label>
							<textarea rows="0" class="form-control" style="width:30%; height:35px;" readonly="readonly">${oaArchives.signJsOpinion}</textarea>
						</tr>
					</c:if>
					<c:if test="${not empty oaArchives.signSwOpinion }">
						<tr>
							<td class="all" colspan="3"><label class="control-label">市场拓展部副总意见：</label>
							<textarea rows="0" class="form-control" style="width:30%; height:35px;" readonly="readonly">${oaArchives.signSwOpinion}</textarea>
						</tr>
					</c:if>
					<c:if test="${not empty oaArchives.signScOpinion }">
						<tr>
							<td class="all" colspan="3"><label class="control-label">市场部副总意见：</label>
							<textarea rows="0" class="form-control" style="width:30%; height:35px;" readonly="readonly">${oaArchives.signScOpinion}</textarea>
						</tr>
					</c:if>
					<c:if test="${not empty oaArchives.signRsOpinion }">
						<tr>
							<td class="all" colspan="3"><label class="control-label">人事部副总意见：</label>
							<textarea rows="0" class="form-control" style="width:30%; height:35px;" readonly="readonly">${oaArchives.signRsOpinion}</textarea>
						</tr>
					</c:if>
					<c:if test="${not empty oaArchives.signCwOpinion }">
						<tr>
							<td class="all" colspan="3"><label class="control-label">财务部副总意见：</label>
							<textarea rows="0" class="form-control" style="width:30%; height:35px;" readonly="readonly">${oaArchives.signCwOpinion}</textarea>
						</tr>
					</c:if>
					<c:if test="${not empty oaArchives.managerText }">
						<tr>
							<td class="all" colspan="3"><label class="control-label">总经理签发意见：</label>
							<textarea rows="0" class="form-control" style="width:30%; height:35px;" readonly="readonly">${oaArchives.managerText}</textarea>
						</tr>
					</c:if>
					<tr>
						<td class="all" colspan="3"><label class="control-label">是否提交：</label>
						<label>
							<input name="flag" type="radio" value="0" checked="checked" class="i-checks"/>废 弃</label> 
						<label>
							<input name="flag" type="radio" value="1" class="i-checks"/>重 新 提 交</label></td>
					</tr>
					<!-- <tr>
							<td class="all" colspan="3"><label class="control-label">是否提交：</label><label><input name="Fruit" type="radio" value="1"
								onclick="setSelectUserNo(this);" />&nbsp;&nbsp;保存草稿暂时不提交 </label><span
								style="color: red;">&nbsp;&nbsp;&nbsp;&nbsp;(默认不选,提交审核)</span>
							</td>
					</tr> -->
				</table>
				<div class="form-actions" style="text-align: left; margin-top: 15px; margin-bottom: 15px;">
					<shiro:hasPermission name="oa:oaArchives:edit">
						<input id="btnSubmit" class="btn btn-primary" type="submit"
							value="提 交" />&nbsp;</shiro:hasPermission>
					<input id="btnCancel" class="btn" type="button" value="返 回"
						onclick="history.go(-1)" />
				</div>
			</form:form>
			</div>
		</div>
	</div>		
</body>
</html>