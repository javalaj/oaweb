<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>公司发文详情</title>
		<meta name="decorator" content="default"/>
		<link href="${ctxStatic}/mobile/css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="${ctxStatic}/mobile/css/Base.css" />
		
		<script type="text/javascript" src="${ctxStatic}/jquery/jquery-1.9.1.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${ctxStatic}/liuxin/css/mobile2.css" />
		<script type="text/javascript" src="${ctxStatic}/liuxin/fn.js"></script>
		<script src="${ctxStatic}/mobile/js/mui.min.js"></script>
		<link rel="stylesheet" href="${ctxStatic}/mobile/css/oabase.css" />
		<script type="text/javascript">
			$(document).ready(function() {
				
				$("#btnViewContent").click(function() {
					var content = $("#content").val();
					top.layer.open({
						type: 1, 
						area: ["100%","100%"],
					  	title: "正文详情",
					  	content: content
		 			});
				});
				
				//获取添加时选中的会签副总
				var departmentsign = document.getElementById("departmentsign").value;
				var departmentsigns = new Array();
				departmentsigns = departmentsign.split(",");
				for ( var str in departmentsigns) {
					$(
							"input[name=departmentsign][value="
									+ departmentsigns[str] + "]").attr(
							"checked", true);
				}
			});
		</script>

	</head>
	
	<body>
		<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">公司发文详情</h1>
	</header>
	
	<div class="mui-content">
		<div class="div1">
			<c:choose>
				<c:when test="${not empty fns:getUser().photo}">
					<img src="${fns:getUser().photo}" id="userimg" />
				</c:when>
				<c:otherwise>
					<img src="${ctxStatic}/mobile/images/touxiang.png" id="userimg" />
				</c:otherwise>
			</c:choose>
			<span id="spanname"> ${fns:getUser().name} </span> <img
				src="${ctxStatic}/mobile/images/zhuanfa.png" id="userimg3" /> <img
				<c:if test="${shoucang}">hidden="hidden"</c:if>
				src="${ctxStatic}/mobile/images/shoucang.png" id="userimg41"
				onclick="shoucang('${mctx}','${oaArchives.keyword}','/oa/oaArchives/detail?id=${oaArchives.id}','公文','${oaArchives.id}')" />
			<img src="${ctxStatic}/mobile/images/shoucang_hover.png"
				id="userimg42" <c:if test="${!shoucang}">hidden="hidden"</c:if>
				onclick="QXshoucang('${mctx}','${oaArchives.keyword}','/oa/oaArchives/detail?id=${oaArchives.id}','公文','${oaArchives.id}')" />
		</div>
	
	<div class="divcontent">
	<form id="inputForm"
		action="" method="post">
		<input type="hidden" name="departmentsign2" id="departmentsign"
			value="${oaArchives.departmentsign}" />
		<input type="hidden" name="content" id="content"
			value="${oaArchives.content}" />	
			
		<div class="divtitle">
			<span id="title">${title}</span>
		</div>
		
		<%-- <ul class="ul-form" style="padding-top: 20px;">
			<li class="btns">
				<div class="modal fade" id="modal-container-262575" role="dialog"
					aria-labelledby="myModalLabel" style="display:none;height:500px;">
					<div class="modal-dialog" style="width:750px;">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">×</button>
								<h4 class="modal-title" id="myModalLabel">正文</h4>
							</div>
							<div class="modal-body">

								<textarea htmlEscape="false" rows="20"
									maxlength="20000" class="input-xxlarge required" disabled="true">${oaArchives.content}</textarea>
								<sys:ckeditor replace="content" uploadPath="/oa/oaArchives" />
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>						
							</div>
						</div>
					</div>
				</div></li>
		</ul> --%>
		
			<ul class="mui-table-view divcontent">
			<li class="mui-table-view-cell">
				<span>发文字号：</span>
				<span>${oaArchives.code}&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>密级：</span>
				<span> ${oaArchives.secrets}&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>紧急程度：</span>
				<span>${oaArchives.urgency}&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>核稿人：</span>
				<span>${oaArchives.leadName}&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>核稿时间：</span>
				<span><fmt:formatDate value="${oaArchives.issuedate}" pattern="yyyy-MM-dd HH:mm:ss" />&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>拟稿人(部门)：</span>
				<span>${oaArchives.createBy.name}&nbsp;${oaArchives.officeName}</span>
			</li>
			<li class="mui-table-view-cell">
				<span>拟稿时间：</span>
				<span><fmt:formatDate value="${oaArchives.draftdate}" pattern="yyyy-MM-dd HH:mm:ss" />&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>事由：</span>
				<span> ${oaArchives.title}&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>主送：</span>
				<span>${oaArchives.oaArchivesNames}&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>抄送：</span>
				<span>${oaArchives.ccunit}&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>正文：</span>
				<span><a id="btnViewContent" href="javascript:void(0);" class="btn btn-primary btn-sm"><i class="fa fa-search-plus"></i> 查看正文</a>&nbsp;</span>
				<!-- <a id="contenthref" href="#modal-container-262575" data-toggle="modal">正文内容</a>&nbsp;</span> -->
			</li>
			<li class="mui-table-view-cell">
				<span>相关部门会签：</span>
				<span>
						<input name="departmentsign" type="checkbox" value="研发部"/>研发部&nbsp;
						<input name="departmentsign" type="checkbox" value="财务部"/>财务部&nbsp;
						<input name="departmentsign" type="checkbox" value="技术部"/>技术部&nbsp;
						<input name="departmentsign" type="checkbox" value="市场部"/>市场部&nbsp;
						<input name="departmentsign" type="checkbox" value="市场拓展部"/>市场拓展部&nbsp;
						<input name="departmentsign" type="checkbox" value="人事部"/>人事部&nbsp;
				</span>
			</li>
			<li class="mui-table-view-cell">
				<span>附件：</span>
				<span><input type="hidden"
					id="billingFile${oaArchives.id}" value="${oaArchives.files}" /> <div style="margin-left: 10px;float: left;">
					<sys:ckfinder
					input="billingFile${oaArchives.id}" readonly="true" type="files"
					uploadPath="/oa/oaArchives" selectMultiple="true" /></div>&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>主题词：</span>
				<span>${oaArchives.keyword}&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>部门负责人意见：</span>
				<span>${oaArchives.leadText}&nbsp;</span>
			</li>
			<c:if test="${not empty oaArchives.signYfOpinion }">
				<li class="mui-table-view-cell">
					<span>研发部意见：</span>
					<span>${oaArchives.signYfOpinion}&nbsp;</span>
				</li>				
			</c:if>
			<c:if test="${not empty oaArchives.signJsOpinion }">
				<li class="mui-table-view-cell">
					<span>技术部意见：</span>
