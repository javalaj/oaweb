<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>易耗品管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
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
		});
		
		//申请提交、申请类型
		function apply(type)
		{
			var url = '/oa/a/fixedassets/assetsSerial/applyAssets?type=' + type;
		
			$("#inputForm").attr("action", url);
			
			$("#inputForm").submit();
		}
		
		function returned()
		{
			var id = "${assetsEquipment.id}";
		
			$.ajax({ 
				type: "POST", 
				url: "${ctx}/fixedassets/assetsClaim/returned",
				data:	{
						'id':id,
					 	},
				dataType : 'json',
				success: function(b) 
				{
					window.location.href="${ctx}/fixedassets/assetsEquipment/claimList?assetsEquipment.condition=1";
				}
			});
		}
		
		function allocation()
		{
			$("#ly").show();
		}
		
		function undo()
		{
			$("#ly").hide();
		}
		
		function sub()
		{
			var userId = $("#userId").val();
			
			var id = "${assetsEquipment.id}";
			
			if (userId != null && userId != '')
			{
				$.ajax({ 
					type: "POST", 
					url: "${ctx}/fixedassets/assetsEquipment/allocation",
					data:	{
							'id':id,
							'userId':userId
						 	},
					dataType : 'json',
					success: function(b) 
					{
						window.location.href="${ctx}/fixedassets/assetsEquipment/claimList?assetsEquipment.condition=1";
					}
				});
			}
			else
			 top.layer.msg("请选择领用人姓名")
		}	
	</script>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<div class="ibox-title">
				<h5>固定资产申请单</h5>
			</div>
			<div class="ibox-content">
			<sys:message content="${message}"/>
				<h2>固定资产信息</h2>
				<table id="contentTable" class="table table-striped table-bordered  table-hover table-condensed  dataTables-example dataTable no-footer">
					<thead>
						<tr>
							<th style="width: 30%;"></th>
							<th style="width: 30%;"></th>
							<th style="width: 30%;"></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td rowspan="6"><img alt="图片" src="${assetsEquipment.fixedAssets.photo}" width="110px;" height="110px;"></td>
							<td>资产名称 ：${assetsEquipment.fixedAssets.assetsName}</td>
							<td>资产编号：${assetsEquipment.serialNumber}</td>
						</tr>
						<tr>
							
							<td>资产类别：${fns:getDictLabel(assetsEquipment.fixedAssets.assetsCategory, 'assets_category', '')}</td>
							<td>品牌：${fns:getDictLabel(assetsEquipment.fixedAssets.brand, 'equ_brand', '')}</td>
						</tr>
						<tr>
							
							<td>库存数量：${assetsEquipment.fixedAssets.amount}</td>
							<td>规格：${assetsEquipment.fixedAssets.specifications}</td>
						</tr>
						<tr>
							
							<td>单价：${fns:getDictLabel(assetsEquipment.fixedAssets.unit, 'unit', '')}</td>
							<td>型号：${assetsEquipment.fixedAssets.model}</td>
						</tr>
						<tr>
							<c:set var="supplier" value="${assetsEquipment.fixedAssets.supplier}"/>
							<td>供应商：${not empty supplier ? supplier : '暂无'}</td>
							<td>入库日期：<fmt:formatDate value="${assetsEquipment.fixedAssets.createDate}" pattern="yyyy-MM-dd "/></td>
						</tr>
						<tr>
							<td>领用日期：<fmt:formatDate value="${assetsEquipment.createDate}" pattern="yyyy-MM-dd "/></td>
							<td>领用人：${fns:getUserById(assetsEquipment.equStaff).name}</td>
						</tr>
					</tbody>
				</table>
	
				<h2>历史操作记录</h2>
				<table id="contentTable" class="table table-striped table-bordered  table-hover table-condensed  dataTables-example dataTable no-footer">
					<thead>
						<tr>
							<th align="center">日期</th>
							<th align="center">操作</th>
							<th align="center">领用人</th>
							<th align="center">经办人</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td align="center"><fmt:formatDate value="${list[0].fixedAssets.createDate}" pattern="yyyy-MM-dd "/></td>
							<td align="center">入库</td>
							<td align="center"></td>
							<td align="center">${list[0].fixedAssets.createBy.name}</td>
						</tr>
					<c:forEach items="${list}" var="assetsClaim">
						<tr>
							<td align="center"><fmt:formatDate value="${assetsClaim.createDate}" pattern="yyyy-MM-dd "/></td>
							<td align="center">${assetsClaim.type}</td>
							<td align="center">${assetsClaim.claimant}</td>
							<td align="center">${assetsClaim.operator}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
	
				<div id="ly" style="display: none;">
					<span style="dislay: inline-block;">资产领用人：</span>
					<div style="dislay: inline-block;">
						<sys:treeselect id="user" name="toSendMessageUserid" labelValue="" labelName="username" value="" title="用户" url="/sys/office/treeData?type=3" cssClass="form-control" allowClear="true" notAllowSelectParent="true" />
					</div>
					<input id="btnSubmit" class="btn btn-primary" type="button" value="确定" onclick="sub()"/>
					<input id="btnSubmit" class="btn btn-primary" type="button" value="取消" onclick="undo()"/>
				</div>
	
				<div style="text-align: center;">
					<shiro:hasPermission name="perishableproducts:perishableProducts:edit">
						<input id="btnSubmit" class="btn btn-primary" type="button" value="归还" onclick="returned()"/>&nbsp;
						<input id="btnSubmit" class="btn btn-primary" type="button" value="调拨" onclick="allocation()"/>&nbsp;
					</shiro:hasPermission>
					<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
				</div>
			</div>
		</div>
	</div>
</body>
</html>