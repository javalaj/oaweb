<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="id" type="java.lang.String" required="true"%>
<style type="text/css">
	.oa-search-group-cell-none{
	 	display: none!important;
	}
</style>
<div class="form-group oa-search-group" id="${id}">
	<jsp:doBody></jsp:doBody>
	<a class="btn btn-white btn-sm oa-search-group-plus"  onclick="${id}searchPlus()" style="outline-style: none;" ><i class="fa fa-plus"></i></a>
	<a class="btn btn-white btn-sm oa-search-group-divide"  onclick="${id}searchDivide()" style="outline-style: none;" ><i class="fa fa-minus"></i></a>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		${id}initSearchDiv();
	});
	
	function ${id}searchDivide(){
		$("#${id}.oa-search-group label:not(.oa-search-group-alwaysVisible)").addClass("oa-search-group-cell-none");
		$("#${id}.oa-search-group a.oa-search-group-plus").removeClass("oa-search-group-cell-none");
		$("#${id}.oa-search-group a.oa-search-group-divide").addClass("oa-search-group-cell-none");
    }
	function ${id}searchPlus(){
		$("#${id}.oa-search-group label").removeClass("oa-search-group-cell-none");
		$("#${id}.oa-search-group a.oa-search-group-divide").removeClass("oa-search-group-cell-none");
		$("#${id}.oa-search-group a.oa-search-group-plus").addClass("oa-search-group-cell-none");
    }
	function ${id}initSearchDiv(){
		$("#${id}.oa-search-group label:not(.oa-search-group-alwaysVisible)").addClass("oa-search-group-cell-none");
		if($("#${id}.oa-search-group label:not(.oa-search-group-alwaysVisible)").length<1){
			$("#${id}.oa-search-group a.oa-search-group-plus").addClass("oa-search-group-cell-none");
		}
		$("#${id}.oa-search-group a.oa-search-group-divide").addClass("oa-search-group-cell-none");
    }
</script>
		