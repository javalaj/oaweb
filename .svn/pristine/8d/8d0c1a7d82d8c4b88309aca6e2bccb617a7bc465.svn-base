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
		function todo(docId,title){
			var src="${ctx}/oa/doc/oaDocReadApply?doc.id="+docId+"&doc.title="+encodeURIComponent(title)+"&lendStatus=0"
			top.layer.open({
				  type: 2, 
				  area: ["80%","80%"],
			      title: "文档阅读申请处理",
		          maxmin: true,
		          shadeClose: true,
				  content: src,
				  cancel: function(index, layero){
					  reset();
				  }
			});
		}
		function resetForm(){
			resetSelection("docType","oaDoc_docType");
			resetSelection("isNeedLend","yes_no");
			resetSelection("isPublic","yes_no");
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
</head>
<body style="padding: 0px"  class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<doc:oaDocTitleNav activeIndex="1"></doc:oaDocTitleNav>
    		<div class="ibox-content">
				<div class="row">
					<div class="col-sm-12">
						<form:form id="searchForm" modelAttribute="oaDoc" action="${ctx}/oa/doc/oaDoc/" method="post" class="form-inline">
							<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
							<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
							<oa:searchGroup id="searchGroup">
								<oa:searchGroupCell label="标题：" isAlwaysVisible="true">
									<form:input path="title" htmlEscape="false" maxlength="64" class="form-control input-sm"/>
								</oa:searchGroupCell>
								<oa:searchGroupCell label="关键词：" >
									<form:input path="keyword" htmlEscape="false" maxlength="200" class="form-control input-sm"/>
								</oa:searchGroupCell>
								<oa:searchGroupCell label="文档归类：">
									<form:select path="docType" class="selectpicker " data-style="btn-inverse" data-live-search="true">
										<form:option value="" label="全部"/>
										<form:options items="${fns:getDictList('oaDoc_docType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
									</form:select>
								</oa:searchGroupCell>
								<oa:searchGroupCell label="是否需借阅：">
									<form:select path="isNeedLend" class="selectpicker " data-style="btn-inverse" data-live-search="true">
										<form:option value="" label="全部"/>
										<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
									</form:select>
								</oa:searchGroupCell>
								<oa:searchGroupCell label="归属部门：">
									<sys:treeselect id="office" name="office.id" value="${oaDoc.office.id}" labelName="office.name" labelValue="${oaDoc.office.name}"
										title="部门" url="/sys/office/treeData?type=2" cssClass="form-control" allowClear="true" notAllowSelectParent="true"/>
								</oa:searchGroupCell>
								<oa:searchGroupCell label="是否共享：">
									<form:select path="isPublic" class="selectpicker " data-style="btn-inverse" data-live-search="true">
										<form:option value="" label="全部"/>
										<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
									</form:select>
								</oa:searchGroupCell>
							</oa:searchGroup>
						</form:form>
						<br/>
					</div>
				</div>
				<sys:message content="${message}"/>
				<!-- 工具栏 -->
				<div class="row">
					<div class="col-sm-12">
						<div class="pull-left">	
							<shiro:hasPermission name="oa:doc:oaDoc:edit"> 
								<table:addRow url="${ctx}/oa/doc/oaDoc/form" title="文档"></table:addRow><!-- 增加按钮 -->
							</shiro:hasPermission> 
						</div>
						<div class="pull-right">
							<button class="btn btn-primary btn-rounded btn-outline btn-sm "
								onclick="search()">
								<i class="fa fa-search"></i> 查询
							</button>
							<button id="btnReset" class="btn btn-primary btn-rounded btn-outline btn-sm "
								onclick="reset()">
								<i class="fa fa-refresh"></i> 重置
							</button>
						</div>
					</div>
				</div>
				<table id="contentTable" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
					<thead>
						<tr>
							<th>序号</th>
							<th>标题</th>
							<th>关键词</th>
							<th>文档归类</th>
							<th>是否需要借阅</th>
							<th>是否共享</th>
							<th>归属部门</th>
							<th>创建时间</th>
							<th>更新时间</th>
							<th>下载次数</th>
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
								${fns:getDictLabel(oaDoc.isPublic, 'yes_no', '')}
							</td>
							<td>
								${oaDoc.office.name}
							</td>
							<td>
								<fmt:formatDate value="${oaDoc.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
							</td>
							<td>
								<fmt:formatDate value="${oaDoc.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
							</td>
							<td>
								${oaDoc.downloadCount}
							</td>
							<td>
								<shiro:hasPermission name="oa:doc:oaDoc:view">
									<a href="#" onclick="openDialogView('查看文档', '${ctx}/oa/doc/oaDoc/form?id=${oaDoc.id}',width='800px', height='500px')"
										class="btn btn-info btn-xs"><i class="fa fa-search-plus"></i>查看</a>
								</shiro:hasPermission>
								<shiro:hasPermission name="oa:doc:oaDoc:edit">
				    				<a href="#" onclick="openDialog('修改文档', '${ctx}/oa/doc/oaDoc/form?id=${oaDoc.id}',width='800px', height='500px')"
										class="btn btn-success btn-xs"><i class="fa fa-edit"></i>修改</a>
									<a href="${ctx}/oa/doc/oaDoc/delete?id=${oaDoc.id}" onclick="return confirmx('确认要删除该文档信息吗？', this.href)"
										class="btn btn-danger btn-xs"><i class="fa fa-trash"></i>删除</a>	
									<c:if test="${oaDoc.applyCount>0}">
										<a href="javascript:void(0);" onclick="todo('${oaDoc.id}','${oaDoc.title}');"
											class="btn btn-warning btn-xs"><i class="fa"></i>处理申请(${oaDoc.applyCount})</a>	
									</c:if>
								</shiro:hasPermission>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<table:page page="${page}"></table:page>
				<br/>
				<br/>
			</div>
		</div>
	</div>
</body>
</html>