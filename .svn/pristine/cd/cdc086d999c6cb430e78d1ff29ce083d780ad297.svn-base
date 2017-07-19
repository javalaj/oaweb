<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="url" type="java.lang.String" required="true"%>
<%@ attribute name="title" type="java.lang.String" required="true"%>
<%@ attribute name="width" type="java.lang.String" required="false"%>
<%@ attribute name="height" type="java.lang.String" required="false"%>
<%@ attribute name="target" type="java.lang.String" required="false"%>
<%@ attribute name="id" type="java.lang.String" required="false"%>
<a href="#" onclick="view()" class="btn btn-info btn-xs" ><i class="fa fa-search-plus"></i> 查看</a>

<script type="text/javascript">
	function view()
	{	
		openDialogView('查看' + '${title}', '${url}',"${width==null?'800px':width}", "${height==null?'500px':height}","${target}");
	}
</script>