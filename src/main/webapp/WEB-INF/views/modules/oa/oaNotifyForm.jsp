<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html style="overflow: initial;">
<head>
<title>通知管理</title>
<meta name="decorator" content="default" />
<script src="${ctxStatic}/common/contabs.js"></script>
<script type="text/javascript">
	$(document).ready(function(){	
		$("#inputForm").validate(
		{	
			rules: {
				"oaNotifyRecordNames": {
			        required: true
			     }
			},
		    messages: {
		    	"oaNotifyRecordNames": {
		          required: "必填信息",
		        }
		    },								
			submitHandler : function(form) {
				/* loading('正在提交，请稍等...'); */
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
				}else {
					error.insertAfter(element);
				}
			}									
		});
		
		$("#oaNotifyRecordName").change(function(){  
			$(this).valid();  
		});
	});
</script>
<style>
	label[for='oaNotifyRecordName']{
		position: absolute;
	}
	.myoa-details-form {
		padding-top: 10px;
	}
	.myoa-details-form .control-group {
		padding-bottom: 0;
		border-bottom: none;
		margin-bottom: 0;
	}
	.myoa-details-form .control-group:last-child {
		margin-bottom: 20px;
	}
	.control-label + div{
		line-height:34px;
		padding-top:0 !important;
	}
	.form-horizontal .controls label.error {
		background-position: 0px 10px;
	}
	.form-horizontal .control-label{
		width:80px;
		text-align:center;
	}
	.form-horizontal .controls {
		margin-left:80px;
	}
	.form-horizontal .controls > a {
		color: #35a5e7;
	}
	.form-horizontal .controls > a:hover {
		color: #666a6d;
		text-doceratio: underline;
	}
	.stats>span{
    	position: relative;
	}
	.stats>span .error{
		position: absolute;
	    right: -300px;
	    top: -10px;
	}
</style>
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
		if(newurl == "/oa/a/oa/oaNotify/self"||newurl == "/oa/a/oa/oaNotify/selfList"){
			location.replace(strUrl);				
		}else if(newurl == "/oa/a/oa/oaNotify/self?repage"){
			window.location.href="${ctx}/oa/oaNotify/self";
		}else if(newurl == "/oa/a/oa/oaNotify/selfList?repage"||newurl =="/oa/a"||newurl =="/oa/a?login"){
			window.location.href="${ctx}/oa/oaNotify/selfList";
		}else if(newurl == "/oa/a/oa/oaNotify"||newurl == "/oa/a/oa/oaNotify/?repage"){
		window.location.href="${ctx}/oa/oaNotify";
		}else{
			history.go(-1);
		}
	}
