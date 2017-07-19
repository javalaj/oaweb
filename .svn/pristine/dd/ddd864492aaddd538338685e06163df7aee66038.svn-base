<%@ tag language="java" pageEncoding="UTF-8" body-content="empty"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<script type="text/javascript">
<%String message=(String)session.getAttribute("message");
	if(message!=null&&!message.equals("")){
		out.print("top.layer.msg('"+message+"')");
		session.removeAttribute("message");
	}
%>
</script>