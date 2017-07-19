<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="id" type="java.lang.String" required="false"%>
<%@ attribute name="height" type="java.lang.String" required="true"%>
<%@ attribute name="width" type="java.lang.String" required="false"%>	
<style>
		div.menu1 {
			position: fixed;
			top: 16px;
			right: 6px;
			width:${not empty width?width:'130px'};
			height: ${height};
		}
		div.menu1 .mui-popover-arrow {
			left: auto;
			right: 6px;
		}
</style>

<!--右上角弹出菜单-->
<div id="${id}" class="mui-popover menu1">
	<div class="mui-popover-arrow"></div>
	<div class="mui-scroll-wrapper">
		<div class="mui-scroll">
			<ul class="mui-table-view">
				<jsp:doBody></jsp:doBody>
			</ul>
		</div>
	</div>
</div>
<script type="text/javascript"  charset="utf-8">
mui('.mui-scroll-wrapper').scroll();
</script>