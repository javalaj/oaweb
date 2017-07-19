<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="id" type="java.lang.String" required="true" description="编号"%>
<%@ attribute name="name" type="java.lang.String" required="true" description="名称"%>
<%@ attribute name="options" type="java.lang.String" required="false" description="配置项"%>
<%@ attribute name="value" type="java.lang.String" required="false" description="值"%>
<%@ attribute name="onSelect" type="java.lang.String" required="false" description="选择回调函数"%>
<%@ attribute name="placeholder" type="java.lang.String" required="false" description="placeholder"%>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/mui-master/examples/hello-mui/css/mui.picker.min.css" />
<style>
.oa-datePicker{
text-align:center;border-radius: 3px;border: 1px solid #d8d8d8;height: 34px;font-weight: 500;font-size: 14px;
}
</style>
<script src="${ctxStatic}/mui-master/examples/hello-mui/js/mui.picker.min.js"></script>
<input class="mui-datetime oa-datePicker" type="text" readonly="readonly" name="${name}" id="${id}" value="${value}" onSelect="${onSelect}" placeholder="${placeholder}"/>
<script>
	$('#${id}.oa-datePicker')[0].addEventListener('tap', function() {
		var options = ${options};
		var picker = new mui.DtPicker(options);
		var now = $(this)[0];
		picker.show(function(rs) {
			now.value=rs.text; 
			picker.dispose();
			${onSelect};
		}); 
	}, false);
</script>


