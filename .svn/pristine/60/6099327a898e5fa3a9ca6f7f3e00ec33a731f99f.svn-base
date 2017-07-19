<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head lang="zh-cn">
<meta charset="UTF-8">
<title>我收到任务详情</title>
<meta name="decorator" content="default"/>
<meta name="" content="no-cache" http-equiv="Pragma" />
<meta name="" content="no-cache" http-equiv="Cache-Control" />
<meta name="" content="0" http-equiv="expires" />
<meta name="viewport"
	content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />

<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/mobile/css/Base.css" />
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/mobile/css/oa.css" />
<link rel="stylesheet" href="${ctxStatic}/mobile/css/mui.css" />
<link rel="stylesheet" href="${ctxStatic}/mobile/css/oabase.css" />
<link rel="stylesheet" href="${ctxStatic}/liuxin/css/mobile.css" />
<script src="${ctxStatic}/mobile/frame_js/mui.min.js"></script>
<style type="text/css">
.log-span {
	padding: 10px;
	word-wrap: break-word;
	word-break: break-all;
	font-size: 14px;
	font-family: "微软雅黑";
	color: #666666;
}
table,.divtable>table{
	border:none;
}
table tr td{
	height:30px;
	line-height:30px;
	border:none;
}
.logDeTable{
	width:100%;
	margin:10px 0;
}
.header{
	background-color:#fff;
	font-size:14px;
	width:35%;
}
.fenge {
    width: 100%;
    height: 15px;
    background-color: #f6f6f6;
}
.log-span {
	word-wrap: break-word;
	word-break: break-all;
	font-size: 14px;
	padding:0 10px 0 5px;
}
.hespan{
	vertical-align: top;
}
.contentlog{
	margin:0 5px;
}
.gray-bg{
	height:100%;
	background-color:#efefef !important;
}
.log-span {
	padding: 10px;
	word-wrap: break-word;
	word-break: break-all;
	font-size: 14px;
	font-family: "微软雅黑";
	color: #666666;
}

.hespan{
	vertical-align: top;
}
.contentlog{
	margin:0 5px;
}
html input[type='button'],input[type='submit']{
	color: #fff;
    border: 1px solid #12b7f5;
    background-color: #12b7f5;
}
.mui-row div{
	text-align:center;
	margin-bottom:10px;
}

.divtable{
	padding:0;
}
h1{
font-size:17px;
padding:8px 10px;
background:#f3f2f7;
}
.mui-title{
background:#f7f7f7;
}
</style>
<script type="text/javascript">
	/*删除确定提示框*/
	function del(url) {
		mui.confirm('确定删除该任务？', '系统提示', [ '是', '否' ], function(e) {
			if (e.index == 0) {
				location.href = url;
			}
		})
	}
