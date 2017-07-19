<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>公文管理管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
	$(document).ready(function() { 
		// 全选 
		$("#allChk").click(function() { 
		$("input[name='subChk']").prop("checked",this.checked); 
		}); 
		// 单选 
		var subChk = $("input[name='subChk']") 
		subChk.click(function() { 
		$("#allChk").prop("checked", subChk.length == subChk.filter(":checked").length ? true:false); 
		}); 
		/* 批量删除 */ 
		$("#del_model").click(function() { 
			// 判断是否至少选择一项 
			var checkedNum = $("input[name='subChk']:checked").length; 
			if(checkedNum == 0) { 
			alert("请选择至少一项！"); 
			return; 
			} 
			// 批量选择 
			confirmx("确定要删除所选项目？",function() { 
				var checkedList = new Array(); 
				$("input[name='subChk']:checked").each(function() { 
				checkedList.push($(this).val()); 
				}); 
				$.ajax({ 
					type: "POST", 
					url: "${ctx}/oa/oaArchives/deletemore", 
					data: {'delitems':checkedList.toString()}, 
		   	    	success: function(result) { 
						$("[name ='subChk']:checkbox").attr("checked", false); 
						window.location.reload(); 
					} 
				}); 
			});
		}); 
		
		
		/*编辑*/
		$("#edit_model").click(function(){
			var checkLength = $("input[name='subChk']:checked").length;
			if(checkLength>1 || checkLength==0){
				alert('请选择一条数据进行编辑!!!');
				return;
			}
			var che=[];
			$("input[name='subChk']:checked").each(function(){
				che.push($(this).val());
			});			
			window.location="${ctx}/oa/oaArchives/update?id="+che;				
		});
	}); 
	
	$(document).ready(function() { 
		// 全选 
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
		alert("请选择至少一项！"); 
		return; 
		} 
		// 批量选择 
		confirmx("确定要收藏所选项目？",function() { 
		var checkedList1 = new Array(); 
		$("input[name='subChk']:checked").each(function() { 
		checkedList1.push($(this).val()); 
		}); 
		$.ajax({ 
		type: "POST", 
		url: "${ctx}/oa/oaArchives/store", 
		data: {'delitem':checkedList1.toString()}, 
		 success: function(result) { 
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
	</script>
</head>
<body>
	<%--<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/oa/oaArchives/">公文管理列表</a></li>
		 <shiro:hasPermission name="oa:oaArchives:edit"><li><a href="${ctx}/oa/oaArchives/form">公文管理添加</a></li></shiro:hasPermission> 
	</ul>--%>
	<form:form id="searchForm" modelAttribute="oaArchives" action="${ctx}/oa/oaArchives/list" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			
			
		
<%-- 			<li>
				<form:input path="code" htmlEscape="false" maxlength="64" class="input-medium" />
			</li>
			<li>
				<input name="beginExeDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${oaArchives.beginExeDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endExeDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${oaArchives.endExeDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>  --%>
				<li class="btns">
					<input id="btnedit" class="btn btn-primary" onclick="window.location.href='${ctx}/oa/oaArchives/form'"type="button" value="发文起草"/>
				</li>
<%-- 			<shiro:hasPermission name="oa:oaArchives:edit"><li class="btns"><input id="edit_model" class="btn btn-primary" type="button" value="编辑"/></li></shiro:hasPermission> --%>
				<shiro:hasPermission name="oa:oaArchives:edit">
					<li class="btns">
						<input id="del_model" class="btn btn-primary" type="button" value="删除" />
					</li>
				</shiro:hasPermission>
				<shiro:hasPermission name="oa:oaArchives:edit">
					<li class="btns">
						<input id="store" class="btn btn-primary" type="button" value="收藏" />
					</li>
				</shiro:hasPermission>	
				<li><form:input path="title" htmlEscape="false" maxlength="255" class="input-medium" placeholder="输入标题查找"/>
				<li class="btns"><input id="btnsubmit" class="btn btn-primary" type="submit" value="查询"/></li>		
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th><input type="checkbox" id="allChk"/>标题</th>
				<th>发文字号</th>
				<th>主题词</th>
				<th>状态</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<td>操作</td>
				<%-- <shiro:hasPermission name="oa:oaArchives:edit"><th>操作</th></shiro:hasPermission> --%>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="oaArchives">
			<tr>
				<td><input type="checkbox" name="subChk" value="${oaArchives.id}"/><a href="${ctx}/oa/oaArchives/form?id=${oaArchives.id}">${oaArchives.title}</a></td>
				<td>
					${oaArchives.code}
				</td>
				<td>
					${oaArchives.keyword}
				</td>
				<td>
					${fns:getDictLabel(oaArchives.status, 'oa_status', '')}
				</td>
				<td>
					<fmt:formatDate value="${oaArchives.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${oaArchives.remarks}
				</td>
				<td>
					<c:if test="${oaArchives.isdraft eq 0}">
							<a href="${ctx}/oa/oaArchives/update?isdraft=1&&id=${oaArchives.id}">编辑</a>
					</c:if>
					<c:if test="${oaArchives.isdraft eq 1}">
							<a href="${ctx}/oa/oaArchives/update?isdraft=1&&id=${oaArchives.id}">该发文已提交无法修改</a>
					</c:if>
				</td>
				<%-- <shiro:hasPermission name="oa:oaArchives:edit"><td>
    				<a href="${ctx}/oa/oaArchives/form?id=${oaArchives.id}">修改</a>
					<a href="${ctx}/oa/oaArchives/delete?id=${oaArchives.id}" onclick="return confirmx('确认要删除该公文管理吗？', this.href)">删除</a>
				</td></shiro:hasPermission> --%>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>