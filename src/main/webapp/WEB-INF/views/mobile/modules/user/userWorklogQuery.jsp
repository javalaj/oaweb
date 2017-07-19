<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head>
<script type="text/javascript"
	src="${ctxStatic}/jquery/jquery-1.9.1.min.js"></script>
<meta charset="UTF-8">
<meta name="decorator" content="default" />
<meta name="" content="no-cache" http-equiv="Pragma" />
<meta name="" content="no-cache" http-equiv="Cache-Control" />
<meta name="" content="0" http-equiv="expires" />
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=no" />
<link href="${ctxStatic}/mobile/frame_css/mui.min.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/mobile/css/Base.css" />
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/mobile/css/oa.css" />
	<link rel="stylesheet" href="${ctxStatic}/mobile/css/oabase.css" />
<title>查询日志</title>
<script type="text/javascript">


	/* function page(n, s) {
		//pageNo pageSize
		location.href = "${mctx}/user/userWorklog/query?otherId="+$("input[name=otherId]").val()+"&pageNo=" + n
			+ "&pageSize=" + s;
	} */


	window.onload = function() {
		/*限制*/
		textLeng = 20;
		var text = document.getElementsByClassName('content');
		for (var i = 0; i < text.length; i++) {
			str = text[i].innerHTML;
			if (str.length > textLeng) {
				text[i].innerHTML = str.substring(0, textLeng) + "…";
			}
		}
		LogDetail();
		//获取 屏幕宽度的width
		var btnwidth = document.getElementById("divtime").offsetWidth;
		var lable1 = document.getElementById("lable1").offsetWidth;
		var lable2 = document.getElementById("lable2").offsetWidth;
		var cha = (btnwidth - lable1 - lable2 - 60) / 2;
		document.getElementById("leftinput").style.width = cha + "px";
		document.getElementById("rightinput").style.width = cha + "px";
	initSelect();
	};
	/*日至详情点击跳转*/
	 var LogDetail = function() {
		var livar = $(".log-content li")
		for (var i = 0; i < livar.length; i++) {
			livar[i].onclick = function() {
				location.href = "${mctx}/user/userWorklog/form?id="
						+ $(this).children("input[name=id]").val();
			}
		}
	}; 
	/*表单验证方法*/
	function validate(){
		var judge=true;
		if($("input[name=begindate]").val() != "" && $("input[name=enddate]").val() != ""){
			var begindate = new Date($("input[name=begindate]").val()).getTime();
			var enddate = new Date($("input[name=enddate]").val()).getTime();
			if(begindate > enddate){
				new_alert("开始时间不得大于结束时间！", " ");
				judge=false;
			}
		}
		return judge;
	}
	
	
	/*json 部门数据*/
	var nodes =[
		<c:forEach var="now" items="${offices }" varStatus="i">
		<c:if test="${i.index != 0}">,</c:if>
		{
		id:"${now.id}", 
		pId:"${now.parentId}",	
		name : "${now.name}",
		value:"",
		isParent:true,
		<c:if test="${now.id == '1'}">open:true,</c:if>
		children : [ <c:forEach var="now2"
			items="${users[i.index] }" varStatus="ii"><c:if test="${ii.index != 0}">,</c:if>{
			name: "${now2.name}",
			value : "${now2.id}"
			<c:if test="${submits[i.index][ii.index] == '0'}">,font:{'color':'red'}</c:if>
		}</c:forEach> ]
	}
	</c:forEach>
	];
	
	<%--
	/*部门集合*/
	//var array1=["请选择","1","2"];
	
	//var array2=[["请选择"],["请选择","1-1","1-2"],["请选择","2-1","2-2"]];
	
	//var array3=[[["请选择"]],[["请选择"],["请选择","1-1-1","1-1-2"],["请选择","1-2-1","1-2-2"]],[["请选择"],["请选择","2-1-1","2-1-2"],["请选择","2-2-1","2-2-2"]]];
	
	//var array4=[[[["请选择"]]],[[["请选择"]],[["请选择"],["请选择","1-1-1-1","1-1-1-2"],["请选择","1-1-2-1","1-1-2-2"]],[["请选择"],["请选择","1-2-1","1-2-1-1"],["请选择","1-2-2-1","1-2-2-2"]]],[[["请选择"]],[["请选择"],["请选择","2-1-1-1","2-1-1-1"],["请选择","2-1-2-1","2-1-2-2"]],[["请选择"],["请选择","2-2-1-1","2-2-1-2"],["请选择","2-2-2-1","2-2-2-2"]]]];
	--%>
	
	/*初始化菜单*/
	function initSelect(){
		$("#select1").empty();
		$("#select1").append("<option><span>请选择</span></option>");
		for(var i in nodes){
			if(nodes[i].pId == "1"){
			 $("#select1").append("<option value="+nodes[i].id+"><span>"+nodes[i].name+"</span></option>");
			}
		}
	}
	
	/*部门选择菜单改变触发的方法*/
	function change1(){
		$("#select2").empty();
		$("#select2").append("<option><span>请选择</span></option>");
		$("#select3").empty();
		$("#select3").append("<option><span>请选择</span></option>");
		$("#select4").empty();
		$("#select4").append("<option><span>请选择</span></option>");
		
		var pid=$("#select1").val();
		for(var i in nodes){
			if(nodes[i].pId == pid){
				 $("#select2").append("<option value="+nodes[i].id+"><span>"+nodes[i].name+"</span></option>");
			}
		}
		//只有一条默认值时，改变最后一个
		for(var i in nodes){
			if(nodes[i].id == pid){
				for(var ii in nodes[i].children){
					 $("#select4").append("<option value="+nodes[i].children[ii].value+"><span>"+nodes[i].children[ii].name+"</span></option>");
				}
			}
		}
	}
	
	function change2(){
		$("#select3").empty();
		$("#select3").append("<option><span>请选择</span></option>");
		$("#select4").empty();
		$("#select4").append("<option><span>请选择</span></option>");
		
		var pid=$("#select2").val();
		for(var i in nodes){
			if(nodes[i].pId == pid){
				 $("#select3").append("<option value="+nodes[i].id+"><span>"+nodes[i].name+"</span></option>");
			}
		}
		//只有一条默认值时，改变最后一个
		for(var i in nodes){
			if(nodes[i].id == pid){
				for(var ii in nodes[i].children){
					 $("#select4").append("<option value="+nodes[i].children[ii].value+"><span>"+nodes[i].children[ii].name+"</span></option>");
				}
			}
		}
	}
	
	function change3(){
		$("#select4").empty();
		$("#select4").append("<option><span>请选择</span></option>");
		
		var pid=$("#select3").val();
		for(var i in nodes){
			if(nodes[i].id == pid){
				for(var ii in nodes[i].children){
					 $("#select4").append("<option value="+nodes[i].children[ii].value+"><span>"+nodes[i].children[ii].name+"</span></option>");
				}
			}
		}
	}
	
	function change4(){
		$("input[name=otherId]").val($("#select4").val());
	}
