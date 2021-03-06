<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>部门文档</title>
	<meta name="decorator" content="default"/>
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no" />
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/mobile/css/mui.min.css" />
	<script src="${ctxStatic}/mobile/js/mui.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/mobile/oa/css/oaDoc.css" />
	<script>
		mui.init({
			swipeBack:true //启用右滑关闭功能
		});
		mui('.mui-scroll-wrapper').scroll();
	</script>
    <script type="text/javascript">
    	$(document).ready(function() {
    		$("html").removeAttr("style");
    	});
	</script>
</head>


<body class="mui-ios mui-ios-9 mui-ios-9-1" style="background-color: #f7f7f7;">
 	<oam:header>
 		<a class="mui-icon mui-icon-left-nav mui-pull-left" onclick="location.href='${ctx}'"></a>
		<h1 class="mui-title">部门文档</h1>
		<a id="menu" class="mui-action-menu mui-icon mui-icon-bars mui-pull-right" href="#topPopover"></a>
	</oam:header>
	<oam:message content="${message}"/>
	<oam:content>
		<oam:searchWidget cancelSelector="#cancelButton" paddingTop="44px">

			<oam:form id="searchForm" modelAttribute="oaDoc" action="${mctx}/oa/doc/oaDoc/officeList" method="post">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<oam:listView>
					<oam:listViewCell inputName="title" title="标题" cellType="input">
						<form:input path="title" htmlEscape="false" maxlength="64" placeholder="输入标题"/>
					</oam:listViewCell>
					<oam:listViewCell inputName="keyword" title="关键词" cellType="input">
						<form:input path="keyword" htmlEscape="false" maxlength="200" placeholder="输入关键词"/>
					</oam:listViewCell>
					<oam:listViewCell inputName="docType" title="文档归类" cellType="input">
						<form:select path="docType" class="form-control">
							<form:option value="" label="全部"/>
							<form:options items="${fns:getDictList('oaDoc_docType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
					</oam:listViewCell>
					<oam:listViewCell inputName="isNeedLend" title="需要借阅" cellType="input">
						<form:select path="isNeedLend">
							<form:option value="" label="全部"/>
							<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
					</oam:listViewCell>
					<oam:listViewCell>
						<table style="width:100%">
							<tbody>
								<tr>
									<td style="width:100%;text-align: center">
										<button type="button" class="mui-btn mui-btn-primary" onclick="search()"><i class="fa fa-search"></i>查询</button>
										<button type="button" class="mui-btn mui-btn-primary" onclick="reset()"><i class="fa fa-refresh"></i>重置</button>
										<button type="button" class="mui-btn mui-btn-danger" id="cancelButton">取消搜索</button>
									</td>
								</tr>
							</tbody>
						</table>
					</oam:listViewCell>
				</oam:listView>
			</oam:form>			
		</oam:searchWidget>
		<ul class="mui-table-view">
			<c:choose>
				<c:when test="${page.list.size()>0}">
					<c:forEach items="${page.list}" var="oaDoc" varStatus="status">
						<li class="mui-table-view-cell" onclick="location.href='${mctx}/oa/doc/oaDoc/form?id=${oaDoc.id}&prePage=/oa/doc/oaDoc/officeList'">
							<p>
								<span style="color:#1a81d1">
									${oaDoc.createBy.name}${ oaDoc.oaDocReadApply.lendStatus}
								</span>
								<span class="mui-pull-right">
									<fmt:formatDate value="${oaDoc.createDate}" pattern="yyyy.MM.dd"/>
								</span>
							</p>
							<p class="mui-ellipsis">${oaDoc.title}</p>
						</li>
					</c:forEach>				
				</c:when>
				<c:otherwise>
					<li class="mui-table-view-cell">
						<p class="mui-ellipsis">暂无数据</p>
					</li>
				</c:otherwise>
			</c:choose>		
		</ul>
		<table:pageMobile page="${page}" showPageOne="false"></table:pageMobile>
	</oam:content>
	
	<oam:menu1 id="topPopover" height="150px">
		<oam:menu1Cell title="我的文档" url="${mctx}/oa/doc/oaDoc/" iconClass="mui-icon-contact"></oam:menu1Cell>
		<oam:menu1Cell title="共享文档" url="${mctx}/oa/doc/oaDoc/publicList" iconClass="mui-icon-navigate"></oam:menu1Cell>
		<oam:menu1Cell title="我的借阅" url="${mctx}/oa/doc/oaDocReadApply/myList" iconClass="mui-icon-eye"></oam:menu1Cell>
	</oam:menu1>	
			
</body>
</html>