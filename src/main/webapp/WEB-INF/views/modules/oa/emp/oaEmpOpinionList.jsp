<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用户意见管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
		function resetForm(){
			resetSelection("type","oa_emp_opinion_type");
			resetSelection("istreated","oa_emp_opinion_isTreated");
        }
		function openDialogTreat(title,url,width,height,target){
			top.layer.open({
			    type: 2,  
			    area: [width, height],
			    title: title,
		        maxmin: true, //开启最大化最小化按钮
			    content: url ,
			    btn: ['回复意见', '关闭'],
			    yes: function(index, layero){
			    	 var body = top.layer.getChildFrame('body', index);
			         var iframeWin = layero.find('iframe')[0]; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
			         var inputForm = body.find('#inputForm');
			         var top_iframe;
			         if(target){
			        	 top_iframe = target;//如果指定了iframe，则在改frame中跳转
			         }else{
			        	 top_iframe = top.getActiveTab().attr("name");//获取当前active的tab的iframe 
			         }
			         inputForm.attr("target",top_iframe);//表单提交成功后，从服务器返回的url在当前tab中展示
			         
			        if(iframeWin.contentWindow.doSubmit() ){
			        	// top.layer.close(index);//关闭对话框。
			        	  setTimeout(function(){top.layer.close(index)}, 100);//延时0.1秒，对应360 7.1版本bug
			         }
					
				  },
				  cancel: function(index){ 
			       }
			}); 	
			
		}
		function resetSelection(id,typex){
			$("#"+id).val("");
			$("#s2id_"+id).children("a").children("span.select2-chosen").html("全部");
			$("#"+id).empty();
			$("#"+id).append("<option value=\"\" selected=\"selected\">全部</option>");
			$.ajax({
				type: "POST",
				url: "${ctx}/sys/dict/getDictList",
				data: {type:typex},
				dataType: 'json',
				success: function(data){
					for(var i=0;i<data.length;i++)  
					{  
						$("#"+id).append("<option value=\""+data[i].value+"\">"+data[i].label+"</option>");
					}
				}
			});
		}
	</script>
	<style>
	tbody tr:hover th,tbody tr:hover td {
		background: #EEF0F2;
	}
	
	label .btn-group>.dropdown-toggle.bs-placeholder{
		background: #fff;
    	border: 1px solid #ddd;
	}
	</style>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<div class="ibox-title">
				<h5>用户意见列表 </h5>
				<%--<div class="ibox-tools">
					<a class="collapse-link">
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
					</a>
				</div>--%>
			</div>
    
		    <div class="ibox-content">
			<sys:message content="${message}"/>
			
			<!-- 查询条件 -->
				<div class="row">
					<div class="col-sm-12">
						<form:form id="searchForm" modelAttribute="oaEmpOpinion" action="${ctx}/oa/emp/oaEmpOpinion/" method="post"  class="form-inline">
							<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
							<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
							<table:sortColumn id="orderBy" name="orderBy" value="${page.orderBy}" callback="sortOrRefresh();"/><!-- 支持排序 -->
							<div class="form-group">
							<label>意见标题：<form:input path="title" htmlEscape="false" maxlength="64" class="form-control"/></label>
							<label>意见类别：<form:select path="type" class="selectpicker " data-style="inverse" id="type" data-live-search="true">
										<form:option value="" label="全部"/>
										<form:options items="${fns:getDictList('oa_emp_opinion_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
									</form:select></label>					
							<label>是否已处理：<form:select path="istreated" class="selectpicker" data-style="inverse" id="istreated" data-live-search="true">
										<form:option value="" label="全部"/>
										<form:options items="${fns:getDictList('oa_emp_opinion_isTreated')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
									</form:select></label>		
							</div>
						</form:form>
						<br/>
					</div>
				</div>
	
		<!-- 工具栏 -->
				<div class="row">
					<div class="col-sm-12">
						<div class="pull-left">
							<%-- <shiro:hasPermission name="oa:emp:oaEmpOpinion:add"> --%>
								<%-- <table:addRow url="${ctx}/oa/emp/oaEmpOpinion/form" title="用户意见" ></table:addRow> --%><!-- 增加按钮 -->
							<%-- </shiro:hasPermission> --%>
							<%-- <shiro:hasPermission name="oa:emp:oaEmpOpinion:edit"> --%>
							    <%-- <table:editRow url="${ctx}/oa/emp/oaEmpOpinion/form" id="contentTable"  title="用户意见"></table:editRow> --%><!-- 编辑按钮 -->
							<%-- </shiro:hasPermission> --%>
							<%-- <shiro:hasPermission name="oa:emp:oaEmpOpinion:edit"> --%>
								<%-- <table:delRow url="${ctx}/oa/emp/oaEmpOpinion/deleteAll" id="contentTable"></table:delRow> --%><!-- 删除按钮 -->
							<%-- </shiro:hasPermission> --%>
					      <!--  <button class="btn btn-white btn-sm " data-toggle="tooltip" data-placement="left" onclick="sortOrRefresh()" title="刷新"><i class="glyphicon glyphicon-repeat"></i> 刷新</button> -->
						
							</div>
						<div class="pull-right">
							<button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="search()" ><i class="fa fa-search"></i> 查询</button>
							<button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="reset()" ><i class="fa fa-refresh"></i> 重置</button>
						</div>
					</div>
				</div>
				<table id="contentTable" class="table table-striped table-bordered  table-hover table-condensed  dataTables-example dataTable no-footer">
					<thead>
						<tr><th> <input type="checkbox" class="i-checks"></th>
							<th>标题</th>
							<th>类别</th>
							<th style="min-width: 100px">意见提交者</th>
							<th style="min-width: 100px">是否已处理</th>
							<th style="min-width: 100px">提交日期</th>
							<th style="min-width: 100px">回复日期</th>
							<shiro:hasPermission name="oa:emp:oaEmpOpinion:treate"><th style="min-width: 100px">操作</th></shiro:hasPermission>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${page.list}" var="oaEmpOpinion">
						<tr>
						<td> <input type="checkbox" id="${oaEmpOpinion.id}" class="i-checks"></td>
							<td>
								${oaEmpOpinion.title}
							</td>
							<td>
								${fns:getDictLabel(oaEmpOpinion.type, 'oa_emp_opinion_type', '')}
							</td>
							<td style="min-width: 100px">
								${oaEmpOpinion.createBy.name}
							</td>
							<td style="min-width: 100px">
								${fns:getDictLabel(oaEmpOpinion.istreated, 'oa_emp_opinion_isTreated', '')}
							</td>
							<td style="min-width: 100px">
							
							<fmt:formatDate value="${oaEmpOpinion.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
						</td>
						<td style="min-width: 100px">
						<c:if test="${fns:getDictLabel(oaEmpOpinion.istreated, 'oa_emp_opinion_isTreated', '')=='已处理'}">
						 <fmt:formatDate value="${oaEmpOpinion.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/></c:if>
					</td>
							<shiro:hasPermission name="oa:emp:oaEmpOpinion:treate"><td style="min-width: 100px">
							<c:if test="${fns:getDictLabel(oaEmpOpinion.istreated, 'oa_emp_opinion_isTreated', '')=='未处理'}">
							<a href="#" onclick="openDialogTreat('处理用户意见', '${ctx}/oa/emp/oaEmpOpinion/treateForm?id=${oaEmpOpinion.id}','800px', '360px')" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i> 处理</a>    						
							<a href="#" onclick="openDialogView('查看意见详情', '${ctx}/oa/emp/oaEmpOpinion/treateForm?id=${oaEmpOpinion.id}','800px', '360px')" class="btn btn-info btn-xs" ><i class="fa fa-search-plus"></i> 详情</a>
							</c:if>
							<c:if test="${fns:getDictLabel(oaEmpOpinion.istreated, 'oa_emp_opinion_isTreated', '')=='已处理'}">
			    				<%-- <a href='${ctx}/oa/emp/oaEmpOpinion/delete?id=${oaEmpOpinion.id}' onclick="return confirmx('确认要删除该意见吗？', this.href)" class="btn btn-danger btn-xs"><i class="fa fa-trash">&nbsp;删除</i></a> --%>
			    				<a href="#" onclick="openDialogView('查看意见详情', '${ctx}/oa/emp/oaEmpOpinion/treateForm?id=${oaEmpOpinion.id}','800px', '360px')" class="btn btn-info btn-xs" ><i class="fa fa-search-plus"></i> 详情</a>
			    				</c:if>
							</td></shiro:hasPermission>
						</tr>
					</c:forEach>
					</tbody>
				</table>
	<!-- 分页代码 -->
				<table:page page="${page}"></table:page>
				<br/>
				<br/>
			</div>
		</div>
	</div>
</body>
</html>