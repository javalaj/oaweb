<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="decorator" content="default" />
<title>编辑日志</title>
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=no" />
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/mobile/css/mui.min.css">
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/mobile/css/oabase.css" />
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/mobile/css/oa.css" />

<style type="text/css">
input, select {
	height: 36px !important;
	border-radius: 6px !important;
}

.heads {
	margin-top: 10px;
	width: 100%;
	height: 46px;
	padding: 0 10px;
	box-sizing: border-box;
}

.start_title {
	width: 15%;
	float: left;
	text-align: left;
	margin-top: 7.5px;
}

.start_title_date {
	float: left;
	width: 50%;
	vertical-align: middle;
	color: #666;
}

.start_title_date input {
	float: left;
	margin: 0;
	width: 100%;
	height: 24px;
	line-height: 24px;
	padding: 0 0 0 8px;
	text-align: left;
	border-radius: 0;
	color: #666;
}

.content {
	margin-top: 10px;
	width: 100%;
	padding: 0 10px;
	box-sizing: border-box;
}

.content_div_date, .content_div_type {
	width: 100%;
}

.content_div_date span, .content_div_type span {
	display: inline-block;
	width: 15%;
}

.content_div_date input {
	width: 30%;
	height: 24px;
	line-height: 24px;
	padding: 0 0 0 8px;
	margin: 0;
	border-radius: 0;
}

.content_div_type {
	padding-top: 10px;
}

.content_div_type select {
	width: 30%;
	height: 24px;
	line-height: 24px;
	margin: 0;
	margin-left: -6px;
	border: 1px solid #ddd !important;
	-webkit-appearance: menulist-button;
	padding: 0 0 0 2px;
}

.content_div_content, .content_div_select {
	width: 100%;
	padding-top: 10px;
	box-sizing: border-box;
}

.content_div_select_span {
	text-align: center;
	width: 40%;
	padding-top: 10px;
	box-sizing: border-box;
}

.content_div_select_select {
	text-align: center;
	width: 30%;
	padding-top: 6px;
	box-sizing: border-box;
	border: 1px solid #ddd !important;
	-webkit-appearance: menulist-button;
	margin-bottom: 10px;
}

.content_div_content textarea, .content_div_method textarea {
	width: 100%;
	border-radius: 6px;
	padding: 3px;
}

.content_div_select_null {
	width: 100%;
	height: 14px;
	background-color: #f6f6f6;
	margin: 6px 0;
}

.content_div_method {
	width: 100%;
	padding: 0 10px;
	box-sizing: border-box;
}

.bottom {
	color: #666;
	padding: 10px 10px 5px 5px;
	width: 100%;
	box-sizing: border-box;
}

.btn {
	font-size: 1em;
	padding: 0.5em 1.1em;
	border-radius: 4px;
}

.btn-submit, .btn-draft {
	background-color: #32a5e7;
	border: 1px solid #32a5e7;
	color: #fff;
}

.btn-next {
	background-color: #eee;
	border: 1px solid #ccc;
	color: #333;
}

.bottom .btn-draft {
	float: right;
}

.btn-submit:hover, .btn-draft:hover {
	background-color: #8cccf0;
	border: 1px solid #8cccf0;
}

.btn-next:hover {
	background-color: #ccc;
}

span {
	color: #666666;
}

.xinbtn {
	width: 16%;
	padding: 6px 0px !important;
}

#delLast {
	width: 45%;
	padding: 6px 0px !important;
}


