<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="activeIndex" type="java.lang.String" required="true" description=""%>
<script type="text/javascript">
$.ajax({
	type: "POST",
	url: "${ctx}/oa/doc/oaDoc/getOaDocListCount",
	dataType: 'json',
	success: function(data){
		if(data.status=='ok'){
			resetOaTabcellBadgedocTab("doc","("+data.countCommon+")");
			resetOaTabcellBadgedocTab("docOffice","("+data.countOffice+")");
			resetOaTabcellBadgedocTab("docPublic","("+data.countPublic+")");
			resetOaTabcellBadgedocTab("docReadApply","("+data.countReadApply+")");
		}
	},
	error:function(xmlr, textStatus, errorThrown){
		if(xmlr.status==403){
		}else{
			layer.confirm("未登录或登录超时。请重新登录，谢谢！", {
			  	btn: ["确定", "取消"],
			  	btn2: function(index, layero){
			  		}
				},
				function(index, layero){
					top.location.reload();
					layer.close(index);
				}
			);
		}
	}
});
</script>
<oa:tab id="docTab">
	<oa:tabCell id="docPublic" href="${ctx}/oa/doc/oaDoc/publicList" label="共享文档" isActive="${activeIndex eq '3'}" isShowBadge="true"></oa:tabCell>
	<oa:tabCell id="docOffice" href="${ctx}/oa/doc/oaDoc/officeList" label="部门文档" isActive="${activeIndex eq '2'}" isShowBadge="true"></oa:tabCell>
	<oa:tabCell id="docReadApply" href="${ctx}/oa/doc/oaDocReadApply/myList" label="我的借阅" isActive="${activeIndex eq '4'}" isShowBadge="true"></oa:tabCell>
	<oa:tabCell id="doc" href="${ctx}/oa/doc/oaDoc" label="我的文档" isActive="${activeIndex eq '1'}" isShowBadge="true"></oa:tabCell>
</oa:tab>
