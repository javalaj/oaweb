<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>易耗品管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
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
	
	function del(obj,index)
	{
		var id = $("#applyid" + index).val();
		
		var equid = $("#equid" + index).val();
		
		$.ajax({ 
			type: "POST", 
			url: "${ctx}/fixedassets/assetsSerial/deleteApply", 
			data: {
					'applyId':id,
					'equid':equid
					},
			dataType : 'json',
			success: function(result) { 
				if (result)
					top.layer.msg("删除成功");
			}
		});
		
		$(obj).remove();
	}
	
	function changeAmount(obj,index)
	{
		var amount = $(obj).val();
		
		var id = $("#applyid" + index).val();
		
		var assetsId = $("#fixed_id" + index).val();
		
		$.ajax({ 
			type: "POST", 
			url: "${ctx}/fixedassets/assetsSerial/updateApply", 
			data:	{
					'applyId':id,
					'amount':amount,
					'assetsId':assetsId
				 	},
			dataType : 'json',
			success: function(b) 
			{
				if (b)
					top.layer.msg("修改成功");
				else
					$(obj).val(0);
			}
		});
	}
	
	function changeRemarks()
	{
		$("#inputForm").submit();
	}
		
	</script>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<div class="ibox-title">
				<h5>固定资产${assetsSerial.type eq '报废' ? '报废': ''}申请单</h5>
			</div>
			<div class="ibox-content">
				<sys:message content="${message}"/>
				<form id="inputForm" action="${ctx}/fixedassets/assetsSerial/reapply?id=${assetsSerial.id}" method="post" class="form-horizontal" style="margin:0;"> 
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
									<img alt="图片" src="${vo.photo}" width="60px;" height="60px;">
									<input id="applyid${status.index}" type="hidden" value="${vo.id}">
									<input id="fixed_id${status.index}" type="hidden" value="${vo.fixed_id}">
									<input id="equid${status.index}" type="hidden" value="${vo.equId}">
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
								<td align=center><input class="btn btn-primary" type="button" value="删除" onclick="del(del${status.index},${status.index})"/></td>
							</tr>																
						</c:forEach>
						</tbody>
					</table>
					<div style="margin-top:12px;">
						<span style="height:34px; line-height:34px;">${assetsSerial.type ne '报废' ? '备注说明：': '报废原因：'}</span>
						<textarea id="remarks" style="width: 100%;height: 80px;"  class="form-control ">${assetsSerial.remarks}</textarea>
					</div>
					<div style="margin-top:12px;">
						<label class="control-label" style="width:65px;padding-top:0">是否提交：</label>
						<div class="controls" style="margin-left:15px;">
							<input type="radio" name="exam" value="1" checked="checked" class="i-checks"></input>提交&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="exam" value="0" class="i-checks"></input>销毁
						</div>
					</div>
					<div style="margin-top:12px;text-align: center;">
						<input id="btnSubmit" class="btn btn-primary" type="button" onclick="changeRemarks()" value="保 存" />&nbsp;
						<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1);"/>&nbsp;
						<input id="btnPNG" class="btn" type="button" value="流程跟踪" />
					</div>
				</form>
				<c:if test="${not empty assetsSerial.id}">
					<act:histoicFlow procInsId="${assetsSerial.procInsId}"/>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>