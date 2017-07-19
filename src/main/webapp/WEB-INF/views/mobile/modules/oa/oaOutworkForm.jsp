<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="decorator" content="default" />
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<title>出差流程</title>
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/mobile/css/mui.min.css" />
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/mobile/css/Base.css" />
<script type="text/javascript"
	src="${ctxStatic}/jquery/jquery-1.9.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/liuxin/css/mobile2.css" />
<link rel="stylesheet" href="${ctxStatic}/mobile/css/oabase.css" />
<style type="text/css">
.divcontent {
	border-bottom: none;
}

.mui-table-view:after {
	position: initial;
}
</style>
</head>
<body>
	<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">编辑出差申请</h1>
	</header>
	<div
		class="mui-content <c:if test='${empty oaOutwork.procInsId}'>mui-content-formview</c:if>">
		<form method="post" action="${mctx}/oa/oaOutwork/save" id="vacateForm">
			<input type="hidden"
				value='<fmt:formatDate value="${minDate}" pattern="yyyy-MM-dd HH:mm"/>'
				id="minDate"><input type="hidden" name="id"
				value="${oaOutwork.id}"> <input type="hidden"
				name="procInsId" value="${oaOutwork.procInsId}"> <input
				type="hidden" name="officeName" value="${oaOutwork.officeName}">
			<input type="hidden" name="token" value="${token }"> <input
				type="hidden" name="flag" value="0" id="flag">

			<ul class="mui-table-view divcontent">
				<li class="mui-table-view-cell" id="content11"><span>文件编号：</span>
					<input class="inputs" type="text" readonly="readonly" name="fileId"
					id="leftinput" value='${oaOutwork.fileId}' /></li>
				<li class="mui-table-view-cell" id="content11"><span>出差任务：</span>
					<input class="inputs" type="text" name="task" id="leftinput"
					value='${oaOutwork.task}' /></li>
				<li class="mui-table-view-cell" id="content11"><span>项目或合同：</span>
					<input class="inputs" type="text" name="projectName" id="leftinput"
					value='${oaOutwork.projectName}' /></li>
				<li class="mui-table-view-cell" id="content11"><span>日程安排：</span>
					<input class="inputs" type="text" name="scheduleProgram"
					id="leftinput" value='${oaOutwork.scheduleProgram}' /></li>
				<li class="mui-table-view-cell" id="content11"><span>目的地：</span>
					<input class="inputs" type="text" name="address" id="leftinput"
					value='${oaOutwork.address}' /></li>
				<li class="mui-table-view-cell" id="content11"><span>访问单位：</span>
					<input class="inputs" type="text" name="unitName" id="leftinput"
					value='${oaOutwork.unitName}' /></li>
				<li class="mui-table-view-cell" id="content11"><span>拜访对象：</span>
					<input class="inputs" type="text" name="unitUserName"
					id="leftinput" value='${oaOutwork.unitUserName}' /></li>
				<li class="mui-table-view-cell" id="content11"><span>开始时间：</span>
					<input class="inputs mui-datetime" type="text" name="startTime"
					readonly="readonly" id="leftinput"
					value='<fmt:formatDate value="${oaOutwork.startTime}" pattern="yyyy-MM-dd HH:mm"/>' />
				</li>
				<li class="mui-table-view-cell" id="content11"><span>结束时间：</span>
					<input class="inputs mui-datetime" type="text" name="endTime"
					id="leftinput" readonly="readonly"
					value='<fmt:formatDate value="${oaOutwork.endTime}" pattern="yyyy-MM-dd HH:mm"/>' />
				</li>
				<li class="mui-table-view-cell" id="content11"><span>出差费用：</span>
					<input name="cost" class="inputs" value="${oaOutwork.cost}"
					type="text" /></li>
			</ul>




		</form>


		<c:choose>
			<c:when test="${ not empty oaOutwork.procInsId}">
				<div class="bottom_button">
					<shiro:hasPermission name="oa:oaOutwork:edit">
						<button type="button" data-loading-text="提交中"
							class="bottoms btnapp btn-submit  mui-btn bt2 mui-btn-primary  form-button2"
							onclick="tijiao()">
							<span>提交</span>
						</button>
					</shiro:hasPermission>
					<button type="button" data-loading-text="查询中"
						class="btnapp btn-next mui-btn bt2 form-button2"
						onclick="tijiao2()">
						<span>作废申请</span>
					</button>
				</div>
			</c:when>
			<c:otherwise>
				<div class="bottom_button">
					<shiro:hasPermission name="oa:oaOutwork:edit">
						<button type="button" data-loading-text="提交中"
							class="bottoms btnapp btn-submit  mui-btn bt2 mui-btn-primary  form-button"
							onclick="tijiao()">
							<span>提交</span>
						</button>
					</shiro:hasPermission>
				</div>
			</c:otherwise>
		</c:choose>
		<c:if test="${fn:length(historys)>0}">
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
		</c:if>
	</div>


	<script src="${ctxStatic}/mobile/frame_js/mui.min.js"></script>
	<script type="text/javascript">//日期格式方法
	Date.prototype.format = function(fmt) { 
	     var o = { 
	        "M+" : this.getMonth()+1,                 //月份 
	        "d+" : this.getDate(),                    //日 
	        "H+" : this.getHours(),                   //小时 
	        "m+" : this.getMinutes(),                 //分 
	        "s+" : this.getSeconds(),                 //秒 
	        "q+" : Math.floor((this.getMonth()+3)/3), //季度 
	        "S"  : this.getMilliseconds()             //毫秒 
	    }; 
	    if(/(y+)/.test(fmt)) {
	            fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
	    }
	     for(var k in o) {
	        if(new RegExp("("+ k +")").test(fmt)){
	             fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
	         }
	     }
	    return fmt; 
	}        
	
	
	
		mui.init()

		/*js控制按钮的联网请求*/
		mui(document.body).on('tap', '.type', function(e) {
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
		/*限制*/
		var textLeng = 10;
		var text = document.getElementsByClassName('spcon');
		for (var i = 0; i < text.length; i++) {
			str = text[i].innerHTML;
			if (str.length > textLeng) {
				text[i].innerHTML = str.substring(0, textLeng) + "…";
			}
		}

		//表单字段验证函数
		function validate() {
			var judge = true;
			//为空判断
			//input not null
			$("input[name!=id][name!=fileId][type!=hidden]").each(function() {
				if ($(this).val() == "") {
					$(this).addClass("required");
					judge = false;
				} else {
					$(this).removeClass("required");
				}
			});
			//textarea not null
			if ($("textarea[name=reason]").val() == "") {
				$("textarea[name=reason]").addClass("required");
				judge = false;
			} else {
				$("textarea[name=reason]").removeClass("required");
			}

			//提示
			if (!judge) {
				new_alert("请填写红色框内容！", " ");
			} else {
				//前后时间大小判断
				var date1 = new Date($("input[name=startTime]").val());
				var date2 = new Date($("input[name=endTime]").val());
				var minDate = new Date($("#minDate").val());
				//开始时间控制
				if (date1 <= minDate) {
					judge = false;
					new_alert("开始时间必须大于 "+minDate.format("yyyy-MM-dd")+" ", " ");
					return judge;
				}
				//时间大小控制
				if (date2 <= date1) {
					judge = false;
					new_alert("开始时间必须小于结束时间！", " ");
					return judge;
				}
				//出差费用为正数
				var regu = /^\d+(\.\d{1,2})?$/;
				if (!regu.test($("input[name=cost]").val())) {
					judge = false;
					new_alert("出差费用格式错误(举例：6.66)！", " ");
				}
			}
			return judge;
		}
		//提交表单方法
		function tijiao() {
			if (validate()) {
				$("#vacateForm").submit();
			}
		}
		//作废申请提交表单方法
		function tijiao2() {
			$("#flag").val("1");
			tijiao();
		}
	</script>
	<sys:mui-datetime></sys:mui-datetime>
	<%--<jsp:include page="/WEB-INF/views/mobile/modules/sys/foot.jsp"></jsp:include> --%>
</body>

</html>