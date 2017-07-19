<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>办公用品管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
	jQuery.validator.addClassRules("myNumber", {  
			required: true,  
			number:true,
			min:1,
			max:999  
		});			
			$("#unitPrice").change(function(){ 
  		
				var a = sum();
	  			
	  			$("#subtotal").val(a);
  			}); 
			
			$("#inputForm").validate({
				submitHandler: function(form){
					oaLoading('正在提交，请稍等...');
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
			
			var c = parseInt($("#" + id).val());
			
			var max = parseInt($("#" + hid).val());
			
			if (c <= 0)
				$("#" + id).val(1);
			
			if(max < c)
			{
				top.layer.msg("大于库存");
				
				$("#" + id).val(1);
			}
		}
		
		function del(obj)
		{
			$(obj).remove();
			
			top.layer.msg("删除成功");
		}
		
		function sub()
		{
			$("#inputForm").submit();
		}	
	</script>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<div class="ibox-title">
				<h5>办公用品申请单</h5>
			</div>
			<div class="ibox-content">
				<sys:message content="${message}"/>
				<div class="row">
					<div class="col-sm-12">
						<form id="inputForm" action="${ctx}/oa/fixedassets/perishableSerial/saveForAct" method="post" class="form-horizontal">
						<table class="table table-striped table-bordered  table-hover table-condensed  dataTables-example dataTable no-footer">
							<thead>
								<tr>
									<th style="width: 30%;">办公用品图片</th>
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
										<img alt="图片" src="${vo.photo}" width="60px;" height="60px;">
										<input type="hidden" name="perishableId" value="${vo.id}"/>
									</td>
									<td align=center>
										<div>
											${vo.itemName}
											<br/>
											品牌：${fns:getDictLabel(vo.brand, 'equ_brand', '')} 型号：${vo.model}
										</div>
									</td>
									<td align=center>${vo.unitPrice}</td>
									<td align=center>
										<input id="amount${status.index}" class="myNumber" name="amount" type="text" value="1" onchange="checkAmount(this.id);" class="form-control number required" style="width: 50px;"/>
										<input id="amount${status.index}h" type="hidden" value="${vo.amount}" name="amounth"/>
									</td>
									<td align=center>${fns:getDictLabel(vo.unit, 'unit', '')}</td>
									<td align=center><input class="btn btn-primary" type="button" value="删除" onclick="del(del${status.index})"/></td>
								</tr>
							</c:forEach>	
							</tbody>
						</table>
						备注说明：
							<br/>
							<textarea class="form-control" name="remarks" style="width: 60%;height: 50px;"></textarea>
							<br/>
						</form>
						<br/>
						<div class="form-actions">
							<center>
								<input id="btnSubmit" class="btn btn-primary" type="button" value="${view eq '1' ? '重新' : ''}提交领用单" onclick="sub()"/>&nbsp;
								<input id="btnCancel" class="btn" type="button" value="返 回" onclick="window.location='${ctx}/perishableproducts/perishableProducts'"/>
							</center>
						</div>
						<br/>
					</div>
				</div>
				<br>
				<br>
			</div>
		</div>
	</div>		
</body>
</html>