</script>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox" style="width:800px;margin:0 auto;">
			<div class="ibox-title">
				<h5>${oaNotify.status eq '1' ? '查看' : ''}${oaNotify.type eq '4' ? '消息':'通告'}${oaNotify.status eq '1' ? '详情' : not empty oaNotify.id ? '修改' : '添加'}
			</div> 
		    <div class="ibox-content">
			    <!-- 工具栏 -->
				<div class="row">
					<div class="col-sm-12">
						<div class="pull-right"></div>		
					</div>
				</div>	
				<form:form id="inputForm" modelAttribute="oaNotify" action="${ctx}/oa/oaNotify/save" method="post" class="form-horizontal myoa-details-form">
					<form:hidden path="id" />
					<sys:message content="${message}" />
					<div class="control-group">
						<c:if test="${oaNotify.status ne '1'}">
							<label class="control-label">类型： <span class="help-inline"><font color="red">*</font> </span></label>
							<div class="controls">
								<form:select path="type" class="form-control  required" id="type">
									<form:options items="${fns:getDictList('my_notify_type')}" itemLabel="label" itemValue="value" htmlEscape="false" />
								</form:select>
							</div>
						</c:if>
						<c:if test="${oaNotify.status eq '1'}">
							<label class="control-label">类型：</label>
							<div class="controls">
								${fns:getDictLabel(oaNotify.type, 'oa_notify_type', '')}
							</div>					
						</c:if>
					</div>
					<div class="control-group">
						<c:if test="${oaNotify.status ne '1'}">
							<label class="control-label">标题： <span class="help-inline"><font color="red">*</font> </span></label>
							<div class="controls">				
								<form:input path="title" htmlEscape="false" maxlength="30" class="form-control required" id="title" autocomplete="off"/>
								<span class="help-inline" id="titletip">标题长度在0~30之间</span>
							</div>
						</c:if>
						<c:if test="${oaNotify.status eq '1'}">
							<label class="control-label">标题：</label>
							<div class="controls">
								${oaNotify.title}					
							</div>
						</c:if>
					</div>
					<div class="control-group">
						<label class="control-label">内容：</label>
						<c:if test="${(fn:contains(oaNotify.content,'@@planNotify@@')==false)&&(fn:contains(oaNotify.content,'@@proNotify@@')==false)&&oaNotify.status ne '1'}">
							<div class="controls">
								<form:textarea path="content" htmlEscape="false" rows="6"  style="display: none;" maxlength="20000"  class="form-control "/> 
								<sys:ckeditor replace="content" uploadPath="/oa/notify" />
							</div>
						</c:if>
						<c:if test="${oaNotify.status eq '1'&&(fn:contains(oaNotify.content,'@@proNotify@@')==false)&&(fn:contains(oaNotify.content,'@@planNotify@@')==false)&&(fn:contains(oaNotify.content,'@@proNotify_layuiWindow@@')==false)}">
							<div class="controls">
								<form:textarea id="content" path="content" htmlEscape="false" rows="6" maxlength="2000" class="form-control " readonly="true" style="display:none;"/> 
								<div id="content1" class="scroll"></div>
								<script>
									$("#content1").html($("#content").val())
								</script>
							</div>
						</c:if>
						<c:if test="${fn:contains(oaNotify.content,'@@proNotify@@')}">
							<div class="controls">
								<a href="${fn:replace(oaNotify.content, '@@proNotify@@', '')}">点击查看详情</a>
							</div>
						</c:if>
						<c:if test="${fn:contains(oaNotify.content,'@@proNotify_layuiWindow@@')}">
							<div class="controls">
								<a href="#"  onclick="openDialogView('查看', '${fn:replace(oaNotify.content, '@@proNotify_layuiWindow@@', '')}','800px', '600px')">点击查看详情</a>
							</div>
						</c:if>
						 <c:if test="${fn:contains(oaNotify.content,'@@planNotify@@')}">
							<div class="controls">
								<a onclick="openTab('${fn:replace(oaNotify.content, '@@planNotify@@', '')}','查看消息详情',false)">点击查看详情</a>
							</div>
						</c:if> 
					</div>
					<c:if test="${oaNotify.status ne '1'}">
						<div class="control-group">
							<c:if test="${(fn:contains(oaNotify.content,'@@planNotify@@')==false)
								&&(fn:contains(oaNotify.content,'@@proNotify@@')==false) 
								&& (fn:contains(oaNotify.content,'@@proNotify_layuiWindow@@')==false)}">
								 <label class="control-label">附件：</label>
								<div class="controls">
									<form:hidden id="files" path="files" htmlEscape="false" maxlength="255" class="form-control" />
									<sys:ckfinder input="files" type="files" uploadPath="/oa/notify" selectMultiple="false" />
								</div> 
							</c:if>
						</div>
						<div class="control-group">
							<label class="control-label">状态： 
								<span class="help-inline">
									<font color="red">*</font> 
								</span>
							</label>
							<div class="controls stats" style="padding-top: 7px;">
								<form:radiobuttons path="status" items="${fns:getDictList('oa_notify_status')}" itemLabel="label"
									itemValue="value" htmlEscape="false" class="i-checks required" id="status"/>
								<span class="help-inline">（发布后不能进行操作）</span>												
							</div>
						</div>
						<div class="control-group" style="position: relative;">
							<label class="control-label">接收人： 
								<span class="help-inline">
									<font color="red">*</font> 
								</span>
							</label>
							<div class="controls">
								<sys:treeselect id="oaNotifyRecord" name="oaNotifyRecordIds"
									value="${oaNotify.oaNotifyRecordIds}"
									labelName="oaNotifyRecordNames"
									labelValue="${oaNotify.oaNotifyRecordNames}" title="接收人"
									url="/sys/office/treeData?type=3" cssClass="form-control required"
									checked="true" allowClear="true"  />
							</div>	
						</div>
					</c:if>
					<c:if test="${oaNotify.status eq '1'}">
						<div class="control-group">
							<c:if test="${(fn:contains(oaNotify.content,'@@planNotify@@')==false)
								&&(fn:contains(oaNotify.content,'@@proNotify@@')==false) 
								&& (fn:contains(oaNotify.content,'@@proNotify_layuiWindow@@')==false)}">
								<label class="control-label">附件：</label>
								<div class="controls">
									<form:hidden id="files" path="files" htmlEscape="false" maxlength="255" class="form-control" />
									<sys:ckfinder input="files" type="files" uploadPath="/oa/notify" selectMultiple="true" readonly="true" />
								</div>
							</c:if>
						</div>
						<c:if test="${!oaNotify.self}">
							<div class="control-group">
								<div class="controls">
									<table id="contentTable1"
										class="table table-striped table-bordered table-condensed no-footer">
										<thead>
											<tr>
												<th>发布人</th>
												<th>发布人部门</th>
												<th>发布时间</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>${oaNotify.createBy.name}</td>
												<td>${oaNotify.createBy.office.name}</td>
												<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${oaNotify.createDate }" /></td>
											</tr>
									</table>
									<table id="contentTable2" class="table table-striped table-bordered table-condensed">
										<thead>
											<tr>
												<th>接收人</th>
												<th>接收人部门</th>
												<th>阅读状态</th>
												<th>阅读时间</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${oaNotify.oaNotifyRecordList}" var="oaNotifyRecord">
												<tr>
													<td>${oaNotifyRecord.user.name}</td>
													<td>${oaNotifyRecord.user.office.name}</td>
													<td>${fns:getDictLabel(oaNotifyRecord.readFlag,'oa_notify_read', '')}</td>
													<td><fmt:formatDate value="${oaNotifyRecord.readDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<p>已查阅：${oaNotify.readNum} &nbsp; 未查阅：${oaNotify.unReadNum} &nbsp;总共：${oaNotify.readNum + oaNotify.unReadNum}</p>
								</div>	
							</div>
						</c:if>
					</c:if>
					<div style="text-align: center;">
						<c:if test="${oaNotify.status ne '1'}">
							<shiro:hasPermission name="oa:oaNotify:edit">
								<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"  />&nbsp;
							</shiro:hasPermission>
						</c:if>
						<input id="btnCancel" class="btn" type="button" value="返 回" onclick="goBack()" />
					</div>
				</form:form>
				<br/>
				<br/>
			</div>
		</div>
	</div>
</body>

</html>