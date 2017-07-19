<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="files" type="java.lang.String" required="true" %>
<%@ attribute name="id" type="java.lang.String" required="true" %>
<ol id="Preview${id}" style="list-style:none" ></ol>
<script type="text/javascript">
	function preview${id}(){
		var url='${files}';
		var li, urls = url.split("|");
		
		$("#Preview${id}").children().remove();
		for (var i=0; i<urls.length; i++){
			if (urls[i]!=""){
				li = "<li><a href=\""+urls[i]+"\" url=\""+urls[i]+"\" target=\"_blank\" >"+decodeURIComponent(urls[i].substring(urls[i].lastIndexOf("/")+1))+"</a></li>";
				$("#Preview${id}").append(li);
			}
		}
		if ($("#Preview${id}").text() == ""){
			$("#Preview${id}").html("<li style='list-style:none;padding-top:5px;'></li>");
		}
	}
	preview${id}();
</script>