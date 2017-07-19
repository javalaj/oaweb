<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>我的借支还款</title>
	<meta name="decorator" content="default"/>
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no" />
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/mobile/css/mui.min.css" />
	<script src="${ctxStatic}/mui-master/dist/js/mui.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("html").removeAttr("style");
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
		function resetForm(){
			resetSelection("repaymentType","OaLoanRepayment_repaymentType");
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
		function resetSelection(id){
			var src="${ctx}/act/task/trace/photo/${fns:getWorkflowVarValue('oa_loan_daily_approval','procDefId','')}/${oaLoanDailyApproval.procInsId}";
			var width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;  
			var height = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;  
			top.layer.open({
				  type: 2, 
				  area: ["100%","100%"],
			      title: "日常借支流程图",
		          maxmin: true, 
		          shadeClose: true,
				  content: src 
			});
		}
	</script>
	<style type="text/css">
		.mui-table-view-cell.mui-active{
			background-color: #ffffff;
		}
		.mui-pull-right{
			color:#666;
		}
	</style>
</head>
<body class="mui-ios mui-ios-9 mui-ios-9-1" style="background-color: #f7f7f7;">
 	<oam:header>
 		<a class="mui-icon mui-icon-left-nav mui-pull-left" onclick="location.href='${ctx}'"></a>
		<h1 class="mui-title">我的借支还款</h1>
		<a class="mui-icon mui-icon-plus mui-pull-right" onclick="location.href='${mctx}/oa/loan/oaLoanDailyApproval/form'"></a>
	</oam:header>
	<oam:message content="${message}"/>
	<oam:content cssStyle="background-color:#efeff4;">
		<oam:searchWidget cancelSelector="#cancelButton" paddingTop="44px">
			<oam:form id="searchForm" modelAttribute="oaLoanRepayment" action="${mctx}/oa/loan/oaLoanRepayment/" method="post">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<oam:listView>
					<oam:listViewCell inputName="repaymentType" title="销账类型" cellType="input">
						<form:select path="repaymentType">
							<form:option value="" label="全部"/>
							<form:options items="${fns:getDictList('OaLoanRepayment_repaymentType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
					</oam:listViewCell>
					<oam:listViewCell>
						<table style="width:100%">
							<tbody>
								<tr>
									<td style="width:100%;text-align: center">
										<button type="button" class="mui-btn mui-btn-primary" onclick="search()"><i class="fa fa-search"></i>查询</button>
										<button type="button" class="mui-btn mui-btn-primary" onclick="reset()"><i class="fa fa-refresh"></i>重置</button>
										<button type="button" class="mui-btn mui-btn-danger" id="cancelButton">取消搜索</button>
									</td>
								</tr>
							</tbody>
						</table>
					</oam:listViewCell>
				</oam:listView>
			</oam:form>	
		</oam:searchWidget>	
			<c:choose>
				<c:when test="${page.list.size()>0}">
					<c:forEach items="${page.list}" var="oaLoanRepayment" varStatus="status">
						<div class="mui-card">
							<div class="mui-card-header"style="text-align: left">
								<a class="mui-card-link" onclick="openDialogView('查看借支单信息', '${mctx}/oa/loan/oaLoanMain/form?id=${oaLoanRepayment.loanMain.id}','100%', '100%')">${oaLoanRepayment.loanMain.loanNo}</a>
							 </div>
							<div class="mui-card-content" >
								<oam:listView>
									<oam:listViewCell title="借支金额：" cellType="input">
										${oaLoanRepayment.loanMain.loanMoney}
									</oam:listViewCell>
									<oam:listViewCell title="还款类型：" cellType="input">
										${fns:getDictLabel(oaLoanRepayment.repaymentType, 'OaLoanRepayment_repaymentType', '')}
									</oam:listViewCell>
									<oam:listViewCell title="还款金额：" cellType="input">
										${oaLoanRepayment.repaymentMoney}
									</oam:listViewCell>
									<oam:listViewCell title="还款时间：" cellType="input">
										<fmt:formatDate value="${oaLoanRepayment.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
									</oam:listViewCell>
									<oam:listViewCell title="报销单号：" cellType="input">
										${oaLoanRepayment.billingNo}
									</oam:listViewCell>
								</oam:listView>								
							</div>
							<div class="mui-card-footer"><div style="text-align: right">经办人：${oaLoanRepayment.dealUser.name}</div></div>
						</div>
						<%-- <oam:listViewCell >
							<p>
								<i class="fa ${oaDoc.isPublic eq '0'?'fa-home':'fa-share-square-o'}" style="font-size:14px;color:rgb(26, 179, 148)"></i>
								<span style="color:#1ab394">
									${oaDoc.isPublic eq '0'?fns:concat(fns:concat('部门文档(',oaDoc.office.name),')'):'共享文档'}
								</span>
								<span class="mui-pull-right">
									<fmt:formatDate value="${oaDoc.createDate}" pattern="yyyy.MM.dd"/>
								</span>
							</p>
							<p><font color="#1a81d1">
								${fns:getDictLabel(oaDoc.docType, 'oaDoc_docType', '')}</font>
							</p>
							<p class="mui-ellipsis">${oaDoc.title}</p>
						</oam:listViewCell> --%>
					</c:forEach>				
				</c:when>
				<c:otherwise>
					<div class="mui-card">
						<div class="mui-card-header" >暂无还款记录</div>
					</div>
				</c:otherwise>
			</c:choose>
		<oam:page page="${page}" ></oam:page>	
	</oam:content>
</body>
</html>