<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head lang="zh-cn">
<meta charset="UTF-8">
<title>日志详情</title>
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
</style>
<script type="text/javascript">
	/*删除确定提示框*/
	function del(url) {
		mui.confirm('确定删除该日志？', '系统提示', [ '是', '否' ], function(e) {
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
		<h1 class="mui-title">查看日志</h1>
		<c:if test="${fns:getUser().id ==  userWorklog.createBy.id}"><a class="mui-icon mui-icon-trash mui-pull-right"
			onclick="del('${mctx}/user/userWorklog/delete?ids=${userWorklog.id}')"></a></c:if>
	</header>
	<div class="divtable divMargin">
		<table id="_table" cellspacing="0" cellpadding="0">
			<tr>
				<td class="header"><span id="date" class="hespan"> 日期 </span></td>
				<td><span id="spanDate" class="contentlog"> <fmt:formatDate
							value="${userWorklog.workdate}" pattern="yyyy年MM月dd日" />
				</span></td>
			</tr>
			<tr>
				<td class="header"><span id="date" class="hespan"> 提交状态
				</span></td>
				<td><span id="" class="contentlog"> <c:choose>
							<c:when test="${now.isdraft=='0'}">
									草稿
								</c:when>
							<c:otherwise>已提交</c:otherwise>
						</c:choose>
				</span></td>
			</tr>
			<tr>
				<td class="header"><span id="date" class="hespan"> 提交时间
				</span></td>
				<td><span id="" class="contentlog"> <fmt:formatDate
							value="${userWorklog.updateDate}" pattern="yyyy-MM-dd HH:mm" />
				</span></td>
			</tr>
		</table>

		<c:forEach items="${userWorkrecords}" var="now">
			<table class="logDeTable" border="" cellspacing="0" cellpadding="0">
				<tr>
					<td class="header"><span id="date" class="hespan"> 开始时间
					</span></td>
					<td><span id="" class="contentlog"> <fmt:formatDate
								value="${now.begintime}" pattern="HH:mm" /></span></td>
				</tr>
				<tr>
					<td class="header"><span id="date" class="hespan"> 结束时间
					</span></td>
					<td><span id="" class="contentlog"> <fmt:formatDate
								value="${now.endtime}" pattern="HH:mm" />
					</span></td>
				</tr>

				<tr>
					<td class="header"><span id="date" class="hespan"> 类型 </span>
					</td>
					<td><span id="" class="contentlog"> <c:choose>
								<c:when test="${now.type=='1'}">
										请假
									</c:when>
								<c:when test="${now.type=='2'}">
										调休
									</c:when>
								<c:when test="${now.type=='3'}">
										出差
									</c:when>
								<c:otherwise>上班</c:otherwise>
							</c:choose>
					</span></td>
				</tr>
				<tr>
					<td class="header"><span id="date" class="hespan"> 工作内容
					</span></td>
					<td><div class="log-span">
							<div>${now.content }</div>
						</div></td>
				</tr>
				<tr>
					<td class="header"><span id="date" class="hespan"> 是否解决
					</span></td>
					<td><span id="" class="contentlog"> <c:choose>
								<c:when test="${now.isdone=='0'}">
									是
								</c:when>
								<c:otherwise>否</c:otherwise>
							</c:choose>
					</span></td>
				</tr>
				<tr>
					<td class="header"><span id="problem" class="hespan">
							问题及解决办法 </span></td>
					<td class=""><div class="log-span">
							<div>${now.remarks }</div>
						</div></td>
				</tr>
			</table>
		</c:forEach>
	</div>
</body>
</html>