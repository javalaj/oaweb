<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="url" type="java.lang.String" required="true"%>
<%@ attribute name="title" type="java.lang.String" required="true"%>
<%@ attribute name="width" type="java.lang.String" required="false"%>
<%@ attribute name="height" type="java.lang.String" required="false"%>
<%@ attribute name="target" type="java.lang.String" required="false"%>
<%@ attribute name="label" type="java.lang.String" required="false"%>
<a href="#" onclick="modify()" class="btn btn-success btn-xs" style="outline-style: none;"><i class="fa fa-edit"></i> 修改</a>
<script type="text/javascript">
	function modify(){
		openDialog("修改"+'${title}',"${url}","${width==null?'800px':width}", "${height==null?'500px':height}","${target}");
	}
</script>