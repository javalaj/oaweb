<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>我的通讯录</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			/* $("#btnExport").click(function(){
				top.$.jBox.confirm("确认要导出通讯录吗？","系统提示",function(v,h,f){
					if(v=="ok"){
						$("#searchForm").attr("action","${ctx}/oa/adress/export1");
						$("#searchForm").submit();
					}
				},{buttonsFocus:1});
				top.$('.jbox-body .jbox-icon').css('top','55px');
			});
			$("#btnImport").click(function(){
				$.jBox($("#importBox").html(), {title:"导入数据", buttons:{"关闭":true}, 
					bottomText:"导入文件不能超过5M，仅允许导入“xls”或“xlsx”格式文件！"});
			}); */
		});
		 function page(n,s){
			
			$("#pageNo").val(n);
		    $("#pageSize").val(s);
			$("#searchForm").attr("action","${ctx}/oa/adress/ShareContactsList");
			$("#searchForm").submit();
	    	return false;
	    } 
	</script>
</head>
<body  class="gray-bg">
<%-- 	<div id="importBox" class="hide">
		<form id="importForm" action="${ctx}/sys/user/import" method="post" enctype="multipart/form-data"
			class="form-search" style="padding-left:20px;text-align:center;" onsubmit="loading('正在导入，请稍等...');"><br/>
			<input id="uploadFile" name="file" type="file" style="width:330px"/><br/><br/>　　
			<input id="btnImportSubmit" class="btn btn-primary" type="submit" value=" 导    入   "/>
			<a href="${ctx}/sys/user/import/template">下载模板</a>
		</form>
	</div> --%>
<%-- 	<ul class="nav nav-tabs">
		<li ><a href="${ctx}/oa/adress/contacts">个人通讯录</a></li>
		<li class="active" ><a>共享通讯录</a></li>
		<shiro:hasPermission name="sys:user:edit"><li><a href="${ctx}/sys/user/form">新建通讯录</a></li></shiro:hasPermission>
	</ul> --%>
<div class="wrapper wrapper-content">
<div class="ibox">
<div class="ibox-title">
		<h5>共享通讯录列表 </h5>
		<div class="ibox-tools">
			<!-- <a class="collapse-link">
				<i class="fa fa-chevron-up"></i>
			</a>
			<a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#">
				<i class="fa fa-wrench"></i>
			</a>
			<ul class="dropdown-menu dropdown-user">
				<li><a href="#">选项1</a>
				</li>
				<li><a href="#">选项2</a>
				</li>
			</ul>
			<a class="close-link">
				<i class="fa fa-times"></i>
			</a> -->
		</div>
	</div>
    
    <div class="ibox-content">
	<sys:message content="${message}"/>	
	<!-- 工具栏 -->
	<div class="row">
	<div class="col-sm-12">
		<div class="pull-left">
	   <a class="btn btn-white btn-sm " href="${ctx}/oa/adress/contacts">个人通讯录</a>	   
	<table:exportExcel url="${ctx}/oa/adress/export1"></table:exportExcel>
	<button class="btn btn-white btn-sm " data-toggle="tooltip" data-placement="left" onclick="window.location.href='${ctx}/oa/adress/ShareContactsList'" title="刷新"><i class="glyphicon glyphicon-repeat"></i> 刷新</button>
			</div>
<form:form id="searchForm" modelAttribute="oaSign"
		action="${ctx}/oa/adress/ShareContactsList" method="post" class="form-inline">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
			</form:form>
	</div>
	</div>
	<table id="contentTable" class="table table-striped table-bordered  table-hover table-condensed  dataTables-example dataTable no-footer">
		<thead><tr><th>姓名</th><th>部门</th><th>岗位</th><th >手机号</th><th>办公电话</th><th>QQ号</th><th>电子邮箱</th><th>办公地点</th><th>操作</th> <%-- <shiro:hasPermission name="sys:user:edit"><th>操作</th></shiro:hasPermission></tr> --%></thead>
		<tbody>
		<c:forEach items="${page.list}" var="cytspoaaddress">
			<tr>
			<td>${cytspoaaddress.name}</td>
			<td>${cytspoaaddress.company}
			</td>
				<td>${cytspoaaddress.position}</td>
				<td>${cytspoaaddress.iphone}</td>
				<td>${cytspoaaddress.oph}</td>
				<td>${cytspoaaddress.qq}</td>
				<td>${cytspoaaddress.email}</a></td>
				<td>${cytspoaaddress.ofaddress}</td> 
				<td><a href="${ctx}/oa/adress/offShare?id=${cytspoaaddress.id}" onclick="return confirmx('确认取消分享该联系人吗？', this.href)" class="btn btn-warning btn-xs">取消共享</a></td>
				<%-- <td><a href="${ctx}/sys/user/form?id=${user.id}">${user.loginName}</a></td> --%>			
				<%-- <shiro:hasPermission name="sys:user:edit"><td>
    				<a href="${ctx}/sys/user/form?id=${user.id}">修改</a>
					<a href="${ctx}/sys/user/delete?id=${user.id}" onclick="return confirmx('确认要删除该用户吗？', this.href)">删除</a>
				</td></shiro:hasPermission> --%>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<table:page page="${page}"></table:page>
	<br/>
	<br/>
	</div>
	</div>
</div>
</body>
</html>