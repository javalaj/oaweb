<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>编写我的周计划</title>
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=no" />
<link href="${ctxStatic}/mobile/frame_css/mui.min.css" rel="stylesheet" />
<link rel="stylesheet" href="${ctxStatic}/mobile/css/oabase.css" />
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/mobile/css/Base.css" />
<script src="${ctxStatic}/mobile/js/mui.min.js"></script>
<link rel="stylesheet" href="${ctxStatic}/liuxin/css/mobile.css" />
<script type="text/javascript" src="${ctxStatic}/jquery/jquery-1.9.1.min.js"></script>
<style type="text/css">
body {
	background-color: #F3F2F7 !important;
}

.divMargin {
	margin-top: 44px;
}
input, select {
	height: 32px !important;
	border-radius: 6px !important;
}

.heads {
	position: fixed;
	top: 44px;
	width: 100%;
	height: 46px;
	padding: 0 10px;
	box-sizing: border-box;
	background-color: #fff;
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
	text-align: center;
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
	padding: 3px 6px;;
	border: none;
}

.content_div_select_null {
	width: 100%;
	height: 14px;
	background-color: #f6f6f6;
	margin: 6px 0;
}

.content_div_method {
	width: 100%;
	padding: 10px 10px 0 10px;
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

.heads h3{
	font-size: 16px;
    height: 100%;
    line-height: 46px;
    text-align: center;
}

</style>
</head>
<body>
	<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">编写我的周计划</h1>
	</header>
	<div class="main divMargin">
		<form id="inputFormcz" action="${mctx}/user/userWeekplan/save" method="post" class="form-inline">
			<div class="heads" id="heads_js">
				<c:choose>
						<c:when test="${canInsert }">
							<h3 style="text-align: center;font-size:17px;font-weight: 400;height: 46px;line-height: 46px;">
								<font color="#12b7f5">第${newUserWeekplan.weeksign }周</font>&emsp;(开始日期：
								<fmt:formatDate value="${newUserWeekplan.firstdate}"
									pattern="yyyy-MM-dd" />
								)
							</h3>
							<input type="hidden" value="" name="id" />
							<input type="hidden"
								value="<fmt:formatDate value="${newUserWeekplan.firstdate}" pattern="yyyy-MM-dd"/>"
								name="firstdate" />
							<input type="hidden" name="plandate"
								value='<fmt:formatDate value="${newUserWeekplan.plandate}" pattern="yyyy-MM-dd"/>' />
							<input type="hidden" name="weeksign"
								value="${newUserWeekplan.weeksign  }" />
						</c:when>
						<c:otherwise>
							<h3 style="text-align: center;font-size:17px;font-weight: 400;height: 46px;line-height: 46px;">
								<font color="blue">第${list1[0].weeksign }周</font>&emsp;(开始日期：
								<fmt:formatDate value="${list1[0].firstdate}"
									pattern="yyyy-MM-dd" />
								)
							</h3>
							<input type="hidden" value="${list1[0].id }" name="id" />
							<input type="hidden"
								value="<fmt:formatDate value="${list1[0].firstdate}"
									pattern="yyyy-MM-dd" />"
								name="firstdate" />
							<input type="hidden" name="plandate"
								value='<fmt:formatDate value="${list1[0].plandate}" pattern="yyyy-MM-dd"/>' />
							<input type="hidden" name="weeksign" value="${list1[0].weeksign }" />
						</c:otherwise>
					</c:choose>
			</div>
			<div class="main-content" style="margin-top: 100px;">
					<c:if test="${canInsert || fn:length(list2[0])==0}">
				<div class="content">
					<div class="content_div_type" id="content_div_type_js">
						<input type='hidden' name='wrid' value='null'>
						<select name='beginday' class="form-control" style="text-align: center;">
							<option value='1'>周一</option>
							<option value='2'>周二</option>
							<option value='3'>周三</option>
							<option value='4'>周四</option>
							<option value='5'>周五</option>
							<option value='6'>周六</option>
							<option value='7'>周日</option>
						</select> 
						<span class="content_div_date_title" style="text-align: center; margin-left: -8px;">至</span>
						<select name='endday' class="form-control">
							<option value='1'>周一</option>
							<option value='2'>周二</option>
							<option value='3'>周三</option>
							<option value='4'>周四</option>
							<option value='5'>周五</option>
							<option value='6'>周六</option>
							<option value='7'>周日</option></select>
						<input type='hidden' name='delFlag' value='0'>
					</div>
					<div class="content_div_content" id="content_div_content_js">
						<textarea class="content_div_content" name="content"placeholder="请输入计划内容" rows="4"></textarea>
					</div>
				</div>
				<div class="notsolve">
					<div class="content_div_method">
						<textarea class="content_div_content" name="deliverables"placeholder="请输入交付物" rows="4"></textarea>
					</div>
				</div>
				<div class="content_div_select_null" id="content_div_select_null_js"></div>
				</c:if>
				<c:if test="${!canInsert}">
					<c:forEach items="${list2[0]}" var="now">
					<div name="${now.id}">
						<div class="content" >
							<div class="content_div_type" id="content_div_type_js" >
								<input type="text" style="display: none;"  id="wrid" name="wrid" value="${now.id}">
								<select name="beginday" class="form-control" style="text-align: center;">
									<option value="1"
										<c:if test="${now.beginday==1}">selected</c:if>>周一</option>
									<option value="2"
										<c:if test="${now.beginday==2}">selected</c:if>>周二</option>
									<option value="3"
										<c:if test="${now.beginday==3}">selected</c:if>>周三</option>
									<option value="4"
										<c:if test="${now.beginday==4}">selected</c:if>>周四</option>
									<option value="5"
										<c:if test="${now.beginday==5}">selected</c:if>>周五</option>
									<option value="6"
										<c:if test="${now.beginday==6}">selected</c:if>>周六</option>
									<option value="7"
										<c:if test="${now.beginday==7}">selected</c:if>>周日</option></select>
								<span class="content_div_date_title" style="text-align: center; margin-left: -8px;">至</span>
								<select name="endday" class="form-control">
									<option value="1"
										<c:if test="${now.endday==1}">selected</c:if>>周一</option>
									<option value="2"
										<c:if test="${now.endday==2}">selected</c:if>>周二</option>
									<option value="3"
										<c:if test="${now.endday==3}">selected</c:if>>周三</option>
									<option value="4"
										<c:if test="${now.endday==4}">selected</c:if>>周四</option>
									<option value="5"
										<c:if test="${now.endday==5}">selected</c:if>>周五</option>
									<option value="6"
										<c:if test="${now.endday==6}">selected</c:if>>周六</option>
									<option value="7"
										<c:if test="${now.endday==7}">selected</c:if>>周日</option>
								</select>
								<input type='hidden' name='delFlag' value='0'>
								<input id="weekId"  name="weekId" type="text" style="display: none;" value="${now.id}">
							</div>
							<div class="content_div_content" id="content_div_content_js">
								<textarea class="content_div_content" name="content"placeholder="请输入计划内容" rows="4">${now.content}</textarea>
							</div>
						</div>
						<div class="notsolve">
							<div class="content_div_method">
								<textarea class="content_div_content" name="deliverables"placeholder="请输入交付物" rows="4">${now.deliverables }</textarea>
							</div>
						</div>
						<div class="content_div_select_null" id="content_div_select_null_js"></div>
					</div>
					</c:forEach>
				</c:if>
			</div>
			
			<input type="hidden" id='isdraft' name="isdraft" value="0">
			<div class="bottom" id="button_js">
				<button type="submit" class="btnapp btn-submit xinbtn" id="button">提交</button>
				<button type="submit" class="btnapp btn-draft xinbtn" id="button2">草稿</button>
				<button type="button" class="btnapp btn-next xinbtn" onclick="addNext()">添加</button>
				<button type="button" class="btnapp btn-next" id="delLast">删除当前条</button>
			</div>
		</form>
	</div>
	<script id="title" src="${ctxStatic}/mobile/js/Base.js" type="text/javascript" charset="utf-8" data="编写我的周计划"></script>

	<script src="${ctxStatic}/mobile/frame_js/mui.min.js"></script>
	<script type="text/javascript">
		mui.init();

		var line ='<div class="main-content"><div class="content"><div class="content_div_type" id="content_div_type_js"><input id="cz"  type="text" style="display: none;" value="0"><input type="hidden" name="delFlag" value="0"><span class="content_div_date_title">时间:</span><input type="hidden" name="wrid" value="null"><select name="beginday" class="form-control"><option value="1">周一</option><option value="2">周二</option><option value="3">周三</option><option value="4">周四</option><option value="5">周五</option><option value="6">周六</option><option value="7">周日</option></select><span class="content_div_date_title" style="text-align: center;">至</span><select name="endday" class="form-control"><option value="1">周一</option><option value="2">周二</option><option value="3">周三</option><option value="4">周四</option><option value="5">周五</option><option value="6">周六</option><option value="7">周日</option></select></div><div class="content_div_content" id="content_div_type_js"><textarea class="content_div_content" name="content"placeholder="请输入计划内容" rows="4"></textarea></div><div class="notsolve"><textarea class="content_div_content" name="deliverables"placeholder="请输入交付物" rows="4"></textarea></div><div class="content_div_select_null" id="content_div_select_null_js"></div></div>'

		/* var line ='<div class="main-content"><input id="cz" type="text" style="display: none;" value="0"><input type="hidden" name="delFlag" value="0"><div class="content"><div class="content_div_type" id="content_div_type_js"><input type="hidden" name="wrid" value="null"><select name="beginday" class="form-control"><option value="1">周一</option><option value="2">周二</option><option value="3">周三</option><option value="4">周四</option><option value="5">周五</option><option value="6">周六</option><option value="7">周日</option></select><span class="content_div_date_title" style="text-align: center;">至</span><select name="endday" class="form-control"><option value="1">周一</option><option value="2">周二</option><option value="3">周三</option><option value="4">周四</option><option value="5">周五</option><option value="6">周六</option><option value="7">周日</option></select></div><div class="content_div_content" id="content_div_content_js"><textarea class="content_div_content" name="content"placeholder="请输入计划内容" rows="4"></textarea></div></div><div class="notsolve"><div class="content_div_method"><textarea class="content_div_content" name="deliverables"placeholder="请输入交付物" rows="4"></textarea></div></div><div class="content_div_select_null" id="content_div_select_null_js"></div></div>' */

		//validate();
		$("#delLast").click(function(){
			if($("#cz").val()!=0){
				if($("#wrid").val()!=null){
					var valArr =new Array();
					$("input[name='weekId']").each(function(i){
					    valArr[i] = $(this).val();
					      });
					if(valArr.length>1){
					var id=valArr.pop();
				 	$.ajax({
					    url:"${mctx}/user/userWeekplan/delete",    //请求的url地址
					    dataType:"text",   //返回格式为json
					    data:{"id":id},    //参数值
					    type:"GET",   //请求方式
					    success:function(req){
					        //请求成功时处理
					    	mui.alert("删除成功！", "系统提示");
					    	$("div[name="+id+"]").remove();
					    	//删除最后一条
					    },
					}); 
					}else{
						var id=valArr.pop();
					 	$.ajax({
						    url:"${mctx}/user/userWeekplan/delete",    //请求的url地址
						    dataType:"text",   //返回格式为json
						    data:{"id":id},    //参数值
						    type:"GET",   //请求方式
						    success:function(req){
						        //请求成功时处理
						    	mui.alert("删除成功！", "系统提示");
						    	$("div[name="+id+"]").remove();
						    	//删除最后一条
						    	if ($(".main-content").size() == 1) {
									$("#delLast").hide();
									$("#button").hide();
									$("#button2").hide();
								}
								$(".main-content:last").remove();
						    },
						}); 
					}
				}
			}else{
			//删除最后一条
			if ($(".main-content").size() == 1) {
				$("#delLast").hide();
				$("#button").hide();
				$("#button2").hide();
			}
			$(".main-content:last").remove();
			}	
		})

		function addNext() {
			//移除现在所有节点的tap事件
			var btns = $('.mui-datetime,.mui-time,.mui-date');
			btns.each(function(i, btn) {
				btn.removeEventListener('tap', method_date);
			});
			//新增一条
			if ($(".main-content").size() == 0) {
				$("#delLast").show();
				$("#button").show();
				$("#button2").show();
			}
			if ($(".main-content").size() == 0) {
				$(".heads:last").after(line);
			} else {
				$(".main-content:last").after(line);
			}
			//获取所有的重新绑定
			/* refresh_event(); */
		}
	</script>
	<script type="text/javascript">
	$("#button").click(function(){
		$("#isdraft").val("1")
		var judge1 = notnull();
		if(judge1){
			var judge2 = judge();
		} if(judge2){
			var judge3 = notnull3();
		}
							return judge1 && judge2 && judge3;
	})
		$("#button2").click(function(){
		$("#isdraft").val("0")
		var judge1 = notnull();
		if(judge1){
			var judge2 = judge();
		}
		if(judge2){
			var judge3 = notnull3();
		}
		return judge1 && judge2 && judge3;
	})
	function notnull3() {
		var judge = true;
		var i=0;
		$("textarea[name='deliverables']").each(function() {
			if ($(this).val().trim() == "" && !$(this).is(":hidden")) {
		 	  i+=1;
			}
		});
		if(i>0){
			judge = false;
			mui.alert("请填写交付物！", "系统提示");
		}
		return judge;
	}
	function notnull() {
		var judge = true;
		var i=0;
		$("textarea[name='content']").each(function() {
			if ($(this).val().trim() == "" && !$(this).is(":hidden")) {
				 i+=1;
			}
		});
		if(i>0){
			judge = false;
			mui.alert("请填写计划内容！", "系统提示");
		}
		return judge;
	}
	function judge() {
		var judge = true;
		var max = 1;
		var index = 0;
		var i=0;
		$("select").each(function() {
			if (!$(this).is(":hidden")) {
				if ($(this).val() >= max) {
					max = $(this).val();
				} else {
					if (index % 2 == 1) {
						 i+=1;
					}
				}
				index++;
			}
		});
		if(i>0){
			judge = false;
			mui.alert("结束时间大于开始时间！", "系统提示");
		}
		return judge;
	}
	
	</script>
	<sys:mui-datetime></sys:mui-datetime>
</body>

</html>