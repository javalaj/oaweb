<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>采购物品信息管理</title>
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
			//$("#name").focus();
			validateForm=$("#inputForm").validate({
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
	</script>
</head>
<body style="padding: 0px"  class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<div class="ibox-title">
				<h5>
					采购物品信息<shiro:hasPermission name="oa:contract:oaContractPurchaseProduct:edit">${not empty oaContractPurchaseProduct.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="oa:contract:oaContractPurchaseProduct:edit">查看</shiro:lacksPermission>
				</h5>
				<div class="ibox-tools">
				</div>
			</div>
    		<div class="ibox-content">
				<div class="row">
					<div class="col-sm-12">
						<form:form id="inputForm" modelAttribute="oaContractPurchaseProduct" action="${ctx}/oa/contract/oaContractPurchaseProduct/save" method="post" class="form-horizontal">
							<form:hidden path="id"/>
							<form:hidden path="contractPurchase.id"/>
							<sys:message content="${message}"/>
							<table class="table table-condensed dataTables-example dataTable no-footer myoa-newitem-table">
							   <tbody>
							      <tr>
							         <td>	
							        	<label class="pull-right">名称： <span class="help-inline"><font color="red">*</font> </span></label>
							         </td>
							         <td>
							         	<form:input path="name" htmlEscape="false" maxlength="64" class="form-control required"/>
										
							         </td>
							         
							      </tr>
							      <tr>
							         
							         <td>	
							         	<label class="pull-right">品牌型号： <span class="help-inline"><font color="red">*</font> </span></label>
							         </td>
							         <td>
							         	<form:input path="productType" htmlEscape="false" maxlength="64" class="form-control required"/>
										
							         </td>
							      </tr>
							      <tr>
							         <td>	
							        	<label class="pull-right">单位： <span class="help-inline"><font color="red">*</font> </span></label>
							         </td>
							         <td>
							         	<form:input path="unit" htmlEscape="false" maxlength="64" class="form-control required"/>
										
							         </td>
							         
							      </tr>
							      <tr>
							         
							         <td>	
							         	<label class="pull-right">数量： <span class="help-inline"><font color="red">*</font> </span></label>
							         </td>
							         <td>
										<form:input path="num" htmlEscape="false" class="form-control number required"/>
										
							         </td>
							      </tr>
							      <tr>
							         <td>	
							        	<label class="pull-right">单价：</label>
							         </td>
							         <td>
										<form:input path="price" htmlEscape="false" class="form-control number required"/>
							         </td>							        
							      </tr>
							      <tr>							         
							         <td>	
							         	<label class="pull-right">备注信息：</label>
							         </td>
							         <td>
							         	<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="form-control "/>
							         </td>
							      </tr>
							      <tr>
							      	 <td></td>
							         <td>
							         	<div>
								         	<shiro:hasPermission name="oa:contract:oaContractPurchaseProduct:edit"><input id="btnSubmit" class="btn btn-myoa-sec" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
											<a href="${ctx}/oa/contract/oaContractPurchase/form?id=${oaContractPurchaseProduct.contractPurchase.id}&tabIndex=2"
												class="btn btn-white"><i class="fa fa-back"></i>返回</a>
										</div>
							         </td>
							      </tr>
							   </tbody>
						   </table> 				
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>