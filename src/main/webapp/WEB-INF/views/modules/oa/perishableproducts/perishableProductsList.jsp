<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>易耗品管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript" src="${ctxStatic}/tableExport/libs/FileSaver/FileSaver.min.js"></script>
	<script type="text/javascript" src="${ctxStatic}/tableExport/tableExport.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			/* $('#contentTable tbody tr td input.i-checks').on('ifChanged', function(event){  
	            //alert(event.type + ' callback');  
	            if($(this).is(':checked')){//就是这么简单  
	            	checkAmount($(this)); 
	            }  
	        }); */
			
			$("#checkAll").on('ifClicked', function(event){
				if(true == $(this).is(':checked')){
					$("input[name='ids']").iCheck('uncheck');
				}else{
					$("input[name='ids']").iCheck('check');
				}
				 
			});
			
			var subChk=$("input[name='ids']");
			
			subChk.on('ifClicked', function(event){
				if(true == $(this).is(':checked')){
					if(subChk.filter(":checked").length-1 >=subChk.length ){
						$("#checkAll").iCheck('check');
					}else{
						$("#checkAll").iCheck('uncheck');
					}
				}else{
					if(subChk.filter(":checked").length+1 >=subChk.length ){
						$("#checkAll").iCheck('check');
					}else{
						$("#checkAll").iCheck('uncheck');
					}
				}
				
			}); 
			
			$("#btnExportSelect").click(function(){
				var idChecks=$("input[name='ids']");
				var idChecksCount=0;
				for ( var i = 0; i < idChecks.length; i+=1) { 
					if(idChecks[i].checked){
						idChecksCount+=1;
					}
				}
				if(idChecksCount<1){
					top.layer.msg('请勾选至少一条数据后再进行导出');
				}else{
					top.layer.confirm('确认要导出用户数据吗?', {icon: 3, title:'提示'}, function(index){
						var tablee = document.createElement("table");
						var $tablee=$(tablee);
						$tablee.attr("id","exportTable")
						$tablee.addClass("table table-striped table-bordered table-hover table-condensed dataTables-example dataTable");
						$tablee.append($("#threadHead").clone());
						
						var tbody = document.createElement("tbody");
						var $tbody=$(tbody);
						for ( var i = 0; i < idChecks.length; i+=1) {

							if(idChecks[i].checked){
								$tbody.append($(idChecks[i]).parent().parent().parent().clone());
							}
						}
						$tablee.append($tbody);
						var tableee=$tablee[0];
						document.body.appendChild(tableee);
						
						 var trArray = $("#exportTable tr");
				            console.log(trArray.length);
				            var td;
				            for (var i = 0; i < trArray.length; i++) {
				                td = $(trArray[i]).find("td:eq(9)");
				                $(td).remove();
				            }
				            
				            for (var i = 0; i < trArray.length; i++) {
				                td = $(trArray[i]).find("td:eq(0)");
				                $(td).remove();
				            }
				            
				            $("#exportTable thead tr th:last").remove();
						
				            $("#exportTable thead tr th:first").remove();
				            
				            var timex = new Date().Format("yyyyMMddhhmmss");
			    	        var name = "办公用品" + timex;
							$("#exportTable").tableExport({worksheetName: '办公用品',fileName: name,type:'excel', excelstyles:['border-bottom', 'border-top', 'border-left', 'border-right']});
		    	       document.body.removeChild(tablee);
						top.layer.close(index);
					});
				}
			});
			
			$("#btnPrintSelect").click(function(){
				var idChecks=$("input[name='ids']");
				var idChecksCount=0;
				for ( var i = 0; i < idChecks.length; i+=1) { 
					if(idChecks[i].checked){
						idChecksCount+=1;
					}
				}
				if(idChecksCount<1){
					top.layer.msg('请勾选至少一条数据后再进行打印');
				}else{
					for ( var i = 0; i < idChecks.length; i+=1) { 
						if(idChecks[i].checked){
							$(idChecks[i]).parent().parent().parent().removeClass("noprint");
						}else{
							$(idChecks[i]).parent().parent().parent().addClass("noprint");
						}
					}
					window.print();
				}
			});
			
			$("#btnExport").click(function(){
				if(getExplorer()=='ie')  
	            {
					ExportUtil.toExcel("contentTable1");
	            }else{
	            	method5('contentTable1');
	            }
				
				
			});
		
}); 		
		function checkAmount(obj)
		{
			var id = obj.val();

			$.ajax({ 
					type: "POST", 
					url: "${ctx}/perishableproducts/perishableProducts/findAmount",
					data:	{
							'id':id,
						 	},
					dataType : 'json',
					success: function(b) 
					{
						if (b)
						{
							obj.iCheck('uncheck');
							
							$("#contentTable thead tr th input.i-checks").iCheck('uncheck');
							
							top.layer.alert('库存不足!', {icon: 0, title:'警告'});
						}
					}
				}); 
		}

		function apply()
		{
			// 判断是否至少选择一项 
			var checkedNum = $("input[name='ids']:checked").length;
			
			if(checkedNum == 0)
			{ 
				//top.layer.msg("请选择至少一项！"); 
				top.layer.alert('请至少选择一项!', {icon: 0, title:'警告'});
				return; 
			} 
			else
			{
				var checkedList = new Array(); 
				
				$("input[name='ids']:checked").each(function() { 
					
					checkedList.push($(this).val()); 
				}); 
				
				$.ajax({ 
					type: "POST", 
					url: "${ctx}/perishableproducts/perishableProducts/findAmount",
					data:	{
							'id':checkedList.toString(),
						 	},
					dataType : 'json',
					success: function(b) 
					{
						if (!b)
						{
							top.layer.alert('你选择的物品库存不足，请重新选择!', {icon: 0, title:'警告'});
							
							$("input[name='ids']:checked").each(function() { 
								
								$(this).iCheck('uncheck');
							}); 
						}
						else
						{
							$("#ides").val(checkedList.toString());
							
							$("#outStockList").submit();
						}
					}
				}); 
				
			}
		}
	</script>
