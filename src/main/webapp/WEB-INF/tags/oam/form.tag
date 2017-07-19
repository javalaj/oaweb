<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="id" type="java.lang.String" required="false"%>
<%@ attribute name="modelAttribute" type="java.lang.String" required="false"%>
<%@ attribute name="action" type="java.lang.String" required="false"%>
<%@ attribute name="method" type="java.lang.String" required="false"%>
<form:form id="${id}" modelAttribute="${modelAttribute}" action="${action}" method="${method}" class="mui-input-group oam-form">
	<jsp:doBody></jsp:doBody>
</form:form>

<script type="text/javascript">
	
	var validateForm;
	function doSubmit(){//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
	  if(validateForm.form()){
		$("#${id}").submit();
		 return true;
	  }
	  return false;
	}
	
	$(document).ready(function() {
		//$("#name").focus();
		validateForm = $("#${id}").validate({
			submitHandler: function(form){
				//loading('操作正在进行，请稍等...');
				form.submit();
			},
			errorPlacement: function(error, element) {
				$("#"+element.attr("name")+"ErrorPlacement").append(error);
			}
		});
		
	});	
</script>
<style>
/*  .oam-form:after{
background:transparent
}
.oam-form .oa-cell-input .oa-cell-input-title td{
   font-weight: 700;
   width:35%;
}
.oam-form .oa-cell-input .oa-cell-input-contents td{
   font-weight: 500;
   width:65%;
}
.oam-form .oa-cell-input .oa-cell-input-title label{
   word-break:break-all;
}
.oam-form .oa-cell-input .oa-cell-input-contents div:not(.treeselect-div){
    border-radius: 3px;
    border: 1px solid #d8d8d8;
    width: 100%;
    padding: 5px 14px;
    margin-bottom:0px;
    font-weight: 500;
    word-break:break-all;
    min-height: 34px;
}
.oam-form .oa-cell-input input{
    border-radius: 3px;
    border: 1px solid #d8d8d8;
    height: 34px;
    font-weight: 500;
    font-size: 14px;
}
.oam-form .oa-cell-input textarea{
    border-radius: 3px;
    border: 1px solid #d8d8d8;
    font-weight: 500;
    font-size: 14px;
}
.oam-form .oa-cell-input select{
	font-size: 14px;
	font-weight: 500;
    border-radius: 3px;
    border: 1px solid #d8d8d8 !important;
    height: 34px;
    padding-top: 5px !important;
    padding-right: 14px;
    margin-bottom:0px;
	appearance:none;
	-moz-appearance:none;
	-webkit-appearance:none;
	
	background: url("${ctxStatic}/easyui/themes/bootstrap/images/combo_arrow.png") no-repeat scroll right center transparent;
}
.oam-form .oa-cell-input .oa-cell-input-table{
	margin-top: 5px;
	margin-bottom: 5px;
	font-size: 14px;
}  */
input.error { border: 1px solid #EA5200; }
textarea.error { border: 1px solid #EA5200; }
select.error { border: 1px solid #EA5200!important; }
label.error {
	background:url("${ctxStatic}/jquery-validation/1.11.1/images/unchecked.gif") no-repeat 0px 3px;
	padding-left: 18px;
	padding-bottom: 2px;
	font-weight: bold;
	color: #EA5200;
	font-size: 12px;
	margin-bottom: 0px;
}
label.checked {
	background:url("${ctxStatic}/jquery-validation/1.11.0/demo/images/checked.gif") no-repeat 0px 0px;
}
</style>


