<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>>办公电脑采购管理</title>
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
		
		function onsub()
		{
			if ($("#beginApplyTime").val() == null || $("#beginApplyTime").val() == ''
				|| $("#endApplyTime").val() == null || $("#endApplyTime").val() == '')
			{
				top.layer.msg("请填写完整的申请时间段");
			}
			else
			{
				search();
			}	
		}
		
	</script>
</head>
<body style="padding: 0px"  class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<div class="ibox-title">
				<h5>办公电脑采购管理</h5>
				<div class="ibox-tools">
				</div>
			</div> 
    		<div class="ibox-content">
				<div class="row">
					<div class="col-sm-12">
						<form:form id="searchForm" modelAttribute="computerPurchase" action="${ctx}/oa/computerpurchase/computerPurchase/" method="post" class="breadcrumb form-search">
							<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
							<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
							<div class="form-group">
								<label>申请时间：</label>
									<input id="beginApplyTime" name="beginApplyTime" type="text" readonly="readonly" maxlength="20" class="form-control Wdate laydate-icon layer-date input-sm"
										value="<fmt:formatDate value="${computerPurchase.beginApplyTime}" pattern="yyyy-MM-dd"/>"
										onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/> - 
									<input id="endApplyTime" name="endApplyTime" type="text" readonly="readonly" maxlength="20" class="form-control Wdate laydate-icon layer-date input-sm"
										value="<fmt:formatDate value="${computerPurchase.endApplyTime}" pattern="yyyy-MM-dd"/>"
										onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
							</div>
						</form:form>
						<sys:message content="${message}"/>
						<!-- 工具栏 -->
						<div class="row">
							<div class="col-sm-12">
								<div class="pull-left">
									<shiro:hasPermission name="oa:computerpurchase:computerPurchase:edit">
										<a href="${ctx}/oa/computerpurchase/computerPurchase/form" class="btn btn-white btn-sm"><i class="fa fa-plus"></i> 添加</a> 
									</shiro:hasPermission> 	
								</div>
								<div class="pull-right">
									<button class="btn btn-primary btn-rounded btn-outline btn-sm" onclick="search();">
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
									<th>申请部门</th>
									<th>申请时间</th>
									<th>申请人</th>
									<th>配置</th>
									<th>cpu</th>
									<th>内存</th>
									<th>硬盘容量</th>
									<th>显卡</th>
									<th>状态</th>
									<shiro:hasPermission name="oa:computerpurchase:computerPurchase:edit"><th>操作</th></shiro:hasPermission>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.list}" var="computerPurchase">
									<tr>
										<td>
											${computerPurchase.applyDept}
										</td>
										<td>
											<fmt:formatDate value="${computerPurchase.applyTime}" pattern="yyyy-MM-dd"/>
										</td>
										<td>
											${computerPurchase.userName.name}
										</td>
										<td>
											${fns:getDictLabel(computerPurchase.configure, 'computer_configure', '')}
										</td>
										<td>
											${computerPurchase.cpu}
										</td>
										<td>
											${computerPurchase.memory}
										</td>
										<td>
											${computerPurchase.hardDisk}
										</td>
										<td>
											${computerPurchase.videoCard}
										</td>
										<td>
											${fns:getDictLabel(computerPurchase.status, 'computer_purchase_status', '')}
										</td>
										<shiro:hasPermission name="oa:computerpurchase:computerPurchase:edit">
											<td>
												<c:choose>
													<c:when test="${computerPurchase.status eq '0' && computerPurchase.userName.id eq fns:getUser().id}">
														<a href="${ctx}/oa/computerpurchase/computerPurchase/form?id=${computerPurchase.id}" class="btn btn-warning btn-xs">
														<i class="fa fa-edit"></i>编辑</a>
													</c:when>
													<c:otherwise>
														<a href="${ctx}/oa/computerpurchase/computerPurchase/form?id=${computerPurchase.id}" class="btn btn-info btn-xs">
														<i class="fa fa-search-plus"></i>详情</a>
													</c:otherwise>
												</c:choose>
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