<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>固定资产申购管理</title>
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
	</script>
</head>
<body style="padding: 0px"  class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			 <div class="ibox-title">
				<h5>固定资产申购管理</h5>
				<div class="ibox-tools"></div>
			</div> 
    		<div class="ibox-content">
				<div class="row">
					<div class="col-sm-12">	
						<form:form id="searchForm" modelAttribute="applyFixedAssets" action="${ctx}/oa/fixedassetpurchase/applyFixedAssets/" method="post" class="breadcrumb form-search">
							<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
							<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
							<div class="form-group">
								<label>申请时间：</label>
									<input name="beginApplyTime" type="text" readonly="readonly" maxlength="20" class="form-control Wdate laydate-icon layer-date input-sm"
										value="<fmt:formatDate value="${applyFixedAssets.beginApplyTime}" pattern="yyyy-MM-dd"/>"
										onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/> - 
									<input name="endApplyTime" type="text" readonly="readonly" maxlength="20" class="form-control Wdate laydate-icon layer-date input-sm"
										value="<fmt:formatDate value="${applyFixedAssets.endApplyTime}" pattern="yyyy-MM-dd"/>"
										onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
								<label>申请标题：</label>
									<form:input path="applyTitle" htmlEscape="false" maxlength="20" class="form-control" style="width:20%;"/>
							</div>
						</form:form>
						<sys:message content="${message}"/>
						<!-- 工具栏 -->
						<div class="row">
							<div class="col-sm-12">
								<div class="pull-left">
									<shiro:hasPermission name="oa:fixedassetpurchase:applyFixedAssets:edit">
										<a href="${ctx}/oa/fixedassetpurchase/applyFixedAssets/form" class="btn btn-white btn-sm"><i class="fa fa-plus"></i> 添加</a> 
									</shiro:hasPermission> 	
								</div>
								<div class="pull-right">
									<button class="btn btn-primary btn-rounded btn-outline btn-sm" onclick="search()">
										<i class="fa fa-search"></i> 查询
									</button>
									<button id="btnReset" class="btn btn-primary btn-rounded btn-outline btn-sm" onclick="reset();">
										<i class="fa fa-refresh"></i> 重置
									</button>
								</div>
							</div>
						</div>
						<table id="contentTable" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
							<thead>
								<tr>
									<th>申请人</th>
									<th>申请部门</th>
									<th>申请时间</th>
									<th>资产类别</th>
									<th>申请标题</th>
									<th>状态</th>
									<shiro:hasPermission name="oa:fixedassetpurchase:applyFixedAssets:edit">
										<th>操作</th>
									</shiro:hasPermission>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.list}" var="applyFixedAssets">
									<tr>
										<td>
											${applyFixedAssets.applyName.name}
										</td>
										<td>
											${applyFixedAssets.applyDept}
										</td>
										<td>
											<fmt:formatDate value="${applyFixedAssets.applyTime}" pattern="yyyy-MM-dd"/>
										</td>
										<td>
											${fns:getDictLabel(applyFixedAssets.assetsCategory, 'assets_category', '')}
										</td>
										<td>
											${applyFixedAssets.applyTitle}
										</td>
										<td>
											${fns:getDictLabel(applyFixedAssets.status, 'apply_fixed_assets_status', '')}
										</td>
										<shiro:hasPermission name="oa:fixedassetpurchase:applyFixedAssets:edit">
											<td>
												<a href="${ctx}/oa/fixedassetpurchase/applyFixedAssets/form?id=${applyFixedAssets.id}" 
												class="btn ${applyFixedAssets.status eq '0'?'btn-success':'btn-info'} btn-xs">
												<i class="fa ${applyFixedAssets.status eq '0'?'fa-edit':'fa-search-plus'}"></i>
												${applyFixedAssets.status eq '0'?'编辑':'详情'}</a>
											</td>
										</shiro:hasPermission>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<table:page page="${page}"/>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>