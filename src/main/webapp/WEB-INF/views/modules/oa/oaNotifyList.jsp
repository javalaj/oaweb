<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>通告列表</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
	$(document).ready(function() {
		$("tr:has(td:contains('未读'))").css({"font-weight":"bold"});
	});
	
    function aggrenGroup(url,f,id)
    {
 	    var u='${ctx}'+url;
 		$.ajax({
 			type : "POST",
 			url : u,
 			data : {
 				"oaid" : id,
 				"f"  :f
 			},
 			success : function(data) {
 				var obj = eval(data);
 				if (obj.status == '1') {
 					
 					var self = "${oaNotify.self?'self':''}";
 					
 					window.location.href = '${ctx}/oa/oaNotify/'+self;
 				} 
 			}
 		});
    }
    
    function lookoa(id)
    {
 	   $.ajax({
			type : "POST",
			url : "${ctx}/iim/contact/lookOa",
			data : {
				"id" : id
			},
			success : function(data) {
				var obj = eval(data);
				if (obj.status == '1') {
					var self = "${oaNotify.self?'self':''}";
 					
 					window.location.href = '${ctx}/oa/oaNotify/'+self;
				} 
			}
		});
    }
	</script>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<div class="ibox-title">
				<h5>${oaNotify.self?'消息中心':'我发布的通知'}</h5>
			</div> 
		    <div class="ibox-content">
				<sys:message content="${message}"/>
				<!-- 查询条件 -->
				<div class="row">
					<div class="col-sm-12">
						<form:form id="searchForm" modelAttribute="oaNotify" action="${ctx}/oa/oaNotify/${oaNotify.self?'self':''}" method="post" class="form-inline">
							<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
							<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
							<table:sortColumn id="orderBy" name="orderBy" value="${page.orderBy}" callback="sortOrRefresh();"/><!-- 支持排序 -->
							<div class="form-group">
								<label>标题：<form:input path="title" htmlEscape="false" maxlength="200"  class=" form-control input-sm"/></label>
								<c:if test="${!requestScope.oaNotify.self}"> 
									<label>类型：
										<form:select path="type"  class="selectpicker" data-style="btn-inverse"  data-live-search="true">
											<form:option value="" label="消息类型"/>
											<form:options items="${fns:getDictList('my_notify_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
										</form:select>
									</label>
								</c:if>
								<c:if test="${requestScope.oaNotify.self}"> 
									<label>类型：
										<form:select path="type"  class="selectpicker" data-style="btn-inverse"  data-live-search="true">
											<form:option value="" label="消息类型"/>
											<form:options items="${fns:getDictList('oa_notify_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
										</form:select>
									</label>
								</c:if>
								<c:if test="${oaNotify.self}"> 
									<label>阅读状态：
										<form:select path="readFlag"  class="selectpicker" data-style="btn-inverse"  data-live-search="true">
											<form:option value="" label="阅读状态"/>
											<form:options items="${fns:getDictList('oa_notify_read')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
										</form:select>
									</label>
								</c:if> 
								<c:if test="${!requestScope.oaNotify.self}">
									<label>状态：<form:radiobuttons path="status" class="i-checks" items="${fns:getDictList('oa_notify_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/></label>				
								</c:if>					
							</div>	
					</form:form>
					</div>
				</div>
				<!-- 工具栏 -->
				<div class="row">
					<div class="col-sm-12">
						<div class="pull-left">
							 <c:if test="${!requestScope.oaNotify.self}">
								<shiro:hasPermission name="oa:oaNotify:edit">				
									<a href="${ctx}/oa/oaNotify/form" class="btn btn-white btn-sm"><i class="fa fa-plus"></i> 发布通知</a><!-- 发布通知-->
								</shiro:hasPermission> 
								<shiro:hasPermission name="oa:oaNotify:edit"> 
									<table:delRow url="${ctx}/oa/oaNotify/deleteAll" id="contentTable" confirm_content="确认要删除通知吗?"/><!-- 删除按钮 -->
								 </shiro:hasPermission>  
							 </c:if>
							 <c:if test="${oaNotify.self}">
							 	<oa:oaStore url="${ctx}/oa/oaNotify/storeMessage" id="contentTable" tagName="消息"/><!--收藏消息  -->
							 </c:if>
							 <c:if test="${oaNotify.self}">
							 	<table:setRead url="${ctx}/oa/oaNotify/updateReadFlag" id="contentTable"/><!-- 设置已读 -->
							 </c:if>
						</div>
						<div class="pull-right">
							<button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="search()" ><i class="fa fa-search"></i> 查询</button>
							<button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="reset()" ><i class="fa fa-refresh"></i> 重置</button>
						</div>
					</div>
				</div>	
			<table id="contentTable" class="table table-striped table-bordered  table-hover table-condensed  dataTables-example dataTable no-footer">
				<thead>
					<tr>
						<th><input type="checkbox" id="allChk" class="i-checks"/>标题</th>
						<th>类型</th>
						<c:if test="${!requestScope.oaNotify.self}">
							<th>状态</th>
						</c:if>
						<th>发布人</th>
						<th>查阅状态</th>
						<th>更新时间</th>
					<shiro:hasPermission name="oa:oaNotify:view"><th>操作</th></shiro:hasPermission>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${page.list}" var="oaNotify">
					<tr>
						<td>
							<input type="checkbox" name="subChk" value="${oaNotify.id}" id="${oaNotify.id}" class="i-checks"/>
							<c:choose>
								<c:when test="${oaNotify.files=='2'}">
								   <a href="${ctx}/oa/cyTspOaMonthlyPlan/personal?commid=${oaNotify.content}&id=${oaNotify.id}">
									 ${fns:abbr(oaNotify.title,60)}
									</a>
								</c:when>
								<c:otherwise>
									<a href="${ctx}/oa/oaNotify/${requestScope.oaNotify.self?'view':'form'}?id=${oaNotify.id}">
										${fns:abbr(oaNotify.title,60)}
									</a>
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							${fns:getDictLabel(oaNotify.type, 'oa_notify_type', '')}
						</td>
						<c:if test="${!requestScope.oaNotify.self}">
							<td>
								${fns:getDictLabel(oaNotify.status, 'oa_notify_status', '')}
							</td>
						</c:if>
						<td>${oaNotify.createBy.name}${oaNotify.power}</td>
						<td id="consult">
							<c:if test="${requestScope.oaNotify.self}">
								${fns:getDictLabel(oaNotify.readFlag, 'oa_notify_read', '')}
							</c:if>
							<c:if test="${!requestScope.oaNotify.self}">
								${oaNotify.readNum} / ${oaNotify.readNum + oaNotify.unReadNum}
							</c:if>
						</td>
						<td>
							<fmt:formatDate value="${oaNotify.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
						</td>
						<td>
							<c:choose>
								<c:when test="${fns:getDictLabel(oaNotify.status, 'oa_notify_status', '')=='发布'}">
									<shiro:hasPermission name="oa:oaNotify:view">
										<a href="${ctx}/oa/oaNotify/view?id=${oaNotify.id}" class="btn btn-info btn-xs"><i class="fa fa-search-plus"></i> 详情</a>
									</shiro:hasPermission>
								</c:when>
								<c:otherwise>
									<shiro:hasPermission name="oa:oaNotify:edit">
										<a href="${ctx}/oa/oaNotify/form?id=${oaNotify.id}" class="btn btn-success btn-xs"><i class="fa fa-edit"></i> 修改</a>
									</shiro:hasPermission>
								</c:otherwise>
							</c:choose>  				
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<!-- 分页代码 -->
			<table:page page="${page}"/>
			<br/>
			<br/>
			</div>
		</div>
	</div>
</body>
</html>