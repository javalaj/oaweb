<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="id" type="java.lang.String" required="true"%>
<%@ attribute name="cssClass" type="java.lang.String" required="false"%>
<%@ attribute name="cssStyle" type="java.lang.String" required="false"%>
<div id="${id}" class="mui-segmented-control mui-segmented-control-primary ${cssClass}" style="background: #fff;border-color: #12b7f5;${cssStyle}"></div>
<%-- 使用方法： 1.将本tag写在查询的form之前；2.传入table的id和controller的url --%>
<script type="text/javascript">
	$(document).ready(function() {
	    
	});
	function addCellTo${id}(data){
		var tpl = $("#tpl${id}").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
		$("#${id}").append(Mustache.render(tpl, data));
	}
</script>

<script type="text/template" id="tpl${id}">
	<a class="mui-control-item {{#isActive}}mui-active{{/isActive}}" href="javascript:;" onclick="location.href='{{url}}'">
		<i class="mui-icon {{icon}}" style="font-size:14px;">{{title}}</i>
	</a>
</script>
<style>

		.mui-bar-nav.mui-bar .mui-icon{
			margin:0;
			padding:0;
		}

		.mui-segmented-control {
			border-color: #12b7f5;	
		}
		.mui-segmented-control .mui-control-item.mui-active {
		    color: #fff;
		    background-color: #12b7f5;
		    height:30px;
		}
		.mui-segmented-control .mui-control-item{
			line-height:30px;
			color:#12b7f5;
			border-color: #12b7f5;
    		border-left: 1px solid #12b7f5;
		}
</style>