<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>资产使用登记</title>
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
		
		function claimSubmit()
		{
			var count = 0;
		
			var current = $("input[name='operator']").length;
		
			$("input[name='operator']").each(function() 
			{
				if ($(this).val() != null && $(this).val() !='')
					count++;
			});
			
			if (current != count)
				top.layer.msg('请填写'+'${assetsSerial.type}'+'申请人');
			else
			$("#inputForm").submit();
				
		}
		
	</script>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<div class="ibox-title">
				<h5>固定资产${assetsSerial.type}单</h5>	
			</div>
			<div class="ibox-content">
				<sys:message content="${message}"/>
					<form id="inputForm" method="post" class="form-horizontal" action="${ctx}/fixedassets/assetsSerial/claimSave?id=${assetsSerial.id}">
						<table class="table table-striped table-bordered  table-hover table-condensed  dataTables-example dataTable no-footer">
							<thead>
								<tr>
									<th style="width: 16%;text-align: center;">资产编号</th>
									<th style="width: 29%;text-align: center;">资产名称</th>
									<th style="width: 5%;text-align: center;">数量</th>
									<th style="width: 5%;text-align: center;">单位</th>
									<th style="width: 10%;text-align: center;">${assetsSerial.type}人</th>
									<th style="width: 25%;text-align: center;">处理结果</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${list}" var="vo" varStatus="status">
									<tr>
										<input type="hidden" name="equId" value="${vo.equId}"/>
										<input type="hidden" name="operator" value="${vo.create_by}"/>
										<input type="hidden" name="claimNumber" value="${vo.deviceID}"/>
										<input type="hidden" name="address" value=" "/>
										<td align="center">${vo.deviceID}</td>
										<td align="center">${vo.assetsName}</td>
										<td align="center">1<input type="hidden" name="assetsId" value="${vo.fixed_id}"/></td>
										<td align="center">${fns:getDictLabel(vo.unit, 'unit', '')}</td>
										<td align="center">${fns:getUserById(vo.create_by).name}</td>
										<td align="center"><input type="text" name="phone" class="form-control "/></td>
									</tr>
							</c:forEach>	
							</tbody>
						</table>
						<div style="margin: 6px 0;">
							<span>备注说明：</span>
							<br/>
							<c:forEach items="${list}" var="vo" varStatus="status">
								<c:if test="${status.first}">
									<span>${vo.remarks}</span>
									<br/>
									<input type="hidden" name="remarks" value="${vo.remarks}"/>								
								</c:if>
							</c:forEach>
						</div>
						<div style="text-align: center;">
							<input id="btnSubmit" class="btn btn-primary" type="button" value="提交" onclick="claimSubmit()"/>&nbsp;
							<input id="btnCancel" class="btn" type="button" value="返回" onclick="window.location='${ctx}/act/task/todo'"/>&nbsp;
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