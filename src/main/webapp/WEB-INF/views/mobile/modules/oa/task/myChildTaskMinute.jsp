<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<meta name="decorator" content="default"/>
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/mobile/css/Base.css" />
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/mobile/css/oa.css" />
<link rel="stylesheet" href="${ctxStatic}/mobile/css/mui.css" />
<link rel="stylesheet" href="${ctxStatic}/mobile/css/oabase.css" />
<link rel="stylesheet" href="${ctxStatic}/liuxin/css/mobile.css" />
		<title>我收到的任务详情</title>
		<style type="text/css">
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
	</head>
	<body>
	<header class="mui-bar mui-bar-nav">
		<a href="${ctx}/m/oa/mytask/myTask/mylist" class=" mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">查看任务详情</h1>
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
					<td><span id="" class="contentlog"> ${oaProjectMain.projectName}</span></td>
					</tr>
					<tr>
					<td class="header"><span id="date" class="hespan"> 发布人</span></td>
					<td><span id="" class="contentlog">${actNameMain}</span></td>
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
					<td><span id="" class="contentlog"><fmt:formatDate value="${strMain }" pattern="yyyy-MM-dd HH:mm:ss"/>
					</span></td>
					</tr>
				<tr>
					<td class="header"><span id="date" class="hespan"> 期望结束</span></td>
					<td><span id="" class="contentlog">	<fmt:formatDate value="${etrMain}" pattern="yyyy-MM-dd HH:mm:ss"/></span></td>
				</tr>
				<tr>
					<td class="header"><span id="date" class="hespan"> 发送对象</span></td>
					<td><span id="" class="contentlog">${actNameMainsss}</span></td>
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
					<div>${oaPlanMain.remarks } </div>
						</div>
							</td>
						</tr>
						<tr>
					<td class="header"><span id="date" class="hespan"> 办理相关文件</span></td>
					<td><span id="" class="contentlog"> <input type="hidden" id="dd${oaPlanMain.id}"value="${oaPlanMain.backfiles}"/>
									<sys:ckfinder input="dd${oaPlanMain.id}" readonly="true" type="files" uploadPath="/oa/oaTask/replyFile" selectMultiple="true"/> 
					</span></td>
				</tr>
			</table>	
			<h1>子任务</h1>
				<table class="logDeTable" border="" cellspacing="0" cellpadding="0">
					<tr>
					<td class="header"><span id="date" class="hespan"> 标题</span></td>
					<td><span id="" class="contentlog">${oaPlanChilds.planTitle}</span></td>
						</tr>
					<tr>
					<td class="header"><span id="date" class="hespan"> 关联项目</span></td>
					<td><span id="" class="contentlog">${oaProjectChilds.projectName}</span></td>
					</tr>
					<tr>
					<td class="header"><span id="date" class="hespan"> 发布人</span></td>
					<td><span id="" class="contentlog">${actNameChilds}</span></td>
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
					<td><span id="" class="contentlog"> <fmt:formatDate value="${strChilds }" pattern="yyyy-MM-dd HH:mm:ss"/>
					</span></td>
					</tr>
				<tr>
					<td class="header"><span id="date" class="hespan"> 期望结束</span></td>
					<td><span id="" class="contentlog"> <fmt:formatDate value="${etrChilds}" pattern="yyyy-MM-dd HH:mm:ss"/></span></td>
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
					<div>${oaPlanChilds.remarks } </div>
						</div>
							</td>
						</tr>
						<tr>
					<td class="header"><span id="date" class="hespan"> 办理相关文件</span></td>
					<td><span id="" class="contentlog"> <input type="hidden" id="zz${oaPlanChilds.id}"value="${oaPlanChilds.backfiles}"/>
									<sys:ckfinder input="zz${oaPlanChilds.id}" readonly="true" type="files" uploadPath="/oa/oaTask/replyFile" selectMultiple="true"/> 
					</span></td>
				</tr>
			</table>	
			<div class="mui-row">
				  <c:choose>
							<c:when test="${oaPlan.state==2 }">
							</c:when>
							<c:otherwise>
							<div class="mui-col-xs-6">
								 <input id="btnSubmit1" class="btn btn-keep" type="button" onclick="reply();" value="回复此任务"/>
							 </div>
							 <div class="mui-col-xs-6">
							 <input id="btnSubmit" class="btn col-md-offset-3 btn-keep" type="button"   onclick="childForm();"  value="编辑子任务"/>
							</div>
							</c:otherwise>
						</c:choose> 
				</div>
		</div>
		<script type="text/javascript">
	    function reply(){
	    	var id='${oaPlan.id}';
				location.href="${ctx}/m/oa/mytask/myTask/subform?delitem="+id+"&flag="+1;
	    }
			function childForm(){
				var id='${oaPlan.id}';
				location.href="${ctx}/m/oa/mytask/myTask/subform?delitem="+id+"&flag="+2;
	    }
	
				function history() {
		location.href="${ctx}/oa/mytask/myTask/mylist";
	}
		</script>
	</body>
	
</html>
