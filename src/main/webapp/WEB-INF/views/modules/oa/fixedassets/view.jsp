<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>易耗品管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			
			$("#unitPrice").change(function(){ 
  		
				var a = sum();
	  			
	  			$("#subtotal").val(a);
  			}); 
			
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
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
			
			if(max < c)
			{
				top.layer.msg("大于库存");
				
				$("#" + id).val(0);
			}
		}
		
		function del(obj)
		{
			$(obj).remove();
		}	
	</script>
</head>
<body  class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<div class="ibox-title">
				<h5>固定资产${assetsSerial.type}申请单</h5>
			</div>
			<div class="ibox-content">
				<sys:message content="${message}"/>
				<div class="row">
					<div class="col-sm-12">
						<br>
						<div style="overflow-y: auto; overflow-x:hidden;width: 633px;">
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
											<img alt="图片" src="${vo.photo}" width="60px;" height="60px;">
										</td>
										<td align=center>
											<div>
												${vo.assetsName}
												<br/>
												品牌：${fns:getDictLabel(vo.brand, 'equ_brand', '')} 型号：${vo.model}
											</div>
										</td align=center>
										<td align=center>${vo.unitPrice}</td>
										<td align=center>1</td>
										<td align=center>${fns:getDictLabel(vo.unit, 'unit', '')}</td>
										<td align=center></td>
									</tr>
								</c:forEach>	
								</tbody>
							</table>
						</div>
						${assetsSerial.type ne '报废' ? '备注说明：': '报废原因：'}
						<br/>
						<textarea name="remarks" style="width: 60%;height: 50px;" class="form-control ">${assetsSerial.remarks}</textarea>
						<div class="form-actions">
							<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1);"/>
							<c:if test="${finishFlag ne '1'}">
								<act:flow-back-btn/>
							</c:if>
						</div>
						<c:if test="${not empty assetsSerial.id}">
							<act:histoicFlow procInsId="${assetsSerial.procInsId}" />
						</c:if>
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