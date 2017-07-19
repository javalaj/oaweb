<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="decorator" content="default" />
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/mobile/css/Base.css" />
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/mobile/css/mui.min.css" />
<title>公司新闻</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

a {
	outline: none;
	text-decoration: none;
}

#sliderSegmentedControl {
	height: 54px;
	background: #f4f7f6;
	width: 100%;
	padding: 8px 15px 0 15px;
}

.divheader ul {
	width: 100%;
}

#divheader li {
	display: inline-block;
}

.mui-fullscreen .mui-segmented-control ~.mui-slider-group {
	position: absolute;
	top: 90px;
	bottom: 50px;
	width: 100%;
	height: auto
}

.mui-segmented-control.mui-scroll-wrapper .mui-scroll {
	width: auto;
	white-space: nowrap;
}

.mui-slider .mui-slider-group .mui-slider-item img {
	width: 11px;
}

.mui-slider-group {
	background: white;
}

.log-footer {
	width: 100%;
	height: 52px;
	background: #f3f2f7;
	text-align: center;
	padding-top: 10px;
}

.titlediv>span {
	color: #000;
}
</style>
<script type="text/javascript">
	var titelspan;
	window.onload = function() {
		//titelspan = document.getElementById("titlespan");
		/*截取*/
		subStr();
		//设置第一个的a背景为蓝色
		$("span[title=${types}]").parent().attr("class", "thisadiv");
		//改变中间的文字标题
		$("#titlespan").text("我收藏的${types}");
		//获取 屏幕宽度的width
		var btnwidth = document.getElementById("sliderSegmentedControl").offsetWidth;
		/*获取所有的li*/
		var lis = document.getElementsByClassName("xuanli");

		for (var i = 0; i < lis.length; i++) {
			lis[i].style.width = btnwidth / 4 + "px";
		}
	}
	function subStr() {
		textLeng = 40;
		var text = document.getElementsByClassName('taskcon');
		for (var i = 0; i < text.length; i++) {
			str = text[i].innerText;
			if (str.length > textLeng) {
				text[i].innerHTML = str.substring(0, textLeng) + "…";
			}
		}
	}
	/*点击分类*/
	function change(type) {
		location.href = encodeURI(encodeURI("${mctx}/user/userFavorite/MobileList?types="
				+ type));
	}

	/*翻页*/
	function page(n, s) {
		//pageNo pageSize
		//s1=s2=2;
		location.href = encodeURI(encodeURI("${mctx}/user/userFavorite/MobileList?types=${types}&pageNo="
				+ n + "&pageSize=" + s));
	}
</script>
</head>

<body>
	<div class="mui-content">
		<div id="slider" class="mui-slider mui-fullscreen">
			<div id="sliderSegmentedControl"
				class="mui-scroll-wrapper mui-slider-indicator mui-segmented-control mui-segmented-control-inverted">
				<div class="mui-scroll" id="divheader">
					<ul>						
							<li class="xuanli">
								<div class="" align="center">
									<a href="#">
										<div class="adiv" id="asynergy" onclick="">
											<span id="" title="">
											</span>
										</div>
									</a>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="titlediv">
				<%--<img src="${ctxStatic}/mobile/images/sousuo.png" /> --%>
				<span id="titlespan"> </span>
			</div>
			<!--协同-->
			<div class="mui-slider-group">
				<div id="item1mobile"
					class="mui-slider-item mui-control-content mui-active">
					<div id="scroll1" class="mui-scroll-wrapper">
						<div class="mui-scroll">
							<ul class="xieul">
								<c:choose>
									<c:when test="${fn:length(page.list)>0}">
										<c:forEach items="${page.list}" var="now">
											<li onclick="location.href = '${mctx}${now.url}&from=sc'">
												<div class="Syerngy-item">
													<div class="synercontent ">
														<div class="syner2 ">
															<span id=" " class=" ">${now.title}</span>
														</div>
														<div class="divtime">
															<span class="synername"><fmt:formatDate
																	value="${now.updateDate}" pattern="yyyy-MM-dd" /></span> <span
																class="date-span">${now.type }</span>
														</div>
													</div>
													<div class=" " id="divimg2">
														<img src="${ctxStatic}/mobile/images/right.png "
															class="rightimg " />
													</div>
												</div>
											</li>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<oam:listViewCell>
											<p class="mui-ellipsis">暂无数据</p>
										</oam:listViewCell>
									</c:otherwise>
								</c:choose>
							</ul>

							<p>
								<table:pageMobile id="myPage" page="${page}" showPageOne="false"></table:pageMobile>
							</p>
						</div>
					</div>
				</div>
			</div><jsp:include page="/WEB-INF/views/mobile/modules/sys/foot.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>