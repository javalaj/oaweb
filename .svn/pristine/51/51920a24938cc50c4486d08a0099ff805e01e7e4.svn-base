<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>固定资产管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			
		//添加到样式规则名
	 	jQuery.validator.addClassRules("myNumber", {  
			required: true,  
			number:true,
			min:1,
			max:9999  
		});
			sum();
			
			disableButton();
			
			inputChange();
			
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
				
		//防止重复提交
		function disableButton()
		{
			var id = "${fixedAssets.id}";
			
			if (id != null && id != "")
				document.getElementById("btnSubmit").setAttribute("disabled",true);
			else
				document.getElementById("btnNext").setAttribute("disabled",true);
		}
		
		//小计
		function sum()
  		{
  			var unitPrice = 0;
  			
  			var amount = 0;
  			
	  		if($("#unitPrice").val() != "" && $("#unitPrice").val() != null)
		  		unitPrice = parseFloat($("#unitPrice").val());
		  		
			if($("#amount").val() != "" && $("#amount").val() != null)
				var amount = parseInt($("#amount").val());
				
			var sum = amount * unitPrice;
			
			$("#subtotal").html(sum + '元');
			
			return sum;
  		}
  		
  		function inputChange()
  		{
  			$("#unitPrice").change(function(){ 
  		
				var a = sum() + '元';
	  			
	  			$("#subtotal").html(a);
  			}); 
  			
  			$("#amount").change(function(){ 
  		
				var a = sum() + '元';
	  			
	  			$("#subtotal").html(a);
  			}); 
  		}
  		
		function equipmentType(type)
		{
			window.location.replace("${ctx}/fixedassets/assetsEquipment/claimList?assetsEquipment.condition="+ type);
		}
	</script>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox"  style="width: 800px; margin: 0 auto;">
			<div class="ibox-title">
				<h5>资产登记</h5>
			</div> 
		<div class="ibox-content">
			<sys:message content="${message}"/>
			
			<!-- 工具栏 -->
			<div class="row">
				<div class="col-sm-12">
					<div class="pull-right"></div>
				</div>
			</div>
			<form:form id="inputForm" modelAttribute="fixedAssets" action="${ctx}/fixedassets/fixedAssets/save" method="post" class="form-horizontal">
				<form:hidden path="id"/>
				<form:hidden path="serialNumber"/>
				<table class="table table-condensed dataTables-example dataTable no-footer myoa-table-noborder">
					<tbody>
						<tr>
							<td>	
				        		图片：
				         	</td>
				         	<td>
				         		<form:hidden id="nameImage" path="photo" htmlEscape="false" maxlength="255" class="form-control"/>
								<sys:ckfinder input="nameImage" type="images" uploadPath="/photo" selectMultiple="false" 
								maxWidth="100" maxHeight="100" /> 
				         	</td>
				         	<td>	
				         		资产名称： <font color="red">*</font>
				         	</td>
				         	<td>
				         		<form:input path="assetsName" htmlEscape="false" maxlength="200" id="type" class="form-control required"/>
				         	</td>
						</tr>
						<tr>
					        <td>	
					        	资产类别： <font color="red">*</font>
					        </td>
					        <td>			        	
					         	<form:select path="assetsCategory" class="form-control selectpicker required" data-style="btn-inverse" data-live-search="true">
									<form:options items="${fns:getDictList('assets_category')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
								</form:select>
					        </td>
					        <td>	
					         	品牌： <font color="red">*</font>
					        </td>
					        <td>
								<form:select path="brand" class="form-control selectpicker required" data-style="btn-inverse" data-live-search="true">
									<form:options items="${fns:getDictList('equ_brand')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
								</form:select>
					        </td>
				      	</tr>
				      	<tr>
				      		<td>	
					        	型号：
					        </td>
					        <td>
				         		<form:input path="model" htmlEscape="false" maxlength="200" class="form-control"/>
				         	</td>
				         	<td>	
					        	规格：
					        </td>
					        <td>
				         		<form:input path="specifications" htmlEscape="false" maxlength="200" class="form-control"/>
				         	</td>
				      	</tr>
				      	<tr>
				      		<td>	
					        	单价： <font color="red">*</font>
					        </td>
					        <td>
				         		<form:input id="unitPrice" path="unitPrice" htmlEscape="false" maxlength="200" class="form-control myNumber required"/>
				         		
				         	</td>
				         	<td>	
					        	数量 ：<font color="red">*</font>
					        </td>
					        <td>
				         		<form:input id="amount" path="amount" htmlEscape="false" maxlength="200" class="form-control myNumber required"/>		         		
				         	</td>
				      	</tr>
				      	<tr>
					        <td>	
					        	供应商：
					        </td>
					        <td>
					         	<form:select path="supplier" class="form-control selectpicker " data-style="btn-inverse" data-live-search="true">
									<form:options items="${supList}" itemLabel="supName" itemValue="id" htmlEscape="false"/>
								</form:select>
					        </td>
					        <td>	
					         	单位：
					        </td>
					        <td>
								<form:select path="unit" class="form-control selectpicker " data-style="btn-inverse" data-live-search="true">
									<form:options items="${fns:getDictList('unit')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
								</form:select>
					        </td>
				      	</tr>
				      	<tr>
				      		<td>	
					        	采购日期： <font color="red">*</font>
					        </td>
					        <td>
				         		<input name="purchaseDate" type="text" readonly="readonly" maxlength="20" class="Wdate laydate-icon form-control layer-date input-sm required"
								value="<fmt:formatDate value="${fixedAssets.purchaseDate}" pattern="yyyy-MM-dd" />"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
				         		<span class="help-inline"> </span>
				         	</td>
				         	<td>	
					        	合计：
					        </td>
					        <td>
				         		<div id="subtotal">
								</div>
				         	</td>
				      	</tr>
				      	<tr>
				      		<td>	
					        	备注信息：
					        </td>
					        <td colspan="3">
				         		<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="form-control "/>
				         	</td>
				      	</tr>
						<tr>
							<td></td>
							<td colspan="3">
								<shiro:hasPermission name="fixedassets:fixedAssets:edit">
									<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;
									<input id="btnNext" class="btn btn-primary" type="button" value="添加下一条" onclick="window.location='${ctx}/fixedassets/fixedAssets/form'"/>&nbsp;
								</shiro:hasPermission>
								<input id="btnCancel" class="btn" type="button" value="返 回" onclick="window.location='${ctx}/fixedassets/assetsEquipment/claimList?assetsEquipment.condition=1'"/>
							</td>	
						</tr>	
					</tbody>
				</table>
			</form:form>
			<br>
			<br>
		</div>
	</div>
</div>
</body>
</html>