<%-- 					<span><textarea rows="0" class="form-control" style="height:35px;" readonly="readonly">${oaArchives.signJsOpinion}</textarea>&nbsp;</span> --%>
					<span>${oaArchives.signJsOpinion}&nbsp;</span>
				</li>
			</c:if>
			<c:if test="${not empty oaArchives.signSwOpinion }">
				<li class="mui-table-view-cell">
					<span>市拓部意见：</span>
<%-- 					<span><textarea rows="0" class="form-control" style="height:35px;" readonly="readonly">${oaArchives.signSwOpinion}</textarea>&nbsp;</span> --%>
					<span>${oaArchives.signSwOpinion}&nbsp;</span>
				</li>				
			</c:if>
			<c:if test="${not empty oaArchives.signScOpinion }">
				<li class="mui-table-view-cell">
					<span>市场部意见：</span>
<%-- 					<span><textarea rows="0" class="form-control" style="height:35px;" readonly="readonly">${oaArchives.signScOpinion}</textarea>&nbsp;</span> --%>
					<span>${oaArchives.signScOpinion}&nbsp;</span>
				</li>				
			</c:if>
			<c:if test="${not empty oaArchives.signRsOpinion }">
				<li class="mui-table-view-cell">
					<span>人事部意见：</span>
<%-- 					<span><textarea rows="0" class="form-control" style="height:35px;" readonly="readonly">${oaArchives.signRsOpinion}</textarea>&nbsp;</span> --%>
					<span>${oaArchives.signRsOpinion}&nbsp;</span>
				</li>				
			</c:if>
			<c:if test="${not empty oaArchives.signCwOpinion }">
				<li class="mui-table-view-cell">
					<span>财务部意见：</span>
<%-- 					<span><textarea rows="0" class="form-control" style="height:35px;" readonly="readonly">${oaArchives.signCwOpinion}</textarea>&nbsp;</span> --%>
					<span>${oaArchives.signCwOpinion}&nbsp;</span>
				</li>				
			</c:if>
			<c:if test="${not empty oaArchives.managerText }">
				<li class="mui-table-view-cell">
					<span>总经理意见：</span>
<%-- 					<span><textarea rows="0" class="form-control" style="height:35px;" readonly="readonly">${oaArchives.managerText}</textarea></span> --%>
					<span>${oaArchives.managerText}&nbsp;</span>
				</li>				
			</c:if>							
		</ul>		
		</form>
		</div>	
		<act:flow-back-btn isMobile="true"></act:flow-back-btn>
		<ul class="xinfoot">
			<c:forEach var="now" items="${listact}">
				<li>
					<div class="contents_title2">
						<div class="content_img">
							<c:choose>
								<c:when test="${now.histIns.endTime != null}">
									<img src="${ctxStatic}/mobile/images/wancheng.png" alt="" />
								</c:when>
								<c:otherwise>
									<img src="${ctxStatic}/mobile/images/shenpizhong.png" alt="" />
								</c:otherwise>
							</c:choose>
						</div>
						<div class="content_title">
							<h3>${now.assigneeName}</h3>
							<span>${now.histIns.activityName}</span>
						</div>
						<div class="content_time">
							<span><fmt:formatDate value="${now.histIns.startTime}"
									pattern="yyyy.MM.dd HH:mm" /></span>
						</div>
						<div class="xinmsg">${now.comment}</div>
					</div>
				</li>
			</c:forEach>
		</ul>
		</div>
		<script src="${ctxStatic}/mobile/frame_js/mui.min.js"></script>
		<script type="text/javascript">
			mui.init()
			
			
			function liucheng_gz() {
				location.href = "LiuCheng_XieTong.html";
			}
			
			$(document).ready(function() {
			
				//获取添加时选中的会签副总
				var departmentsign = document.getElementById("departmentsign").value;
				var departmentsigns = new Array();
				departmentsigns = departmentsign.split(",");
				for ( var str in departmentsigns) {
					$(
							"input[name=departmentsign][value="
									+ departmentsigns[str] + "]").attr(
							"checked", true);
				}
				
			});
		
		</script><%-- <jsp:include page="/WEB-INF/views/mobile/modules/sys/foot.jsp"></jsp:include> --%>
		<sys:mui-datetime></sys:mui-datetime>
	</body>

</html>	