<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>分发</title>
<meta name="decorator" content="default" />
<script type="text/javascript" src="${ctxStatic}/jquery/jquery-ui.min.js"></script>	
<script type="text/javascript">
		$(document).ready(function() {
			$("#btnPrint").click(function(){
				$("#billingFilePreview a").attr("href","");
				window.print();
			});
		});
	</script>
	<style>
	@media print {
		.noprint {
			display: none
		}
	}
	
	</style>
<style type="text/css">
ul li {
	float: left;
	list-style: none;
	padding-left: 10px;
}

.control-label{
	font-size: 14px;
	color: #317EAC;
	font-weight: bolder;
	background-color: #FAFAFA;
}
tr{
	height:30px;
}
.form-horizontal .control-label{
	text-align: left;
}

<!--表中第一列和第三列占20%-->
.table-form tr td:nth-of-type(1),.table-form tr td:nth-of-type(3){ 
	width:20%;
}
.table-form tr td:nth-of-type(2){
	width:30%;
}
</style>
</head>
<body class="myoa-print-page" style="padding-top: 20px;">
	<form:form id="inputForm" modelAttribute="oaArchives"
		action="${ctx}/oa/oaArchives/mysingsave" method="post"
		class="form-horizontal">

		<input type="hidden" name="departmentsign2" id="departmentsign"
			value="${oaArchives.departmentsign}" />
		<input type="hidden" name="flag" value="1" />
		<form:hidden path="id" />
		<form:hidden path="code" />
		<form:hidden path="urgency" />
		<form:hidden path="secrets" />
		<input type="hidden" name="issuedate"
			value="<fmt:formatDate value="${oaArchives.issuedate}" pattern="yyyy-MM-dd HH:mm:ss" />" />
		<input type="hidden" name="draftdate"
			value="<fmt:formatDate value="${oaArchives.draftdate}" pattern="yyyy-MM-dd HH:mm:ss" />" />
		<input type="hidden" name=qianfadate
			value="<fmt:formatDate value="${oaArchives.qianfadate}" pattern="yyyy-MM-dd HH:mm:ss" />" />
		<input type="hidden" name="issuingtime" 
			value="<fmt:formatDate value="${oaArchives.qianfadate}" pattern="yyyy-MM-dd HH:mm:ss" />" />
		<sys:message content="${message}" />
		
		<div style="height:30px;margin-bottom: 20px;" class="noprint"><input id="btnPrint" type="button" value="打印" class="btn btn-primary"/>
		<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)" /></div>
		
		<table class="table-form">
			<caption>
				<p style="color: #317EAC;font-weight: bolder;font-size: 20px;text-align: center;">楚誉科技股份有限公司发文稿纸</p>
			</caption>
			<tbody>
				<tr>
					<td><label class="control-label">发文字号</label></td>
					<td>${oaArchives.code}</td>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td><label class="control-label">密级</label>
					</td>
					<td>${oaArchives.secrets}</td>
					<td><label class="control-label">紧急程度</label></td>
					<td>${oaArchives.urgency}</td>
				</tr>	
				<tr class="note">
					<td><label class="control-label" for="manager">核稿人(时间)</label></td>
					<td>
						${oaArchives.leadName}&nbsp;<fmt:formatDate value="${oaArchives.issuedate}"
  					pattern="yyyy-MM-dd" /></td>
					<td><label class="control-label">拟稿部门和拟稿人</label></td>
					<td>${oaArchives.officeName}&nbsp;${ oaArchives.createBy.name}&nbsp;
						<fmt:formatDate value="${oaArchives.draftdate}" pattern="yyyy-MM-dd" /></td>
				</tr>
				<tr>
					<td><label class="control-label" for="tilte">事由</label> </td>
					<td>${oaArchives.title}</td>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td>
						<label class="control-label">主送</label>
					</td>
					<td>${oaArchives.oaArchivesNames}</td>
					<td colspan="2"></td>
				</tr>	
				<tr>
					<td>
						<label class="control-label">抄送</label>
					</td>
					<td>${oaArchives.ccunit}</td>
					<td colspan="2"></td>
				</tr>				
				<tr>
					<td><label class="control-label">附件</label></td>
					<td>
						<input type="hidden" id="billingFile"  value="${oaArchives.files}" />
						<div style="margin-left: 10px;float: left;">
							 <sys:ckfinder input="billingFile" readonly="true" type="files"
							uploadPath="/oa/oaArchives" selectMultiple="true"/>
						</div>
					</td>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td><label class="control-label">主题词</label></td>
					<td>${oaArchives.keyword }</td>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td><label class="control-label">印发时间</label></td>
					<td>
						<fmt:formatDate value="${oaArchives.issuingtime}" pattern="yyyy-MM-dd" />					
					</td>
					<td><label class="control-label">印发份数</label></td>
					<td>${oaArchives.issuedNum }</td>
				</tr>
				<tr>
					<td><label class="control-label">部门负责人意见</label></td>
					<td>${oaArchives.leadText }</td>
					<td colspan="2"></td>
				</tr>
				<c:if test="${not empty oaArchives.signYfOpinion }">
					<tr>
						<td><label class="control-label">研发部副总意见</label></td>
						<td>${oaArchives.signYfOpinion }</td>
						<td colspan="2"></td>
					</tr>
				</c:if>
				<c:if test="${not empty oaArchives.signJsOpinion }">
					<tr>
						<td><label class="control-label">技术部副总意见</label></td>
						<td>${oaArchives.signJsOpinion }</td>
						<td colspan="2"></td>
					</tr>
				</c:if>
				<c:if test="${not empty oaArchives.signSwOpinion }">
					<tr>
						<td colspan="3"><label class="control-label">市场拓展部副总意见</label></td>
						<td>${oaArchives.signSwOpinion }</td>
						<td colspan="2"></td>
					</tr>
				</c:if>
				<c:if test="${not empty oaArchives.signScOpinion }">
					<tr>
						<td colspan="3"><label class="control-label">市场部副总意见</label></td>
						<td>${oaArchives.signScOpinion }</td>
						<td colspan="2"></td>
					</tr>
				</c:if>
				<c:if test="${not empty oaArchives.signRsOpinion }">
					<tr>
						<td colspan="3"><label class="control-label">人事部副总意见</label></td>
						<td>${oaArchives.signRsOpinion }</td>
						<td colspan="2"></td>
					</tr>
				</c:if>
				<c:if test="${not empty oaArchives.signCwOpinion }">
					<tr>
						<td><label class="control-label">财务部副总意见</label></td>
						<td>${oaArchives.signCwOpinion }</td>
						<td colspan="2"></td>
					</tr>
				</c:if>
				<tr>
					<td><label class="control-label">总经理会签意见</label></td>
					<td>${oaArchives.managerText }</td>
					<td colspan="2"></td>
					
				</tr>
		</table>
	</form:form>
</body>
</html>