</script>
</head>
<body>
	<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">查看任务详情</h1>
		<a class="mui-icon mui-icon-trash mui-pull-right"
			onclick="del('${ctx }/m/oa/mytask/myTask/deletemore?delitem=${oaPlan.id}')"></a>
	</header>
	<div class="divtable divMargin">
	<h1>主任务</h1>
			<table class="logDeTable" border="" cellspacing="0" cellpadding="0">
					<tr>
					<td class="header"><span id="date" class="hespan"> 标题</span></td>
					<td><span id="" class="contentlog"> ${oaPlanMain.planTitle}</span></td>
						</tr>
					<tr>
					<td class="header"><span id="date" class="hespan"> 关联项目</span></td>
					<td><span id="" class="contentlog">${oaProjectMain.projectName}</span></td>
					</tr>
					<tr>
					<td class="header"><span id="date" class="hespan"> 发布人</span></td>
					<td><span id="" class="contentlog">${mainActName}</span></td>
						</tr>
					<tr>
					<td class="header"><span id="date" class="hespan"> 创建时间</span></td>
					<td><span id="" class="contentlog">  <fmt:formatDate value="${oaPlanMain.createDate}" pattern="yyyy-MM-dd" /></span></td>
						</tr>
					<tr>
					<td class="header">
					<span id="problem" class="hespan">任务描述 </span></td>
					<td class="">
					<div class="log-span">
					<div>${oaPlanMain.content }</div>
						</div>
							</td>
						</tr>
				<tr>
					<td class="header"><span id="date" class="hespan"> 开始时间</span></td>
					<td><span id="" class="contentlog"> <fmt:formatDate value="${oaPlanMain.startDay}"
						pattern="yyyy-MM-dd" />   ${oaPlanMain.startTime}
					</span></td>
					</tr>
				<tr>
					<td class="header"><span id="date" class="hespan"> 期望结束</span></td>
					<td><span id="" class="contentlog"> ${oaPlanMain.endTime}</span></td>
				</tr>
				<tr>
					<td class="header"><span id="date" class="hespan"> 发送对象</span></td>
					<td><span id="" class="contentlog"> ${nameMain}</span></td>
				</tr>
					<tr>
					<td class="header"><span id="date" class="hespan"> 相关文件</span></td>
					<td><span id="" class="contentlog"><input type="hidden" id="billingFile${oaPlanMain.id}"value="${oaPlanMain.files}"/>
									<sys:ckfinder input="billingFile${oaPlanMain.id}" readonly="true" type="files" uploadPath="/oa/oaTask" selectMultiple="true"/>
					</span></td>
				</tr>
						<tr>
					<td class="header">
					<span id="problem" class="hespan">办理情况 </span></td>
					<td class="">
					<div class="log-span">
					<div>${oaPlanMain.remarks }</div>
						</div>
							</td>
						</tr>
						<tr>
					<td class="header"><span id="date" class="hespan"> 办理相关文件</span></td>
					<td><span id="" class="contentlog"><input type="hidden" id="cc${oaPlanMain.id}"value="${oaPlanMain.backfiles}"/>
									<sys:ckfinder input="cc${oaPlanMain.id}" readonly="true" type="files" uploadPath="/oa/oaTask/replyFile" selectMultiple="true"/> 
					</span></td>
				</tr>
			</table>
			<h1>子任务</h1>
					<table class="logDeTable" border="" cellspacing="0" cellpadding="0">
					<tr>
					<td class="header"><span id="date" class="hespan"> 标题</span></td>
					<td><span id="" class="contentlog"> ${oaPlanChilds.planTitle}</span></td>
						</tr>
					<tr>
					<td class="header"><span id="date" class="hespan"> 关联项目</span></td>
					<td><span id="" class="contentlog">${oaProjectChilds.projectName}</span></td>
					</tr>
					<tr>
					<td class="header"><span id="date" class="hespan"> 发布人</span></td>
					<td><span id="" class="contentlog">${childsActName}</span></td>
						</tr>
					<tr>
					<td class="header"><span id="date" class="hespan"> 创建时间</span></td>
					<td><span id="" class="contentlog">  <fmt:formatDate value="${oaPlanChilds. createDate}" pattern="yyyy-MM-dd" /></span></td>
						</tr>
					<tr>
					<td class="header">
					<span id="problem" class="hespan">任务描述 </span></td>
					<td class="">
					<div class="log-span">
					<div>${oaPlanChilds.content }</div>
						</div>
							</td>
						</tr>
				<tr>
					<td class="header"><span id="date" class="hespan"> 开始时间</span></td>
					<td><span id="" class="contentlog"> <fmt:formatDate value="${oaPlanChilds.startDay}"
						pattern="yyyy-MM-dd" />   ${oaPlanChilds.startTime}
					</span></td>
					</tr>
				<tr>
					<td class="header"><span id="date" class="hespan"> 期望结束</span></td>
					<td><span id="" class="contentlog">${oaPlanChilds.endTime}</span></td>
				</tr>
				<tr>
					<td class="header"><span id="date" class="hespan"> 发送对象</span></td>
					<td><span id="" class="contentlog"> ${nameChilds}</span></td>
				</tr>
					<tr>
					<td class="header"><span id="date" class="hespan"> 相关文件</span></td>
					<td><span id="" class="contentlog"><input type="hidden" id="billingFile${oaPlanChilds.id}"value="${oaPlanChilds.files}"/>
									<sys:ckfinder input="billingFile${oaPlanChilds.id}" readonly="true" type="files" uploadPath="/oa/oaTask" selectMultiple="true"/>
					</span></td>
				</tr>
						<tr>
					<td class="header">
					<span id="problem" class="hespan">办理情况 </span></td>
					<td class="">
					<div class="log-span">
					<div>${oaPlanChilds.remarks }</div>
						</div>
							</td>
						</tr>
						<tr>
					<td class="header"><span id="date" class="hespan"> 办理相关文件</span></td>
					<td><span id="" class="contentlog"><input type="hidden" id="aa${oaPlanChilds.id}"value="${oaPlanChilds.backfiles}"/>
									<sys:ckfinder input="aa${oaPlanChilds.id}" readonly="true" type="files" uploadPath="/oa/oaTask/replyFile" selectMultiple="true"/>
					</span></td>
				</tr>
			</table>
	   <c:if test="${oaPlanChild.size()!=null}">
		<c:forEach items="${oaPlanChild }" var="oaPlanChild">
			<table class="logDeTable" border="" cellspacing="0" cellpadding="0">
					<tr>
					<td class="header"><span id="date" class="hespan"> 标题</span></td>
					<td><span id="" class="contentlog"> ${oaPlanChild.planTitle}</span></td>
						</tr>
					<tr>
					<td class="header"><span id="date" class="hespan"> 关联项目</span></td>
					<td><span id="" class="contentlog"> ${oaPlanChild.proname}</span></td>
					</tr>
					<tr>
					<td class="header"><span id="date" class="hespan"> 发布人</span></td>
					<td><span id="" class="contentlog">${oaPlanChild.childActName}</span></td>
						</tr>
					<tr>
					<td class="header"><span id="date" class="hespan"> 创建时间</span></td>
					<td><span id="" class="contentlog"> <fmt:formatDate value="${oaPlanChild.createDate }" pattern="yyyy-MM-dd" /></span></td>
						</tr>
					<tr>
					<td class="header">
					<span id="problem" class="hespan">任务描述 </span></td>
					<td class="">
					<div class="log-span">
					<div>${oaPlanChild.content }</div>
						</div>
							</td>
						</tr>
				<tr>
					<td class="header"><span id="date" class="hespan"> 开始时间</span></td>
					<td><span id="" class="contentlog"> <fmt:formatDate value="${oaPlanChild.startDay}"
						pattern="yyyy-MM-dd" />   ${oaPlanChild.startTime}
					</span></td>
					</tr>
				<tr>
					<td class="header"><span id="date" class="hespan"> 期望结束</span></td>
					<td><span id="" class="contentlog">${oaPlanChild.endTime}</span></td>
				</tr>
				<tr>
					<td class="header"><span id="date" class="hespan"> 发送对象</span></td>
					<td><span id="" class="contentlog">${oaPlanChild.actName}</span></td>
				</tr>
					<tr>
					<td class="header"><span id="date" class="hespan"> 相关文件</span></td>
					<td><span id="" class="contentlog"><input type="hidden" id="billingFile${oaPlanChild.id}"value="${oaPlanChild.files}"/>
									<sys:ckfinder input="billingFile${oaPlanChild.id}" readonly="true" type="files" uploadPath="/oa/oaTask" selectMultiple="true"/>
					</span></td>
				</tr>
						<tr>
					<td class="header">
					<span id="problem" class="hespan">办理情况 </span></td>
					<td class="">
					<div class="log-span">
					<div>${oaPlanChild.remarks } </div>
						</div>
							</td>
						</tr>
						<tr>
					<td class="header"><span id="date" class="hespan"> 办理相关文件</span></td>
					<td><span id="" class="contentlog"><input type="hidden" id="bb${oaPlanChild.id}"value="${oaPlanChild.backfiles}"/>
									<sys:ckfinder input="bb${oaPlanChild.id}" readonly="true" type="files" uploadPath="/oa/oaTask/replyFile" selectMultiple="true"/> 
					</span></td>
				</tr>
			</table>
		
		</c:forEach>
		</c:if>
		
		
		
		
	</div>
</body>
</html>