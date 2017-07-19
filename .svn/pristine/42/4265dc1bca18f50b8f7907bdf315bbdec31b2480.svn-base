<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>日程管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				
				rules: {
					"compere.name": {
				        required: true
				     },
				     "actor.name": {
					        required: true
					     },
				},
			    messages: {
			    	"compere.name": {
			          required: "必填信息",
			        },
			        "actor.name": {
				          required: "必填信息",
				        },
			    },
				
			
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
			
			$("#select").change(function(){
			     var select=$("#select").val();
				if(select==0){
					//工作任务
					alert("1");
				}else if(select==1){
					//私人活动进入页面
					window.location.href="${ctx}/oa/mytask/oaPlan/href";
				}else{
					
				}
				
				
			})
		});
	</script>
	<style>
		.table tr td:nth-of-type(2n-1){
			width:10%;
			overflow: hidden;
			text-overflow:ellipsis;
			white-space: nowrap;
		}
		input[type="radio"]{
			margin:0 4px 0 10px;
		}
	</style>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<div class="ibox-title">
				<h5>会议详情</h5>
			</div>
			<div class="ibox-content">
				<form:form id="inputForm" modelAttribute="oaPlan"
		action="${ctx}/oa/mytask/oaPlan/take" method="post"
		class="form-horizontal">
		<input style="display: none;" class="btn" name="id"
				value="${oaPlan.id }" />
		<sys:message content="${message}" />
		<%-- 		<div class="control-group">
			<label class="control-label">日程图标：</label>
			<div class="controls">
				<form:input path="planIcon" htmlEscape="false" maxlength="64" class="input-xlarge "/>
			</div>
		</div> --%>
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">

			<tr>
				<td>计划类型：</td>
				<td><font color="red"> <c:choose>
							<c:when test="${oaPlan.planType==0}">
    工作任务
    </c:when>
							<c:when test="${oaPlan.planType==2}">
    会议
    </c:when>
							<c:otherwise>
        私人活动
    </c:otherwise>
						</c:choose>
				</font></td>
				
				<td>会议主题：</td>
				<td colspan="4"><font color="red"> ${oaPlan.planTitle }

				</font></td>
			</tr>
			<tr>
				<td>主持人:</td>
				<td>${Comperename }</td>
				<td>会议日期：</td>
				<td><font color="red"> <fmt:formatDate
							value="${oaPlan.startDay}" pattern="yyyy-MM-dd" />
				</font></td>
				<td>开始时间：</td>
				<td><font color="red">${oaPlan.startTime}</font></td>
				

			</tr>
			<tr>
				
			</tr>
			<tr>
				
				<td>参与者:</td>
				<td colspan="6"><c:forEach var="Actorname" items="${Actorname }">
						<c:out value="${Actorname}" />
					</c:forEach></td>
			</tr>
			<tr>
				<td>会议内容：</td>
				<td colspan="5"><textarea rows="4" maxlength="1000" style="width:100%;padding:6px;border-radius: 6px;
				border:1px solid #ddd;"
						class="input-xxlarge " readonly="readonly">${oaPlan.content }</textarea>
				</td>
			</tr>
			<tr>
				<td>是否参加</td>
				<td colspan="5"><c:if test="${oaPlan.isback==0 }">
				<input type="radio" name="c" value="2" checked="checked" class="i-checks"><span>参加</span>
		<input type="radio" name="c" value="1" class="i-checks"><span>不参加</span>
		
		</c:if></td>
			</tr>
		<input style="display: none;" class="btn" name="planTitle"
				value="${oaPlan.planTitle }" />
			<input style="display: none;" class="btn" name="cruse"
				value="${cruse }" />

		</table>

		<div class="form-actions">
			
			<c:if test="${oaPlan.isback==0 }">
				<input id="btnCancel" class="btn btn-myoa btn-myoa-large" type="submit" value="保 存" />
			</c:if>
			<input id="btnCancel" class="btn btn-myoa" type="button" value="返 回"
				onclick="history();" />
		</div>
	</form:form>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	function history(){
		window.location.href="${ctx}/oa/oaNotify/self";
	}
		
		</script>
</body>
</html>