<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="oaDoc" type="com.thinkgem.jeesite.modules.oa.entity.doc.OaDoc" required="true" %>
<%@ attribute name="id" type="java.lang.String" required="true" %>
<ol id="Preview${oaDoc.id}file" style="list-style:none" ></ol>
<script type="text/javascript">
	function readCounter(oaDocId,downloadUserId){
		$.ajax({
			type: "POST",
			url: "${ctx}/oa/doc/oaDoc/readCounter",
			data: {oaDocId:oaDocId,downloadUserId:downloadUserId},
			dataType: 'json',
			success: function(data){
				
			}
		});
	}
	function preview${oaDoc.id}${id}(){
		var url='${oaDoc.file}';
		var li, urls = url.split("|");
		
		$("#Preview${oaDoc.id}${id}").children().remove();
		for (var i=0; i<urls.length; i++){
			if (urls[i]!=""){
				li = "<li><a href=\""+urls[i]+"\" url=\""+urls[i]+"\" target=\"_blank\" onclick=\"readCounter('${oaDoc.id}','${fns:getUser().id}');\">"+decodeURIComponent(urls[i].substring(urls[i].lastIndexOf("/")+1))+"</a></li>";
				$("#Preview${oaDoc.id}${id}").append(li);
			}
		}
		if ($("#Preview${oaDoc.id}${id}").text() == ""){
			$("#Preview${oaDoc.id}${id}").html("<li style='list-style:none;padding-top:5px;'></li>");
		}
	}
	
	preview${oaDoc.id}${id}();
</script>