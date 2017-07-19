<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="urls" type="java.lang.String" required="true"%>
<%@ attribute name="id" type="java.lang.String" required="true"%>
<%@ attribute name="isMobile" type="java.lang.String" required="false"
	description="是否为手机端的附件显示"%>
<c:choose>
	<c:when test="${isMobile == 'true'}">
		<script type="text/javascript">
			var urlsa = "${urls}".split("|");
			var html = "";
			var path = "";
			for (var i = 0; i < urlsa.length; i++) {
				if (i != 0) {
					path = urlsa[i];
					html += '<a href="#" onclick="location.href=\''+path+'\'"  target="_blank">'
							+ decodeURIComponent(urlsa[i].substring(urlsa[i]
									.lastIndexOf("/") + 1))
							+ '&emsp;&emsp;</a>';
				}
			}
			$("#${id}").html(html);
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			var urlsa = "${urls}".split("|");
			var html = "";
			var path = "";
			for (var i = 0; i < urlsa.length; i++) {
				if (i != 0) {
					path = urlsa[i];
					html += '<a href=\"'+path+'\" class="printHidden" target="_blank">'
							+ decodeURIComponent(urlsa[i].substring(urlsa[i]
									.lastIndexOf("/") + 1))
							+ '&emsp;&emsp;</a><span class="printShow" hidden="true">'
							+ decodeURIComponent(urlsa[i].substring(urlsa[i]
									.lastIndexOf("/") + 1))
							+ '&emsp;&emsp;</span>';
				}
			}
			$("#${id}").html(html);
		</script>
	</c:otherwise>
</c:choose>