<style>	
@media print {
	.noprint {
		display: none
	}
	.blackBorder{
		border:1px solid black
	}
}
.noExp{
	display: none
}

.table-c table {
	border-right: 1px solid #F00;
	border-bottom: 1px solid #F00
}

.table-c table td {
	border-left: 1px solid #F00;
	border-top: 1px solid #F00
}
</style>	
	
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<div class="ibox-title">
				<h5>办公用品管理列表 </h5>
			</div>   
		    <div class="ibox-content">
				<sys:message content="${message}"/>
				<!-- 查询条件 -->
				<div class="row">
					<div class="col-sm-12">
						<form:form id="searchForm" modelAttribute="perishableProducts" action="${ctx}/perishableproducts/perishableProducts/" method="post" class="form-inline">
							<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
							<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
							<div class="form-group">
								<span>用品名称：</span>
									<form:input path="itemName" htmlEscape="false" maxlength="255" class="form-control"/>
								<span>品牌：</span>
									<form:select path="brand" class="selectpicker " data-style="btn-inverse" data-live-search="true">
										<form:option value="" label="全部"/>
										<form:options items="${fns:getDictList('equ_brand')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
									</form:select>			
							</div>
						</form:form>
						<br/>
					</div>
				</div>	
					<!-- 工具栏 -->
				<div class="row">
					<div class="col-sm-12">
						<div class="pull-left">
							<shiro:hasPermission name="perishableproducts:perishableProducts:edit"> 
								<a  class="btn btn-white btn-sm" href="${ctx}/perishableproducts/perishableProducts/form" title="入库">入库</a><!-- 增加按钮 -->
								<input id="btnExportSelect" class="btn btn-white btn-sm" type="button" value="导出" />				
								<oa:fileImportForm  actionUrl="${ctx}/perishableproducts/perishableProducts/import" 
								buttonText=" EXCEL导入" 
								templateUrl="${ctxStatic}/template/oa/perishable/PerishableTemplate.xls" 
								title="办公用品EXCEL导入" 
								id="perishableProducts"
								filePathName="file"/>
							</shiro:hasPermission>
					       <button class="btn btn-white btn-sm " data-toggle="tooltip" data-placement="left" onclick="apply()" title="领用申请"> 领用申请</button>
						</div>
						<div class="pull-right">
							<button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="search()" ><i class="fa fa-search"></i> 查询</button>
							<button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="reset()" ><i class="fa fa-refresh"></i> 重置</button>
						</div>
					</div>
				</div>
				
				<table id="contentTable" class="table table-striped table-bordered  table-hover table-condensed  dataTables-example dataTable no-footer">
					<thead id="threadHead">
						<tr class="blackBorder">
							<th class="noprint noexport" style="width: 20px"id="checkHeader">
							<input type="checkbox" name="allChecked" id="checkAll" class="i-checks"/></th>
							<th>用品编号</th>
							<th>用品名称</th>
							<th>用品类别</th>
							<th>库存数量</th>
							<th>单价(元)</th>
							<th>单位</th>
							<th>供应商</th>
							<th>品牌</th>
							<shiro:hasPermission name="perishableproducts:perishableProducts:edit">
							<th>操作</th>
							</shiro:hasPermission>
						</tr>
					</thead>
					<tbody>		
			 	<form:form id="outStockList" modelAttribute="perishableProducts" method="post" action="${ctx}/perishableproducts/perishableProducts/outStockList">
					<input type="hidden" name="ides" id="ides"/>
					<c:forEach items="${page.list}" var="perishableProducts">
						<tr class="blackBorder">
							<td class="noprint noexport">
							<input type="checkbox" name="ids" value="${perishableProducts.id}" onclick="checkAmount(this)" class="i-checks"/>
							</td>
							<td>
								${perishableProducts.serialNumber}
							</td>
							<td>
								${perishableProducts.itemName}
							</td>
							<td>
								${fns:getDictLabel(perishableProducts.itemCategory, 'item_category', '')}
							</td>
							<td>
								${perishableProducts.amount}
							</td>
							<td>
								${perishableProducts.unitPrice}
							</td>
							<td>
								${fns:getDictLabel(perishableProducts.unit, 'unit', '')}
							</td>
							<td>
								${perishableProducts.supplier}
							</td>
							<td>
								${fns:getDictLabel(perishableProducts.brand, 'equ_brand', '')}
							</td>
							<shiro:hasPermission name="perishableproducts:perishableProducts:edit">
								<td>
				    				<a href="${ctx}/perishableproducts/perishableProducts/modif?id=${perishableProducts.id}" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i> 修改</a>
									<a href="${ctx}/perishableproducts/perishableProducts/delete?id=${perishableProducts.id}" onclick="return confirmx('确认要删除该易耗品吗？', this.href)" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> 删除</a>
								</td>
							</shiro:hasPermission> 
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</form:form> 
			<table:page page="${page}"></table:page>
			<br/>
			<br/>
			</div>
		</div>
	</div>
</body>
</html>