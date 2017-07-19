<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>部门管理员审核</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				rules: {
					"actor.name": {
				        required: true
				     },
				    
				},
			    messages: {
			    	"actor.name": {
			          required: "必填信息",
			        },
			       
			    },
				
				
				
				submitHandler: function(form){
					oaLoading('正在提交，请稍候...');
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
			
			

			$("#btnImport1").click(function(){
				
				window.print();
				});
		});
		function cz(){
			var checkedList1 = new Array();
			$("input[name='subChk']:checked").each(function() { 
				checkedList1.push($(this).val()); 
				}); 
			alert(checkedList1.toString());
			}
		function setSelectUserNo(radioObj){  
	          
	        var radioCheck= $(radioObj).val();  
	        if("1"==radioCheck){  
	            $(radioObj).attr("checked",false);  
	            $(radioObj).val("0");  
	              
	        }else{   
	            $(radioObj).val("1");  
	              
	        }  
	    }  
	</script>
	<script type="text/javascript">

$(document).ready(function() {

   CKEDITOR.config.readOnly = true;

});

</script>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
<div class="ibox">
<div class="ibox-title">
		<h5>公司签报流程 </h5>
		<div class="ibox-tools">
		</div>
	</div>
   <div class="ibox-content">
   	<sys:message content="${message}"/>
   	<div class="row">
	<div class="col-sm-12">
	<br/>
	</div>
	</div>
	
	<form:form id="inputForm" modelAttribute="oaSign" action="${ctx}/oa/sign/oaSign/depform" method="post" class="form-inline">
	<input type="hidden" name="token" value="${token }">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
		<tr>
		
		<td colspan="4" ><h3 align='center'>楚 誉 科 技 股 份 有 限 公 司</h3>
	      	<h3 align='center'>签 报 审 批 单</h3>
		</td>
		</tr>
		<tr>
				<td>密级：</td>
		<td><c:choose>
						<c:when test="${oaSign.signType == 0}">
								绝密
							</c:when>
						<c:when test="${oaSign.signType == 1 }">
							机密
							</c:when>
							<c:when test="${oaSign.signType == 2 }">
							秘密
							</c:when>
							<c:when test="${oaSign.signType == 3 }">
							内部
							</c:when>
						<c:otherwise>
							公开
							</c:otherwise>
					</c:choose>
				
				</td>
		</tr>
		<tr>
		<td>相关部门会签:</td>
		<td>	
		<input type="checkbox" name="subChk" value="d093d3bb4f4d4b73a505bf7f459dfa30" class="i-checks" />研发部
<!-- 		<input type="checkbox" name="subChk" value="8ebd2702dc94495cba340752afaa3aa4"  class="i-checks"/>技术部 -->
		<input type="checkbox" name="subChk" value="8ebd2702dc94495cba340752afaa3aa4"  class="i-checks"/>财务部/技术部
		<input type="checkbox" name="subChk" value="e8b417f79a2b47c5bd86820f622f1cba" class="i-checks" />市场部
		<input type="checkbox" name="subChk" value="6797ed3ef7564119b06aa29ee56180f2"  class="i-checks"/>市场拓展部
		<input type="checkbox" name="subChk" value="2" class="i-checks" />人事部
        </td>
		</tr>
		<tr>
			<td>标题：</td>
			<td colspan="4" >
			${oaSign.signTitile }
			</td>
		</tr>
		<tr>
			<td>内容：</td>
			<td colspan="4" >
			<textarea  rows="6"maxlength="200" class="input-xxlarge required" disabled="disabled" readonly="readonly">${oaSign.signContent }</textarea>
			</td>
		</tr>
		<tr>
			<td>正文：</td>
				<td colspan="4" style="width: 200px;height: 200px;">
				${text }
		<%-- 		 <form:textarea path="signText"
						htmlEscape="false" rows="6" maxlength="200"
						class="input-xxlarge required" disabled="disabled" /> <sys:ckeditor
						replace="signText" uploadPath="/oa/sign" /> --%></td>
		</tr>
		<tr>
			<td>附件：</td>
			<td colspan="4" >
			<input type="hidden" id="billingFile${oaSign.id}"value="${oaSign.signFiles}"/>
									<sys:ckfinder input="billingFile${oaSign.id}" readonly="true" type="files" uploadPath="/oa/sign" selectMultiple="true"/>
			</td>
		</tr>
		<tr>
			<td>部门负责人意见：</td>
			<td colspan="4" >
				<form:input path="signHeadOpinion"  cssStyle="width: 55%" htmlEscape="false" maxlength="255" class="form-control required "/><span class="help-inline"><font color="red">*</font></span>
			</td>
		</tr>
		<tr>
		<td>是否提交</td>
		<td><label><input id="actor" name="Fruit" type="radio" value="1" class="required i-checks" checked />同意</label> 
		    <label><input id="actor" name="Fruit" type="radio" value="2" class="required i-checks"/>驳回</label>
		  <span style="display: none;"> <form:input path="procInsId" /></span> <span class="help-inline"><font color="red">*</font></span>
		</td>
		
		</tr>
			<tr>
			<td></td>
			<td colspan="3">
					<shiro:hasPermission name="oa:sign:oaSign:edit"><input id="btnSubmit" class="btn btn-myoa-sec btn-myoa-large" type="submit" value="提 交" />&nbsp;</shiro:hasPermission>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="btnCancel" class="btn btn-myoa" type="button" value="返 回" onclick="history.go(-1)"/>
		</td>
			</tr>
		</table>
	</form:form>
	
	<br/>
	<br/>
	</div>
	</div>
	</div>
</body>
</html>