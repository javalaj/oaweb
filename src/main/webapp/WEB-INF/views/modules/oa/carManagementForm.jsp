<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>保存车辆管理成功</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
	$.validator.addMethod('checkKilometers',function(value,element,params){
		if(value==''){
			return true;
		}else if(value<params[0] || isNaN(value)){
			return false;
		}else{
			return true;
		}
		},'请输入大于或等于0的数字');
		
	$.validator.addMethod('checkPrice',function(value,element,params){		
		if(value==''){
			return true;
		}else if(value<=params[0] || isNaN(value)){
			return false;
		}else{
			return true;
		}
		},'请输入大于0的数字');
	
	$.validator.addMethod('checkplatenum',function(value,element,params){
		if(params.indexOf(','+value+',') != -1){
			return false;
		}
		return true;
		},'已存在此车牌号');
	
		$(document).ready(function() {
			checksave();//文档加载时判断
			$("#inputForm").validate({
				 rules:{
					 seatnum:{
						 digits:true
					 },
					 kilometers:{
						 checkKilometers:[0.1]
					 },
					 price:{
						 checkPrice:[0]
					 },
					 platenum:{
						 checkplatenum:'${platenum}'
					 } 
				 },
				 messages:{
					 seatnum:{
						 digits:"请输入一个整数"
					 }				
				 },
				submitHandler: function(form){
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
		function checksave(){
			var id = "${carManagement.id}";
			if (id != null && id != ""){
				document.getElementById("btnSubmit").setAttribute("disabled",true);
			}else{
				document.getElementById("btnNext").setAttribute("disabled",true);
			}
		} 

	</script>
	<style>
		.table.myoa-table-noborder  > thead > tr > th, 
		.table.myoa-table-noborder  > tbody > tr > th, 
		.table.myoa-table-noborder  > tfoot > tr > th, 
		.table.myoa-table-noborder  > thead > tr > td, 
		.table.myoa-table-noborder  > tbody > tr > td, 
		.table.myoa-table-noborder  > tfoot > tr > td {
			border-top: none;
		}
		.table.myoa-table-noborder > tbody > tr > td:nth-chilid(odd) {
			width: 20%;
		}
	</style>
</head>


<%-- <body>	
	<form:form id="inputForm" modelAttribute="carManagement" action="${ctx}/oa/carManagement/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
		   <tbody>
		    <tr>
		         <td class="width-15 active"><label class="pull-right">图片：</label></td>
		         <td class="width-35">
		         	<form:hidden id="photo" path="photo" htmlEscape="false" maxlength="255"  class="form-control"/>
					<sys:ckfinder input="photo" type="images" uploadPath="/photo" selectMultiple="true" maxWidth="100" maxHeight="100"/>
				</td>
		         <td class="width-15 active"><label class="pull-right">车牌号：</label></td>
		         <td class="width-35"><form:input path="platenum" htmlEscape="false" maxlength="64" class="form-control required"/>
					<span class="help-inline"><font color="red">*</font> </span></td>
		      </tr>
		      
		      <tr>
		         <td class="active"><label class="pull-right">品牌：</label></td>
		         <td><form:select path="brand" class="form-control required">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('brands')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select><span class="help-inline"><font color="red">*</font> </span></td>
				</td>
		         <td class="active"><label class="pull-right">型号：</label></td>
		         <td><form:input path="model" htmlEscape="false" maxlength="64" class="form-control"/></td>
		      </tr>
		      
		      <tr>
		         <td class="active"><label class="pull-right">座位数：</label></td>
		         <td><form:input path="seatnum" htmlEscape="false" maxlength="10" class="form-control required"/>
				<span class="help-inline"><font color="red">*</font> </span></td>
		         <td class="active"><label class="pull-right">公里数:</label></td>
		         <td><form:input path="kilometers" htmlEscape="false" class="form-control"/></td>
		      </tr>		      
		       <tr>
		       	 <td class="active"><label class="pull-right">购买日期：</label></td>
 		       	 <td><input name="buydate" type="text" readonly="readonly" maxlength="20" class="laydate-icon form-control layer-date input-sm required" style="background-color: #FFFFFF;"
					value="<fmt:formatDate value="${carManagement.buydate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
					<span class="help-inline"><font color="red">*</font> </span></td>
		       	 <td class="active"><label class="pull-right">车架号：</label></td>
		         <td><span class="lbl"><form:input path="framenum" htmlEscape="false" maxlength="64" class="form-control"/></span></td>
		      </tr>		       
		      <tr>
		       	 <td class="active"><label class="pull-right">车辆价格：</label></td>
		       	 <td><form:input path="price" htmlEscape="false" class="form-control"/></td>
		       	 <td class="active"><label class="pull-right">保险公司：</label></td>
		         <td><span class="lbl"><form:input path="insurer" htmlEscape="false" maxlength="64" class="form-control"/></span></td>
		      </tr>		      
		      <tr>
		       	 <td class="active"><label class="pull-right">保单号：</label></td>
 		       	 <td><form:input path="policynum" htmlEscape="false" maxlength="64" class="form-control"/></td>
		       	 <td class="active"><label class="pull-right">行驶证号：</label></td>
		         <td><span class="lbl"><form:input path="driverlicense" htmlEscape="false" maxlength="64" class="form-control required"/>
				<span class="help-inline"><font color="red">*</font> </span></span></td>
		      </tr>		       
		      <tr>
		       	 <td class="active"><label class="pull-right">行驶证有效期：</label></td>
		       	 <td><input name="dlicensedate" type="text" readonly="readonly" maxlength="20" class="laydate-icon form-control layer-date input-sm required" style="background-color: #FFFFFF;"
					value="<fmt:formatDate value="${carManagement.dlicensedate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
				<span class="help-inline"><font color="red">*</font> </span></td>
		       	 <td class="active"><label class="pull-right">车辆状态（0.正常  1.已停用）：</label></td>
		         <td>
		         	<span class="lbl">
		         	<form:input id="state" path="state" htmlEscape="false" maxlength="10" class="form-control required" value="正常"/>
					<span class="help-inline"><font color="red">*</font> </span></span>
					<form:select path="state" class="form-control required">
					<form:options items="${fns:getDictList('carSta')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				</td>
		      </tr>
			 </tbody>
		</table>
</form:form>		
</body>
</html>  --%>

<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox" style="width: 800px;margin: 0 auto;">
			<div class="ibox-title">
				<h5><a href="${ctx}/oa/carManagement/form?id=${carManagement.id}">车辆<shiro:hasPermission name="oa:carManagement:edit">${not empty carManagement.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="oa:carManagement:edit">查看</shiro:lacksPermission></a></h5>		
			</div>
			<div class="ibox-content">
				<%-- <ul class="nav nav-tabs myoa-tabs">
					<li><a href="${ctx}/oa/carManagement/">车辆列表</a></li>
					<li class="active"><a href="${ctx}/oa/carManagement/form?id=${carManagement.id}">车辆<shiro:hasPermission name="oa:carManagement:edit">${not empty carManagement.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="oa:carManagement:edit">查看</shiro:lacksPermission></a></li>
				</ul> --%>
				<form:form id="inputForm" modelAttribute="carManagement" action="${ctx}/oa/carManagement/save" method="post" class="form-horizontal myoa-details-form">
					<form:hidden path="id"/>
					<sys:message content="${message}"/>		
					
					<table class="table myoa-table-noborder">
						<tr>
							<td>图片：</td>
							<td><form:hidden id="photo" path="photo" htmlEscape="false" maxlength="255" class="input-xlarge"/>
								<sys:ckfinder input="photo" type="images" uploadPath="/photo" selectMultiple="fasle" maxWidth="100" maxHeight="100"/>
							</td>
							<td>车牌号： <span class="help-inline"><font color="red">*</font></span></td>
							<td>
								<form:input path="platenum" htmlEscape="false" maxlength="64"  class="form-control required"/>
							</td>
						</tr>
						<tr>
							<td>品牌： <span class="help-inline"><font color="red">*</font> </span></td>
							<td><form:select path="brand" class="form-control selectpicker" data-style="btn-inverse" data-live-search="true" required="required">
								<form:option value="" label="未选择"/>
								<form:options items="${fns:getDictList('brands')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>
							</td>
							<td>型号： <span class="help-inline"><font color="red">*</font></span></td>
							<td>
								<form:input path="model" htmlEscape="false" maxlength="64"  class="form-control" required="required"/>
							</td>
						</tr>
						<tr>
							<td>座位数： <span class="help-inline"><font color="red">*</font> </span></td>
							<td><form:input path="seatnum" htmlEscape="false" maxlength="4"  class="form-control required"/>
							</td>
							<td>公里数：</td>
							<td>
								<form:input path="kilometers" htmlEscape="false"  class="form-control"/>
							</td>
						</tr>
						<tr>
							<td>购买日期： <span class="help-inline"><font color="red">*</font></span><!-- class="input-medium Wdate required" --></td>
							<td><input name="buydate" type="text" readonly="readonly" maxlength="20" class="form-control required"  
								value="<fmt:formatDate value="${carManagement.buydate}" pattern="yyyy-MM-dd"/>"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
							</td>
							<td>车架号：</td>
							<td>
								<form:input path="framenum" htmlEscape="false" maxlength="64"  class="form-control" />
							</td>
						</tr>
						<tr>
							<td>车辆价格：</td>
							<td><form:input path="price" htmlEscape="false"  class="form-control" />
							</td>
							<td>保险公司：</td>
							<td>
								<form:input path="insurer" htmlEscape="false" maxlength="64"  class="form-control" />
							</td>
						</tr>
						<tr>
							<td>保单号：</td>
							<td><form:input path="policynum" htmlEscape="false" maxlength="64"  class="form-control" />
							</td>
							<td>行驶证号： <span class="help-inline"><font color="red">*</font></span></td>
							<td>
								<form:input path="driverlicense" htmlEscape="false" maxlength="64"  class="form-control required" />
							</td>
						</tr>
						<tr>
							<td>行驶证有效期：<span class="help-inline"><font color="red">*</font></span></td>
							<td><input name="dlicensedate" type="text" readonly="readonly" maxlength="20" class="form-control required"  
								value="<fmt:formatDate value="${carManagement.dlicensedate}" pattern="yyyy-MM-dd"/>"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
							</td>
							<td>车辆状态： <span class="help-inline"><font color="red">*</font> </span></td>
							<td>
								<form:select path="state"  class="form-control required selectpicker" 
			         		data-style="btn-inverse" data-live-search="true">
									<form:options items="${fns:getDictList('carSta')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
								</form:select>
							</td>
						</tr>
						<tr>
							<td></td>
							<td><shiro:hasPermission name="oa:carManagement:edit">
								<input id="btnSubmit" class="btn btn-myoa" type="submit" value="提交"/>&nbsp;
								<input id="btnNext" class="btn btn-myoa" type="button" value="添加下一条" 
								onclick="window.location='${ctx}/oa/carManagement/form'"/>&nbsp;
							</shiro:hasPermission>
							<input id="btnCancel" class="btn" type="button" value="返 回" onclick="window.location='${ctx}/oa/carManagement/list'"/></td>
						</tr>
					</table>					
					
				</form:form>
			</div>
		</div>
	</div>/		
</body>
</html>