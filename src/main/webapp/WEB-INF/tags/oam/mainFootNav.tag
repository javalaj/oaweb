<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="activeIndex" type="java.lang.String" required="false" description="需要高亮的页签编号[1,2,3,4]"%>
<link rel="stylesheet" href="${ctxStatic}/mobile/css/oabase.css" />
<nav class="mui-bar mui-bar-tab oa-bar-tab mui-bar-footer ">
	<a class="mui-tab-item ${activeIndex eq '1'?'mui-active':''}" id="tab1" > 
		<span class="mui-icon tabicon-message" style="margin-left: 0px;"></span>
		<span class="mui-tab-label">消息</span>
	</a> 
	
	<a class="mui-tab-item  ${activeIndex eq '2'?'mui-active':''}" id="tab2" >
		<span class="mui-icon tabicon-maillist" style="margin-left: 0px;"></span> 
		<span class="mui-tab-label">通讯录</span>
	</a> 
	
	<a class="mui-tab-item ${activeIndex eq '3'?'mui-active':''}" id="tab3" > 
		<span class="mui-icon tabicon-worktop " style="margin-left: 0px;"></span> 
		<span class="mui-tab-label">工作台</span>
	</a> 
	<a class="mui-tab-item ${activeIndex eq '4'?'mui-active':''}" id="tab4" >
		<span class="mui-icon tabicon-my" style="margin-left: 0px;"></span> 
		<span class="mui-tab-label">我的</span>
	</a>
</nav>
<script type="text/javascript">
$(document).ready(function() {
	$("#tab1").on("tap",function(){
		location.href = "${mctx}/oa/oaNotify/messageAll";
	});
	$("#tab2").on("tap",function(){
		location.href = "${mctx}/oa/contact/oaContact";
	});
	$("#tab3").on("tap",function(){
		location.href = "${ctx}";
	});
	$("#tab4").on("tap",function(){
		location.href = "${mctx}/sys/user/list";
	});
});
</script>