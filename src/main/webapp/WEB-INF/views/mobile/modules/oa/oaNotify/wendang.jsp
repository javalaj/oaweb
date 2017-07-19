<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>

	<head>
		<meta charset="UTF-8">
		<title>通知</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link href="${ctxStatic}/mobile/frame_css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="${ctxStatic}/mobile/css/Base.css" />
		<script id="title" src="${ctxStatic}/mobile/js/Base.js" type="text/javascript" charset="utf-8" data="协同办公"></script>
		<script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>	
	<script src="${ctxStatic}/jquery-jbox/2.3/jquery.jBox-2.3.min.js" type="text/javascript"></script>
	<script src="${ctxStatic}/common/jeesite.js" type="text/javascript"></script>
	<script src="${ctxStatic}/messageBox/messageBox.js" type="text/javascript"></script>
	<script src="${ctxStatic}/mobile/frame_js/mui.min.js"></script>
		<style type="text/css">
			.divheader {
				width: 100%;
				overflow: hidden;
				box-sizing: border-box;
				padding: 10px;
				background: #f4f7f6;
				height: 50px;
			}			
			.xinwen_lists{display:none;}
			.document_lists{display:none;}
			.store_lists{display:none;}
			.divheader>div {
				float: left;
				width: 25%;
				margin: 0px;
				padding: 0px;
			}
			
			.adiv {
				width: 70%;
				height: 32px;
				border-radius: 5px;
				border: 1px solid #CCCCCC;
				text-align: center;
				background: white;
			}
			
			.thisadiv {
				width: 68px;
				height: 32px;
				border-radius: 4px;
				border: 1px solid #32A5E7;
				text-align: center;
				background: #32A5E7;
			}
			
			a>div>span {
				height: 32px;
				line-height: 30px;
				text-align: center;
				font-size: 1.5rem;
				font-family: "微软雅黑";
				color: #333333;
			}
			
			.thisadiv>span {
				height: 32px;
				font-size: 1.5rem;
				font-family: "微软雅黑";
				color: #FFFFFF;
			}
			
			.intermediate {
				padding: 0px 10px;
				width: 100%;
				height: 30px;
				background-color: #eee;
			}
			
			.intermediate_sousuo {
				float: left;
				width: 10%;
				height: 30px;
				border: 0px;
				background-color: #eee;
				text-align: center;
			}
			
			.intermediate_sousuo img {
				margin: 5px auto;
				height: 20px;
			}
			
			.intermediate_title {
				float: left;
				width: 80%;
				text-align: center;
				line-height: 30px;
			}
			
			.intermediate_title span {
				font-size: 1.6rem;
				color: #0094ff;
			}
			
			.intermediate_new {
				float: left;
				width: 10%;
				height: 30px;
				border: 0px;
				background-color: #eee;
				text-align: center;
			}
			
			.intermediate_new img {
				margin: 5px auto;
				height: 20px;
			}
			
			.xinwen_main {
				padding: 10px;
				height: 84px;
				border-bottom: 1px solid #d4dde4;
			}
			
			.tongzhi_geren_title {
				width: 100%;
				padding-left: 10px;
				height: 30px;
				line-height: 30px;
				background-color: #eee;
			}
			
			.tongzhi_geren_title b {
				color: #666666;
				font-size: 1.5rem;
			}
			
			.tongzhi_geren_title a {
				padding-right: 10px;
				float: right;
				font-size: 1.5rem;
			}
			
			.xinwen_list {
				width: 75%;
				float: left;
			}
			
			.xinwen_h5 {
				float: left;
				line-height: 21px;
				font-size: 1.4rem;
				color: #007AFF;
			}
			
			.xiwen_span {
				float: left;
				padding-left: 20px;
				line-height: 21px;
				font-size: 1.4rem;
			}
			
			.xinwen_title {
				padding-top: 10px;
				overflow: hidden;
				/*自动隐藏文字*/
				text-overflow: ellipsis;
				/*文字隐藏后添加省略号*/
				white-space: nowrap;
				/*强制不换行*/
				width: 24em;
				font-size: 1.6rem;
				clear: both;
				width: 100%;
				height: 42px;
				padding-right: 10px;
			}
			
			.xinwen_img {
				float: right;
				width: 72px;



			}
			
			.tongzhi_list {
				padding: 10px;
				width: 100%;
			
				border-bottom: 1px solid #d4dde4;
			}
			
			.tongzhi_name {
				float: left;
				height: 20px;
				line-height: 10px;
				font-size: 1.4rem;
				color: #0062CC;
			}
			
			.tongzhi_time {
				float: right;
				height: 20px;
				line-height: 10px;
				font-size: 1.4rem;
			}
			
			.tongzhi_p {
				clear: both;
				line-height: 16px;
				height: 32px;
				width: 100%;
				overflow: hidden;
				/*自动隐藏文字*/
				text-overflow: ellipsis;
				/*文字隐藏后添加省略号*/
				white-space: nowrap;
				/*强制不换行*/
				width: 22em;
			}
		</style>
	</head>

	<body>
		<div class="divheader">
			<div class="" align="center">
				<a >
					<div class="adiv" id="asynergy" onclick="change1()">
						<span id="">
							通知
						</span>
					</div>
				</a>
			</div>
			<div class="" align="center">
				<a >
					<div class="adiv" id="ainfrom" onclick="change2()">
						<span id="">
							新闻
						</span>
					</div>
				</a>
			</div>
			<div class="" align="center">
				<a >
					<div class="adiv" id="adoc" onclick="change3()">
						<span id="">
						文档
					</span>
					</div>
				</a>
			</div>

			<div class="" align="center">
				<a >
					<div class="adiv" id="alink" onclick="change4()">
						<span id="">
						收藏
					</span>
					</div>
				</a>
			</div>

		</div>

		<div class="tongzhi_lists"  id="notice">
			<div class="tongzhi_geren_title">
				<b>个人通告</b>
				<a href="${ctx}/m/oa/oaNotify/self">更多 </a>
			</div>

			<div class="tongzhi_list" onclick="My_tongzhi_li()">
				<c:forEach items="${pageSelf.list}" var="oaNotify" begin="0" end="2">
				<span class="tongzhi_name">
				<c:choose>
					<c:when test="${oaNotify.files=='2'}">
					   <a href="${ctx}/m/oa/cyTspOaMonthlyPlan/personal?commid=${oaNotify.content}&id=${oaNotify.id}">
						 ${fns:abbr(oaNotify.title,50)}
					</a>
					</c:when>
					<c:otherwise>
					<a href="${ctx}/m/oa/oaNotify/view?id=${oaNotify.id}">
						${fns:abbr(oaNotify.title,50)}
					</a>
					</c:otherwise>
				</c:choose>
				</span>
				
				<span class="tongzhi_time">
					<fmt:formatDate value="${oaNotify.updateDate}" pattern="yyyy-MM-dd"/>
				</span>
				
				<p class="tongzhi_p">${fns:getDictLabel(oaNotify.type, 'oa_notify_type', '')}</p>
				
				</c:forEach>
			</div>
			
			<div class="tongzhi_geren_title">
				<b>通告管理</b>
				<a href="${ctx}/m/oa/oaNotify">更多 </a>
			</div>

			<div class="tongzhi_list" >
				<c:forEach items="${page.list}" var="oaNotify" begin="0" end="2">
				<span class="tongzhi_name">
				<c:choose>
					<c:when test="${oaNotify.files=='2'}">
					   <a href="${ctx}/m/oa/cyTspOaMonthlyPlan/personal?commid=${oaNotify.content}&id=${oaNotify.id}">
						 ${fns:abbr(oaNotify.title,50)}
					</a>
					</c:when>
					<c:otherwise>
					<a href="${ctx}/m/oa/oaNotify/form?id=${oaNotify.id}">
						${fns:abbr(oaNotify.title,50)}
					</a>
					</c:otherwise>
				</c:choose>
				</span>
				
				<span class="tongzhi_time">
					<fmt:formatDate value="${oaNotify.updateDate}" pattern="yyyy-MM-dd"/>
				</span>
				
				<p class="tongzhi_p">${fns:getDictLabel(oaNotify.type, 'oa_notify_type', '')}</p>
				
				</c:forEach>
			</div>
		</div>

		<div class="xinwen_lists" >

			<div class="intermediate">
				<button type="button" class="intermediate_sousuo" onclick="xinwen_chaxun()"><img src="${ctxStatic}/mobile/images/sousuo.png" alt="" /></button>
				<div class="intermediate_title"><span>新闻中心</span></div>
				<button type="button" class="intermediate_new" onclick="xinwen_xinjian()"><img src="${ctxStatic}/mobile/images/tianjia.png"/></button>
			</div>

			<div class="xinwen_main">
				<div class="xinwen_list">
					<h5 class="xinwen_h5">张三</h5>
					<span class="xiwen_span">2017.01.06</span>
					<p class="xinwen_title">这里是新闻的标题部分，这里是新闻的标题部分，这里是新闻的标题部分，这里是新闻的标题部分，这里是新闻的标题部分，这里是新闻的标题部分，这里是新闻的标题部分，这里是新闻的标题部分，这里是新闻的标题部分，这里是新闻的标题部分，这里是新闻的标题部分，这里是新闻的标题部分，</p>
				</div>
				<img class="xinwen_img" src="${ctxStatic}/mobile/images/xinwentu.png" alt="" />
			</div>
		</div>
		<div class="document_lists" >			
		</div>
		<div class="store_lists" >			
		</div>

		<script src="${ctxStatic}/mobile/frame_js/mui.min.js"></script>

		<script type="text/javascript ">
			(function($) {
				$('.mui-scroll-wrapper').scroll({
					indicators: true //是否显示滚动条
				});
			})(mui);
		</script>
		<script type="text/javascript">
			window.onload = function() {
					//设置第一个的a背景为蓝色
					document.getElementById("asynergy").setAttribute("class", "thisadiv");
				}
				/*通知点击*/
			function change1() {
				$("#notice").css("display","block");
				$(".xinwen_lists").css("display","none");
				$(".document_lists").css("display","none");
				$(".store_lists").css("display","none")
				document.getElementById("asynergy").setAttribute("class", "thisadiv");
				document.getElementById("ainfrom").setAttribute("class", "adiv");
				document.getElementById("adoc").setAttribute("class", "adiv");
				document.getElementById("alink").setAttribute("class", "adiv");

			}
			/*新闻事项*/
			function change2() {
				$("#notice").css("display","none");
				$(".xinwen_lists").css("display","block");
				$(".document_lists").css("display","none");
				$(".store_lists").css("display","none")
				document.getElementById("asynergy").setAttribute("class", "adiv");
				document.getElementById("ainfrom").setAttribute("class", "thisadiv");
				document.getElementById("adoc").setAttribute("class", "adiv");
				document.getElementById("alink").setAttribute("class", "adiv");	
				
			}
			/*文档事项*/
			function change3() {
				$("#notice").css("display","none");
				$(".xinwen_lists").css("display","none");
				$(".document_lists").css("display","block");
				$(".store_lists").css("display","none")
				document.getElementById("asynergy").setAttribute("class", "adiv");
				document.getElementById("ainfrom").setAttribute("class", "adiv");
				document.getElementById("adoc").setAttribute("class", "thisadiv");
				document.getElementById("alink").setAttribute("class", "adiv");
			}

			/*收藏事项*/
			function change4() {
				$("#notice").css("display","none");
				$(".xinwen_lists").css("display","none");
				$(".document_lists").css("display","none");
				$(".store_lists").css("display","block")
				document.getElementById("asynergy").setAttribute("class", "adiv");
				document.getElementById("ainfrom").setAttribute("class", "adiv");
				document.getElementById("adoc").setAttribute("class", "adiv");
				document.getElementById("alink").setAttribute("class", "thisadiv");
			}
		</script>
		<script type="text/javascript">
			mui.init()

			function xiangqing() {
				location.href = "NewSynergy.html";

			}

			function gonggao_chaxun() {
				location.href = "GangGao_XhaXun.html"
			}

			function gonggao_xinjian() {
				location.href = "GangGao_XinJian.html"
			}
			
			function My_tongzhi_li() {
				location.href = "GangGao_XinJian.html"
			}
			
			
		</script>
	</body>

</html>