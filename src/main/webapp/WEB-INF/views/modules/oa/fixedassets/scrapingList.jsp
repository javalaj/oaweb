<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>固定资产管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript" src="${ctxStatic}/tableExport/libs/FileSaver/FileSaver.min.js"></script>
	<script type="text/javascript" src="${ctxStatic}/tableExport/tableExport.js"></script>
	<script type="text/javascript">
		$(document).ready(function()
		 {
			$("#btnExport").click(function(){
				/* if(getExplorer()=='ie')  
	            { */
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
	    	        var name = "固定资产-待报废" + timex;
					$("#exportTable2").tableExport({worksheetName: '固定资产-待报废',fileName: name,type:'excel', excelstyles:['border-bottom', 'border-top', 'border-left', 'border-right']});
					document.body.removeChild(tablee);
	           /*  }else{
	            	method5('contentTable1');
	            } */
			});							
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
		
		function equipmentType(type)
		{
			window.location.replace("${ctx}/fixedassets/assetsEquipment/claimList?assetsEquipment.condition="+ type);
		}
		
		function add(){
			window.location.replace("${ctx}/fixedassets/fixedAssets/form");
		}
	</script>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<ul class="nav nav-tabs myoa-tabs">
				<li><a href="${ctx}/fixedassets/assetsEquipment/claimList?assetsEquipment.condition=1">在库</a></li>
				<li><a href="${ctx}/fixedassets/assetsEquipment/claimList?assetsEquipment.condition=2">外借</a></li>
				<li><a href="${ctx}/fixedassets/assetsEquipment/claimList?assetsEquipment.condition=3">已领用</a></li>
				<li><a href="${ctx}/fixedassets/assetsEquipment/claimList?assetsEquipment.condition=4">已报废</a></li>
				<li class="active"><a href="${ctx}/fixedassets/assetsEquipment/claimList?assetsEquipment.condition=5">待报废</a></li>
				<li><a href="${ctx}/fixedassets/assetsEquipment/">全部</a></li>
			</ul> 	
			<div class="ibox-content">
				<sys:message content="${message}"/>
				<div class="row">
					<div class="col-sm-12">
						<form:form id="searchForm" modelAttribute="assetsEquipment" action="${ctx}/fixedassets/assetsEquipment/claimList?assetsEquipment.condition=5" method="post" class="breadcrumb form-search">
							<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
							<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
							<div class="form-group">
								<label>资产名称：</label>
									<form:input path="fixedAssets.assetsName" htmlEscape="false" maxlength="255" class=" form-control input-sm"  style="width: 165px;"/>
								<label>资产编号：</label>
									<form:input path="serialNumber" htmlEscape="false" maxlength="255" class=" form-control input-sm"  style="width: 165px;"/>
								<label>采购日期：</label>
									<input name="beginTime" type="text" readonly="readonly" maxlength="20" class="form-control Wdate laydate-icon layer-date input-sm"
									value="${assetsEquipment.beginTime}" style="width: 165px;"
									onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true});"/> - 
									<input name="endTime" type="text" readonly="readonly" maxlength="20" class="form-control Wdate laydate-icon layer-date input-sm"
									value="${assetsEquipment.endTime}" style="width: 165px;"
									onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true});"/>			
							</div>
						</form:form>
						<br/>
					</div>
				</div>
				<!-- 工具栏 -->
				<div class="row">
					<div class="col-sm-12">
						<div class="pull-left">
							<button class="btn btn-white btn-sm " data-toggle="tooltip" data-placement="left" id="btnExport" title="导出当前页"> 导出当前页</button>
						</div>
						<div class="pull-right">
							<table:search/>
							<table:reset/>
						</div>
					</div>
				</div>
				<table id="contentTable" class="table table-striped table-bordered  table-hover table-condensed  dataTables-example dataTable no-footer">
					<thead>
						<tr>
							<th>资产名称</th>
							<th>资产类别</th>
							<th>资产编号</th>
							<th>品牌</th>
							<th>数量</th>
							<th>单价</th>
							<th>单位</th>
							<th>采购日期</th>
							<th>待报废原因</th>
						</tr>
					</thead>
					<tbody>
					<form:form id="apply" modelAttribute="fixedAssets" method="post" action="${ctx}/fixedassets/fixedAssets/apply">
					<c:forEach items="${page.list}" var="assetsEquipment">
						<tr>
							<td>
								${assetsEquipment.fixedAssets.assetsName}
							</td>
							<td>
								${fns:getDictLabel(assetsEquipment.fixedAssets.assetsCategory, 'assets_category', '')}
							</td>
							<td>
								${assetsEquipment.serialNumber}
							</td>
							<td>
								${fns:getDictLabel(assetsEquipment.fixedAssets.brand, 'equ_brand', '')}
							</td>
							<td>
								1
							</td>
							<td>
								${assetsEquipment.fixedAssets.unitPrice}
							</td>
							<td>
								${fns:getDictLabel(assetsEquipment.fixedAssets.unit, 'unit', '')}
							</td>
							<td>
								<fmt:formatDate value="${assetsEquipment.fixedAssets.purchaseDate}" pattern="yyyy-MM-dd "/>
							</td>
							<td>
								${assetsEquipment.remarks}
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				</form:form>
				<table:page page="${page}"/>
				<br>
				<br>
			</div>
		</div>
	</div>
</body>
</html>