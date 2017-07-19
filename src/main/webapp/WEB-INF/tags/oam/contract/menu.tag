<%@ tag language="java" pageEncoding="UTF-8" body-content="empty"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="id" type="java.lang.String" required="true" description=""%>
<%@ attribute name="hideMenuCellName" type="java.lang.String" required="true" description="[oaContractSales,oaContractPurchase,oaContractSub,oaContractProtocol]"%>
<oam:menu1 id="${id}"  height="140px" width="100px">
	<c:if test="${hideMenuCellName ne 'oaContractSales'}">
		<oam:menu1Cell id="tab1" title="销售合同" url="${mctx}/oa/contract/oaContractSales/" ></oam:menu1Cell>
	</c:if>
	<c:if test="${hideMenuCellName ne 'oaContractPurchase'}">
		<oam:menu1Cell id="tab1" title="采购合同" url="${mctx}/oa/contract/oaContractPurchase/" ></oam:menu1Cell>
	</c:if>
	<c:if test="${hideMenuCellName ne 'oaContractSub'}">
		<oam:menu1Cell id="tab1" title="分包借阅" url="${mctx}/oa/contract/oaContractSub/" ></oam:menu1Cell>
	</c:if>
	<c:if test="${hideMenuCellName ne 'oaContractProtocol'}">
		<oam:menu1Cell id="tab1" title="协议框架" url="${mctx}/oa/contract/oaContractProtocol/" ></oam:menu1Cell>
	</c:if>
</oam:menu1>
