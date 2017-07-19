<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/mobile/css/mui.min.css" />
<script src="${ctxStatic}/mobile/js/mui.min.js"></script>
<oam:listView id="dataTable">
	<c:forEach items="${histoicFlowList}" var="now" >
		<oam:listViewCell>
					<table style="width:100%;">
						<tr>
							<td style="width:25px">
								<img src="${ctxStatic}/mobile/images/${not empty now.histIns.endTime?'wancheng.png':'shenpizhong.png'}" style="width:15px"/>
							</td>
							<td>
								<h2 style="color:${not empty now.histIns.endTime?'#18a689':'#808080;'};font-size: 14px">${now.assigneeName}</h2>
							</td>
							<td>
								<div style='text-align:right;font-size: 14px'>
									<h2 style="color:${not empty now.histIns.endTime?'#18a689':'#808080;'};font-size: 14px"><fmt:formatDate value="${now.histIns.startTime}" pattern="yyyy.MM.dd HH:mm" /></h2>
								</div>
							</td>
						</tr>
						<tr>
							<td>
							</td>
							<td colspan="2">
								<p style="color:${not empty now.histIns.endTime?'#18a689':'#808080;'}">${now.histIns.activityName}</p>
							</td>
						</tr>
						<tr>
							<td>
							</td>
							<td colspan="2">
								<p style="color:#18a689">${now.comment}</p>
							</td>
						</tr>
					</table>			
		</oam:listViewCell>
	</c:forEach>
</oam:listView>




<%-- 		<ul class="xinfoot" style="margin-bottom: 0px !important;">
			<c:forEach var="now" items="${histoicFlowList}">
				<li class="contents_title2">
					<br>
					<table style="width:100%">
						<tr>
							<td style="width:30px">
								<img src="${ctxStatic}/mobile/images/${not empty now.histIns.endTime?'wancheng.png':'shenpizhong.png'}" />
							</td>
							<td>
								<h2 style="color:#18a689">${now.assigneeName}</h2>
							</td>
							<td>
								<div style='text-align:right'>
									<h2 style="color:#18a689"><fmt:formatDate value="${now.histIns.startTime}" pattern="yyyy.MM.dd HH:mm" /></h2>
								</div>
							</td>
						</tr>
						<tr>
							<td>
							</td>
							<td colspan="2">
								<p style="color:${not empty now.histIns.endTime?'#18a689':'#f7a54a'}">${now.histIns.activityName}</p>
							</td>
						</tr>
						<tr>
							<td>
							</td>
							<td colspan="2">
								<p style="color:#18a689">${now.comment}</p>
							</td>
						</tr>
					</table>
					<br>
				</li>
			</c:forEach>
		</ul> --%>