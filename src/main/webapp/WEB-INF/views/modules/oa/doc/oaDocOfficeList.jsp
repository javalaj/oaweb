<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="doc" tagdir="/WEB-INF/tags/oa/doc" %>
<html>
<head>
	<title>文档信息管理</title>
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
		function resetForm(){
			resetSelection("docType","oaDoc_docType");
			resetSelection("isNeedLend","yes_no");
        }
		function resetSelection(id,typex){
			$("#"+id).val("");
			$("#s2id_"+id).children("a").children("span.select2-chosen").html("全部");
			$("#"+id).empty();
			$("#"+id).append("<option value=\"\" selected=\"selected\">全部</option>");
			$.ajax({
				type: "POST",
				url: "${ctx}/sys/dict/getDictList",
				data: {type:typex},
				dataType: 'json',
				success: function(data){
					for(var i=0;i<data.length;i++)  
					{  
						$("#"+id).append("<option value=\""+data[i].value+"\">"+data[i].label+"</option>");
					}
				}
			});
		}
	</script>
	<style>
		label + .btn{
			height:30px;
		}
	</style>
</head>
<body style="padding: 0px"  class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<doc:oaDocTitleNav activeIndex="2"></doc:oaDocTitleNav>
			<div class="ibox-content">
				<div class="row">
					<div class="col-sm-12">
						<form:form id="searchForm" modelAttribute="oaDoc" action="${ctx}/oa/doc/oaDoc/officeList" method="post" class="form-inline">
							<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
							<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
							<oa:searchGroup id="searchGroup">
								<label class="oa-search-group-alwaysVisible">标题：
									<form:input path="title" htmlEscape="false" maxlength="64" class="form-control input-sm"/>
								</label>	
								<label>关键词：
									<form:input path="keyword" htmlEscape="false" maxlength="200" class="form-control input-sm"/>
								</label>	
								<label>文档归类：
									<form:select path="docType" class="selectpicker " data-style="btn-inverse" data-live-search="true">
										<form:option value="" label="全部"/>
										<form:options items="${fns:getDictList('oaDoc_docType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
									</form:select>
								</label>	
								<label>是否需借阅：
									<form:select path="isNeedLend" class="selectpicker " data-style="btn-inverse" data-live-search="true">
										<form:option value="" label="全部"/>
										<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
									</form:select>
								</label>	
							</oa:searchGroup>
						</form:form>
						<sys:message content="${message}"/>
						<!-- 工具栏 -->
						<div class="row">
							<div class="col-sm-12">
								<div class="pull-left">	
								</div>
								<div class="pull-right">
									<button class="btn btn-primary btn-rounded btn-outline btn-sm "
										onclick="search()">
										<i class="fa fa-search"></i> 查询
									</button>
									<button id="btnReset" class="btn btn-primary btn-rounded btn-outline btn-sm "
										onclick="reset();">
										<i class="fa fa-refresh"></i> 重置
									</button>
								</div>
							</div>
						</div>
						<br/>
						<table id="contentTable" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
							<thead>
								<tr>
									<th>序号</th>
									<th>标题</th>
									<th>关键词</th>
									<th>文档归类</th>
									<th>是否需要借阅</th>
									<th>创建人</th>
									<th>下载次数</th>
									<th>借阅信息</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${page.list}" var="oaDoc" varStatus="status">
								<tr>
									<td>
										${status.count}
									</td>
									<td title="${oaDoc.title}">
										${fns:abbr2(oaDoc.title,32)}
									</td>
									<td title="${oaDoc.keyword}">
										${fns:abbr2(oaDoc.keyword,32)}
									</td>
									<td>
										${fns:getDictLabel(oaDoc.docType, 'oaDoc_docType', '')}
									</td>
									<td>
										${fns:getDictLabel(oaDoc.isNeedLend, 'yes_no', '')}
									</td>
									<td>
										${oaDoc.createBy.name}
									</td>
									<td>
										${oaDoc.downloadCount}
									</td>
									<td>
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
									</td>
									<td>
										<shiro:hasPermission name="oa:doc:oaDoc:edit">
										<c:if test="${oaDoc.isNeedLend ne '1'}">
											<a href="#" onclick="openDialogView('查看文档', '${ctx}/oa/doc/oaDoc/form?id=${oaDoc.id}','80%', '80%')"
												class="btn btn-info btn-xs"><i class="fa fa-search-plus"></i>查看</a>
										</c:if>
										<c:if test="${oaDoc.isNeedLend eq '1'}">
											<c:if test="${not empty oaDoc.oaDocReadApply }">
												<c:if test="${ oaDoc.oaDocReadApply.lendStatus eq '1'}">
													<a href="#" onclick="openDialogView('查看文档', '${ctx}/oa/doc/oaDoc/form?id=${oaDoc.id}','80%', '80%')"
														class="btn btn-info btn-xs"><i class="fa fa-search-plus"></i>查看</a>
												</c:if>
											</c:if>
											<c:if test="${empty oaDoc.oaDocReadApply}">
												<c:if test="${fns:getUser().id eq oaDoc.createBy.id}">
													<a href="#" onclick="openDialogView('查看文档', '${ctx}/oa/doc/oaDoc/form?id=${oaDoc.id}','80%', '80%')"
														class="btn btn-info btn-xs"><i class="fa fa-search-plus"></i>查看</a>
												</c:if>
												<c:if test="${fns:getUser().id ne oaDoc.createBy.id}">
													<a href="${ctx}/oa/doc/oaDocReadApply/save?doc.id=${oaDoc.id}&lendUser.id=${fns:getUser().id}" onclick="return confirmx('确认要借阅吗？', this.href)"
														class="btn btn-default btn-xs"><i class="fa fa-circle-o"></i>借阅</a>	
												</c:if>
											</c:if>
										</c:if>
										</shiro:hasPermission>
									</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
						<table:page page="${page}"></table:page>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>