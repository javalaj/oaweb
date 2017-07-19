 <%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="doc" tagdir="/WEB-INF/tags/oa/doc" %>
<html>
<head>
	<title>文档信息管理</title>
	<meta name="decorator" content="default"/>
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no" />
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/mobile/css/mui.min.css" />
	<script src="${ctxStatic}/mobile/js/mui.min.js"></script>
	<script>
		mui.init({
			swipeBack:true //启用右滑关闭功能
		});
	</script>
	<script type="text/javascript">
		var validateForm;
		function doSubmit(){//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
			
		  if(validateForm.form()){
			  if($("#file").val()==null||$("#file").val()==""){
					top.layer.msg('请上传一个文档！'); 
					return false;
				}else{
					$("#inputForm").submit();
					 return true;
				}
		  }
		  return false;
		}
		
		$(document).ready(function() {
			
			if("${oaDoc.isPublic}"=="1"||"${empty oaDoc.isPublic}"=="true"){
				$("#cell_office").hide();
				
			}else{
				$("#cell_office").show();
			}
			//$("#name").focus();
			validateForm = $("#inputForm").validate({
				rules: {
					"officeName": {
				        required: true
				     }
				},
			    messages: {
			    	"officeName": {
			          required: "必填信息",
			        }
			    },submitHandler: function(form){
					//loading('操作正在进行，请稍等...');
					form.submit();
				},
				errorPlacement: function(error, element) {
					$("#"+element.attr("name")+"ErrorPlacement").append(error);
				}
			});
			
			$("#isPublic").change(function(){  
				$(this).valid();
				if($(this).val()=="1"){
					$("#cell_office").hide();
				}else{
					$("#cell_office").show();
				}
			});
			$("#docType").change(function(){  
				$(this).valid();
			});
			$("#isNeedLend").change(function(){  
				$(this).valid();
			});
			$("#officeName").change(function(){  
				$(this).valid();  
			});
		});
	</script>
    <script type="text/javascript">
    	$(document).ready(function() {
    		$("html").removeAttr("style");
    	});
	</script>	
