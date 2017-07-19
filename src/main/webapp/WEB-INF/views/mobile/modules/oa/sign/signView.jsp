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
		<title>签报详情</title>
		<style type="text/css">
.log-span {
	padding: 10px;
	word-wrap: break-word;
	word-break: break-all;
	font-size: 14px;
	font-family: "微软雅黑";
	color: #666666;
}

.divMargin{
	margin-top:40px;
}

.divtable>table,.divtable>table tr,.divtable>table th,.divtable>table td{
	border:none;
}

.divtable>table td{
	height:36px;
	line-height:36px;
	border-bottom:1px #ddd solid;
}

table thead h3{
	font-size:17px;
	color:#333;
	line-height:24px;
}

.header{
	background:#fff;;
}

.log-span{
	padding:0 10px;
}

</style>
	</head>
	<body>
	<header class="mui-bar mui-bar-nav">
		<a href="${mctx}/oa/sign/oaSign/" class=" mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">查看签报详情</h1>
	</header>
	<div class="divtable divMargin">
			<table class="logDeTable" class="table" border="" cellspacing="0" cellpadding="0">
			<thead>
			<tr>
				<th colspan="4"><h3 align='center'>楚誉科技股份有限公司</h3>
					<h3 align='center'>签 报 审 批 单</h3></th>
			</tr>
			</thead>
			<tbody>
					<tr>
					<td class="header"><span id="date" class="hespan">密级</span></td>
					<td><span id="" class="contentlog"> <c:choose>
						<c:when test="${oaSign.signType == 0}">
								绝密
							</c:when>
						<c:when test="${oaSign.signType == 1 }">
							机密
							</c:when>
							<c:when test="${oaSign.signType == 2 }">
							秘密
							</c:when>
							<c:when test="${oaSign.signType == 3 }">
							内部
							</c:when>
						<c:otherwise>
							公开
							</c:otherwise>
					</c:choose></span></td>
						</tr>
					<tr>
					<td class="header"><span id="date" class="hespan">编号</span></td>
					<td><span id="" class="contentlog"><c:choose>
						<c:when test="${oaSign.signNumber == 0}">
							楚财签】
							</c:when>
						<c:when test="${oaSign.signNumber == 1 }">
							【楚人签】
							</c:when>
						<c:when test="${oaSign.signNumber == 2 }">
							【楚研签】
							</c:when>
						<c:when test="${oaSign.signNumber == 3 }">
							【楚技签】
							</c:when>
						<c:when test="${oaSign.signNumber == 4 }">
							【楚市签】
							</c:when>
						<c:otherwise>

						</c:otherwise>
					</c:choose>${oaSign.code }号</span></td>
					</tr>
					<tr>
					<td class="header"><span id="date" class="hespan">标题</span></td>
					<td><span id="" class="contentlog">${oaSign.signTitile }</span></td>
						</tr>
					<tr>
					<td class="header">
					<span id="problem" class="hespan">内容 </span></td>
					<td class="">
					<div class="log-span">
					<div>${oaSign.signContent }</div>
						</div>
							</td>
						</tr>
						<tr>
					<td class="header">
					<span id="problem" class="hespan">正文</span></td>
					<td class="">
					<div class="log-span">
					<div>${text }</div>
						</div>
							</td>
						</tr>
							<tr>
					<td class="header"><span id="date" class="hespan"> 相关文件</span></td>
					<td><span id="" class="contentlog"><input type="hidden"
					id="billingFile${oaSign.id}" value="${oaSign.signFiles}" /> <sys:ckfinder
						input="billingFile${oaSign.id}" readonly="true" type="files"
						uploadPath="/oa/sign" selectMultiple="true" /></span></td>
				</tr>
				<c:if test="${not empty oaSign.signHeadOpinion }">
			<tr>
			<td class="header">
					<span id="problem" class="hespan">部门负责人意见 </span></td>
					<td><span id="" class="contentlog">${oaSign.signHeadOpinion }</span></td>
			</tr>
			</c:if>
			<c:if test="${not empty oaSign.signYfOpinion }">
				<tr>
					<td class="header">
					<span id="problem" class="hespan">研发部副总意见 </span></td>
					<td><span id="" class="contentlog">${oaSign.signYfOpinion }</span></td>
				</tr>
			</c:if>
			<c:if test="${not empty oaSign.signJsOpinion }">
				<tr>
					<td class="header">
					<span id="problem" class="hespan">技术部副总人意见 </span></td>
					<td><span id="" class="contentlog">${oaSign.signJsOpinion }</span></td>
				</tr>
			</c:if>
			<c:if test="${not empty oaSign.signSwOpinion }">
				<tr>
					<td class="header">
					<span id="problem" class="hespan">市场拓展部副总意见</span></td>
					<td><span id="" class="contentlog">${oaSign.signSwOpinion }</span></td>
				</tr>
			</c:if>
			<c:if test="${not empty oaSign.signScOpinion }">
				<tr>
					<td class="header">
					<span id="problem" class="hespan">市场部副总意见</span></td>
					<td><span id="" class="contentlog">${oaSign.signScOpinion }</span></td>
				</tr>
			</c:if>
			<c:if test="${not empty oaSign.signRsOpinion }">
				<tr>
					<td class="header">
					<span id="problem" class="hespan">人事部副总意见 </span></td>
					<td><span id="" class="contentlog">${oaSign.signRsOpinion }</span></td>
				</tr>
			</c:if>
			<c:if test="${not empty oaSign.signCwOpinion }">
				<tr>
					<td class="header">
					<span id="problem" class="hespan">财务部副总意见 </span></td>
					<td><span id="" class="contentlog">${oaSign.signCwOpinion }</span></td>
				</tr>
			</c:if>
			<c:if test="${not empty oaSign.signLdOpinion }">
			<tr>
				<td class="header">
					<span id="problem" class="hespan">领导意见 </span></td>
					<td><span id="" class="contentlog">${oaSign.signLdOpinion }</span></td>
			</tr>
			</c:if>
			<tr>
				<td class="header">
					<span id="problem" class="hespan">拟稿人 </span></td>
					<td><span id="" class="contentlog">${crName}</span></td>
			</tr>
			<tr>
				<td class="header">
					<span id="problem" class="hespan">拟稿时间 </span></td>
					<td><span id="" class="contentlog"><fmt:formatDate value="${oaSign.createDate}"
							pattern="yyyy-MM-dd HH:mm:ss" /></span></td>
			</tr>
			<tr>
				<td class="header">
					<span id="problem" class="hespan">拟稿部门 </span></td>
					<td><span id="" class="contentlog">${ofName }</span></td>
			</tr>
			</tbody>
			</table>	
		</div>
	</body>
	
</html>
