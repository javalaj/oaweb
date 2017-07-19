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
		
		function checkAmount(id)
		{
			var hid = id + 'h';
			
			var c = $("#" + id).val();
			
			var max = $("#" + hid).val();
			
			if(max < c)
			{
				top.layer.msg("大于库存");
				
				$("#" + id).val(0);
			}
		}
		
		function del(index)
		{
			var id = $("#invid" + index).val();
			
			var equid = $("#equid" + index).val();
		
			$.ajax({ 
				type: "POST", 
				url: "${ctx}/fixedassets/fixedAssets/delInventory",
				data:	{
						'id':id,
						'equid':equid
					 	},
				dataType : 'json',
				success: function(b) 
				{
					if (b)
						top.layer.msg("删除成功");
				}
			}); 
			
			$("#del" + index).remove();
		}
		
		//申请提交、申请类型
		function apply(type)
		{
			var url = '/oa/a/fixedassets/assetsSerial/applyAssets?type=' + type;
		
			$("#inputForm").attr("action", url);
			
			$("#inputForm").submit();
		}
		
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
		
		function scrapApply(type)
		{
			if (type == '3')
			{
				if ($("#remarks").val() == "" || $("#remarks").val() == null)
				{
					$("#scrapApply").html("报废原因：<font color=\"red\">*</font>");
					
					top.layer.msg("请填写报废原因");
				}
				else
				{
					apply(type);
				}
			}
			else
			{
				$("#scrapApply").html("备注说明：");
				
				apply(type);
			}
			
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
				<form id="inputForm" method="post" class="form-horizontal">	
					<div style="overflow-y: auto; overflow-x:hidden;width: 100%;max-height: 500px;">
						<table class="table table-striped table-bordered  table-hover table-condensed  dataTables-example dataTable no-footer">
							<thead>
								<tr>
									<th style="width: 30%;">固定资产图片</th>
									<th style="width: 30%;"></th>
									<th style="width: 10%;">单价</th>
									<th style="width: 10%;">数量</th>
									<th style="width: 10%;">单位</th>
									<th style="width: 10%;"></th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${list}" var="vo" varStatus="status">
								<tr id="del${status.index}">
									<td align=center>
										<img alt="图片" src="${vo.fixedAssets.photo}" width="60px;" height="60px;">
										<input type="hidden" id="invid${status.index}" name="invid" value="${vo.id}"/>
										<input type="hidden" id="equid${status.index}" name="equid" value="${vo.equId}"/>
										<input type="hidden" id="assetsid${status.index}" name="assetsid" value="${vo.fixedAssets.id}"/>
									</td>
									<td align=center>
										<div>
											${vo.fixedAssets.assetsName}
											<br/>
											品牌：${fns:getDictLabel(vo.fixedAssets.brand, 'equ_brand', '')} 型号：${vo.fixedAssets.model}
										</div>
									</td>
									<td align=center>${vo.fixedAssets.unitPrice}</td>
									<td align=center>1</td>
									<td align=center>${fns:getDictLabel(vo.fixedAssets.unit, 'unit', '')}</td>
									<td align=center><input class="btn btn-primary" type="button" value="删除" onclick="del(${status.index})"/></td>
								</tr>
							</c:forEach>	
							</tbody>
						</table>
					</div>
					<span id="scrapApply">备注说明：</span>
					<br/>
					<textarea name="remarks" style="width: 60%;height: 50px;" class="form-control " id="remarks"></textarea>
					<br/>
					<br/>
					<div style="text-align: center;">
						<input id="btnSubmit" class="btn btn-primary" type="button" value="领用申请" onclick="scrapApply('1')"/>&nbsp;
						<input id="btnSubmit" class="btn btn-primary" type="button" value="外借申请" onclick="scrapApply('2')"/>&nbsp;
						<shiro:hasPermission name="fixedassets:fixedAssets:edit">
							<input id="btnSubmit" class="btn btn-primary" type="button" value="报废申请" onclick="scrapApply('3');"/>&nbsp;
						</shiro:hasPermission>
						<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1);"/>
					</div>
				</form>
				<c:if test="${not empty assetsSerial.id}">
					<act:histoicFlow procInsId="${assetsSerial.procInsId}" />
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>