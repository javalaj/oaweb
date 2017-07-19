<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="id" type="java.lang.String" required="false" description="编号"%>
<%@ attribute name="title" type="java.lang.String" required="false" description="输入项名称"%>
<%@ attribute name="requiredTip" type="java.lang.String" required="false" description="需要红色高亮提示的字符"%>
<%@ attribute name="inputName" type="java.lang.String" required="false" description="输入控件的name属性值"%>
<%@ attribute name="cellType" type="java.lang.String" required="false" description="类型[commen(默认类型),input]"%>
<%@ attribute name="onclick" type="java.lang.String" required="false" description="点击事件触发的js方法，只支持cellType为commen(默认类型)的" %>
<%@ attribute name="cellStyle" type="java.lang.String" required="false" description="列表单元样式" %>
<c:if test="${empty cellType or cellType eq 'commen'}">
	<li id="${id}" class="mui-table-view-cell oa-cell-commen" onclick="${onclick}" style="${cellStyle}">
		<jsp:doBody></jsp:doBody>
	</li>
</c:if>

<c:if test="${cellType eq 'input'}">
	<li id="${id}" class="mui-table-view-cell oa-cell-input" style="padding:1px 15px" style="${cellStyle}">
		<table class="oa-cell-input-table" style="width:100%">
			<tbody>
				<tr>
					<td style="width:40%;" class="oa-cell-input-title">
						<label>${title}<font color="#EA5200">&nbsp;${requiredTip}</font></label>
					</td>
					<td style="width:60%;" class="oa-cell-input-contents">
						<jsp:doBody></jsp:doBody>
					</td>
				</tr>
				<tr>
					<td></td><td id="${inputName}ErrorPlacement" style="font-size: 13px"></td>
				</tr>
			</tbody>
		</table>
	</li>
</c:if>