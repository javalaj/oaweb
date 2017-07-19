<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=no" />
<link href="${ctxStatic}/mobile/css/mui.min.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/mobile/css/Base.css" />
<title>出差流程</title>
<script type="text/javascript"
	src="${ctxStatic}/jquery/jquery-1.9.1.min.js"></script><link rel="stylesheet" href="${ctxStatic}/mobile/css/oabase.css" />
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/liuxin/css/mobile2.css" />
</head>

<body>
	<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">审核出差申请</h1>
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
				onclick="shoucang('${mctx}','${title}','/oa/oaOutwork/form?flag=view&id=${oaOutwork.id}','协同','${oaOutwork.id}')" />
			<img src="${ctxStatic}/mobile/images/shoucang_hover.png"
				id="userimg42" <c:if test="${!shoucang}">hidden="hidden"</c:if>
				onclick="QXshoucang('${mctx}','${title}','/oa/oaOutwork/form?flag=view&id=${oaOutwork.id}','协同','${oaOutwork.id}')" />

		</div>
		<div class="divtitle">
			<span id="title">${title}</span>
		</div>
		<div class="divcontent">
			<form action="${mctx}/oa/oaOutwork/dealExam" method="post"
				id="inputForm">


				<input type="hidden" name="token" value="${token }"> <input
					type="hidden" value="${oaOutwork.id}" name="id" /> <input
					type="hidden" value="${oaOutwork.procInsId}" name="procInsId" /> <input
					type="hidden" value="${oaOutwork.fileId}" name="fileId" /> <input
					type="hidden" value="${oaOutwork.officeName}" name="officeName" />
				<input type="hidden" value="${oaOutwork.task}" name="task" /> <input
					type="hidden" value="${oaOutwork.address}" name="address" /> <input
					type="hidden" value="${oaOutwork.unitName}" name="unitName" /> <input
					type="hidden" value="${oaOutwork.unitUserName}" name="unitUserName" />
				<input type="hidden" name="startTime"
					value="<fmt:formatDate value="${oaOutwork.startTime}"
					pattern="yyyy-MM-dd HH:mm:ss" />" />
				<input type="hidden" name="endTime"
					value="<fmt:formatDate value="${oaOutwork.endTime}"
					pattern="yyyy-MM-dd HH:mm:ss" />" />
				<input type="hidden" value="${oaOutwork.cost}" name="cost" /> <input
					type="hidden" value="${oaOutwork.projectName}" name="projectName" />
				<input type="hidden" value="${oaOutwork.scheduleProgram}"
					name="scheduleProgram" />



				<ul class="mui-table-view divcontent">
					<li class="mui-table-view-cell"><span> 文件编号&emsp;：</span> <span>${oaOutwork.fileId }</span>
					</li>
					<li class="mui-table-view-cell"><span> 部门名称&emsp;：</span> <span>${oaOutwork.officeName }</span>
					</li>
					<li class="mui-table-view-cell"><span> 申请人&emsp;&emsp;：</span>
						<span>${oaOutwork.createBy.name }</span></li>
					<li class="mui-table-view-cell"><span> 申请时间&emsp;：</span> <span><fmt:formatDate
								value="${oaOutwork.createDate }" pattern="yyyy-MM-dd HH:mm:ss" /></span>
					</li>
					<li class="mui-table-view-cell"><span> 出差任务&emsp;：</span> <span>${oaOutwork.task }</span>
					</li>
					<li class="mui-table-view-cell"><span> 项目或合同：</span> <span>${oaOutwork.projectName }</span>
					</li>
					<li class="mui-table-view-cell"><span> 日程安排&emsp;：</span> <span>${oaOutwork.scheduleProgram }</span>
					</li>
					<li class="mui-table-view-cell"><span> 目的地&emsp;&emsp;：</span>
						<span>${oaOutwork.address }</span></li>
					<li class="mui-table-view-cell"><span> 访问单位&emsp;：</span> <span>${oaOutwork.unitName }</span>
					</li>
					<li class="mui-table-view-cell"><span> 拜访对象&emsp;：</span> <span>${oaOutwork.unitUserName }</span>
					</li>
					<li class="mui-table-view-cell"><span> 开始时间&emsp;：</span> <span><fmt:formatDate
								value="${oaOutwork.startTime}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
					</li>
					<li class="mui-table-view-cell"><span> 截止时间&emsp;：</span> <span><fmt:formatDate
								value="${oaOutwork.endTime}" pattern="yyyy-MM-dd HH:mm:ss" /></span></li>
					<li class="mui-table-view-cell"><span> 出差费用&emsp;：</span> <span>${oaOutwork.cost}</span>
					</li>

					<li class="mui-table-view-cell"><span> 审批意见：</span> <span style="width:60%;"><input class="exam"
							type="radio" name="exam" value="0"></input>同意 <input type="radio" class="exam"
							name="exam" checked="checked" value="1"></input>不同意</span></li>
					<li class="mui-table-view-cell"><span> 审批留言：</span> <input
						class="inputs" type="text" name="examtext"></li>
				</ul>
			</form>
		</div>









		<div class="bottom_button">
			<button type="button" data-loading-text="提交中" onclick="tijiao2()"
				class="bottoms btnapp btn-submit bt2 mui-btn-primary form-button">
				<span>提交审核</span>
			</button>
		</div>

		<ul class="xinfoot">
			<c:forEach var="now" items="${historys}">
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
		window.onload = function() {

		}
		/*限制*/
		var textLeng = 10;
		var text = document.getElementsByClassName('spcon');
		for (var i = 0; i < text.length; i++) {
			str = text[i].innerHTML;
			if (str.length > textLeng) {
				text[i].innerHTML = str.substring(0, textLeng) + "…";
			}
		}
		/*js控制按钮的联网请求*/
		mui(document.body).on('tap', '.mui-btn', function(e) {
			mui(this).button('loading');
			setTimeout(function() {
				mui(this).button('reset');
			}.bind(this), 2000);
		});
		(function($) {
			$('#scroll').scroll({
				indicators : true
			//是否显示滚动条
			});
		})(mui);

		function xiangqing() {
			location.href = "NewSynergy.html";

		}

		function tijiao2() {
			$("#inputForm").submit();
		}
	</script>
	<script type="text/javascript"
		src="${ctxStatic}/jquery/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${ctxStatic}/liuxin/fn.js"></script>
</body>
</html>