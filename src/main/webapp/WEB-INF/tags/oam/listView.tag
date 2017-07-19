<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="id" type="java.lang.String" required="false"%>

<style>
.oa-listView:before {
    background:transparent
}
.oa-listView:after {
    background:transparent
}
.oa-listView ul>li:last:after {
    background:transparent
}

.oa-listView:after{
	background:transparent
}
.oa-listView .oa-cell-input .oa-cell-input-title td{
   font-weight: 700;
   width:35%;
}
.oa-listView .oa-cell-input .oa-cell-input-contents td{
   font-weight: 500;
   width:65%;
}
.oa-listView .oa-cell-input .oa-cell-input-title label{
   word-break:break-all;
}
.oa-listView .oa-cell-input .oa-cell-input-contents div:not(.treeselect-div){
    border-radius: 3px;
    border: 1px solid #d8d8d8;
    width: 100%;
    padding: 5px 14px;
    margin-bottom:0px;
    font-weight: 500;
    word-break:break-all;
    min-height: 34px;
}
.oa-listView .oa-cell-input input{
    border-radius: 3px;
    border: 1px solid #d8d8d8;
    height: 34px;
    font-weight: 500;
    font-size: 14px;
}
.oa-listView .oa-cell-input input.mui-datetime.oa-datePicker{
    text-align: left;
}
.oa-listView .oa-cell-input textarea{
    border-radius: 3px;
    border: 1px solid #d8d8d8;
    font-weight: 500;
    font-size: 14px;
}
.oa-listView .oa-cell-input select{
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
.oa-listView .oa-cell-input .oa-cell-input-table{
	margin-top: 5px;
	margin-bottom: 5px;
	font-size: 14px;
} 
</style>
<ul id="${id}" class="mui-table-view oa-listView">
	<jsp:doBody></jsp:doBody>
</ul>


