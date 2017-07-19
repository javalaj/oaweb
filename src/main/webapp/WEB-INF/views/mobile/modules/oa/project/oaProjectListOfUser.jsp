<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>我的项目</title>
	<meta name="decorator" content="default"/>
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no" />
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/mobile/css/mui.min.css" />
	<script src="${ctxStatic}/mui-master/dist/js/mui.min.js"></script>
	<script>
		mui.init({
			swipeBack:true //启用右滑关闭功能
		});
	</script>
	<style>
		#dataTable .mui-table-view-cell p{
			font-size:16px;
		}
		#dataTable .mui-table-view-cell font{
			font-size:14px;
		}
		#dataTable .mui-table-view-cell .mui-ellipsis{
			font-size:16px;
		}
		#dataTable .mui-table-view-cell .mui-pull-right{
			font-size:14px;
		}
	</style>
	<script type="text/javascript">
		$(document).ready(function() {
			$("html").removeAttr("style");
		});
	</script>
	
</head>
<body class="mui-ios mui-ios-9 mui-ios-9-1" style="background-color: #f7f7f7;">
 	<oam:header>
 		<a class="mui-icon mui-icon-left-nav mui-pull-left" onclick="location.href='${mctx}/sys/user/list'"></a>
		<h1 class="mui-title">我的项目</h1>
	</oam:header>
	<oam:message content="${message}"/>
	<oam:content>
		<oam:searchWidget cancelSelector="#cancelButton" paddingTop="44px">
			<oam:form id="searchForm" modelAttribute="oaProject" action="${mctx}/oa/project/oaProject/myList" method="post">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<oam:listView>
					<oam:listViewCell inputName="projectNo" title="项目编号" cellType="input">
						<form:input path="projectNo" htmlEscape="false" maxlength="64" placeholder="输入项目编号"/>
					</oam:listViewCell>
					<oam:listViewCell inputName="projectName" title="项目名称" cellType="input">
						<form:input path="projectName" htmlEscape="false" maxlength="64" placeholder="输入项目名称"/>
					</oam:listViewCell>
					<oam:listViewCell inputName="projectStage" title="项目阶段" cellType="input">
						<form:select path="projectStage" >
							<form:option value="" label="全部"/>
							<form:options items="${fns:getDictList('oaDoc_docType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
					</oam:listViewCell>
					<oam:listViewCell inputName="contractType" title="服务类别" cellType="input">
						<form:select path="contractType" >
							<form:option value="" label="全部"/>
							<form:options items="${fns:getDictList('oa_project_contractType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
					</oam:listViewCell>
					<oam:listViewCell inputName="beginEstablishmentTime" title="立项日期(起点)" cellType="input">
						<oam:datePicker options='{"type":"date"}' id="beginEstablishmentTime" name="beginEstablishmentTime" value="${fns:formatDate(oaProject.beginEstablishmentTime,'yyyy-MM-dd')}" placeholder="请选择日期"/>
					</oam:listViewCell>
					<oam:listViewCell inputName="endEstablishmentTime" title="立项日期(结点)" cellType="input">
						<oam:datePicker options='{"type":"date"}' id="endEstablishmentTime" name="endEstablishmentTime" value="${fns:formatDate(oaProject.endEstablishmentTime,'yyyy-MM-dd')}" placeholder="请选择日期"/>
					</oam:listViewCell>
					<oam:listViewCell>
						<table style="width:100%">
							<tbody>
								<tr>
									<td style="width:100%;text-align: center">
										<button type="button" class="mui-btn mui-btn-primary" onclick="search()"><i class="fa fa-search"></i>查询</button>
										<button type="button" class="mui-btn mui-btn-primary" onclick="reset()"><i class="fa fa-refresh"></i>重置</button>
										<button type="button" class="mui-btn mui-btn-danger" id="cancelButton"><i class="fa fa-cancel"></i>取消</button>
									</td>
								</tr>
							</tbody>
						</table>
					</oam:listViewCell>
				</oam:listView>
			</oam:form>	
		</oam:searchWidget>
		<oam:listView id="dataTable">
			<c:choose>
				<c:when test="${page.list.size()>0}">
					<c:forEach items="${page.list}" var="oaProject" varStatus="status">
						<oam:listViewCell onclick="location.href='${mctx}/oa/project/oaProject/form?id=${oaProject.id}'">
							<%-- <p>
								<i class="fa ${oaDoc.isPublic eq '0'?'fa-home':'fa-share-square-o'}" style="font-size:14px;color:rgb(26, 179, 148)"></i>
								<span style="color:#1ab394">
									${oaDoc.isPublic eq '0'?fns:concat(fns:concat('部门文档(',oaDoc.office.name),')'):'共享文档'}
								</span>
								<span class="mui-pull-right">
									<fmt:formatDate value="${oaDoc.createDate}" pattern="yyyy.MM.dd"/>
								</span>
							</p> --%>
							<p>
								<font color="#1a81d1">
									${oaProject.projectNo}
								</font>
							</p>
							<p class="mui-ellipsis">${oaProject.projectName}</p>
						</oam:listViewCell>
					</c:forEach>				
				</c:when>
				<c:otherwise>
					<oam:listViewCell>
						<p class="mui-ellipsis">暂无数据</p>
					</oam:listViewCell>
				</c:otherwise>
			</c:choose>
		</oam:listView>
		<oam:page page="${page}" ></oam:page>
	</oam:content>
</body>
</html>