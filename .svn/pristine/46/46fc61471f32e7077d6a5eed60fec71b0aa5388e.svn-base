<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>用车申请司机填写</title>
		<link href="${ctxStatic}/mobile/css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="${ctxStatic}/mobile/css/Base.css" />
		
		<script type="text/javascript" src="${ctxStatic}/jquery/jquery-1.9.1.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${ctxStatic}/liuxin/css/mobile2.css" />
		<script type="text/javascript" src="${ctxStatic}/liuxin/fn.js"></script>
		<link rel="stylesheet" href="${ctxStatic}/mobile/css/oabase.css" />
		<style type="text/css">
			.selects{
				width: 67%;
    			height: 32px;
			}		
		</style>
	</head>
	
	<body>
	<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">用车申请司机填写</h1>
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
	<form id="inputForm"
		action="${ctx}/m/oa/oaUsecar/dealExam3" method="post">
		<div class="divtitle">
			<span id="title">${title}</span>
		</div>
		<input type="hidden" name="token" value="${token }">
		<input type="hidden" value="${oaUsecar.id}" name="id"/>
		<input type="hidden" value="${oaUsecar.procInsId}" name="procInsId"/>
		<input type="hidden" value="${oaUsecar.fileId}" name="fileId"/>
		<input type="hidden" value="${oaUsecar.department}" name="department"/>
		<input type="hidden" value="${oaUsecar.createBy.id}" name="createBy.id"/>
		<input type="hidden" value="<fmt:formatDate value="${oaUsecar.usetime}" pattern="yyyy-MM-dd HH:mm:ss"/>" id="usetime" name="usetime"/>
		<input type="hidden" value="${oaUsecar.usereason}" name="usereason"/>
		<input type="hidden" value="${oaUsecar.destination}" name="destination"/>
		<input type="hidden" value="${oaUsecar.usescope}" name="usescope"/>
		<input type="hidden" value="${oaUsecar.examname}" name="examname"/>
		<input type="hidden" value="${oaUsecar.examtext}" name="examtext"/>
		<input type="hidden" value="${oaUsecar.destinationchange}" name="destinationchange"/>
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
			<li class="mui-table-view-cell">
				<span>变更目的地：</span>
				<span>${oaUsecar.destinationchange}&nbsp;</span>
			</li>


			<li class="mui-table-view-cell" id="content11">
				<span>车牌号：</span>
				<select name="platenum" class="selects riqi_selects">
					<c:forEach items="${carno}" var="no" varStatus="i">
						<option value="${no}">${no}</option>
					</c:forEach>
				</select>
			</li>

			<li class="mui-table-view-cell" id="content11">
				<span>司机：</span>
				<span><input type="text" value="${oaUsecar.driver}" name="driver" class="inputs"  readonly="readonly"></span>
			</li>

			<li class="mui-table-view-cell" id="content11">
				<span>出发时间：</span>
				<input class="inputs mui-datetime" id="gotime"  type="text" readonly="readonly" name="gotime"
					value="<fmt:formatDate value="${oaUsecar.gotime}" pattern="yyyy-MM-dd HH:mm:ss"/>" />
			</li>

			<li class="mui-table-view-cell" id="content11">
				<span>返回时间：</span>
				<input class="inputs mui-datetime" id="leftinput"  type="text" readonly="readonly" name="backtime"
					value="<fmt:formatDate value="${oaUsecar.backtime}" pattern="yyyy-MM-dd HH:mm:ss"/>" />
			</li>
			
			<li class="mui-table-view-cell" id="content11">
				<span>起始公里数：</span>
				<span><input type="text" name="gokilometer"  id="gokilometer" class="inputs"></span>
			</li>
					
			<li class="mui-table-view-cell" id="content11">
				<span>返回公里数：</span>
				<span><input type="text" name="backkilometer" id="backkilometer" class="inputs"></span>
			</li>
			
			<li class="mui-table-view-cell" id="content11">
				<span class="sp">是否安全到达：</span>
				<span style="width:60%;">
					<input checked="checked" name="safearrive" type="radio" value="是"  class="exam"/>是
					<input name="safearrive" type="radio" value="否"  class="exam"/>否
			    </span>
			</li>
			
			<li class="mui-table-view-cell" id="content11">
				<span>备&nbsp;&nbsp;&nbsp;注：</span>
				<textarea  name="remarks" placeholder="" rows="4">${remarks}</textarea>
			</li>
			
		</ul>

		<div class="bottom_button">
			<button type="submit" data-loading-text="提交中" id="tijiao"
				class="bottoms btnapp btn-submit bt2 mui-btn-primary form-button">
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
// 			mui.init()
// 				/*js控制按钮的联网请求*/
// 			mui(document.body).on('tap', '.type', function(e) {
// 				mui(this).button('loading');
// 				setTimeout(function() {
// 					mui(this).button('reset');
// 				}.bind(this), 2000);
// 			});

			$("#tijiao").click(function(){	
				var usetime = $("#usetime").val();//获取出发时间
				var gotime = $("#gotime").val(); //获取出发时间 
				var backtime = $("#leftinput").val();//获取返回时间
				var gokilometer = $("#gokilometer").val();//起始公里数
				var backkilometer = $("#backkilometer").val();//返回公里数
				var go = new Date(gotime.replace(/-/g,"/"));
 				var back = new Date(backtime.replace(/-/g,"/"));
 				
 				if(gotime==""){
					mui.alert('出发时间不能为空！');
					return false;
				}
 				if(backtime==""){
					mui.alert('返回时间不能为空！');
					return false;
				}
 				if(gokilometer==""){
					mui.alert('起始公里数不能为空！');
					return false;
				}
 				if(backkilometer==""){
					mui.alert('结束公里数不能为空！');
					return false;
				}
 				if(Date.parse(usetime) > Date.parse(gotime)){
 					mui.alert("请在用车时间之后填写出发返回时间！", "系统提示");
 					return false;
 				}
				if(Date.parse(back)<Date.parse(go)){
					mui.alert("出发时间必须早于返回时间！", "系统提示");
					return false;
				}
				
				if(isNaN(gokilometer) || (isNaN(backkilometer))){
					mui.alert("公里数请输入数字！", "系统提示");
					return false;
				}
				
				if(parseInt(gokilometer)>parseInt(backkilometer)){
					mui.alert("返回公里数不能小于起始公里数！", "系统提示");
					return false;
				}
				return true;
			})

		</script><%-- <jsp:include page="/WEB-INF/views/mobile/modules/sys/foot.jsp"></jsp:include> --%>
		<sys:mui-datetime></sys:mui-datetime>
	</body>

</html>