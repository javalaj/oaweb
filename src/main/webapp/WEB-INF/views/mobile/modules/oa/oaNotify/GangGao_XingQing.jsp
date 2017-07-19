<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<title>${oaNotify.status ne '1'?'修改':'查看'}${oaNotify.isMess ? '消息':'通知'}</title>
<meta name="decorator" content="default" />
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/mobile/css/mui.min.css" />
<script src="${ctxStatic}/mobile/js/mui.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/mobile/oa/css/oaDoc.css" />
<link href="${ctxStatic}/mobile/frame_css/mui.min.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/mobile/css/Base.css" />
<link href="${ctxStatic}/common/jeesite.css" type="text/css"
	rel="stylesheet" />
<link href="${ctxStatic}/jquery-jbox/2.3/Skins/Bootstrap/jbox.min.css"
	rel="stylesheet" />
<script src="${ctxStatic}/jquery/jquery-1.8.3.min.js"
	type="text/javascript"></script>
<script src="${ctxStatic}/jquery-jbox/2.3/jquery.jBox-2.3.min.js"
	type="text/javascript"></script>
<script src="${ctxStatic}/common/jeesite.js" type="text/javascript"></script>
<script src="${ctxStatic}/messageBox/messageBox.js"
	type="text/javascript"></script>
<script src="${ctxStatic}/mobile/frame_js/mui.min.js"></script>
<style type="text/css">
.main {
	margin: 10px 10px 0px 15px;
}

.list_title {
	width: 100%;
	height: 30px;
	border-bottom: 1px solid #d4dde4;
}

.list_title span {
	line-height: 28px;
	font-size: 1.4rem;
}

.list_title b {
	line-height: 30px;
	font-size: 1.4rem;
	line-height: 28px;
	color: #000000;
}

.list_title a {
	text-decoration: underline;
	color: #666666;
}

.fenge {
	width: 100%;
	height: 15px;
	background-color: #f6f6f6;
}

.mui-input-row label {
	font-size: 16px;
	width: 29%;
}

.mui-btn-primary {
	border: 1px solid #12b5f7;
	background-color: #12b5f7;
	width: 20%;
}

.mui-input-row input {
	width: 75%;
}

.form-horizontal {
	background: #fff;
	margin: 0px;
}

.list_title:last-child {
	border-bottom: none;
}

#content1 {
	word-wrap: break-word;
	padding-right: 15px;
}
.mui-input-row label~input, .mui-input-row label~select, .mui-input-row label~textarea {
	width: 70%;
}
.mui-input-row > a {
	display: inline-block;
    padding: 11px 0;
    line-height: 1.1;
}
</style>

<script type="text/javascript">
	$(document).ready(
			function() {
				$("#inputForm")
						.validate(
								{
									submitHandler : function(form) {
										loading('正在提交，请稍等...');
										form.submit();
									},
									errorContainer : "#messageBox",
									errorPlacement : function(error, element) {
										$("#messageBox").text("输入有误，请先更正。");
										if (element.is(":checkbox")
												|| element.is(":radio")
												|| element.parent().is(
														".input-append")) {
											error.appendTo(element.parent()
													.parent());
										} else {
											error.insertAfter(element);
										}
									}
								});
			});
	//返回收藏列表
	function backSC() {
		window.location.href = "${mctx}/user/userFavorite/";

	}
	function goBack() {
		$("#searchForm").submit();

	}
	function back() {
		var strUrl = document.referrer;
		var arrObj = strUrl.split("//");
		var start = arrObj[1].indexOf("/");
		var newurl = arrObj[1].substring(start);

		if (newurl == "/oa/a/m/oa/oaNotify/allList") {
			window.location.href = '${mctx}/oa/oaNotify/allList';
		} else if (newurl == "/oa/a/m/oa/oaNotify/myNoticeList") {
			window.location.href = '${mctx}/oa/oaNotify/myNoticeList';
		} else if (newurl == "/oa/a/m/user/userFavorite/") {
			window.location.href = '${mctx}/user/userFavorite/';
		}

	}
	
	function del(url) {
		mui.confirm('确定删除该通知？', '系统提示', [ '是', '否' ], function(e) {
			if (e.index == 0) {
				location.href = url;
			}
		})
	}
</script>

</head>

