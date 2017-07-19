<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>变更目的地用车申请</title>
		<link href="${ctxStatic}/mobile/css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="${ctxStatic}/mobile/css/Base.css" />
		
		<script type="text/javascript" src="${ctxStatic}/jquery/jquery-1.9.1.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${ctxStatic}/liuxin/css/mobile2.css" />
		<script type="text/javascript" src="${ctxStatic}/liuxin/fn.js"></script>
		<script src="${ctxStatic}/mobile/js/mui.min.js"></script>
		<link rel="stylesheet" href="${ctxStatic}/mobile/css/oabase.css" />
	</head>

	<body>
	<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">用车申请</h1>
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
				onclick="shoucang('${mctx}','${title}','/oa/oaUsecar/form?id=${oaUsecar.id}','协同','${oaUsecar.id}')" />
			<img src="${ctxStatic}/mobile/images/shoucang_hover.png"
				id="userimg42" <c:if test="${!shoucang}">hidden="hidden"</c:if>
				onclick="QXshoucang('${mctx}','${title}','/oa/oaUsecar/form?id=${oaUsecar.id}','协同','${oaUsecar.id}')" />

		</div>
	
	<div class="divcontent">
	<form id="inputForm" action="${ctx}/m/oa/oaUsecar/dealExam2" method="post">
		<div class="divtitle">
			<span id="title">${title}</span>
		</div>	
		<input type="hidden" name="token" value="${token }">
		<input type="hidden" name="next" value="0" id="next">
		
		<input type="hidden" value="${oaUsecar.id}" name="id"/>
		<input type="hidden" value="${oaUsecar.procInsId}" name="procInsId"/>
		<input type="hidden" value="${oaUsecar.fileId}" name="fileId"/>
		<input type="hidden" value="${oaUsecar.department}" name="department"/>
		<input type="hidden" value="${oaUsecar.createBy.id}" name="createBy.id"/> 
		<input type="hidden" value="<fmt:formatDate value="${oaUsecar.usetime}" pattern="yyyy-MM-dd HH:mm:ss"/>" name="usetime"/>
		<input type="hidden" value="${oaUsecar.usereason}" name="usereason"/>
		<input type="hidden" value="${oaUsecar.destination}" name="destination" id="destination"/>
		<input type="hidden" value="${oaUsecar.usescope}" name="usescope"/>
		<input type="hidden" value="${oaUsecar.examname}" name="examname"/>
		<input type="hidden" value="${oaUsecar.examtext}" name="examtext"/>
		<sys:message content="${message}" />
					
		<ul class="mui-table-view divcontent">
			<li class="mui-table-view-cell">
				<span>用车部门：</span>
				<span>${oaUsecar.department}&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>申&nbsp;&nbsp;请&nbsp;&nbsp;人：</span>
				<span>${oaUsecar.createBy.name}&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>用车时间：</span>
				<span><fmt:formatDate value="${oaUsecar.usetime}" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>用车原因：</span>
				<span>${oaUsecar.usereason}&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>目&nbsp;&nbsp;的&nbsp;&nbsp;地：</span>
				<span>${oaUsecar.destination}&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>用车范围：</span>
				<span>${oaUsecar.usescope}&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>人事签字：</span>
				<span>${oaUsecar.examname}&nbsp;</span>
			</li>
			<li class="mui-table-view-cell">
				<span>人事留言：</span>
				<span>${oaUsecar.examtext}&nbsp;</span>
			</li>
			
			<li class="mui-table-view-cell" id="content11"><span>变更目的地：</span>
				<span style="width:60%;">
					<input type="radio" class="exam" name="exam" value="0" checked="checked"/>不变更 
					<input type="radio" name="exam" class="exam" value="1" />变更
			    </span>
			</li>
			<li class="mui-table-view-cell" id="content11">
				<span>变更地点：</span>
				<input type="text" name="destinationchange" id="destinationchange" class="inputs">
			</li>
		</ul>
			
			<div class="bottom_button">
			<button type="submit" data-loading-text="提交中"
				class="bottoms btnapp btn-submit bt2 mui-btn-primary form-button" onclick="return choose();">
				<span>提交审核</span>
			</button>
		</div>
		</form>
		</div>
		
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
// 				/*js控制按钮的联网请求*/
// 			mui(document.body).on('tap', '.type', function(e) {
// 				mui(this).button('loading');
// 				setTimeout(function() {
// 					mui(this).button('reset');
// 				}.bind(this), 2000);
// 			});

 			//判断是否变更目的地，如果变更则变更目的地项必填
 			function choose(){
 				var change = $('input:radio:checked').val();
 				var destinationchange = $("#destinationchange").val();
 				var destination = $("#destination").val();

 				if((change == '1' && destinationchange=='')||(change == '1' && destinationchange==destination)){
 					mui.alert("请注意填写变更后的目的地!", "系统提示");
 					return false;
 				}
 				if(change == '0' && destinationchange !=''){
 					mui.alert("请置空变更目的地项!", "系统提示");
 					return false;
 				}
 				return true;
 			}
 			
			$("#btnCancle2").click(function() {
				$("#next").val("1");
			});
		</script><%-- <jsp:include page="/WEB-INF/views/mobile/modules/sys/foot.jsp"></jsp:include> --%>
	</body>

</html>