</script>

<style type="text/css">
.log-footer {
	width: 100%;
	height: 52px;
	background: #F6F6F6;
	text-align: center;
	padding-top: 10px;
}

.divTime {
	width: 100%;
	position: fixed;
	top: 50px;
	left: 0;
	background-color: white;
}

.qldiv1 {
	margin-top: 230px;
	width: 100%;
	border: solid #DDDDDD;
	border-width: 1px 0px 1px 0px;
	background: #F6F6F6;
	padding: 10px;
	position: fixed;
	top: 0;
	left: 0;
}

.mui-scroll-wrapper {
	margin-top: 275px;
	bottom: 50px;
}

ul {
	list-style: none;
	overflow: hidden;
}

.log-content li {
	display: list-item;
	float: left;
	width: 100%;
	border-bottom: 1px solid #F6F6F6;
}

.divleft {
	float: left;
	width: 50%;
}

.divleft span {
	width: 30%;
}

.divleft input {
	width: 65%;
	margin-left: 7px;
	padding-left: 5px !important;
}

.divright {
	float: left;
	width: 50%;
}

.divright span {
	width: 30%;
}

.divright input {
	width: 65%;
	margin-left: 7px;
	padding-left: 5px !important;
}
.right
</style>
</head>
<body>
	<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">搜索日志</h1>
	</header>
	<div class="divTime" id="divtime">
		<form action="${mctx}/user/userWorklog/query" method="post"
			id="queryForm">
			<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
			<input id="pageSize" name="pageSize" type="hidden"
				value="${page.pageSize}" /> <input type="hidden" name="otherId"
				value="${otherId}">
			<div class="divleft">
				<span>时段:</span> <input class="inputs" type="date" name="begindate"
					id="leftinput"
					value="<fmt:formatDate value="${begindate}"
									pattern="yyyy-MM-dd" />" />
			</div>
			<div class="divright">
				<span>至:&emsp;</span> <input class="inputs" type="date"
					name="enddate" id="rightinput"
					value="<fmt:formatDate value="${enddate}"
									pattern="yyyy-MM-dd" />" />
			</div>
			<div class="div_datas">
				<div class="div_datas_bumen">
					<span>部门:</span> <select onchange="change1()" class="selects"
						id="select1">
						<option><span>请选择</span></option>
					</select>
				</div>
				<div class="div_datas_fenbu">
					<span>部门:</span> <select onchange="change2()" class="selects"
						id="select2">
						<option><span>请选择</span></option>
					</select>
				</div>
				<div class="div_datas_xiaozu">
					<span>部门:</span> <select onchange="change3()" class="selects"
						id="select3">
						<option><span>请选择</span></option>
					</select>
				</div>
				<div class="div_datas_xiaozu">
					<span>人员:</span> <select onchange="change4()" class="selects"
						id="select4">
						<option><span>请选择</span></option>
					</select>
				</div>
			</div>
			<div id="div2" class="">
				<button type="button" data-loading-text="查询中"
					class="btn-login mui-btn btn-submit">查询</button>
			</div>
		</form>
	</div>
	<div class="qldiv1">
		<span id="lispanl"> 日志列表 </span>
	</div>
	<div id="scroll" class="mui-scroll-wrapper">
		<div class="mui-scroll">
			<div class="log-content" style="min-width: 320px;">
				<ul>
					<c:forEach items="${page.list}" var="now" varStatus="status1">
						<li><input type="hidden" name="id" value="${now.id}">
							<div class="log-item">
								<div class="log-date">
									<span id="" class="date-span">${userName }</span><span
										class="state"><fmt:formatDate value="${now.workdate}"
											pattern="yyyy-MM-dd" /></span>
								</div>
								<c:forEach items="${userWorkrecords[status1.index]}" var="now2"
									varStatus="status2">
									<div class="main">
										<div class="divtime">
											<span id="time"> <fmt:formatDate
													value="${now2.begintime}" pattern="HH:mm" />--<fmt:formatDate
													value="${now2.endtime}" pattern="HH:mm" />
											</span>
										</div>
										<div class="divcon">
											<span class="content"> ${now2.content }</span>
										</div>
									</div>
								</c:forEach>
							</div></li>
					</c:forEach>
				</ul>
			</div>
			<p>
				<table:pageMobile id="myPage" page="${page}"></table:pageMobile>
			</p>
		</div>
	</div>
	<script src="${ctxStatic}/mobile/frame_js/mui.min.js"></script>
	<script type="text/javascript">
		mui.init()
		mui(document.body).on('tap', '.mui-btn', function(e) {
			if(!validate()){
				return false;
			}
			$("#queryForm").submit();
			mui(this).button('loading');
			setTimeout(function() {
				mui(this).button('reset');
			}.bind(this), 2000);
		});
		(function($) {
			$('#scroll').scroll({
				indicators: true //是否显示滚动条
			});
		})(mui);
		
		
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#queryForm").submit();
        }
	</script><jsp:include page="/WEB-INF/views/mobile/modules/sys/foot.jsp"></jsp:include>
</body>

</html>