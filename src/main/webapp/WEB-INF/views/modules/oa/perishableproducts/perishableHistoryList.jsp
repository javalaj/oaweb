<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>易耗品历史管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript" src="${ctxStatic}/tableExport/libs/FileSaver/FileSaver.min.js"></script>
	<script type="text/javascript" src="${ctxStatic}/tableExport/tableExport.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#searchForm").validate({
			submitHandler: function(form){
				oaLoading('正在提交，请稍候...');
				form.submit();
			},
			errorContainer: "#messageBox",
			errorPlacement: function(error, element) {
				$("#messageBox").text("输入有误，请先更正。");
				if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
					error.appendTo(element.parent().parent());
				} else {
					error.insertAfter(element);
				}
			}
		});
		
		$("#btnPrint").click(function(){
			window.print();
		});
		
		$("#btnExport").click(function(){
			var idChecks=$("input[name='idCheck']");
			
			var tablee = document.createElement("table");
			
			var $tablee=$(tablee);
			$tablee.attr("id","exportTable2")
			$tablee.addClass("table table-striped table-bordered table-hover table-condensed dataTables-example dataTable");
			$tablee.append($("#threadHead").clone());
			
			var tbody = document.createElement("tbody");
			var $tbody=$(tbody);
			for ( var i = 0; i < idChecks.length; i+=1) {
				
				$tbody.append($(idChecks[i]).parent().parent().parent().clone());
				
			}
			$tablee.append($tbody);
			var tableee=$tablee[0];
			document.body.appendChild(tableee);
			
		 	var trArray = $("#exportTable2 tr");
	           
         	var td;
	            
            for (var i = 0; i < trArray.length; i++) {
                td = $(trArray[i]).find("td:eq(0)");
                $(td).remove();
            }
	            
            $("#exportTable2 thead tr th:first").remove();
			
			var timex = new Date().Format("yyyyMMddhhmmss");
	        var name = "用品统计" + timex;
			$("#exportTable2").tableExport({worksheetName: '用品统计',fileName: name,type:'excel', excelstyles:['border-bottom', 'border-top', 'border-left', 'border-right']});
			document.body.removeChild(tablee);
			
			
		});
		
	});

	</script>
	<style>     
	@media print {   
		.noprint {    
			display: none    
		}   
	}
	</style>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<div class="ibox-title">
				<h5>用品统计结果(共${list.size()}条)</h5>
			</div>
		</div>
    		<div class="ibox-content">
				<div class="row">
					<div class="col-sm-12">	
						<!-- 工具栏 -->
						<div class="row">
							<div class="col-sm-12">
								<div class="pull-left">
									<shiro:hasPermission name="perishableproducts:perishableProducts:edit">
										<input id="btnCancel" class="btn noprint" type="button" value="返 回" onclick="history.go(-1)"/>&nbsp;
										<input id="btnExport" class="btn btn-primary noprint" type="button" value="导出"/>&nbsp;
										<input id="btnPrint" class="btn btn-primary noprint" type="button" value="打印"/>&nbsp;&nbsp;&nbsp;
									</shiro:hasPermission>
								</div>
							</div>
						</div>	
					</div>
				</div>								
				<form:form id="searchForm" modelAttribute="perishableHistory" action="${ctx}/oa/fixedassets/perishableHistory/" method="post" class="breadcrumb form-search">
					<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
					<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
					<form:hidden path="perishableProducts.itemCategory"/>
					<form:hidden path="type"/>
					<input type="hidden" name="beginCreateDate" value="<fmt:formatDate value="${perishableHistory.beginCreateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"/>
					<input type="hidden" name="endCreateDate" value="<fmt:formatDate value="${perishableHistory.endCreateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"/>
				</form:form>
				<sys:message content="${message}"/>
				<table id="contentTable" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
					<thead>
						<tr style="border:1px solid #ddd;">
							<c:if test="${fn:contains(perishableHistoryViewCondition.statisticsWordType, 'createDate')}">
								<th width="20%">统计周期</th>
							</c:if>
							<c:if test="${fn:contains(perishableHistoryViewCondition.statisticsWordType, 'serialNumber')}">
								<th width="10%">用品编号</th>
							</c:if>
							<c:if test="${fn:contains(perishableHistoryViewCondition.statisticsWordType, 'itemName')}">
								<th width="10%">用品名称</th>
							</c:if>
							<c:if test="${fn:contains(perishableHistoryViewCondition.statisticsWordType, 'item_category')}">
								<th width="10%">用品类别</th>
							</c:if>
							<c:if test="${fn:contains(perishableHistoryViewCondition.statisticsWordType, 'amount')}">
								<th width="10%">数量</th>
							</c:if>
							<c:if test="${fn:contains(perishableHistoryViewCondition.statisticsWordType, 'unitPrice')}">
								<th width="5%">单价(元)</th>
							</c:if>
							<c:if test="${fn:contains(perishableHistoryViewCondition.statisticsWordType, 'unit')}">
								<th width="5%">单位</th>
							</c:if>
							<c:if test="${fn:contains(perishableHistoryViewCondition.statisticsWordType, 'unitPrice')
								and fn:contains(perishableHistoryViewCondition.statisticsWordType, 'amount')}">
								<th width="10%">合计金额(元)</th>
							</c:if>
						</tr>
					</thead>
					<tbody>
					<c:set var="sum" value="0"/>
					<c:forEach items="${list}" var="vo">
						<tr style="border:1px solid #ddd;">
							<c:if test="${fn:contains(perishableHistoryViewCondition.statisticsWordType, 'createDate')}">
								<td>
									<fmt:formatDate value="${perishableHistory.beginCreateDate}" pattern="yyyy-MM-dd"/>
									--<fmt:formatDate value="${perishableHistory.endCreateDate}" pattern="yyyy-MM-dd"/>
								</td>
							</c:if>
							<c:if test="${fn:contains(perishableHistoryViewCondition.statisticsWordType, 'serialNumber')}">
								<td>
									${vo.perishableProducts.serialNumber}
								</td>
							</c:if>
							<c:if test="${fn:contains(perishableHistoryViewCondition.statisticsWordType, 'itemName')}">
								<td>
									${vo.perishableProducts.itemName}
								</td>
							</c:if>
							<c:if test="${fn:contains(perishableHistoryViewCondition.statisticsWordType, 'item_category')}">
								<td>
									${fns:getDictLabel(vo.perishableProducts.itemCategory, 'item_category', '')}
								</td>
							</c:if>
							<c:if test="${fn:contains(perishableHistoryViewCondition.statisticsWordType, 'amount')}">
								<td>
									${vo.amount}
								</td>
							</c:if>
							<c:if test="${fn:contains(perishableHistoryViewCondition.statisticsWordType, 'unitPrice')}">
								<td>
									${vo.perishableProducts.unitPrice}
								</td>
							</c:if>
							<c:if test="${fn:contains(perishableHistoryViewCondition.statisticsWordType, 'unit')}">
								<td>
									${fns:getDictLabel(vo.perishableProducts.unit, 'unit', '')}
								</td>
							</c:if>
							<c:if test="${fn:contains(perishableHistoryViewCondition.statisticsWordType, 'unitPrice')
								and fn:contains(perishableHistoryViewCondition.statisticsWordType, 'amount')}">
								<td>
									${vo.amount * vo.perishableProducts.unitPrice}
								</td>
							</c:if>
						</tr>
						<c:if test="${fn:contains(perishableHistoryViewCondition.statisticsWordType, 'unitPrice')
								and fn:contains(perishableHistoryViewCondition.statisticsWordType, 'amount')}">
							<c:set var="sum" value="${sum + vo.amount * vo.perishableProducts.unitPrice}"/>
						</c:if>
					</c:forEach>
					<c:if test="${fn:contains(perishableHistoryViewCondition.statisticsWordType, 'unitPrice')
								and fn:contains(perishableHistoryViewCondition.statisticsWordType, 'amount')}">
						<tr style="border:1px solid #ddd;">
							<td>总金额(元)</td>
							<td colspan="${colspan + 1}">${sum}</td>
						</tr>
					</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>