</head>
<body class="mui-ios mui-ios-9 mui-ios-9-1">
 	<oam:header>
		<a class="mui-icon mui-icon-back mui-pull-left" onclick="location.href=document.referrer<%-- location.href='${mctx}${param.prePage} ' --%>"></a>
		<h1 class="mui-title">文档查看</h1>
	</oam:header>
	<oam:message content="${message}"/>
	<oam:content>
		<oam:form id="inputForm" modelAttribute="oaDoc" action="${mctx}/oa/doc/oaDoc/save" method="post">
			<form:hidden path="id"/>
			<input type="hidden" name="prePage" value="${param.prePage}"/>
			<oam:listView>
				<oam:listViewCell inputName="title" title="标题" cellType="input" >
					${oaDoc.title}
					<%-- <form:input path="title" htmlEscape="false" maxlength="64" placeholder="输入标题" class="required"/> --%>
				</oam:listViewCell>
				<oam:listViewCell inputName="keyword" title="关键词" cellType="input" >
					${oaDoc.keyword}
					<%-- <form:input path="keyword" htmlEscape="false" maxlength="200" placeholder="输入关键词" class="required"/> --%>
				</oam:listViewCell>
				<oam:listViewCell inputName="docType" title="文档归类" cellType="input"  >
					${fns:getDictLabel(oaDoc.docType, 'oaDoc_docType','')}
					<%-- <form:select path="docType"  class="required">
						<form:option value="" label="请选择"/>
						<form:options items="${fns:getDictList('oaDoc_docType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select> --%>
				</oam:listViewCell>
				<oam:listViewCell inputName="isNeedLend" title="是否需借阅" cellType="input"  >
					${fns:getDictLabel(oaDoc.isNeedLend, 'yes_no','')}
					<%-- <form:select path="isNeedLend"  class="required">
						<form:option value="" label="请选择"/>
						<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select> --%>
				</oam:listViewCell>
				<oam:listViewCell inputName="isPublic" title="是否共享" cellType="input"  >
					${fns:getDictLabel(oaDoc.isPublic, 'yes_no', '')}
					<%-- <c:if test="${empty oaDoc.id }">
						<form:select path="isPublic"  class="required" disabled="true">
							<form:option value="" label="请选择"/>
							<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
					</c:if>
					<c:if test="${not empty oaDoc.id }">
						<div>
							${fns:getDictLabel(oaDoc.isPublic, 'yes_no', '')}
						</div>
					</c:if> --%>
				</oam:listViewCell>
				<oam:listViewCell id="cell_office" inputName="officeName" title="归属部门" cellType="input"  >
					${oaDoc.office.name}
					<%-- <sys:treeselect id="office" name="office.id" value="${oaDoc.office.id}" labelName="officeName" labelValue="${oaDoc.office.name}"
						title="部门" url="/sys/office/treeData?type=2" cssClass="required" allowClear="true" notAllowSelectParent="true" width="100%" height="100%"/> --%>
				</oam:listViewCell>
				<oam:listViewCell inputName="remarks" title="备注信息" cellType="input">
					${oaDoc.remarks}
					<%-- <form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255"/> --%>
				</oam:listViewCell>
				<c:if test="${fns:getUser().id eq oaDoc.createBy.id or oaDoc.isNeedLend eq '0' or oaDoc.oaDocReadApply.lendStatus eq '1'}">
					<oam:listViewCell inputName="file" title="附件" cellType="input">
						<doc:downloadCounter oaDoc="${oaDoc}" id="file"></doc:downloadCounter>
					</oam:listViewCell>
				</c:if>
				<oam:listViewCell>
					<shiro:hasPermission name="oa:doc:oaDoc:edit">
						<%-- <c:if test="${fns:getUser().id eq oaDoc.createBy.id}">
							<button type="button" class="mui-btn mui-btn-primary" onclick="doSubmit()" style="width: 20%;right: 50%;margin-right: -10%;background-color:#12b7f5;border:1px solid #12b7f5;">保存</button>&nbsp;&nbsp;
						</c:if> --%>
						<c:if test="${fns:getUser().id ne oaDoc.createBy.id}">
							<c:if test="${oaDoc.isNeedLend eq '1' }">
								<c:if test="${empty oaDoc.oaDocReadApply.lendStatus }">
									<button style="width:90%" type="button" class="mui-btn mui-btn-primary" onclick="location.href='${mctx}/oa/doc/oaDocReadApply/save?doc.id=${oaDoc.id}&lendUser.id=${fns:getUser().id}&prePage=${param.prePage}'"><i class="fa fa-circle-o"></i>借阅</button>&nbsp;&nbsp;
								</c:if>
								<c:if test="${not empty oaDoc.oaDocReadApply.lendStatus }">
									<c:if test="${ oaDoc.oaDocReadApply.lendStatus eq '0'}">
											<font color="orange">
												${fns:getDictLabel(oaDoc.oaDocReadApply.lendStatus, 'oaDocReadApply_lendStatus', '')}
											</font>
										</c:if>
										<c:if test="${ oaDoc.oaDocReadApply.lendStatus eq '1'}">
											<font color="green">
												${fns:getDictLabel(oaDoc.oaDocReadApply.lendStatus, 'oaDocReadApply_lendStatus', '')}
											</font>
										</c:if>
										<c:if test="${ oaDoc.oaDocReadApply.lendStatus eq '2'}">
											<font color="red">
												${fns:getDictLabel(oaDoc.oaDocReadApply.lendStatus, 'oaDocReadApply_lendStatus', '')}
											</font>
										</c:if>
								</c:if>
							</c:if>	
						</c:if>
					</shiro:hasPermission>
				</oam:listViewCell>
			</oam:listView>	
		</oam:form>
	</oam:content>
</body>
</html>