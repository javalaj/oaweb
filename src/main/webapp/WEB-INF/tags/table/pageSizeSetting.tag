<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="page" type="com.thinkgem.jeesite.common.persistence.Page" required="true"%>
	<div class="pagination-detail " >
		<form>
			<a href="javascript:void(0);" style="color: #ffffff;">每页
				<input type="text" style="width:30px;height:20px;text-align:center;color:#999;border-radius: 3px;outline: 0;border: 1px solid rgba(0,0,0,.2);" value="${page.pageSize}" onkeypress="var e=window.event||event;var c=e.keyCode||e.which;if(c==13)${page.funcName}(${page.pageNo},this.value,'${page.funcParam}');" onclick="this.select();"/> 条数据
			</a>
		</form>
	</div>
<!-- pagination的css样式设定-->
<style>
.fixed-table-pagination div.pagination,
.fixed-table-pagination div.pagination-roll,
.fixed-table-pagination .pagination-detail {
    margin-top: 0px;
    margin-bottom: 10px;
}

.fixed-table-pagination div.pagination-roll .pagination,
.fixed-table-pagination div.pagination .pagination {
    margin: 0;
}

.fixed-table-pagination .pagination a {
    padding: 6px 12px;
    line-height: 1.428571429;
}

.fixed-table-pagination .pagination-info {
    line-height: 34px;
    margin-right: 5px;
}

.fixed-table-pagination .btn-group {
    position: relative;
    display: inline-block;
    vertical-align: middle;
}

.fixed-table-pagination .dropup .dropdown-menu {
    margin-bottom: 0;
}

.fixed-table-pagination .page-list {
    display: inline-block;
}

</style>