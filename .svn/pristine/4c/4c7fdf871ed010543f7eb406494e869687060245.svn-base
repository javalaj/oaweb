<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>易耗品管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
	var validateForm;
	function doSubmit(){//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
	  if(validateForm.form()){
		  $("#inputForm").submit();
		  return true;
	  }

	  return false;
	}
		$(document).ready(function() {
			inputChange();
			validateForm = $("#inputForm").validate({
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
		
				//小计
		function sum()
  		{
	  		if($("#unitPrice").val() != "")
		  		var unitPrice = parseFloat($("#unitPrice").val());
		  	else
		  		var unitPrice = parseFloat("0");
		  		
			if($("#amount").val() != "")
				var amount = parseInt($("#amount").val());
			else
				var amount = parseInt("0");
				
			var sum = amount * unitPrice;
			
			return sum;
  		}
  		
  		function inputChange()
  		{
  			$("#unitPrice").change(function(){ 
  		
				var a = sum();
	  			
	  			$("#subtotal").val(a);
  			}); 
  			
  			$("#amount").change(function(){ 
  		
				var a = sum();
	  			
	  			$("#subtotal").val(a);
  			}); 
  		}
  		
  		function checkNumber(obj)
  		{
  			var reg = /^\+?[1-9][0-9]*$/;
  			
  			var val = $(obj).val();
  			
  			if (!reg.test(val))
  			{
  				top.layer.msg("请输入正整数");
  				
  				$(obj).val(1);
  			}
  			else
  			{
	  			var value = parseInt(val);
	  			
	  			if (value < 0)
	  			{
	  				$(obj).val(1);
	  				
	  				var text = "必须大于0";
	  				
	  				top.layer.msg(text);
	  			}
  			}
  			
  		}
  		
  		function checkUnitPrice(obj)
  		{
  			var val = $(obj).val();
  			
  			var value = parseInt(val);
	  			
  			if (value < 0)
  			{
  				$(obj).val(1);
  				
  				var text = "必须大于0";
  				
  				top.layer.msg(text);
  			}
  		}
	</script>
	<style>
	.table tr td{
		height:34px;
	}
	.table tr td:first-child span{
        	position: relative;
        }
		.sgin-red:after{
        	position: absolute;
		    display: block;
		    content: '*';
		    color: red;
		    top: -2px;
    		right: -7px;
        }
		.table tr:last-child td{
			vertical-align: top;
		}
	</style>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox"  style="width:800px; margin:0 auto;">
			<div class="ibox-title">
				<h5>入库修改</h5>
			</div>
		<div class="ibox-content">
			<sys:message content="${message}"/>
			
			<div class="row">
				<div class="col-sm-12">
					<br/>
				</div>
			</div>	
			<form:form id="inputForm" modelAttribute="perishableProducts" action="${ctx}/perishableproducts/perishableProducts/modifysave" method="post" class="form-horizontal">
				<form:hidden path="id"/>
				<table class="table table-condensed dataTables-example dataTable no-footer myoa-newitem-table">
					<tbody>
						<tr>
							<td>	
				        		<label class="pull-right">图片</label>
				         	</td>
				         	<td >
				         		<form:hidden id="nameImage" path="photo" htmlEscape="false" maxlength="255" class="form-control"/>
								<sys:ckfinder input="nameImage" type="images" uploadPath="/photo" selectMultiple="false" maxWidth="100" maxHeight="100" /> 
					        </td>
					    </tr>
						<tr>
				         	<td>	
				         		<label class="pull-right"><span class="sgin-red">用品名称</span></label>
				         	</td>
				         	<td >
				         		<form:input path="itemName" htmlEscape="false" maxlength="8" class="form-control required"/>
				         		
				         	</td>		   
						</tr>
						<tr>
					        <td>	
					        	<label class="pull-right"><span class="sgin-red">用品类别</span></label>
					        </td>
					        <td>
					        	<div>
						         	<form:select path="itemCategory" class="form-control selectpicker required" data-style="btn-inverse" data-live-search="true">
										<form:options items="${fns:getDictList('item_category')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
									</form:select>
								</div>
					        </td>
					    </tr>
						<tr>
					        <td>	
					         	<label class="pull-right"><span class="sgin-red">数量</span></label>
					        </td>
					        <td>
								<form:input  id="amount" path="amount" htmlEscape="false" maxlength="3" class="form-control required" onchange="checkNumber(this)"/>
					        </td>
				      	</tr>
				      	<tr>
				      		<td>	
					        	<label class="pull-right">单价(元)</label>
					        </td>
					        <td>
				         		<input id="unitPrice" name="unitPrice" type="text" class="form-control number" onchange="checkUnitPrice(this)"
								value="<fmt:parseNumber integerOnly="true" value="${perishableProducts.unitPrice}"/>">
				         	</td>
				        </tr>
						<tr>
							<td>	
					        	<label class="pull-right">型号</label>
					        </td>
					        <td>
				         		<form:input path="model" htmlEscape="false" maxlength="6" class="form-control"/>
				         	</td>	         		
				      	</tr>
				      	<tr>
				      		<td>	
					        	<label class="pull-right">规格</label>
					        </td>
					        <td>
				         		<form:input path="specifications" htmlEscape="false" maxlength="10" class="form-control"/>
				         	</td>
				        </tr>
						<tr>
							<td>	
					        	<label class="pull-right"><span class="sgin-red">供应商</span></label>
					        </td>
					        <td>
				         		<div>
						         	<form:select path="supplier" class="form-control selectpicker required" data-style="btn-inverse" data-live-search="true">
										<form:options items="${supList}" itemLabel="supName" itemValue="id" htmlEscape="false"/>
									</form:select>
								</div>
				         	</td>	         		
				      	</tr>
				      	<tr>
							<td>	
					        	<label class="pull-right">品牌</label>
					        </td>
					        <td>
				         		<div>
						         	<form:select path="brand" class="form-control selectpicker" data-style="btn-inverse" data-live-search="true">
										<form:options items="${fns:getDictList('equ_brand')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
									</form:select>
								</div>
				         	</td>
				        </tr>
						<tr>
							<td>	
					        	<label class="pull-right"><span class="sgin-red">单位</span></label>
					        </td>
					        <td>
				         		<div>
						         	<form:select path="unit" class="form-control selectpicker required" data-style="btn-inverse" data-live-search="true">
										<form:options items="${fns:getDictList('unit')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
									</form:select>
								</div>
				         	</td>	         			      	
				      	</tr>
				      	<tr>
			      			<td>	
					        	<label class="pull-right">合计</label>
					        </td>
					        <td>
				         		<form:input id="subtotal" path="total" htmlEscape="false" class="form-control number" readonly="true"/>
				         	</td>
				        </tr>
				      	<tr>
							<td>	
					         	<label class="pull-right">备注信息</label>
					         </td>
					         <td>
								<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="form-control "/>
					         </td>	      	
				      	</tr>		      				
					</tbody>
				</table>
				<br>
				<div class="form-actions">
					<shiro:hasPermission name="perishableproducts:perishableProducts:edit">
						<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;
					</shiro:hasPermission>
					<input id="btnCancel" class="btn" type="button" value="返 回" onclick="window.location='${ctx}/perishableproducts/perishableProducts'"/>
				</div>
			</form:form>
		</div>
	</div>
</div>
</body>
</html>