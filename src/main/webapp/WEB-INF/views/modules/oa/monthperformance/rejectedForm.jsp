<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>驳回后重新申请</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						//$("#name").focus();
						$("#date1").val($("#date2").val());
						$("#btnSubmit1").click(function() {
							$(this).next().val("0");
							var judge1 = notnull(); 
							var judge2 =judgeInt();
							return judge1&&judge2;
							
						});
						$("#inputForm").validate({
							submitHandler : function(form) {
								oaLoading('操作正在进行中，请耐心等待');
								form.submit();
							},
						});
					});
	function del1line(item) {
		$(item).next().val("1");
		$(item).parent().parent().hide();
		return false;
	}
	function notnull() {
		var judge = true;
		$("input[name='schedule']").each(function() {
			var str = "";
			if ($(this).val().trim() == "" && !$(this).is(":hidden")) {
				judge = false;
				str = "必填信息 ";
			}else{
				judge = true;
				str = "* ";
			}
			$(this).next().children().text(str+"*");
		});
		return judge;
	}
	function judgeInt() {
		var judge = true;
		var str = "";
		var str1 = "*"
		var str2 = "输入正整数 *";
		$("input[name='schedule']").each(function() {
			if (!$(this).is(":hidden") && $(this).val() != "") {
				if (!(/^\d+$/.test($(this).val()))) {
					judge = false;
					str = str2;
				} else {
					str = str1;
				}
				$(this).next().children().text(str);
			}
		});
		return judge;
	}
</script>
<style type="text/css">
.add-del-png {
	width: 15px;
	height: 15px;
}
</style>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
<div class="ibox">
<div class="ibox-title">
		<h5>月绩效流程 </h5>
		<div class="ibox-tools">
		</div>
	</div>
   <div class="ibox-content">
   	<sys:message content="${message}"/>
   	<div class="row">
	<div class="col-sm-12">
	<br/>
	</div>
	</div>
		<form id="inputForm"   action="${ctx}/user/userWeekplan/rejecteExam" method="post" class="form-inline">
		<table class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
			<thead>
		<tr>
				<th style="text-align: center;">小组成员</th>
				<th style="text-align: center;">开始时间</th>
				<th style="text-align: center;">结束时间</th>
				<th style="text-align: center;">工作内容</th>
				<th style="text-align: center;">交付物</th>
				<th style="text-align: center;">工作权重</th>
				<th style="text-align: center;">进度分</th>
			</tr>
		</thead>
		<tbody>
		<c:set scope="page" var="inisign" value="-1" >
		</c:set>
		<%-- <c:forEach items="${us}" var="week" > --%>
		
		<c:forEach items="${us}" var="now2">
		<c:if test="${now2.weeksign!=inisign }">
		             <tr>
											<td  colspan="8" style="text-align: center;"><h1>
											第${now2.weeksign}周<input type="text"  style="display: none;"
										name="weeksign" value="${now2.weeksign}" maxlength="255"/></h1></td>
								</tr>
								<c:set scope="page" var="inisign" value="${ now2.weeksign}" >
		</c:set>
								</c:if>
						            	<tr>	
			<input type="text"  style="display: none;"
										name="id" value="${now2.id}" maxlength="255"/>
								<td style="text-align: center;" >${now2.creatName }</td>
								<td style="text-align: center;"><c:choose>
									<c:when test="${now2.beginday=='1' }">周一</c:when>
									<c:when test="${now2.beginday=='2' }">周二</c:when>
									<c:when test="${now2.beginday=='3' }">周三</c:when>
									<c:when test="${now2.beginday=='4' }">周四</c:when>
									<c:when test="${now2.beginday=='5' }">周五</c:when>
									<c:when test="${now2.beginday=='6' }">周六</c:when>
									<c:otherwise>周日</c:otherwise>
								</c:choose></td>

							<td style="text-align: center;"><c:choose>
									<c:when test="${now2.endday=='1' }">周一</c:when>
									<c:when test="${now2.endday=='2' }">周二</c:when>
									<c:when test="${now2.endday=='3' }">周三</c:when>
									<c:when test="${now2.endday=='4' }">周四</c:when>
									<c:when test="${now2.endday=='5' }">周五</c:when>
									<c:when test="${now2.endday=='6' }">周六</c:when>
									<c:otherwise>周日</c:otherwise>
								</c:choose></td>
							<td style="text-align: center;">${now2.content }</td>
							<td style="text-align: center;">${now2.deliverables }</td>
							<td style="text-align: center;">${now2.important }</td>
						<td style="text-align: center;" ><input type="text"  id="schedule" class="form-control"   name="schedule" maxlength="25" style="width: 50px;" value="${now2.schedule }"><span class="help-inline"><font color="red">*</font></span></td>
						</tr>
						</c:forEach>
							<tr>
					<td colspan="5"></td>
					<td style="text-align: center;"><input id="btnSubmit1"
								class="btn btn-myoa-sec btn-myoa-large" type="submit" value="提 交" /> </td>
					<td style="text-align: center;" colspan="3">
						<input id="btnCancel" class="btn btn-myoa" type="button" value="返 回"
				onclick="history.go(-1)" />
						</td>
					</tr>
		<%-- </c:forEach> --%>
		</tbody>
	</table>
	</form>
	<br/>
	<br/>
	</div>
	</div>
	</div>
		<c:if test="${not empty userWeekrecords.id}">
		<act:histoicFlow procInsId="${userWeekrecords.procInsIdPre}" />
	</c:if>
	<hr>


</body>
</html>