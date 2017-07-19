<%@ tag language="java" pageEncoding="UTF-8" body-content="empty"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="id" type="java.lang.String" required="true" description=""%>
<%@ attribute name="activeCellName" type="java.lang.String" required="true" description="[oaContractSales,oaContractPurchase,oaContractSub,oaContractProtocol]"%>
<oam:segmentedControl id="${id}"></oam:segmentedControl>

<script type="text/javascript">
	$(document).ready(function() {
		addCellTo${id}({title:"销售合同",url:"${mctx}/oa/contract/oaContractSales/",isActive:${activeCellName eq 'oaContractSales'}});
		addCellTo${id}({title:"采购合同",url:"${mctx}/oa/contract/oaContractPurchase/",isActive:${activeCellName eq 'oaContractPurchase'}});
		addCellTo${id}({title:"分包合同",url:"${mctx}/oa/contract/oaContractSub/",isActive:${activeCellName eq 'oaContractSub'}});
		addCellTo${id}({title:"协议框架",url:"${mctx}/oa/contract/oaContractProtocol/",isActive:${activeCellName eq 'oaContractProtocol'}});
		$("#${id} a:eq(0)").on("tap",function(){
			location.href = "${mctx}/oa/contract/oaContractSales/";
		});
		$("#${id} a:eq(1)").on("tap",function(){
			location.href = "${mctx}/oa/contract/oaContractPurchase/";
		});
		$("#${id} a:eq(2)").on("tap",function(){
			location.href = "${mctx}/oa/contract/oaContractSub/";
		});
		$("#${id} a:eq(3)").on("tap",function(){
			location.href = "${mctx}/oa/contract/oaContractProtocol/";
		});
	});
	
</script>



