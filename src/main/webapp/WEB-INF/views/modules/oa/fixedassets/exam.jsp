<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>易耗品管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
		$("#remarks").blur(function(){
			var remarks = $("#remarks").val();
			
			var id = "${assetsSerial.id}";
			
				$.ajax({ 
				type: "POST", 
				url: "${ctx}/fixedassets/assetsSerial/updateRemarks",
				data:	{
						'remarks':remarks,
						'id':id,
					 	},
				dataType : 'json',
				success: function(b) 
				{
				
				}
			});
		});
		
		$("#btnPNG").click(function(){
			var src="${ctx}/act/task/trace/photo/${fns:getWorkflowVarValue('assets_quisitions','procDefId','')}/${assetsSerial.procInsId}";
			top.layer.open({
				  type: 2, 
				  area: [$("body").width()+'px', $("body").height()+'px'],
			      title: "固定资产申请流程图",
		          maxmin: true, 
		          shadeClose: true,
				  content: src 
			});
		});
			
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
		
	function applySubmit()
	{
		var exam = $("input[name=exam]:checked").val();
		
		if (3 == exam)
		{
			var equIdList = new Array();
		
			$("input[name=equId]").each(function() {
				equIdList.push($(this).val());
			});
		
			$.ajax({ 
				type: "POST", 
				url: "${ctx}/fixedassets/assetsSerial/updateAmount", 
				data:	{
						'equIdList':equIdList.toString()
					 	},
				dataType : 'json',
				success: function(b) 
				{
					 $("#inputForm").submit(); 
				}
			});
		}
		else
		{
			$("#inputForm").submit();
		}
	}	
	</script>
</head>
<body class="gray-bg">
	
	<div class="wrapper wrapper-content">
		<div class="ibox">	
			<div class="ibox-title">
				<h5>固定资产${assetsSerial.type}申请单</h5>
			</div>
	
			<div class="ibox-content">
				<sys:message content="${message}"/>
				<form id="inputForm" action="${ctx}/fixedassets/assetsSerial/dealExam?id=${assetsSerial.id}" method="post" class="form-horizontal" style="margin: 0;"> 
					<div style="overflow-y: auto; overflow-x:hidden;width: 100%;">
						<table class="table table-striped table-bordered  table-hover table-condensed  dataTables-example dataTable no-footer">
							<thead>
								<tr>
									<th style="width: 30%;text-align: center;">固定资产图片</th>
									<th style="width: 30%;text-align: center;">固定资产名称</th>
									<th style="width: 10%;text-align: center;">单价</th>
									<th style="width: 10%;text-align: center;">数量</th>
									<th style="width: 10%;text-align: center;">单位</th>
									<th style="width: 10%;text-align: center;">操作</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${list}" var="vo" varStatus="status">														
								<tr id="del${status.index}">
									<td align=center>
										<img alt="图片" src="${vo.photo}" width="60px;" height="60px;"/>
										<input type="hidden" name="equId" value="${vo.equId}"/>
									</td>
									<td align=center>
										<span>
											${vo.assetsName}  
											<br/>
											品牌：${fns:getDictLabel(vo.brand, 'equ_brand', '')} 型号：${vo.model}
										</span>
									</td>
									<td align=center>${vo.unitPrice}</td>
									<td align=center>1</td>
									<td align=center>${fns:getDictLabel(vo.unit, 'unit', '')}</td>
									<td align="center"><span id="sp${status.index}" style="color: red;"></span></td>
								</tr>
							</c:forEach>	
							</tbody>
						</table>
					</div>
					<div style="margin: 6px 0;">
						<span style="display: inline-block;">${assetsSerial.type ne '报废' ? '备注说明：': '报废原因：'}</span>
						<textarea id="remarks" style="width: 60%;" row="4" class="form-control ">${assetsSerial.remarks}</textarea>
					</div>
					<div style="margin: 12px 0;">
						<span style="display: inline-block;">审批意见：</span>
						<div style="display: inline-block;">
							<span id="exam1"><input type="radio" name="exam" value="1" checked="checked" class="i-checks"/>同意</span>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="exam" value="2" class="i-checks"/>不同意
						</div>
					</div>
					<div style="text-align: center;">
						<input id="btnSubmit" class="btn btn-primary" type="button" onclick="applySubmit()" value="保 存" />&nbsp;
						<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1);"/>&nbsp;
						<input id="btnPNG" class="btn" type="button" value="流程跟踪" />
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