/*不要修改 或  去掉 以下两个样式*/
ul{
overflow: visible!important;
}
.required{
	border-color: #fdcfcf !important;
}
</style>
<link rel="stylesheet" href="${ctxStatic}/liuxin/css/mobile.css" />
<script type="text/javascript" src="${ctxStatic}/jquery/jquery-1.9.1.min.js"></script>
</head>
<body>
	<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">编辑日志</h1>
		<c:if test="${not empty userWorklog.id}">
			<a class="mui-icon mui-icon-trash mui-pull-right"
				onclick="del('${mctx}/user/userWorklog/delete?ids=${userWorklog.id}')"></a>
		</c:if>
	</header>
	<div class="main divMargin">
		<div class="heads" id="heads_js">
			<input type="hidden" name="id" value="${userWorklog.id }"> <input
				type="hidden" name="isdraft" value="0"> <span
				class="start_title" id="heads_title_js">日期:</span>
			<div class="start_title_date" id="heads_dates_js">
				<input type="text" name="workdate" class="mui-date"
					required="required" readonly="readonly"
					value="<fmt:formatDate value="${userWorklog.workdate}" pattern="yyyy-MM-dd"/>" />
				<!-- <span style="color:red;width:3%;text-align:right;font-size:1.2rem;float: right;">*</span> -->
			</div>

		</div>

		<c:if test="${fn:length(userWorkrecords) == 0}">
			<div class="main-content">
				<input type="hidden" name="id" />
				<div class="content">
					<div class="content_div_date" id="content_SOdate_js">
						<span class="content_div_date_title">时间:</span><input type="text"
							readonly="readonly" name="begintime" class="mui-time"
							required="required" />
						<!-- <span style="color:red;width:3%;text-align:right;font-size:1.2rem;float: right;">*</span> -->
						<span class="content_div_date_title"
							style="text-align: center; margin-left: -8px;">至</span><input
							type="text" readonly="readonly" name="endtime" class="mui-time"
							required="required" />
						<!-- <span style="color:red;width:2%;text-align:right;font-size:1.2rem;float: right;">*</span> -->

						<div class="content_div_type" id="content_div_type_js">
							<span>类型:</span> <select name="type" onchange="typeClick(this)">
								<option value="0" selected="selected"><span>上班</span></option>
								<option value="1"><span>请假</span></option>
								<option value="2"><span>调休</span></option>
								<option value="3"><span>出差</span></option>
							</select>
						</div>
					</div>
					<div class="content_div_content" id="content_div_content_js">
						<textarea class="content_div_content" name="content"
							placeholder="请输入工作内容" rows="4"></textarea>
						<!-- <span style="color:red;width:2%;text-align:right;font-size:1.2rem;float: right;">*</span> -->
					</div>
					<div class="content_div_select" id="content_div_select_js">
						<span class="content_div_select_span">是否解决？</span> <select
							name="isdone" class="content_div_select_select" onchange="isdoneClick(this)">
							<option value="0" selected="selected"><span>是</span></option>
							<option value="1"><span>否</span></option>
						</select>
					</div>
				</div>
				<div class="notsolve">
					<div class="content_div_method">
						<textarea class="content_div_method" name="remarks" readonly="readonly"
							placeholder="问题及解决方法" rows="4"></textarea>
					</div>
				</div>
				<div class="content_div_select_null" id="content_div_select_null_js"></div>
			</div>
		</c:if>






		<c:forEach items="${userWorkrecords}" var="now">
			<div class="main-content">
				<input type="hidden" name="id" value="${now.id }" />
				<div class="content">
					<div class="content_div_date" id="content_SOdate_js">
						<span class="content_div_date_title">时间:</span><input type="text"
							value="<fmt:formatDate value="${now.begintime}" pattern="HH:mm" />"
							name="begintime" class="mui-time" readonly="readonly"
							required="required" />
						<!-- <span style="color:red;width:3%;text-align:right;font-size:1.2rem;float: right;">*</span> -->
						<span class="content_div_date_title"
							style="text-align: center; margin-left: -8px;">至</span><input
							type="text" name="endtime"
							value="<fmt:formatDate value="${now.endtime}" pattern="HH:mm" />"
							class="mui-time" readonly="readonly" required="required" />
						<!-- <span style="color:red;width:2%;text-align:right;font-size:1.2rem;float: right;">*</span> -->

						<div class="content_div_type" id="content_div_type_js">
							<span>类型:</span> <select name="type" onchange="typeClick(this)">
								<option value="0" <c:if test="${now.type=='0' }">selected</c:if>><span>上班</span></option>
								<option value="1" <c:if test="${now.type=='1' }">selected</c:if>><span>请假</span></option>
								<option value="2" <c:if test="${now.type=='2' }">selected</c:if>><span>调休</span></option>
								<option value="3" <c:if test="${now.type=='3' }">selected</c:if>><span>出差</span></option>
							</select>
						</div>
					</div>
					<div class="content_div_content" id="content_div_content_js">
						<textarea class="content_div_content" name="content"
							placeholder="请输入工作内容" rows="4" <c:if test="${now.type != '0' && now.type != '3'}">readonly</c:if>>${now.content}</textarea>
						<!-- <span style="color:red;width:2%;text-align:right;font-size:1.2rem;float: right;">*</span> -->
					</div>
					<div class="content_div_select" id="content_div_select_js">
						<span class="content_div_select_span">是否解决？</span> <select
							name="isdone" class="content_div_select_select" onchange="isdoneClick(this)">
							<option value="0"
								<c:if test="${now.isdone=='0' }">selected</c:if>><span>是</span></option>
							<option value="1"
								<c:if test="${now.isdone=='1' }">selected</c:if>><span>否</span></option>
						</select>
					</div>
				</div>
				<div class="notsolve">
					<div class="content_div_method">
						<textarea class="content_div_method" name="remarks" 	<c:if test="${now.isdone == '0'}">readonly</c:if>
							placeholder="问题及解决方法" rows="4">${now.remarks}</textarea>
					</div>
				</div>
				<div class="content_div_select_null" id="content_div_select_null_js"></div>
			</div>
		</c:forEach>







		<div class="bottom" id="button_js">
			<button type="submit" class="btnapp btn-submit xinbtn"
				onclick="submit1()">提交</button>
			<button type="button" class="btnapp btn-next xinbtn"
				onclick="addNext()">添加</button>
			<button type="button" class="btnapp btn-next" id="delLast"
				onclick="delLast()">删除当前条</button>
			<button type="button" class="btnapp btn-draft xinbtn"
				onclick="submit0()">草稿</button>
		</div>
	</div>
	<script id="title" src="${ctxStatic}/mobile/js/Base.js"
		type="text/javascript" charset="utf-8" data="写日志"></script>

	<script src="${ctxStatic}/mobile/frame_js/mui.min.js"></script>
	<script type="text/javascript">
		mui.init();
		var line = '<div class="main-content"><input type="hidden" name="id" /><div class="content"><div class="content_div_date" id="content_SOdate_js"><span class="content_div_date_title">时间:</span><input type="text" name="begintime" readonly="readonly" class="mui-time" required="required" /><!-- <span style="color:red;width:3%;text-align:right;font-size:1.2rem;float: right;">*</span> --><span class="content_div_date_title" style="text-align: center;">至</span><input type="text" name="endtime" class="mui-time"  required="required" readonly="readonly"/><!-- <span style="color:red;width:2%;text-align:right;font-size:1.2rem;float: right;">*</span> --><div class="content_div_type" id="content_div_type_js"><span>类型:</span> <select name="type" onchange="typeClick(this)"><option value="0" selected="selected"><span>上班</span></option><option value="1"><span>请假</span></option><option value="2"><span>调休</span></option><option value="3"><span>出差</span></option></select></div></div><div class="content_div_content" id="content_div_content_js"><textarea class="content_div_content" name="content"placeholder="请输入工作内容" rows="4"></textarea><!-- <span style="color:red;width:2%;text-align:right;font-size:1.2rem;float: right;">*</span> --></div><div class="content_div_select" id="content_div_select_js"><span class="content_div_select_span">是否解决？</span> <select name="isdone" class="content_div_select_select" onchange="isdoneClick(this)"><option value="0" selected="selected"><span>是</span></option><option value="1"><span>否</span></option></select></div></div><div class="notsolve"><div class="content_div_method"><textarea class="content_div_method" name="remarks"placeholder="问题及解决方法" rows="4"></textarea></div></div><div class="content_div_select_null" id="content_div_select_null_js"></div></div>';
		//validate();
		function delLast() {
			//删除最后一条
			if ($(".main-content").size() == 1) {
				$("#delLast").hide();
			}
			$(".main-content:last").remove();
		}

		function addNext() {
			//移除现在所有节点的tap事件
			var btns = $('.mui-datetime,.mui-time,.mui-date');
			btns.each(function(i, btn) {
				btn.removeEventListener('tap', method_date);
			});
			//新增一条
			if ($(".main-content").size() == 0) {
				$("#delLast").show();
			}
			if ($(".main-content").size() == 0) {
				$(".heads:last").after(line);
			} else {
				$(".main-content:last").after(line);
			}
			//获取所有的重新绑定
			refresh_event();
		}
		//日期点击事件重新绑定，全页面
		function refresh_event() {
			mui.init();
			var btns = $('.mui-datetime,.mui-time,.mui-date');
			btns.each(function(i, btn) {
				//已经绑定了事件的不在绑定
				//alert(1);
				//alert($(btn).data("event"));
				btn.addEventListener('tap', method_date, false);
			});
		}

		function submit1() {
			//提交
			$("input[name=isdraft]").val("1");
			if (validate()) {
				submitForm();
			} else {
				new_alert("请填写红色框内容！", " ");
			}
		}

		function submit0() {
			//草稿
			$("input[name=isdraft]").val("0");
			if (validate()) {
				submitForm();
			} else {
				new_alert("请填写红色框内容！", " ");
			}
		}
		function validate() {
			//表单字段是否合法检测
			var judge = true;
			if ($("input[name=workdate]").val() == "") {
				$("input[name=workdate]").addClass("required");
				judge = false;
			} else {
				$("input[name=workdate]").removeClass("required");
			}
			$(".main-content")
					.each(
							function() {

								if ($(this).find("input[name=begintime]").val() == "") {
									$(this).find("input[name=begintime]")
											.addClass("required");
									judge = false;
								} else {
									$(this).find("input[name=begintime]")
											.removeClass("required");
								}
								//
								if ($(this).find("input[name=endtime]").val() == "") {
									$(this).find("input[name=endtime]")
											.addClass("required");
									judge = false;
								} else {
									$(this).find("input[name=endtime]")
											.removeClass("required");
								}
								//
								if (($(this).find("select[name=type]").val() == "0" || $(
										this).find("select[name=type]").val() == "3")
										&& $(this).find(
												"textarea[name=content]").val() == "") {
									$(this).find("textarea[name=content]")
											.addClass("required");
									judge = false;
								} else {
									$(this).find("textarea[name=content]")
											.removeClass("required");
								}
								//
								if ($(this).find("select[name=isdone]").val() == "1"
										&& $(this).find(
												"textarea[name=remarks]").val() == "") {
									$(this).find("textarea[name=remarks]")
											.addClass("required");
									judge = false;
								} else {
									$(this).find("textarea[name=remarks]")
											.removeClass("required");
								}
							});
			return judge;
		}

		function submitForm() {
			//禁用所有按钮
			$("#button_js button").attr("disabled", true);
			//表单提交的ajax请求，传递json
			var workdate = new Date($("input[name=workdate]").val());
			workdate.setHours(0, 0, 0, 0);

			var jstr = {
				log : {
					id : $("#heads_js").find("input[name=id]").val(),
					workdate : workdate.getTime(),
					isdraft : $("input[name=isdraft]").val()
				},
				list : []
			};
			var begintime = new Date(workdate.getTime());
			var endtime = new Date(workdate.getTime());
			$(".main-content").each(
					function() {
						begintime.setHours(
								$(this).find("input[name=begintime]").val()
										.split(":")[0], $(this).find(
										"input[name=begintime]").val().split(
										":")[1], 0, 0);
						endtime.setHours($(this).find("input[name=endtime]")
								.val().split(":")[0], $(this).find(
								"input[name=endtime]").val().split(":")[1], 0,
								0);
						var wr = {
							begintime : begintime.getTime(),
							endtime : endtime.getTime(),
							type : $(this).find("select[name=type]").val(),
							content : $(this).find("textarea[name=content]")
									.val(),
							isdone : $(this).find("select[name=isdone]").val(),
							remarks : $(this).find("textarea[name=remarks]")
									.val()
						};
						jstr.list.push(wr);
					});

			$
					.ajax({
						url : "${mctx}/user/userWorklog/saveJson",
						type : "POST",
						contentType : "application/json;charset=utf-8",
						data : JSON.stringify(jstr),
						dataType : "text",
						success : function(data) {
							if (data == "future") {
								//禁用所有按钮
								$("#button_js button").attr("disabled", false);
								new_alert("请勿填写未来日期的日志！", " ");
							} else if (data == "exists") {
								//禁用所有按钮
								$("#button_js button").attr("disabled", false);
								new_alert("该日期日志已经存在，请勿重复填写！", " ");
							} else {
								window.location.href = "${mctx}/user/userWorklog/?result=success";
							}
						}
					});
		}

		function tijiao() {
			new_alert("该日期日志已经存在，请勿重复填写！", " ", callback[null, 'div']);

			/* .closePopup()    关闭弹出的对话框*/
		}
		/*删除确定提示框*/
		function del(url) {
			mui.confirm('确定删除该日志？', ' ', [ '是', '否' ], function(e) {
				if (e.index == 0) {
					location.href = url;
				}
			})
		}
		
		//是否解决按下事件
		function isdoneClick(item) {
			if ($(item).val() == '1') {
				$(item).parent().parent().next().children().children().attr("readonly", false);
			} else {
				$(item).parent().parent().next().children().children().attr("readonly", true).val("");
			}
		}
		//类型被按下事件
		function typeClick(item) {
			if ($(item).val() == '0' || $(item).val() == '3') {
				$(item).parent().parent().next().children().attr("readonly", false);
			} else {
				$(item).parent().parent().next().children().attr("readonly", true).val("");
			}
		}
	</script>
	<sys:mui-datetime></sys:mui-datetime>
</body>

</html>