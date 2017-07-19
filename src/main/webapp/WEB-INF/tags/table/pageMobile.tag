<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="page" type="com.thinkgem.jeesite.common.persistence.Page" required="true"%>
<%@ attribute name="showPageOne" type="java.lang.Boolean" required="false"%>
<%@ attribute name="showPageTwo" type="java.lang.Boolean" required="false"%>
<%@ attribute name="id" type="java.lang.String" required="false" description="编号"%>
<%-- 表格分页工具栏，使用方法： 原样输出page --%>
<script type="text/javascript">

	$(document).ready(function() {
		
		var begin = ${page.pageNo} - (${page.length} / 2);

		if (begin < ${page.first}) {
			begin = ${page.first};
		}
		
		var end = begin + ${page.length} - 1;
		if (end >= ${page.last}) {
			end = ${page.last};
			begin = end - ${page.length} + 1;
			if (begin < ${page.first}) {
				begin = ${page.first};
			}
		}
		var pageSelector="ul.pagination.pagination-outline";
		if("${id}"!=null&&"${id}"!=""){
			pageSelector=pageSelector+"#"+"${id}";
		}
		if(${page.last}<=1){
			$(pageSelector).hide();
		}
		
		if (begin > ${page.first}) {
			var i = 0;
			for (i = ${page.first}; i < ${page.first} + ${page.slider} && i < begin; i++) {
				$(pageSelector).append("<li class=\"paginate_button \"><a href=\"javascript:void(0);\" onclick=\"${page.funcName}("+i+",${page.pageSize},'${page.funcParam}');\">"
						+ (i + 1 - ${page.first}) + "</a></li>");
			}
			if (i < begin) {
				$(pageSelector).append("<li class=\"paginate_button disabled\"><a href=\"javascript:void(0);\">...</a></li>");
			}
		}
		
		for (var i = begin; i <= end; i++) {
			if (i == ${page.pageNo}) {
				$(pageSelector).append("<li class=\"paginate_button active\"><a href=\"javascript:void(0);\">" + (i + 1 - ${page.first}) + "</a></li>");
			} else {
				$(pageSelector).append("<li class=\"paginate_button \"><a href=\"javascript:void(0);\" onclick=\"${page.funcName}("+i+",${page.pageSize},'${page.funcParam}');\">"
						+ (i + 1 - ${page.first}) + "</a></li>");
			}
		}

		if (${page.last} - end > ${page.slider}) {
			$(pageSelector).append("<li class=\"paginate_button disabled\"><a href=\"javascript:void(0);\">...</a></li>");
			end = ${page.last}  - ${page.slider};
		}

		for (var i = end + 1; i <= ${page.last} ; i++) {
			$(pageSelector).append("<li class=\"paginate_button \"><a href=\"javascript:void(0);\" onclick=\"${page.funcName}("+i+",${page.pageSize},'${page.funcParam}');\">"
					+ (i + 1 - ${page.first}) + "</a></li>");
		}

		if (${page.pageNo} == ${page.last}) {
			$(pageSelector).append("<li class=\"paginate_button next disabled\"><a href=\"javascript:void(0);\"><i class=\"fa fa-angle-right\"></i></a></li>");
			$(pageSelector).append("<li class=\"paginate_button next disabled\"><a href=\"javascript:void(0);\"><i class=\"fa fa-angle-double-right\"></i></a></li>");
		} else {
			$(pageSelector).append("<li class=\"paginate_button next\"><a href=\"javascript:void(0);\" onclick=\"${page.funcName}(${page.next},${page.pageSize},'${page.funcParam}');\">"
					+ "<i class=\"fa fa-angle-right\"></i></a></li>");
			$(pageSelector).append("<li class=\"paginate_button next\"><a href=\"javascript:void(0);\" onclick=\"${page.funcName}(${page.last},${page.pageSize},'${page.funcParam}');\">"
					+ "<i class=\"fa fa-angle-double-right\"></i></a></li>");
		}
	});	
</script>
<div class="fixed-table-pagination" style="text-align:center;font-size:15px;background-color:#e9e9e9">
	<div class="pagination-roll" style="${showPageTwo eq 'false'?'display:none':''}">
		<ul class="pagination pagination-outline" id="${id}" style="margin-top:8px;margin-bottom:6px;color: rgb(154, 154, 154);">
			<c:choose>
				<c:when test="${page.pageNo eq page.first}">
					<li class="paginate_button previous disabled"><a href="javascript:void(0);"><i class="fa fa-angle-double-left"></i></a></li>
					<li class="paginate_button previous disabled"><a href="javascript:void(0);"><i class="fa fa-angle-left"></i></a></li>
				</c:when>
				<c:otherwise>
					<li class="paginate_button previous"><a href="javascript:void(0);" onclick="${page.funcName}(${page.first},${page.pageSize},'${page.funcParam}');"><i class="fa fa-angle-double-left"></i></a></li>
					<li class="paginate_button previous"><a href="javascript:void(0);" onclick="${page.funcName}(${page.prev},${page.pageSize},'${page.funcParam}');"><i class="fa fa-angle-left"></i></a></li>
				</c:otherwise>
			</c:choose>
		</ul>	
	</div>
	<div class="pagination-detail" style="margin-top:2px;${showPageOne eq 'false'?'display:none':'display:none'}">
		<form>
			<a href="javascript:void(0);" style="color: rgb(154, 154, 154);">第
				<input type="text" style="width:50px;height:20px;text-align:center;color:#999" value="${page.pageNo}" onkeypress="var e=window.event||event;var c=e.keyCode||e.which;if(c==13)${page.funcName}(this.value,${page.pageSize},'${page.funcParam}');" onclick="this.select();"/>页，每页
				<input type="text" style="width:50px;height:20px;text-align:center;color:#999" value="${page.pageSize}" onkeypress="var e=window.event||event;var c=e.keyCode||e.which;if(c==13)${page.funcName}(${page.pageNo},this.value,'${page.funcParam}');" onclick="this.select();"/> 条,共${page.count}条
			</a>
		</form>
	</div>	
</div>
<!-- pagination的css样式设定-->
<style>
.fixed-table-pagination div.pagination,
.fixed-table-pagination div.pagination-roll,
.fixed-table-pagination .pagination-detail {
    margin-top: 0px;
    margin-bottom: 0px;
}

.fixed-table-pagination div.pagination-roll .pagination,
.fixed-table-pagination div.pagination .pagination {
    margin: 0;
}

.fixed-table-pagination .pagination a {
    padding: 4px 6px;
    line-height: 1.428571429;
    border-color: #f4f4f4;
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
.pagination>.disabled>a, .pagination>.disabled>a:focus, .pagination>.disabled>a:hover, .pagination>.disabled>span, .pagination>.disabled>span:focus, .pagination>.disabled>span:hover {
    color: #777;
    cursor: not-allowed;
    background-color: #f5f5f5;
}
</style>