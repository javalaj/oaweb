<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title>用印申请</title>
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/mobile/css/mui.min.css" />
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/mobile/css/Base.css" />
	<script type="text/javascript" src="${ctxStatic}/jquery/jquery-1.9.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/liuxin/css/mobile2.css" />
	<link rel="stylesheet" href="${ctxStatic}/mobile/css/oabase.css" />
	<style type="text/css">
			.btn-submit, .btn-draft{
				background-color: #12b7f5;
			    border: 1px solid #12b7f5;
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
		<h1 class="mui-title">编辑用印申请</h1>
		</header>
	<div class="mui-content">
		<form action="${ctx}/m/oa/oaSealUse/save" method="post">
		<div class="main-tit">${title }</div>
		<input type="hidden" name="token" value="${token }"> 
		<input type="hidden" value="0" name="flag" id="flag" /> 
		<input type="hidden" value="${oaSealUse.id}" name="id" />
		<input type="hidden" value="${oaSealUse.procInsId}" name="procInsId" />
		<sys:message content="${message}" />
		
		<ul class="mui-table-view divcontent">
			<li class="mui-table-view-cell" id="content11">
				<span>申请人：</span> 
				<input type="text" class="inputs" value="${oaSealUse.createBy.name}" name="createBy.id" disabled/>
			</li>
			<li class="mui-table-view-cell" id="content11">
				<span>所在部门：</span> 
				<input type="text" class="inputs" value="${oaSealUse.officeName}" name="officename" disabled/>
			</li>
			<li class="mui-table-view-cell" id="content11">
				<span>申请日期：</span>
				<input class="inputs mui-datetime" id="starttime" type="text" readonly="readonly" name="createDate" required="required"
					value="<fmt:formatDate value="${oaSealUse.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>" />
			</li>
			<li class="mui-table-view-cell" id="content11">
				<span>印章类型：</span> 
				<span style="width: 62%;">
					<input checked="checked" name="sealType" type="radio" value="公章"  class="exam"/>公章
					<input name="sealType" type="radio" value="合同章"  class="exam"/>合同章
			    </span>				
			</li>
			<li class="mui-table-view-cell" id="content11">
				<span>携带外出：</span> 
				<span style="width: 62%;">
					<input checked="checked" name="isout" type="radio" value="是"  class="exam"/>是 
					<input name="isout" type="radio" value="否"  class="exam"/>否
			    </span>
			</li>
			<li class="mui-table-view-cell" id="content11">
				<span style="vertical-align:top;">摘要事项：</span> 
				<textarea  name="matter" placeholder="" rows="3" id="matter" maxlength="800">${oaSealUse.matter}</textarea>
<%-- 				<input type="text" value="${oaSealUse.matter}" name="matter" id="matter" class="inputs" required="required"/> --%>
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
			<c:if test="${not empty oaSealUse.id }">
			<button type="submit" id="btnCancle2" data-loading-text="取消中" class="btnapp btn-next">取消申请</button>
			</c:if>			
		</div>
		</form>
		</div>
		<script src="${ctxStatic}/mobile/frame_js/mui.min.js"></script>
		<script type="text/javascript">
 			mui.init();

			$("#btnCancle2").click(function(){
					$("#flag").val("1");
			})
	
			$("#tijiao").click(function(){
				var matter = $("#matter").val();//证照类别
				var reason = $("#reason").val(); //使用事由
 				if(matter==""){
					mui.alert('摘要事项不能为空！');
					return false;
				}
 				return true;
			});
		</script><%-- <jsp:include page="/WEB-INF/views/mobile/modules/sys/foot.jsp"></jsp:include> --%>
		<sys:mui-datetime></sys:mui-datetime>
	</body>

</html>