<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>保存车辆管理成功管理</title>
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
// 			checksave();//文档加载时判断
			
			 validateForm =$("#inputForm").validate({
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


<body>	
	<form:form id="inputForm" modelAttribute="carManagement" action="${ctx}/oa/carManagement/saveupdate" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<table class="table table-condensed dataTables-example dataTable no-footer myoa-table-noborder">
		   <tbody>
		      <tr>
		         <td>图片：</td>
		         <td>
		         	<form:hidden id="photo" path="photo" htmlEscape="false" maxlength="255"  class="form-control"/>
					<sys:ckfinder input="photo" type="images" uploadPath="/photo" selectMultiple="true" maxWidth="100" maxHeight="100"/>
				</td>	
				<td>车牌号： <span class="help-inline"><font color="red">*</font> </span></td>
		         <td><form:input path="platenum" htmlEscape="false" maxlength="64" class="form-control required"/>
					</td>	         
		      </tr>
	      
		      <tr>
		         <td>品牌：</td>
		         <td><form:select path="brand" class="form-control selectpicker" data-style="btn-inverse" data-live-search="true">
					<form:option value="" label="未选择"/>
					<form:options items="${fns:getDictList('brands')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
				 </td>
				 <td>型号：</td>
		         <td><form:input path="model" htmlEscape="false" maxlength="64" class="form-control"/></td>						         
		      </tr>
		      
		      <tr> 
		         <td>座位数： <span class="help-inline"><font color="red">*</font> </span></td>
		         <td><form:input path="seatnum" htmlEscape="false" maxlength="10" class="form-control"/></td>	
		         <td>公里数:</td>
		         <td><form:input path="kilometers" htmlEscape="false" class="form-control"/></td>	        
		      </tr>
		      
		       <tr>
		       	 <td>购买日期： <span class="help-inline"><font color="red">*</font> </span></td>
 		       	 <td><input name="buydate" type="text" readonly="readonly" maxlength="20" class="laydate-icon form-control layer-date input-sm" style="background-color: #FFFFFF;"
					value="<fmt:formatDate value="${carManagement.buydate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/></td>
		       	 <td>车架号：</td>
		         <td><span class="lbl"><form:input path="framenum" htmlEscape="false" maxlength="64" class="form-control"/></span></td>
		       </tr>
		       
		      <tr>
		       	 <td>车辆价格：</td>
		       	 <td><form:input path="price" htmlEscape="false" class="form-control"/></td>
		       	 <td>保险公司：</td>
		         <td><span class="lbl"><form:input path="insurer" htmlEscape="false" maxlength="64" class="form-control"/></span></td>		       	 
		      </tr>		      
		      
		      <tr>
		       	 <td>保单号：</td>
 		       	 <td><form:input path="policynum" htmlEscape="false" maxlength="64" class="form-control"/></td>	
 		       	 <td>行驶证号： <span class="help-inline"><font color="red">*</font> </span></td>
		         <td><span class="lbl"><form:input path="driverlicense" htmlEscape="false" maxlength="64" class="form-control required"/>
				</span></td>	       	 
		      </tr>

		      <tr>
		       	 <td>行驶证有效期： <span class="help-inline"><font color="red">*</font> </span></td>
		       	 <td><input name="dlicensedate" type="text" readonly="readonly" maxlength="20" class="laydate-icon form-control layer-date input-sm" style="background-color: #FFFFFF;"
					value="<fmt:formatDate value="${carManagement.dlicensedate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
				</td>
				<td>车辆状态： <span class="help-inline"><font color="red">*</font> </span></td>
		         <td>
					<form:select path="state" class="form-control selectpicker" data-style="btn-inverse" data-live-search="true">
					<form:options items="${fns:getDictList('carSta')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>					
				</td>		       	 
		      </tr>
			 </tbody>
		</table>
</form:form>		
</body>
</html>

<%-- <body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/oa/carManagement/">车辆列表</a></li>
		<li class="active"><a href="${ctx}/oa/carManagement/update?id=${carManagement.id}">车辆<shiro:hasPermission name="oa:carManagement:edit">${not empty carManagement.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="oa:carManagement:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="carManagement" action="${ctx}/oa/carManagement/saveupdate" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		
		<div class="control-group">	
			<label class="control-label">图片：</label>		
			<div class="controls">
				<form:hidden id="photo" path="photo" htmlEscape="false" maxlength="255" class="input-xlarge"/>
				<sys:ckfinder input="photo" type="images" uploadPath="/photo" selectMultiple="false" maxWidth="100" maxHeight="100"/>
<!-- 				<input id="File1" type="file"  accept=".jpg (*.jpg),.gif (*.gif)"  /> -->
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">车牌号：</label>
			<div class="controls">
				<form:input path="platenum" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">品牌：</label>
			<div class="controls">
				<form:select path="brand" class="input-xlarge required">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('brands')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">型号：</label>
			<div class="controls">
				<form:input path="model" htmlEscape="false" maxlength="64" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">座位数：</label>
			<div class="controls">
				<form:input path="seatnum" htmlEscape="false" maxlength="1" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">公里数：</label>
			<div class="controls">
				<form:input path="kilometers" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">购买日期：</label>
			<div class="controls">
				<input name="buydate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${carManagement.buydate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">车架号：</label>
			<div class="controls">
				<form:input path="framenum" htmlEscape="false" maxlength="64" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">车辆价格：</label>
			<div class="controls">
				<form:input path="price" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">保险公司：</label>
			<div class="controls">
				<form:input path="insurer" htmlEscape="false" maxlength="64" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">保单号：</label>
			<div class="controls">
				<form:input path="policynum" htmlEscape="false" maxlength="64" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">行驶证号：</label>
			<div class="controls">
				<form:input path="driverlicense" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">行驶证有效期：</label>
			<div class="controls">
				<input name="dlicensedate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
					value="<fmt:formatDate value="${carManagement.dlicensedate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group" style="display: none">
			<label class="control-label">车辆状态（0.正常  1.已停用）：</label>
			<div class="controls">
				<form:input id="state" path="state" htmlEscape="false" maxlength="1" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		
		<div class="form-actions">
			<shiro:hasPermission name="oa:carManagement:edit">
				<input id="btnSubmit" class="btn btn-primary" type="submit" value="提交" onclick="return choose();"/>&nbsp;
<!-- 				<input class="btn btn-primary" type="button" value="添加下一条"  -->
					onclick="window.location='${ctx}/oa/carManagement/form'"/>
			</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html> --%>