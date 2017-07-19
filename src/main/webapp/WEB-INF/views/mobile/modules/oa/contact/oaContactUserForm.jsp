<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>新建联系人</title>
	<meta name="decorator" content="default"/>
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no" />
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/mobile/css/mui.min.css" />
	<script src="${ctxStatic}/mobile/js/mui.min.js"></script>
</head>
<body class="mui-ios mui-ios-9 mui-ios-9-1">
 	<header class="mui-bar mui-bar-nav" >
		<a class="mui-icon mui-icon-back mui-pull-left" href="${mctx}/oa/contact/oaContact/user/list" ></a>
		<h1 class="mui-title">新建联系人</h1>
	</header>
	<oam:content>
		<oam:form id="inputForm" modelAttribute="cyTspOaAddress" action="${mctx}/oa/contact/oaContact/user/save" method="post">
			<form:hidden path="id"/>
			<oam:listView>
				<oam:listViewCell inputName="name" title="姓名" requiredTip="*" cellType="input">
					<form:input path="name" htmlEscape="false" maxlength="64" placeholder="输入姓名" class="required "/>
				</oam:listViewCell>
				<oam:listViewCell inputName="company" title="公司" requiredTip="*" cellType="input">
					<form:input path="company" htmlEscape="false" maxlength="64" placeholder="输入公司" class="required "/>
				</oam:listViewCell>
				<oam:listViewCell inputName="position" title="岗位"  cellType="input">
					<form:input path="position" htmlEscape="false" maxlength="64" placeholder="输入岗位"/>
				</oam:listViewCell>
				<oam:listViewCell inputName="iphone" title="手机号" requiredTip="*" cellType="input">
					<form:input path="iphone" htmlEscape="false" maxlength="64" placeholder="输入手机号" class="required "/>
				</oam:listViewCell>
				<oam:listViewCell inputName="oph" title="办公电话"  cellType="input">
					<form:input path="oph" htmlEscape="false" maxlength="64" placeholder="输入办公电话"/>
				</oam:listViewCell>
				<oam:listViewCell inputName="qq" title="QQ" cellType="input">
					<form:input path="qq" htmlEscape="false" maxlength="64" placeholder="输入QQ"/>
				</oam:listViewCell>
				<oam:listViewCell inputName="email" title="电子邮箱" cellType="input">
					<form:input path="email" htmlEscape="false" maxlength="64" placeholder="输入电子邮箱"/>
				</oam:listViewCell>
				<oam:listViewCell inputName="ofaddress" title="联系地址" cellType="input">
					<form:input path="ofaddress" htmlEscape="false" maxlength="64" placeholder="输入联系地址"/>
				</oam:listViewCell>
				<oam:listViewCell inputName="groupId" title="分组" requiredTip="*" cellType="input" >
					<form:select path="groupId"  class="required ">
						<form:option value="" label="选择分组"/>
						<c:forEach items="${cyTspOaAddressGroups}" var="cyTspOaAddressGroup">
				        	<option value="${cyTspOaAddressGroup.groupId}">${cyTspOaAddressGroup.name}</option>
				        </c:forEach>
					</form:select>
				</oam:listViewCell>
				<oam:listViewCell>
					<button type="button" class="mui-btn mui-btn-primary " onclick="doSubmit()" style="width:90%">保存</button>&nbsp;&nbsp;
				</oam:listViewCell>
			</oam:listView>
		</oam:form>
	</oam:content>		
</body>
</html>