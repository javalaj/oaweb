<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="decorator" content="default" />
<meta name="" content="no-cache" http-equiv="Pragma" />
<meta name="" content="no-cache" http-equiv="Cache-Control" />
<meta name="" content="0" http-equiv="expires" />
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=no" />
<title>工作日志</title>
<!-- css-->
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/mobile/css/mui.min.css">
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/mobile/css/oabase.css" />
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/mobile/css/oa.css" />
<!-- java-script -->
<script type="text/javascript"
	src="${ctxStatic}/jquery/jquery-1.9.1.min.js"></script>
<script src="${ctxStatic}/mobile/js/mui.min.js"></script>
<style type="text/css">
ul {
	/*页面日期输入框，显示异常改正代码*/
	overflow: visible;
}

a {
	color: #12b7f5;
}

input[name='begindate'], input[name='enddate'] {
	height: 32px;
}

.mui-btn {
	height: 32px;
	line-height: .8;
}

button[id='btn-clear'] {
	margin: 5px 0;
	border-radius: 6px;
}

#serach, #add {
	background-image: none !important;
}

#serach span {
	float: left;
}

#add span {
	float: right;
}

.mui-scroll-wrapper ul {
	list-style: none;
	overflow: hidden;
	display: inline-block;
}

.mui-scroll-wrapper li {
	display: inline-block;
	float: left;
	width: 100%;
	border-bottom: 1px solid #F6F6F6;
}

.mui-scroll-wrapper li:last-child {
	border-bottom: none;
}

#scroll1 .mui-scroll-wrapper {
	background: white;
	/* margin-top: 177px; */
	/* bottom: 50px; */
	margin-top:100px;
}

#scroll2 {
	background: white;
	bottom: 50px;
}

.log-footer {
	width: 100%;
	height: 52px;
	background: #F6F6F6;
	text-align: center;
	padding-top: 10px;
	margin-bottom:50px;
}

.query-form {
	margin-top: 50px;
	text-align: center;
}

.query-form .begindate {
	text-align: center;
	margin: 7px 1%;
	padding: 3px;
	width: 46%;
}

.query-form .enddate {
	text-align: center;
	float: right;
	margin: 7px 2% 7px 0;
	padding: 3px;
	width: 46%;
}

.query-form button {
	width: 34%;
	margin: 1%;
	padding: 1%;
}

.xin-left, .xin-right {
	height: 40px;
	padding-top: 8px;
}

.team-header {
	padding: 1px 0;
}

.log-item>.log-date>.date-span, .state {
	padding-bottom: 8px;
}

.mui-segmented-control {
	border-color: #12b7f5;
	border-left: 1px solid #8bcdf0;
}

.mui-segmented-control .mui-control-item.mui-active {
	color: #fff;
	background-color: #12b7f5;
}

.mui-segmented-control .mui-control-item {
	border-left: 1px solid #12b7f5;
	color: #12b7f5;
}

.mui-control-item {
	border-left: 1px solid #12b7f5;
}

.btn-submit {
	background: #12b7f5;
	border: 1px solid #12b7f5;
}

.btn-clear {
	border-color: #12b7f5;
	color: #12b7f5;
}

.bottom-button {
	padding: 5px 0;
}

.bottom-button .btnapp {
	width: 20%;
	padding: 8px 0;
}
</style>
<script type="text/javascript">
mui.init()
(function($) {
	$('.mui-scroll-wrapper').scroll({
		indicators: true //是否显示滚动条
	});
})(mui);