<body>
	<header class="mui-bar mui-bar-nav">
		<c:choose>
			<c:when test="${from == 'sc'}">
				<a class="mui-icon mui-icon-left-nav mui-pull-left" onclick="backSC();"></a>
			</c:when>
			<c:when test="${oaNotify.isMess}">
				<a class="mui-icon mui-icon-left-nav mui-pull-left" onclick="goBack();"></a>
			</c:when>
			<c:otherwise>
				<a class=" mui-icon mui-icon-left-nav mui-pull-left" onclick="back();"></a>${my}
				<c:if test="${oaNotify.status ne '1'}">
					<a class="mui-icon mui-icon-trash mui-pull-right" onclick="del('${ctx }/m/oa/oaNotify/delete?oaNotify.id=${oaNotify.id}')"></a>
				</c:if>		
			</c:otherwise>
		</c:choose>
		<h1 class="mui-title">${oaNotify.status ne '1'?'修改':'查看'}${oaNotify.isMess ? '消息':'通知'}</h1>
	</header>
	<div class="mui-content">
		<form:form id="inputForm" modelAttribute="oaNotify" action="${mctx}/oa/oaNotify/save" method="post" class="form-horizontal">
			<form:hidden path="id" />
			<div class="mui-input-row">
				<label class="oaDocFormLabel">类型：</label>
				<c:if test="${oaNotify.status ne '1'}">
					<form:select path="type" id="type" style="font-size:16px;">
						<form:options items="${fns:getDictList('my_notify_type')}" itemLabel="label" itemValue="value" htmlEscape="false" />
					</form:select>
				</c:if>
				<c:if test="${oaNotify.status eq '1'}">
					<form:select path="type" disabled="true" id="type" style="font-size:16px;">
						<form:options items="${fns:getDictList('oa_notify_type')}" itemLabel="label" itemValue="value" htmlEscape="false" />
					</form:select>
				</c:if>
			</div>

			<div class="mui-input-row">
				<label class="oaDocFormLabel">标题：</label>
				<c:if test="${oaNotify.status ne '1'}">
					<form:input path="title" htmlEscape="false" maxlength="20" id="title" autocomplete="off" />
				</c:if>
				<c:if test="${oaNotify.status eq '1'}">
					<div style="width: 98%; overflow: auto; padding-left: 15px;">${oaNotify.title}</div>
				</c:if>
			</div>
			<div class="mui-input-row">
				<label class="oaDocFormLabel">内容：</label>
				<c:if test="${(fn:contains(oaNotify.content,'@@proNotify@@')==false)
				&&(fn:contains(oaNotify.content,'@@proNotify_layuiWindow@@')==false)
				&&(fn:contains(oaNotify.content,'@@DocRead@@')==false)
				&&(fn:contains(oaNotify.content,'@@planNotify@@')==false)&&oaNotify.status ne '1'}">
					<form:textarea path="content" htmlEscape="false" rows="10" class="" id="content" style="display:none;width: 100%; padding: 0 15px;" />
					<div id="content1"></div>
					<script type="text/javascript">
						$("#content1").html($("#content").val());
						$("#content1").css({
							"display" : "none",
							"word-wrap" : "break-word"
						});
						$("#content").css("display", "block");
						$("#content").val($("#content1").text());
					</script>
				</c:if>
				<c:if test="${oaNotify.status eq '1'&&(fn:contains(oaNotify.content,'@@proNotify@@')==false)
				&&(fn:contains(oaNotify.content,'@@proNotify_layuiWindow@@')==false)
				&&(fn:contains(oaNotify.content,'@@docReadNotify@@')==false)
				&&(fn:contains(oaNotify.content,'@@planNotify@@')==false)}">
					<form:textarea path="content" htmlEscape="false" rows="10" readonly="true" id="content" style="display:none;" />
					<div id="content1" style="overflow-y: auto; width: 100%; padding-left: 15px;"></div>
					<script type="text/javascript">
						$("#content1").html($("#content").val());
					</script>
				</c:if>
				<c:if test="${fn:contains(oaNotify.content,'@@docReadNotify@@')}">
					<a href="${fn:replace(oaNotify.content, '@@docReadNotify@@/oa/a/', '/oa/a/m/')}">点击查看文档借阅详情</a>
				</c:if>
				<c:if test="${fn:contains(oaNotify.content,'@@proNotify@@')}">
					<c:choose>
						<c:when test="${!fn:contains(oaNotify.content,'computerpurchase')
							&& !fn:contains(oaNotify.content,'assetsSerial')
							&& !fn:contains(oaNotify.content,'perishableSerial')
							&& !fn:contains(oaNotify.content,'applyFixedAssets')
							&& !fn:contains(oaNotify.content,'staffTurnover')}">
							<a href="${fn:replace(oaNotify.content, '@@proNotify@@/oa/a/', '/oa/a/m/')}">点击查看详情</a>
						</c:when>
						<c:otherwise>
							<a href="${ctx}/m/oa/oaNotify/errorView">点击查看详情</a>
						</c:otherwise>
					</c:choose>
				</c:if>
				<c:if test="${fn:contains(oaNotify.content,'@@planNotify@@')}">
					<a href="${fn:replace(oaNotify.content, '@@planNotify@@/oa/a/', '/oa/a/m/')}">点击查看任务详情</a>
				</c:if> 
				<c:if test="${fn:contains(oaNotify.content,'@@proNotify_layuiWindow@@')}">
					<a href="${fn:replace(oaNotify.content, '@@proNotify_layuiWindow@@/oa/a/', '/oa/a/m/')}">点击查看详情</a>
				</c:if>
				<div class="list_content_border"></div>
			</div>
			<c:if test="${not empty oaNotify.files}">	
				<div class="mui-input-row">
						<label class="oaDocFormLabel">附件：</label>
						<a href="${oaNotify.files}">下载附件</a>
				</div>
			</c:if>	
			<c:if test="${oaNotify.status ne '1'}">
				<div class="mui-input-row">
					<label class="oaDocFormLabel" style="font-size: 16px">状态：</label>
					<form:select path="status" id="status">
						<form:options items="${fns:getDictList('oa_notify_status')}" itemLabel="label" itemValue="value" htmlEscape="false" />
					</form:select>
				</div>
				<div class="mui-input-row">
					<label class="oaDocFormLabel">接收人：</label>
					<sys:treeselect id="oaNotifyRecord" name="oaNotifyRecordIds"
						value="${oaNotify.oaNotifyRecordIds}"
						labelName="oaNotifyRecordNames"
						labelValue="${oaNotify.oaNotifyRecordNames}" title="接收人"
						url="/sys/office/treeData?type=3" cssClass="required"
						notAllowSelectParent="true" notAllowSelectRoot="true"
						checked="true" allowClear="true" />
				</div>
			</c:if>
			<div class="fenge"></div>
			<script type="text/javascript">
				/*表单验证*/
				function doSubmit() {

					if ($("#title").val() != null && $("#title").val() != "") {

						if ($("#content").val() != null
								&& $("#content").val() != "") {
							if ($("#type").val() != null
									&& $("#type").val() != "") {
								$("#inputForm").submit();
								if ($("#oaNotifyRecordId").val() != null
										&& $("#oaNotifyRecordId").val() != "") {
									$("#inputForm").submit();
								} else {
									mui.init().alert("接收人不能为空", "提示", [ '确定' ],
											null, false);
								}

							} else {
								mui.init().alert("类型不能为空", "提示", [ '确定' ],
										null, false);
							}

						} else {
							mui.init().alert("内容不能为空", "提示", [ '确定' ], null,
									false);
						}
					} else {
						mui.init().alert("标题不能为空", "提示", [ '确定' ], null, false);
					}
				}
			</script>
			<ul class="mui-table-view">
				<c:if test="${oaNotify.status eq '1'}">
					<c:if test="${!oaNotify.self}">
						<li class="mui-table-view-cell">
							<span>发布人：</span> <span>${oaNotify.createBy.name}</span>
						</li>
						<li class="mui-table-view-cell">
							<span>发布人部门：</span> <span>${oaNotify.createBy.office.name}</span>
						</li>
						<li class="mui-table-view-cell">
							<span>发布时间：</span> <span><fmt:formatDate pattern="yyyy-MM-dd" value="${oaNotify.createDate}" /></span>
						</li>
					</c:if>
				</c:if>
			</ul>
			<div class="mui-button-row">
				<c:if test="${oaNotify.status ne '1'}">
					<button type="button" class="mui-btn mui-btn-primary" onclick="doSubmit()" style="width: 20%">保存</button>
				</c:if>
			</div>
			<script src="${ctxStatic}/mobile/frame_js/mui.min.js"></script>
			<script type="text/javascript">
				mui.init()
			</script>
		</form:form>
	</div>
	<form:form id="searchForm" modelAttribute="oaNotify" action="${ctx}/m/oa/oaNotify/message" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${pageSize}"/>
		<input id="type" name="type" type="hidden" value="${oaNotify.type}"/>
	</form:form>
</body>
</html>