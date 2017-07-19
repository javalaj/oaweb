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
					/* oaLoading('正在提交，请稍候...'); */
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
					<table class="table table-striped table-bordered  table-hover table-condensed  dataTables-example dataTable no-footer">
						<thead>
							<tr>
								<th style="width: 30%;text-align: center;">办公用品图片</th>
								<th style="width: 30%;text-align: center;"></th>
								<th style="width: 10%;text-align: center;">单价</th>
								<th style="width: 10%;text-align: center;">数量</th>
								<th style="width: 10%;text-align: center;">单位</th>
								<th style="width: 10%;text-align: center;"></th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${list}" var="vo" varStatus="status">
							<tr id="del${status.index}">
								<td align=center>
									<img alt="图片" src="${vo.perishable.photo}" width="60px;"/>					
								</td>
								<td align=center>
									<span>
										${vo.perishable.itemName}
										<br/>
										品牌：${fns:getDictLabel(vo.perishable.brand, 'equ_brand', '')} 型号：${vo.perishable.model}
									</span>
								</td>
								<td align=center>${vo.perishable.unitPrice}</td>
								<td align=center>
									<input id="amount${status.index}" name="amount" type="text" value="${vo.amount}" readonly="readonly" class="form-control number required" style="width: 50px;"/>
								</td>
								<td align=center>${fns:getDictLabel(vo.perishable.unit, 'unit', '')}</td>
								<td align=center></td>
							</tr>
						</c:forEach>	
						</tbody>
					</table>
					<div>
						<span style="display: inline-block;">备注说明：</span>
						<textarea class="form-control" name="remarks" style="width: 60%;height: 50px;display: inline-block;">${perishableSerial.remarks}</textarea>
					</div>
					<div style="text-align: center;">
						<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1);"/>
						<act:flow-back-btn/>
					</div>
					<c:if test="${not empty perishableSerial.id}">
						<act:histoicFlow procInsId="${perishableSerial.procInsId}" />
					</c:if>
			</div>
		</div>
	</div>			
</body>
</html>