<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="decorator" content="default" />
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<c:choose>
	<c:when test="${isTX}">
		<title>调休流程</title>
	</c:when>
	<c:otherwise>
		<title>请假流程</title>
	</c:otherwise>
</c:choose>
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/mobile/css/mui.min.css" />
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/mobile/css/Base.css" />
<link href="${ctxStatic}/liuxin/css/mobile2.css" rel="stylesheet" />
<link rel="stylesheet" href="${ctxStatic}/mobile/css/oabase.css" />
<style type="text/css">
.btn-submit {
	background-color: #12b7f5;;
	border: 1px solid #12b7f5;;
}

.mui-action-back {
	color: #12b7f5;
}

.xin_select {
	height: 32px;
}

.divcontent {
	border-bottom: none;
}

.mui-table-view:after {
	position: initial;
}
</style>
<script type="text/javascript"
	src="${ctxStatic}/jquery/jquery-1.9.1.min.js"></script>
</head>
<body>
	<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<c:choose>
			<c:when test="${isTX}">
				<h1 class="mui-title">编辑调休申请</h1>
			</c:when>
			<c:otherwise>
				<h1 class="mui-title">编辑请假申请</h1>
			</c:otherwise>
		</c:choose>
	</header>
	<div
		class="mui-content <c:if test='${empty oaProVacate.procInsId}'>mui-content-formview</c:if>">
		<input type="hidden" value="${warn}" id="warn" />
		<form method="post" action="${mctx}/oa/coding/oaProVacate/save"
			id="vacateForm">
			<input type="hidden" name="id" value="${oaProVacate.id}" /> <input
				type="hidden" name="vacateTitle" value="${oaProVacate.vacateTitle}" />
			<input type="hidden" name="isTX" value="${isTX}" /><input
				type="hidden" name="realGo" value="false" />

			<ul class="mui-table-view divcontent">
				<li class="mui-table-view-cell" id="content11"><span>申请日期：</span>
					<input class="inputs" type="text" name="applydate" id="leftinput"
					readonly="readonly"
					value='<fmt:formatDate value="${oaProVacate.applydate}" pattern="yyyy-MM-dd"/>' />
				</li>
				<li class="mui-table-view-cell" id="content11"><span>开始时间：</span>
					<input class="inputs mui-datetime" type="text"
					name="vacatebegindate" readonly="readonly" id="leftinput"
					value='<fmt:formatDate value="${oaProVacate.vacatebegindate}" pattern="yyyy-MM-dd HH:mm"/>' />
				</li>

				<li class="mui-table-view-cell" id="content11"><span>截止时间：</span>
					<input class="inputs mui-datetime" type="text" name="vacateenddate"
					readonly="readonly" id="leftinput"
					value='<fmt:formatDate value="${oaProVacate.vacateenddate}" pattern="yyyy-MM-dd HH:mm"/>' />
				</li>

				<li class="mui-table-view-cell" id="content11"><span>请假小时：</span>
					<input name="vacatedays" class="inputs"
					value="${oaProVacate.vacatedays}" type="text" maxlength="10" /></li>
				<c:if test="${isTX}">
					<li class="mui-table-view-cell" id="content11"><span>剩余时长：</span>
						${restTime}</li>
				</c:if>
				<c:choose>
					<c:when test="${isTX}">
						<li class="mui-table-view-cell" id="content11"><span>请假类型：</span>
							调休<input name="vacatetype" value="2" type="hidden" /></li>
					</c:when>
					<c:otherwise>
						<li class="mui-table-view-cell" id="content11"><span>请假类型：</span>
							<select class="selects riqi_selects xin_select" name="vacatetype">
								<c:forEach items="${fns:getDictList('pro_vacate_type_show')}"
									var="now">
									<option value="${now.value }"
										<c:if test="${oaProVacate.vacatetype==now.value}">selected</c:if>>${now.label }</option>
								</c:forEach>
						</select></li>
					</c:otherwise>
				</c:choose>
				<li class="mui-table-view-cell" id="content11"><span>请假事由：</span>
					<textarea name="vacatedesc" placeholder="请输入申请说明" rows="4"
						class="textgp">${oaProVacate.vacatedesc}</textarea></li>
				<li class="mui-table-view-cell"><span>是否提交：</span><span style="width: 62%;">
						<input checked="checked" name="exam" type="radio" class="exam"
						value="1" />提交 <input name="exam" class="exam" type="radio"
						value="0" />作废
				</span></li>
			</ul>
		</form>
		<div class="bottom_button">
			<button type="button" data-loading-text="提交中"
				class="bottoms btnapp btn-submit mui-btn bt2 mui-btn-primary form-button"
				onclick="tijiao()">提交
			</button>
		</div>
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
	<script type="text/javascript">
		//日期格式方法
		Date.prototype.format = function(fmt) {
			var o = {
				"M+" : this.getMonth() + 1, //月份 
				"d+" : this.getDate(), //日 
				"H+" : this.getHours(), //小时 
				"m+" : this.getMinutes(), //分 
				"s+" : this.getSeconds(), //秒 
				"q+" : Math.floor((this.getMonth() + 3) / 3),
				////季度 
				"S" : this.getMilliseconds()
			//毫秒 
			};
			if (/(y+)/.test(fmt)) {
				fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "")
						.substr(4 - RegExp.$1.length));
			}
			for ( var k in o) {
				if (new RegExp("(" + k + ")").test(fmt)) {
					fmt = fmt.replace(RegExp.$1,
							(RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k])
									.substr(("" + o[k]).length)));
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
			$("input[name!=id][type!=hidden]").each(function() {
				if ($(this).val() == "") {
					$(this).addClass("required");
					judge = false;
				} else {
					$(this).removeClass("required");
				}
			});
			//textarea not null
			if ($("textarea[name=vacatedesc]").val() == "") {
				$("textarea[name=vacatedesc]").addClass("required");
				judge = false;
			} else {
				$("textarea[name=vacatedesc]").removeClass("required");
			}

			if ($("textarea[name=vacatedesc]").val() == "") {
				$("textarea[name=vacatedesc]").addClass("required");
				judge = false;
			} else {
				$("textarea[name=vacatedesc]").removeClass("required");
			}
			//提示
			if (!judge) {
				new_alert("请填写红色框内容！", " ");
			} else {
				//前后时间大小判断
				var date1 = new Date($("input[name=vacatebegindate]").val());
				var date2 = new Date($("input[name=vacateenddate]").val());
				var nowdate = new Date();
				//开始时间控制
				if (date1 < nowdate) {
					judge = false;
					new_alert("开始时间必须大于 "
							+ nowdate.format("yyyy-MM-dd HH:mm:ss") + " ", " ");
					return judge;
				}
				//时间大小控制
				if (date2 <= date1) {
					judge = false;
					new_alert("开始时间必须小于结束时间！", " ");
					return judge;
				}
				//时长控制
				var regu = /^\d+$/;
				if ((regu.test($("input[name=vacatedays]").val()))
						&& ($("input[name=vacatedays]").val() % 4 == 0)) {
					//格式正确对值大小判断
					if ($("input[name=vacatedays]").val() < 4) {
						judge = false;
						new_alert("调休时长最少为4小时！", " ");
						return judge;
					}
					if ('${isTX}' == 'true') {
						var numstr = '${restTime}';
						if ($("input[name=vacatedays]").val() > numstr * 1) {
							judge = false;
							new_alert("调休时长超出可调休范围！", " ");
							return judge;
						}
					}
				} else {
					judge = false;
					new_alert("时长为正整数且为4的整数倍！", " ");
					return judge;
				}
			}
			return judge;
		}
		//提交表单方法
		function tijiao() {
			if ($("input[name=exam]:checked").val() == '0') {
				//作废
				$("#vacateForm").submit();
			} else {
				if (validate()) {
					$("#vacateForm").submit();
				}
			}
		}
		$(function() {
			//重复时间段的提交内容，警告
			if ($("#warn").val() == 'true') {
				var btnArray = [ '是', '否' ];
				mui.confirm('该时间段，已经存在申请，是否继续？', ' ', btnArray, function(e) {
					if (e.index == 0) {
						//info.innerText = '你刚确认MUI是个好框架';
						$("input[name=realGo]").val(true);
						//$(".form-actions").hide();
						$("#vacateForm").submit();
					} else {
						//info.innerText = 'MUI没有得到你的认可，继续加油'
					}
				})
				$("#warn").val("");
			}
		});
	</script>
	<sys:mui-datetime></sys:mui-datetime>
</body>

</html>