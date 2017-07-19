<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>签报起草管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
		$(document).ready(function() {
			$("#allChk").click(function() { 
				$("input[name='subChk']").prop("checked",this.checked); 
				}); 
				// 单选 
				var subChk = $("input[name='subChk']") 
				subChk.click(function() { 
				$("#allChk").prop("checked", subChk.length == subChk.filter(":checked").length ? true:false); 
				}); 
				/* 批量收藏 */ 
				$("#store").click(function() { 
				// 判断是否至少选择一项 
				var checkedNum = $("input[name='subChk']:checked").length; 
				if(checkedNum == 0) { 
					top.layer.msg('请勾选至少一条数据后再进行收藏');
					$("#messageBox").show();
				return; 
				} 
				// 批量选择 
				confirmx("确定要收藏所选签报？",function() { 
				var checkedList1 = new Array(); 
				$("input[name='subChk']:checked").each(function() { 
				checkedList1.push($(this).val()); 
				}); 
				$.ajax({ 
				type: "POST", 
				url: "${ctx}/oa/sign/oaSign/store", 
				data: {'delitem':checkedList1.toString()}, 
				 success: function(result) { 
					 top.$.jBox.tip.mess = 2;
						top.$.jBox.tip("收藏成功！", "success", {
							persistent : true,
							opacity : 0
						});
						$("#messageBox").show();
				$("[name ='subChk']:checkbox").attr("checked", false); 
				window.location.reload(); 
				} 
				}); 
				} );
				});
				
				$("#del_model").click(function() { 
					// 判断是否至少选择一项 
					var checkedNum = $("input[name='subChk']:checked").length; 
					if(checkedNum == 0) { 
						top.layer.msg('请勾选至少一条数据后再进行删除');
						$("#messageBox").show();
					return; 
					} 
					// 批量选择 
					confirmx("确定要删除选中签报？",function() { 
					var checkedList1 = new Array(); 
					$("input[name='subChk']:checked").each(function() { 
					checkedList1.push($(this).val()); 
					}); 
					$.ajax({ 
					type: "POST", 
					url: "${ctx}/oa/sign/oaSign/delete", 
					data: {'delitem':checkedList1.toString()}, 
					 success: function(result) { 
						 top.layer.msg("删除成功！");
						 /* top.$.jBox.tip.mess = 2;
							top.$.jBox.tip("删除成功！", "success", {
								persistent : true,
								opacity : 0
							}); */
							$("#messageBox").show();
					$("[name ='subChk']:checkbox").attr("checked", false); 
					window.location.reload(); 
					} 
					}); 
					} );
					});
				
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
		



		function clearForm(){
			$("#signTitile").val("");
			$("#select").val("");
		}


	</script>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
<div class="ibox">
    <div class="ibox-title">
		<h5>公司签报列表 </h5>
		<div class="ibox-tools">
		</div>
	</div>
    
   <div class="ibox-content">
   	<sys:message content="${message}"/>
   	<div class="row">
	<div class="col-sm-12">
	
	<form:form id="searchForm" modelAttribute="oaSign"
		action="${ctx}/oa/sign/oaSign/" method="post" class="form-inline">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
		<div class="form-group">
			<span>标题：</span><form:input path="signTitile" htmlEscape="false" maxlength="255" class="form-control m-b"/>
			<span>编号：</span> <form:select path="signNumber" data-style="btn-inverse" data-live-search="true" 
					class="selectpicker" id="select">
					<form:option value="" label="全部" />
					<form:options items="${fns:getDictList('sign_number')}"
						itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select>
		</div>	
	<br/>
	</div>
	</div>
	<br/>
	<div class="row">
	<div class="col-sm-12">
		<div class="pull-left">
			<a class="btn btn-white btn-sm" href="${ctx}/oa/sign/oaSign/form"><i class="fa fa-plus"></i>&nbsp;起草签报</a>
	<!-- 		 <input id="store"	class="btn btn-white btn-sm btn-sm" type="button" value="收藏" /> 
			 <input id="del_model"	class="btn btn-white btn-sm btn-xs" type="button" value="删除" />  -->
<!-- 			 <a href="javascript:void(0);" class="btn btn-white btn-sm"  id='del_model' ><i class="fa fa-trash-o"></i>删除</a> -->
			
			   <a href="javascript:void(0);" class="btn btn-white btn-sm" id='store' ><i class="fa fa-star"></i>&nbsp;收藏</a>
			 
											<!-- 			<a href="javascript:void(0);" id="del_model"
										class="btn btn-danger btn-xs"><i class="fa fa-trash"></i>删除</a> -->
 		<%-- 	<shiro:hasPermission name="oa:oaArchives:edit"><table:delRow url="${ctx}/oa/sign/oaSign/delete" id="del_model"></table:delRow></shiro:hasPermission>
			<shiro:hasPermission name="oa:oaArchives:edit"><table:shoucang></table:shoucang></shiro:hasPermission>  --%>
			
			
			</div>
		<div class="pull-right">
			<button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="search()" ><i class="fa fa-search"></i>&nbsp;查 询</button>
			<button  class="btn btn-primary btn-rounded btn-outline btn-sm" onclick="clearForm();"><i class="fa fa-trash"></i>&nbsp;清 空</button>
		</div>
	</div>
	</form:form>
	</div>
<%-- 	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/oa/sign/oaSign/">签报列表</a></li>
		<shiro:hasPermission name="oa:sign:oaSign:edit">
			<li><a href="${ctx}/oa/sign/oaSign/form">签报起草</a></li>
		</shiro:hasPermission>
	</ul>  --%>
<%-- 	<form:form id="searchForm" modelAttribute="oaSign"
		action="${ctx}/oa/sign/oaSign/" method="post"
		class="form-inline">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
			<div class="pull-right">
			<label>标题：</label> <form:input path="signTitile"
					htmlEscape="false" maxlength="255" class="form-control" />
			<label>编号：</label> <form:select path="signNumber"
					class="form-control required" id="select">
					<form:option value="" label="" />
					<form:options items="${fns:getDictList('sign_number')}"
						itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select>
			<input id="btnSubmit" class="btn btn-primary btn-rounded btn-outline btn-sm"
				type="submit" value="查询" /> <input id="store"
				class="btn btn-primary btn-rounded btn-outline btn-sm" type="button" value="收藏" /> 
				
														<a href="javascript:void(0);" id="del_model"
										class="btn btn-danger btn-xs"><i class="fa fa-trash"></i>删除</a>
			<!-- 	<input
				id="del_model" class="btn btn-primary btn-rounded btn-outline btn-sm" type="button" value="删除" /> -->
			
		</div>
	</form:form>
	<sys:message content="${message}" /> --%>
	<div id="contentdiv" style="width: 100%; overflow: auto;margin-bottom: 6px;">
	<table id="contentTable"
		class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable" style="white-space: nowrap;">
		<thead>
			<tr>
				<th><input type="checkbox" id="allChk" /></th>
				<th>标题</th>
				<th>密级</th>
				<th>编号</th>
				<th>创建者</th>
				<th>创建时间</th>
				<th>状态</th>
				<th>完成时间</th>
				<shiro:hasPermission name="oa:sign:oaSign:edit">
					<th>操作</th>
				</shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list}" var="oaSign">
				<tr>
					<td><input type="checkbox" name="subChk" value="${oaSign.id}" />

					</td>
					<td>
						<%-- <a href="${ctx}/oa/sign/oaSign/form?id=${oaSign.id}"> </a>--%>
						${oaSign.signTitile}
					</td>
					<td><c:choose>
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
					</c:choose></td>
					<td><c:choose>
							<c:when test="${oaSign.signNumber == 0}">
							【楚财签】${oaSign.code }号
							</c:when>
							<c:when test="${oaSign.signNumber == 1 }">
							【楚人签】${oaSign.code }号
							</c:when>
							<c:when test="${oaSign.signNumber == 2 }">
							【楚研签】${oaSign.code }号
							</c:when>
							<c:when test="${oaSign.signNumber == 3 }">
							【楚技签】${oaSign.code }号
							</c:when>
							<c:when test="${oaSign.signNumber == 4 }">
							【楚市签】${oaSign.code }号
							</c:when>
							<c:otherwise>

							</c:otherwise>
						</c:choose></td>
					<td>${oaSign.createBy.name}</td>
					<td><fmt:formatDate value="${oaSign.createDate}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td><c:choose>
							<c:when test="${oaSign.signState == 0}">
								草稿
							</c:when>
							<c:when test="${oaSign.signState == 1 }">
							审核中
							</c:when>
							<c:when test="${oaSign.signState == 2 }">
							已办结
							</c:when>
							<c:when test="${oaSign.signState == 4 }">
							已作废
							</c:when>
							<c:otherwise>
							  审核中
							</c:otherwise>
						</c:choose></td>
					<td><fmt:formatDate value="${oaSign.completeDate}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<shiro:hasPermission name="oa:sign:oaSign:edit">
						<td><c:choose>
								<c:when test="${oaSign.signState == 0 }">
									<a href="${ctx}/oa/sign/oaSign/form?id=${oaSign.id}"class="btn btn-success btn-xs"><i class="fa fa-edit"></i> 修改</a>
									<a href="${ctx}/oa/sign/oaSign/delete?delitem=${oaSign.id}" class="btn btn-success btn-xs"  onclick="return confirmx('确认要删除该签报数据吗？', this.href)"><i class=" fa fa-trash"></i> 删除</a>
								</c:when>
								<c:when test="${oaSign.signState == 2 }">
									<a href="${ctx}/oa/sign/oaSign/completelist?id=${oaSign.id}" class="btn btn-info btn-xs"> <i class="fa fa-search-plus"></i> 查看</a>
								</c:when>
								<c:when test="${oaSign.signState == 3 }">
									<a href="${ctx}/oa/sign/oaSign/form?id=${oaSign.id}" class="btn btn-success btn-xs"><i class="fa fa-edit"></i> 修改</a>
								<%-- 	<a href="${ctx}/oa/sign/oaSign/delete?id=${oaSign.id}"class="btn btn-success btn-xs"><i class=" fa fa-trash"></i>删除</a> --%>
								</c:when>
								<c:otherwise>
										<a href="${ctx}/oa/sign/oaSign/completelist?id=${oaSign.id}" class="btn btn-info btn-xs"> <i class="fa fa-search-plus"></i> 查看</a>

								</c:otherwise>
							</c:choose></td>
					</shiro:hasPermission>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	<table:page page="${page}"></table:page>
	</div>
	</div>
</body>
</html>