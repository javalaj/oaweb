<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>文档阅读申请信息管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
		function todo(oaDocReadApplyId,changTolendStatus){
			window.location.href = "${ctx}/oa/doc/oaDocReadApply/updateLendStatus?doc.id=${oaDocReadApply.doc.id}"+"&doc.title="+encodeURIComponent('${oaDocReadApply.doc.title}')+"&lendStatus=0"+"&changTolendStatus="+changTolendStatus+"&oaDocReadApplyId="+oaDocReadApplyId;
		}
	</script>
</head>
<body style="padding: 0px"  class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<div class="ibox-title">
				<h5>
					<form:form id="searchForm" modelAttribute="oaDocReadApply" action="${ctx}/oa/doc/oaDocReadApply/" method="post" class="form-inline">
						<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
						<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
						<input id="docId" name="doc.id" type="hidden"/>
						<div class="form-group">
							<label>当前文档：</label>
								<form:input path="doc.title" disabled="true" htmlEscape="false" maxlength="64" class="form-control input-sm"/>
						</div>
						<br>
					</form:form>
				</h5>
				<br>
				<div class="ibox-tools">
				</div>
				<br>
			</div>
			
			<div class="ibox-content">
				<div class="row">
					<div class="col-sm-12">
	
	<sys:message content="${message}"/>
	
	<c:if test="${page.list.size()<1}">
		<div style='text-align:left'><fieldset><legend><font color="green">当前没有需要处理的阅读申请</font></legend></fieldset></div>
	</c:if>
	<c:if test="${page.list.size()>0}">
	<table id="contentTable" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
		<thead>
			<tr>
				<th>序号</th>
				<th>借阅人</th>
				<th>申请时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="oaDocReadApply" varStatus="status">
			<tr>
				<td>
					${status.count}
				</td>
				<td>
					${oaDocReadApply.lendUser.name}
				</td>
				<td>
					<fmt:formatDate value="${oaDocReadApply.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<shiro:hasPermission name="oa:doc:oaDocReadApply:edit">
						<a href="javascript:void(0);" onclick="todo('${oaDocReadApply.id}','1');"
							class="btn btn-info btn-xs"><i class="fa"></i>同意</a>	
						<a href="javascript:void(0);" onclick="todo('${oaDocReadApply.id}','2');"
							class="btn btn-warning btn-xs"><i class="fa"></i>不同意</a>
					</shiro:hasPermission>	
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<table:page page="${page}"></table:page>
	</c:if>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>