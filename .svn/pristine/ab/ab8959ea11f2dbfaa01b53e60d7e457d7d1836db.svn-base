<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>资质借用申请</title>
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/mobile/css/mui.min.css" />
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/mobile/css/Base.css" />
	<script type="text/javascript" src="${ctxStatic}/jquery/jquery-1.9.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/liuxin/css/mobile2.css" />
	<link rel="stylesheet" href="${ctxStatic}/mobile/css/oabase.css" />
	<style type=text/css>
	.btn-submit, .btn-draft{
		background-color: #12b5f7;
    	border: 1px solid #12b5f7;
	}
	.divcontent{
		border-bottom:none;
	}		
	.mui-table-view:after{
		position: initial;
	} 
	</style>
	</head>

	<body>
		<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">编辑资质借用申请</h1>
	</header>
	<div class="mui-content">
		<form action="${ctx}/m/oa/qualificationb/oaQualificationb/save" method="post">
		<div class="main-tit">${title }</div>
		<input type="hidden" name="token" value="${token }">
		<input type="hidden" value="0" name="flag" id="flag"/>
		<input type="hidden" value="${oaQualificationb.id}" name="id"/>
		<input type="hidden" value="${oaQualificationb.procInsId}" name="procInsId"/>
		<sys:message content="${message}" />
	
		<ul class="mui-table-view divcontent">
			<li class="mui-table-view-cell" id="content11">
				<span>借用人&nbsp;</span>
				<input type="text" class="inputs" value="${oaQualificationb.createBy.name}" name="createBy.id" disabled/>
			</li>
			<li class="mui-table-view-cell" id="content11">
				<span>所在部门</span>
				<input type="text" class="inputs" value="${oaQualificationb.officename}" name="officename" disabled/>
			</li>

			<li class="mui-table-view-cell" id="content11">
				<span>借用日期</span>	
				<input class="inputs mui-datetime" id="createDate" type="text" readonly="readonly" name="createDate"
					value='<fmt:formatDate value="${oaQualificationb.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>' />
			</li>

			<li class="mui-table-view-cell" id="content11">
				<span>证照名称<span class="requiredstar">*</span></span>				
				<input value="${oaQualificationb.licensename}" type="text" class="inputs" name="licensename" id="licensename"/>
			</li>			
			
			<li class="mui-table-view-cell" id="content11"><span>证照类别：</span>
				<span style="width: 62%;">
					<input checked="checked" name="type" type="radio" value="原件"  class="exam"/>原件 
					 <input name="type" type="radio" value="复印件"  class="exam"/>复印件
			    </span>
			</li>
			
			<li class="mui-table-view-cell" id="content11">
				<span>使用事由<span class="requiredstar">*</span></span>
				<input value="${oaQualificationb.reason}" class="inputs" maxlength="160" type="text" name="reason" id="reason"/>
			</li>
					
			<li class="mui-table-view-cell" id="content11">
				<span>备注</span>				
				<input value="${oaQualificationb.remarks}" name="remarks" class="inputs" maxlength="200" type="text" id="remarks"/>
			</li>
		</ul>
		
<!-- 		流程流转信息 -->
<c:if test="${fn:length(historys)>0}">
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
		</c:if>
		<div class="separation"></div>		
		<div class="bottom-button">
			<button type="submit" id="tijiao" data-loading-text="提交中" class="btnapp btn-submit">提交</button>
			<c:if test="${not empty oaQualificationb.id }">
			<button type="submit" id="btnCancle2" data-loading-text="取消中" class="btnapp btn-next">取消申请</button>
			</c:if>			
		</div>
		</form></div>
		<script src="${ctxStatic}/mobile/frame_js/mui.min.js"></script>
		
		<script type="text/javascript">
 			mui.init();

			$("#btnCancle2").click(function(){
					$("#flag").val("1");
			})
			
			$("#tijiao").click(function(){
				var licensename = $("#licensename").val();//证照类别
				var reason = $("#reason").val(); //使用事由
 				if(licensename==""){
					mui.alert('证照名称不能为空！');
					return false;
				}
 				if(reason==""){
					mui.alert('使用事由不能为空！');
					return false;
 				}
 				return true;
			});
		</script>
		<sys:mui-datetime></sys:mui-datetime>
	</body>

</html>