/* $(document).ready(function() {
	$('.query-form').hide();
	var num=0;
	
	$('#zoom').click( function(){
		if(num<1){
			$('.query-form').show();
			num++;
		}else if(num=1){
			$('.query-form').hide();
			num=0;
		}
		
	});
}) */
</script>
<script type="text/javascript">
		$(function(){
		if('${flag}'==1){
			otherdiv();
		}else{
			mediv();
		}
		/*截取*/
		subStr();
		/*日志详情*/
		LogDetail();
		//获取 屏幕宽度的width
		 
		mui.init();
		document.getElementById('me-div').addEventListener('tap', function(){
			    mediv();
		    }); 
		document.getElementById('other-div').addEventListener('tap', function(){  
			   otherdiv();
		   }); 
		
  	if($("#result").val()=='del'){
			//日志删除成功提示
			new_alert("日志删除成功！", " ");
			$("#result").val("");
		}else if($("#result").val()=='success'){
		//日志保存成功提示
			new_alert("日志保存成功！", " ");
			$("#result").val("");
		}  
	});

	function subStr() {
		textLeng = 20;
		var text = document.getElementsByClassName('content');
		for(var i = 0; i < text.length; i++) {
			str = text[i].innerHTML;
			if(str.length > textLeng) {
				text[i].innerHTML = str.substring(0, textLeng) + "…";
			}
		}
	}
	
	
		function mediv(){
			$("#me-div").addClass("mui-active");
			$("#other-div").removeClass("mui-active");
			$("#scroll1").show();
			$("#scroll2").hide();
			$(".mui-segmented-control-primary span").text("我的日志");
			$(".team-header .mui-pull-right").css({"display":"block"});
			$("#zoom").click( function(){
				$('#scroll1 .query-form').toggle();
				$('.mask').toggle();
			});
		}
		
		function otherdiv(){
			$("#me-div").removeClass("mui-active");
			$("#other-div").addClass("mui-active");
			$("#scroll2").show();
			$("#scroll1").hide();
			$(".mui-segmented-control-primary span").text("他人日志");
			$(".team-header .mui-pull-right").css({"display":"none"});
			$(".team-header .mui-pull-left").css({"display":"none"});
			$("#zoom").click( function(){
				$('#scroll2 .query-form').toggle();
				$('.mask').toggle();
			});
		}
	
		/*翻页*/
		function page(n1, s1, n2 , s2, flag) {
			//pageNo pageSize
			//s1=s2=2;
			/* location.href = "${mctx}/user/userWorklog/list?pageNo1=" + n1
					+ "&pageSize1=" + s1+"&pageNo2=" + n2
					+ "&pageSize2=" + s2+"&flag="+flag; */
					$("#pageNo1").val(n1);
					$("#pageSize1").val(s1);
					$("#pageNo2").val(n2);
					$("#pageSize2").val(s2);
					$("#flag").val(flag);
					$("#query-form-2").submit();
		}
		/*添加*/
		function addLog() {
			location.href = "${mctx}/user/userWorklog/form";
		}
		/*搜索*/
		function addserach() {
			location.href = "${mctx}/user/userWorklog/query";
		}
		/*日至详情点击跳转*/
		var LogDetail = function() {
			var livar = document.getElementsByTagName("li");
			for (var i = 0; i < livar.length; i++) {
				livar[i].onclick = function() {
					location.href = "${mctx}/user/userWorklog/form?id="
							+ $(this).children("input[name=id]").val();
				}
			}
		};
		/*改变样式*/
		/* function changeSyte() {
			var hr1 = document.getElementById("hr1");
			var hr2 = document.getElementById("hr2");
			var mespan = document.getElementById("mespan");
			var other = document.getElementById("other");
			mespan.style.color = "#858585";
			other.style.color = "#57B2E9";
			hr1.style.display = "none";
			hr2.style.display = "block";
		}

		function changeSyte2() {

			var hr1 = document.getElementById("hr1");
			var hr2 = document.getElementById("hr2");
			var mespan = document.getElementById("mespan");
			var other = document.getElementById("other");
			mespan.style.color = "#57B2E9";
			other.style.color = "#858585";
			hr1.style.display = "block";
			hr2.style.display = "none";
		} */
		/* var scrol1 = document.getElementById("scroll1");
		var scrol2 = document.getElementById("scroll2"); */
		/*我的*/
		/* function mediv() {
			changeSyte2()
			scrol1.style.display = "block";
			scrol2.style.display = "none";
		} */
		/*他人*/
		/* function otherdiv() {
			changeSyte();
			scrol1.style.display = "none";
			scrol2.style.display = "block";
		} */
		
		//时间大小判断
		function judgeTime(){
			var judge=true;
			var date1=new Date($(".begindate").val());
			var date2=new Date($(".enddate").val());
			if(date1 != "" && date2 != "" && date1 > date2){
				judge=false;
			}
			return judge;
		}
		//查询表单
		function query(){
			if(judgeTime()){
				$('#query-form-2').submit();
			}else{
				new_alert("开始时间大于结束时间！", " ");
			}}
		//清空按钮
		function clearForm(){
			$(".begindate").val("");
			$(".enddate").val("");
		}
	</script>
