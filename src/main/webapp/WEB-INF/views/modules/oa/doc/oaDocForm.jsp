<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="doc" tagdir="/WEB-INF/tags/oa/doc" %>
<html>
<head>
	<title>文档信息管理</title>
	<meta name="decorator" content="default"/>
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no" />
	<style>
		.table.myoa-newitem-table>tbody>tr>td {
			border-top-width: 0;
		}
		.table.myoa-newitem-table>tbody>tr>td:nth-child(odd) {
			width: 20%;
		}
		.table.myoa-newitem-table>tbody>tr>td:nth-child(even) {
			width: 80%;
		}
	</style>
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
				$("#div_office").hide();
				$("#div_office_title").hide();
				
			}else{
				$("#div_office").show();
				$("#div_office_title").show();
			}
			//$("#name").focus();
			validateForm = $("#inputForm").validate({
				rules: {
					"office.name": {
				        required: true
				     }
				},
			    messages: {
			    	"office.name": {
			          required: "必填信息",
			        }
			    },
				submitHandler: function(form){
					form.submit();
					oaLoading('操作正在进行中，请耐心等待');
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
			
			$("#isPublic").change(function(){  
				$(this).valid();
				if($(this).val()=="1"){
					$("#div_office").hide();
					$("#div_office_title").hide();
				}else{
					$("#div_office").show();
					$("#div_office_title").show();
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
		function downloadFile(id,url){
			alert(id+url);
		}
	</script>
</head>
<body>
	<form:form id="inputForm" modelAttribute="oaDoc" action="${ctx}/oa/doc/oaDoc/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<table class="table table-condensed dataTables-example dataTable no-footer myoa-newitem-table">
		   <tbody>
		      <tr>
		         <td>	
		        	<label class="pull-right">标题 <span class="help-inline"><font color="red">*</font></span></label>
		         </td>
		         <td>
		         	<form:input path="title" htmlEscape="false" maxlength="64" class="form-control required"/>		         	
		         </td>		         
		      </tr>
		      <tr>		         
		         <td>	
		         	<label class="pull-right">关键词 <span class="help-inline"><font color="red">*</font></span></label>
		         </td>
		         <td>
		         	<form:input path="keyword" htmlEscape="false" maxlength="200" class="form-control required"/>		         	
		         </td>
		      </tr>
		      <tr>
		         <td>	
		        	<label class="pull-right">文档归类 <span class="help-inline"><font color="red">*</font> </span></label>
		         </td>
		         <td>
		         	<form:select path="docType" class="form-control selectpicker required" data-style="btn-inverse" data-live-search="true">
						<form:options items="${fns:getDictList('oaDoc_docType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>					
		         </td>		         
		      </tr>
		      <tr>		         
		         <td>	
		         	<label class="pull-right">是否需要借阅 <span class="help-inline"><font color="red">*</font> </span></label>
		         </td>
		         <td>
					<form:select path="isNeedLend" class="form-control selectpicker required" data-style="btn-inverse" data-live-search="true">
						<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>					
		         </td>
		      </tr>
		      <tr>
		         <td>	
		        	<label class="pull-right">是否共享  <span class="help-inline"><font color="red">*</font> </span></label>
		         </td>
		         <td>
					<c:if test="${empty oaDoc.id }">
						<form:select path="isPublic" class="form-control selectpicker required" data-style="btn-inverse" data-live-search="true">
							<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
						<span class="help-inline"><font color="red">*保存之后将无法更改(非共享文档将在部门文档中列出)</font> </span>
					</c:if>
					<c:if test="${not empty oaDoc.id }">
						${fns:getDictLabel(oaDoc.isPublic, 'yes_no', '')}
					</c:if>
		         </td>		         
		      </tr>
		      <tr>		         
		         <td id="div_office_title">	
		         	<label class="pull-right">文档归属部门 <span class="help-inline"><font color="red">*</font></span></label>
		         </td>
		         <td id="div_office">		         	
					<sys:treeselect id="office" name="office.id" value="${empty oaDoc.office.id?fns:getUser().office.id:oaDoc.office.id}" labelName="office.name" labelValue="${empty oaDoc.office.name?fns:getUser().office.name:oaDoc.office.name}"
						title="文档归属部门" url="/sys/office/treeData?type=2" cssClass="form-control" allowClear="true" notAllowSelectParent="true"/>					
		         </td>
		      </tr>
		      <tr>
		         <td>	
		        	<label class="pull-right">文档附件 <span class="help-inline"><font color="red">*</font></span></label>
		         </td>
		         <td>
					<c:choose>
						<c:when test="${fns:getUser().id eq oaDoc.createBy.id or empty oaDoc.id}">
							<shiro:hasPermission name="oa:doc:oaDoc:edit">
								<form:hidden id="file" path="file" htmlEscape="false" maxlength="1000" class="form-control required"/>
								<sys:ckfinder input="file" type="files" uploadPath="/oa/doc/oaDoc" selectMultiple="false"/>								
							</shiro:hasPermission>
						</c:when>
						<c:otherwise>
							<doc:downloadCounter oaDoc="${oaDoc}" id="file"></doc:downloadCounter>
							<%-- <ol style="list-style:none" >
								<li><a href="javascript:void(0);" target="_blank" onclick="downloadFile('${oaDoc.id}','${oaDoc.file}')">附件</a>
							</ol> --%>
							<%-- <form:hidden id="file" path="file" htmlEscape="false" maxlength="1000" class="form-control required"/>
							<sys:ckfinder input="file" type="files" uploadPath="/oa/doc/oaDoc" selectMultiple="false" readonly="true"/> --%>
						</c:otherwise>
					</c:choose>	
		         </td>		         
		      </tr>
		      <tr>		         
		         <td>	
		         	<label class="pull-right">备注信息</label>
		         </td>
		         <td>
					<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="form-control "/>
		         </td>
		      </tr>
		   </tbody>
		   </table> 		
	</form:form>
</body>
</html>