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
				/*复选框全选 */
				$("#allChecked").click(function(){
					$("input[name='ids']").prop("checked",this.checked);
				});
				
				$("#applyButton").click(function() { 
				// 判断是否至少选择一项 
				var checkedNum = $("input[name='ids']:checked").length;
				 
				if(checkedNum == 0)
				{ 
					top.layer.msg("请选择至少一项！"); 
					
					return; 
				} 
				else
				{
					$("#apply").submit();
				}
			});
			
				$("#btnPrint").click(function(){
					window.print();
				});
				
				$("#btnExport").click(function(){
					/* if(getExplorer()=='ie')  
		            { */
						//ExportUtil.toExcel("contentTable1");
						
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
		    	        var name = "固定资产-在库" + timex;
						$("#exportTable2").tableExport({worksheetName: '固定资产-在库',fileName: name,type:'excel', excelstyles:['border-bottom', 'border-top', 'border-left', 'border-right']});
						document.body.removeChild(tablee);
		            /* }else{
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
        
        function addInventory(index)
        {
        	var id = $("#assetsId" + index).val();//信息表主键
        	
        	var equ_id = $("#equId" + index).val();//设备表主键
        	
        	$.ajax({ 
				type: "POST", 
				url: "${ctx}/fixedassets/fixedAssets/addInventory",
				data:	{
						'id':id,
						'equ_id':equ_id
					 	},
				dataType : 'json',
				success: function(b) 
				{
					if (b)
					{
						top.layer.msg("添加成功！");
						
						window.location.replace("${ctx}/fixedassets/assetsEquipment/claimList?assetsEquipment.condition=1");
					}
					else
						top.layer.msg("库存不足！");
				}
			});
        }
        
        function sub()
        {
        	 $.ajax({ 
				type: "POST", 
				url: "${ctx}/fixedassets/fixedAssets/queryInventory",
				dataType : 'json',
				success: function(b) 
				{
					if (b)
						top.layer.msg("请添加物品");
					else
						window.location.replace("${ctx}/fixedassets/fixedAssets/apply");
				}
			});
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
				<li class="active"><a href="${ctx}/fixedassets/assetsEquipment/claimList?assetsEquipment.condition=1">在库</a></li>
				<li><a href="${ctx}/fixedassets/assetsEquipment/claimList?assetsEquipment.condition=2">外借</a></li>
				<li><a href="${ctx}/fixedassets/assetsEquipment/claimList?assetsEquipment.condition=3">已领用</a></li>
				<li><a href="${ctx}/fixedassets/assetsEquipment/claimList?assetsEquipment.condition=4">已报废</a></li>
				<li><a href="${ctx}/fixedassets/assetsEquipment/claimList?assetsEquipment.condition=5">待报废</a></li>
				<li><a href="${ctx}/fixedassets/assetsEquipment/">全部</a></li>
			</ul>
			<div class="ibox-content">
				<sys:message content="${message}"/>
				<div class="row">
					<div class="col-sm-12">
						<form:form id="searchForm" modelAttribute="assetsEquipment" action="${ctx}/fixedassets/assetsEquipment/claimList?assetsEquipment.condition=1" method="post" class="breadcrumb form-search">
							<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
							<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
							<div class="form-group">
								<label>资产名称：</label>
									<form:input path="fixedAssets.assetsName" htmlEscape="false" maxlength="255" class=" form-control input-sm" style="width: 165px;"/>
								<label>资产编号：</label>
									<form:input path="serialNumber" htmlEscape="false" maxlength="255" class=" form-control input-sm" style="width: 165px;"/>
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
							<shiro:hasPermission name="fixedassets:fixedAssets:edit"> 
								<oa:fileImportForm  actionUrl="${ctx}/fixedassets/fixedAssets/import" 
								buttonText=" EXCEL导入" 
								templateUrl="${ctxStatic}/template/oa/fixedAssets/FixedAssetsTemplate.xls" 
								title="固定资产EXCEL导入" 
								id="assetsEquipment"
								filePathName="file"/>			 
							</shiro:hasPermission>
							<button type="button" class="tn btn-white btn-sm " data-placement="left" onclick="sub();" title="申请表">
								<span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> 
							</button>
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
							<th>加入申请单</th>
							<shiro:hasPermission name="fixedassets:fixedAssets:edit">
								<th>操作</th>
							</shiro:hasPermission>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${page.list}" var="assetsEquipment" varStatus="status">
						<tr>
							<td>
								<a href="${ctx}/fixedassets/fixedAssets/form?id=${assetsEquipment.fixedAssets.id}">
									${assetsEquipment.fixedAssets.assetsName}
									<input type="hidden" value="${assetsEquipment.fixedAssets.id}" id="assetsId${status.index}">
									<input type="hidden" value="${assetsEquipment.id}" id="equId${status.index}" >
								</a>
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
							<td>1</td>
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
								<img alt="" src="/oa/userfiles/img/u9565.png" onclick="addInventory(${status.index})">
							</td>
							<shiro:hasPermission name="fixedassets:fixedAssets:edit">
								<td>
				    				<a href="${ctx}/fixedassets/fixedAssets/modify?id=${assetsEquipment.fixedAssets.id}&equipId=${assetsEquipment.id}" class="btn btn-info btn-xs"><i class="fa fa-edit"></i> 修改</a>
								</td>
							</shiro:hasPermission> 
						</tr>
					</c:forEach>
					</tbody>
					</table>
					<table:page page="${page}"></table:page>
					<br>
					<br>
				</div>
			</div>
		</div>
</body>
</html>