</head>
<body>
	<div style="position: fixed;background:#fff;z-index:999;">
	<div id="journal-tab"
			class="mui-segmented-control mui-segmented-control-primary"
			style="width: 80%; margin: 8px auto; background:#fff;">
			<a class="mui-control-item" id="me-div">我的日志</a>
			<shiro:hasPermission name="log:logWorklogOtherList:edit">
				<a class="mui-control-item" id="other-div">他人日志</a>
			</shiro:hasPermission>
		</div>
	</div>
	<div class="team-header journal-header" style="position: fixed;width:100%;z-index:999;top:48px;">
	
		<a class="mui-pull-right" href="${mctx}/user/userWorklog/form" style="color:#666;"><span
			class="mui-icon mui-icon-plus xin-right"
			style="line-height: 32px; padding-right: 8px;"></span></a> 
		<a id="zoom" href="#" style="color:#666;"><span
			class="mui-icon mui-pull-left mui-icon-search"
			style="line-height: 50px;padding-left:8px;"></span></a>
		<div class=" mui-segmented-control-primary" style="width: 80%; margin: 8px auto; text-align:center; ">
		<span style="font-size:16px; line-height:32px; border:none; color:#666;">我的日志</span>
		</div>
	</div>
	<%--
	<div class="log-title">
		<div id="" onclick="addserach()">
			<button  id="serach" value="" ><span
						class="mui-icon mui-icon-search"></span></button>
		</div>
		<div id="leftspan" align="center" onclick="mediv()">
			<span id="mespan">我的日志</span>
			<hr id="hr1" width="80%" size="1" color="#57B2E9" noshade="noshade">
		</div>
		<div id="rightspan" align="center" onclick="otherdiv()">
			<span id="other">他人日志</span>
			<hr id="hr2" width="80%" size="1" color="#57B2E9" noshade="noshade"
				style="display: none;">
		</div>
		<div id="" onclick="addLog()"
			style=" box-sizing: border-box;">
			<button id="add" value="" ><span
						class="mui-icon mui-icon-plus"></span></button>
		</div>
	</div>
 --%>

	<div id="scroll1" style="margin-top:100px;">
		
		<div class="mui-scroll-wrapper">
		<div class="query-form" style="display:none;z-index:999;position: relative; background: #fff;">
			<form action="${mctx}/user/userWorklog/" method="post"
				id="query-form-2" style="margin-top: -50px;">
				<input type="hidden" name="pageNo1" id="pageNo1" value="1" /> <input
					type="hidden" name="pageSize1" id="pageSize1" value="30" /> <input
					type="hidden" name="pageNo2" id="pageNo2" value="1" /> <input
					type="hidden" name="pageSize2" id="pageSize2" value="30" /> <input
					type="hidden" value="0" name="flag" id="flag" /> <input
					name="begindate" class="begindate mui-date" type="text"
					readonly="readonly"
					value='<fmt:formatDate value="${begindate}" pattern="yyyy-MM-dd"/>' />-<input
					name="enddate" type="text" class="enddate mui-date"
					readonly="readonly"
					value='<fmt:formatDate value="${enddate}" pattern="yyyy-MM-dd"/>' />
				<div class="bottom-button">
					<button type="button" class="btnapp btn-submit" id="btn-submit"
						onclick="query();">查询</button>

					<button type="button" class="btnapp mui-btn-next btn-clear"
						id="btn-clear" onclick="clearForm();">重置</button>
				</div>
			</form>
			<input type="hidden" id="result" value="${result}" />
		</div>
		<!-- <div class="mask" style="position: absolute;z-index:99;width:100%;height:1000%;background:rgba(0,0,0,.4);display:none;"></div> -->
			<div class="mui-scroll">
				<div style="min-width: 320px;">
					<ul>
						<c:forEach items="${page.list}" var="now" varStatus="status1">
							<li><input type="hidden" name="id" value="${now.id}">
								<div class="log-item">
									<div class="log-date">
										<span id="" class="date-span"><fmt:formatDate
												value="${now.workdate}" pattern="yyyy-MM-dd" /> </span><span
											class="state"><c:choose>
												<c:when test="${now.isdraft=='1'}"><span>已提交</span></c:when>
												<c:otherwise><span style="color: #12b7f5">草稿</span></c:otherwise>
											</c:choose></span>
									</div>
									<c:forEach items="${userWorkrecords[status1.index]}" var="now2"
										varStatus="status2">
										<div class="main">
											<div class="divtime">
												<span id="time"><fmt:formatDate
														value="${now2.begintime}" pattern="HH:mm" />--<fmt:formatDate
														value="${now2.endtime}" pattern="HH:mm" /> </span>
											</div>
											<div class="divcon">
												<span class="content"> ${now2.content }</span>
											</div>
										</div>
									</c:forEach>
								</div></li>
						</c:forEach>
					</ul>
					<div class="log-footer">
						<input type="button" id="leftbt" value="上一页" class="btnapp"
							onclick="page(${page.pageNo-1},30,${page2.pageNo},30,0)"
							<c:if test="${page.firstPage}">disabled</c:if> /> <input
							type="button" id="rightbt" value="下一页" class="btnapp"
							onclick="page(${page.pageNo+1},30,${page2.pageNo},30,0)"
							<c:if test="${page.lastPage }">disabled</c:if> />
					</div>
				</div>
			</div>
		</div>
	</div>



	<div id="scroll2" class="mui-scroll-wrapper" style="margin-top:100px;">
	<div class="query-form"  style="display:none;position: relative; background: #fff">
			<form action="${mctx}/user/userWorklog/" method="post"
				id="query-form-2" style="margin-top: -50px;">
				<input type="hidden" name="pageNo1" id="pageNo1" value="1" /> <input
					type="hidden" name="pageSize1" id="pageSize1" value="30" /> <input
					type="hidden" name="pageNo2" id="pageNo2" value="1" /> <input
					type="hidden" name="pageSize2" id="pageSize2" value="30" /> <input
					type="hidden" value="0" name="flag" id="flag" /> <input
					name="begindate" class="begindate mui-date" type="text"
					readonly="readonly"
					value='<fmt:formatDate value="${begindate}" pattern="yyyy-MM-dd"/>' />-<input
					name="enddate" type="text" class="enddate mui-date"
					readonly="readonly"
					value='<fmt:formatDate value="${enddate}" pattern="yyyy-MM-dd"/>' />
				<div class="bottom-button">
					<button type="button" class="btnapp btn-submit" id="btn-submit"
						onclick="query();">查询</button>

					<button type="button" class="btnapp mui-btn-next btn-clear"
						id="btn-clear" onclick="clearForm();">重置</button>
				</div>
			</form>
			<input type="hidden" id="result" value="${result}" />
		</div>
		<div class="mui-scroll">

			<div style="min-width: 320px;">
				<ul>
					<c:forEach items="${page2.list}" var="now" varStatus="status1">
						<li><input type="hidden" name="id" value="${now.id}">
							<div class="log-item">
								<div class="log-date">
									<span id="" class="date-span">${now.createBy.name }</span><span
										class="state"><fmt:formatDate value="${now.workdate}"
											pattern="yyyy-MM-dd" /> </span>
								</div>
								<c:forEach var="now2" items="${userWorkrecords2[status1.index]}"
									varStatus="status2">
									<div class="main">
										<div class="divtime">
											<span id="time"> <fmt:formatDate
													value="${now2.begintime}" pattern="HH:mm" />--<fmt:formatDate
													value="${now2.endtime}" pattern="HH:mm" /></span>
										</div>
										<div class="divcon">
											<span class="content"> ${now2.content }</span>
										</div>
									</div>
								</c:forEach>
							</div></li>
					</c:forEach>
				</ul>
				<div class="log-footer">
					<input type="button" id="leftbt" value="上一页" class="btnapp"
						onclick="page(${page.pageNo},30,${page2.pageNo-1},30,1)"
						<c:if test="${page2.firstPage}">disabled</c:if> /> <input
						type="button" id="rightbt" value="下一页" class="btnapp"
						onclick="page(${page.pageNo},30,${page2.pageNo+1},30,1)"
						<c:if test="${page2.lastPage }">disabled</c:if> />
				</div>
			</div>

		</div>
	</div>
	<sys:mui-datetime></sys:mui-datetime>
	<jsp:include page="/WEB-INF/views/mobile/modules/sys/foot.jsp"></jsp:include>
</body>

</html>