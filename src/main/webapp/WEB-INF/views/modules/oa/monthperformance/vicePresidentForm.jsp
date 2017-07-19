<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>测试部审核月绩效</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document)
			.ready(
					function() {
				
						 $("#btnSubmit2").click(function() {
								$("#isdraft").val("1");
								var checkedList1 = new Array(); 
								$("input[name='subChk']:checked").each(function() { 
								checkedList1.push($(this).val()); 
								}); 
								$("#return").val(checkedList1);
								 var val=$('input:radio[name="Fruit"]:checked').val();
								   if(val==null){
										top.layer.msg('请选择驳回部门！！！');
						                return false;
						            }
							}); 
						 $("#btnSubmit3").click(function() {
								var checkedList1 = new Array(); 
								$("input[name='subChk']:checked").each(function() { 
								checkedList1.push($(this).val()); 
								}); 
								$("#return").val(checkedList1);
									 $("#isdraft").val("1");
									$("#Fruit").val("2");
						 }); 
						 $("#btnSubmit1").click(function() {
							
								$("#isdraft").val("0");
							}); 
						 $("#btnSubmit4").click(function() {
								$("#isdraft").val("0");
							}); 
							$("#inputForm").validate({
								submitHandler : function(form) {
									oaLoading('操作正在进行中，请耐心等待');
									form.submit();
								},
							});

					});

	
	
	
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
		<form id="inputForm"   action="${ctx}/user/userWeekplan/toExam" method="post" class="form-horizontal">
		<table class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
			<thead>
		<tr>
				<th style="text-align: center;">驳回选项</th>
				<th style="text-align: center;">小组成员</th>
				<th style="text-align: center;">开始时间</th>
				<th style="text-align: center;">结束时间</th>
				<th style="text-align: center;">工作内容</th>
				<th style="text-align: center;">交付物</th>
				<th style="text-align: center;">工作权重</th>
				<th style="text-align: center;">进度分</th>
					<c:if test="${turneddownFlag==2 }">
				<th style="text-align: center;">质量分</th>
				</c:if>
				<th style="text-align: center;" colspan="2" >任务分</th>
			</tr>
		</thead>
		<tbody>
		<c:set scope="page" var="inisign" value="-1" >
		</c:set>
		<%-- <c:forEach items="${us}" var="week" > --%>
		
		<c:forEach items="${us}" var="now2">
		<c:if test="${now2.weeksign!=inisign }">
		             <tr>
											<td  colspan="10" style="text-align: center;"><h1>第${now2.weeksign}周</h1></td>
								</tr>
								<c:set scope="page" var="inisign" value="${ now2.weeksign}" >
		</c:set>
								</c:if>
						            	<tr>	
						            	<td style="text-align: center;"> <input type="checkbox" name="subChk" class="i-checks" value="${now2.id}" /></td>
									<input type="text"  style="display: none;" name="id"  value="${now2.id}"/>
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
							<td style="text-align: center;" >${now2.schedule }</td>
							<c:if test="${turneddownFlag==2 }">
							<td style="text-align: center;" >${now2.qualityScore }</td>
							</c:if>
							<td style="text-align: center;"colspan="2" >${now2.testScore }</td>					
								</tr>
						</c:forEach>
						</table>
	<%-- 					<table class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
													<thead>
		<tr>
				<th style="text-align: center;">小组成员</th>
				<th style="text-align: center;" >周次</th>
				<th style="text-align: center;" >周总分</th>
				<th style="text-align: center;"colspan="2" >月平均分</th>
			</tr>
		</thead><c:forEach items="${to}" var="map">  
					<tr>
					<td style="text-align: center;"><c:out value="${map.name  }"></c:out>  </td>
						<td style="text-align: center;"><c:out value="${map.week  }"></c:out>  </td>
						<td style="text-align: center;"><c:out value="${map.sum }"></c:out> </td>
							<td style="text-align: center;"><c:out value=" ${map.avg }"></c:out></td>
					</tr>
					 </c:forEach>  
					 
		</table> --%>
				<c:choose>
				<c:when test="${turneddownFlag==2 }">
					<table class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
			<thead>
			<tr>
			<th colspan="1" style="text-align: center;">驳回部门</th>
			<th style="text-align: center;"><label>	<input id="actor"  name="Fruit" type="radio" value="1" class=" i-checks"  />测试部</label>
			<label><input  id="actor"  name="Fruit" type="radio" value="2" class=" i-checks"   />小组部门</label> <span class="help-inline"><font color="red">*</font></span></th>
			</tr>
			</thead>
			<tr>
			<td  colspan="2" align="center" valign="middle">
				<input id="btnSubmit2"
								class="btn btn-myoa" type="submit" value="驳  回" />
					<input id="btnSubmit1"
								class="btn btn-myoa-sec btn-myoa-large" type="submit" value="同 意" />
								<input	type="hidden"  id='return' name="turndownId" value="0">
								<input
								type="hidden"  id='isdraft' name="isdraft" value="0">
						<input id="btnCancel" class="btn btn-myoa" type="button" value="返 回"
				onclick="history.go(-1)" /> </td>
					</tr>
				</table>
				</c:when>
				<c:otherwise>
						<table class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
			<thead>
			</thead>
			<tr>
			<td align="center" valign="middle">
			<input  id="Fruit"  style="display: none;" name="Fruit" type="text" value="3" class="required"  />
				<input id="btnSubmit3"
								class="btn btn-myoa" type="submit" value="驳  回" />
					<input id="btnSubmit4"
								class="btn btn-myoa-sec btn-myoa-large" type="submit" value="同 意" />
								<input	type="hidden"  id='return' name="turndownId" value="0">
								<input
								type="hidden"  id='isdraft' name="isdraft" value="0">
						<input id="btnCancel" class="btn btn-myoa" type="button" value="返 回"
				onclick="history.go(-1)" /> </td>
					</tr>
				</table>
				</c:otherwise>
				</c:choose>
		</tbody>
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