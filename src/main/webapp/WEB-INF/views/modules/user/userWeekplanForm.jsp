<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>周计划管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#btnSubmit1").click(function() {

							$("#isdraft").val("0");
							var judge1 = notnull();

							var judge2 = judge();
							var judge3 = notnull3();
							return judge1 && judge2 && judge3;
						});
						$("#btnSubmit2").click(function() {

							$("#isdraft").val("1");
							var judge1 = notnull();
							var judge2 = judge();
							var judge3 = notnull3();
							return judge1 && judge2 && judge3;
						});
						$("#inputFormcz").validate({
							submitHandler : function(form) {
								oaLoading('操作正在进行中，请耐心等待');
								form.submit();
							},
						});

						$("select").select2({
							minimumResultsForSearch : -1
						});
						$("#date1").val($("#date2").val());
						//$("#name").focus();

						$("#btnSubmit11").click(function() {
							$(this).next().val("0");
							return notnull2();
						});
						$("#btnSubmit22").click(function() {
							$(this).prev().val("1");
							return notnull2();
						});
						/* 	$(".add1line")
									.click(
											function() { */

						$(".add1line2")
								.click(
										function() {
											$(this)
													.parent()
													.parent()
													.before(
											"<tr><td ><input type='hidden' name='mrid' value='null'><input type='text' name='finish' value=''maxlength='255'></td><td><input type='text' name='unfinish' value=''maxlength='255'></td><td><a onclick='del1line(this)'><img class='add-del-png' src='${ctxStatic}/images/del.png' /></a><input type='hidden'name='delFlag' value='0'></td></tr>");
											return false;
										});
						//
					});
	function add1line() {
		$(".add1line")
				.parent()
				.parent()
				.before(
						"<tr><td style='text-align:center;'><input type='hidden'name='wrid'value='null'><select name='beginday' class='form-control'><option value='1'>周一</option><option value='2'>周二</option><option value='3'>周三</option><option value='4'>周四</option><option value='5'>周五</option><option value='6'>周六</option><option value='7'>周日</option></select></td><td style='text-align:center;'><select name='endday' class='form-control'><option value='1'>周一</option><option value='2'>周二</option><option value='3'>周三</option><option value='4'>周四</option><option value='5'>周五</option><option value='6'>周六</option><option value='7'>周日</option></select></td><td style='text-align:center;'><input type='text' name='content' value=''maxlength='255' class='form-control'><td style='text-align: center;'><input type='text' name='deliverables' value='' maxlength='255' class='form-control'></td><td style='text-align:center;'><a onclick='del1line(this)'><img class='add-del-png' src='${ctxStatic}/images/del.png' /></a><input type='hidden'name='delFlag' value='0'></td></tr>");
		return false;
	};
	function del1line(item) {
		$(item).next().val("1");
		$(item).parent().parent().hide();
		return false;
	}
	function notnull() {
		var judge = true;
		var i=0;
		$("input[name='content']").each(function() {
			var str = "";
			if ($(this).val().trim() == "" && !$(this).is(":hidden")) {
				i+=1;
			}
		});
		if(i>0){
			judge = false;
			str = "必填信息  ";
			$("#cz2").children().text(str);
		}else{
			var judge = true;
		}
			
		return judge;
	}
	/* 	
	 function cz(){
	 $("#isdraft").val("1");
	 var judge1 = notnull();
	 var judge2 = judge();
	 var judge1 = notnull3();
	 return judge1 && judge2;	} */
	function notnull3() {
		var judge = true;
		var i=0;
		$("input[name='deliverables']").each(function() {
			var str = "";
			if ($(this).val().trim() == "" && !$(this).is(":hidden")) {
				i+=1;
			}
		});
		if(i>0){
			judge = false;
			str = "必填信息";
			$("#cz3").children().text(str);
		}else{
			var judge = true;
		}
		return judge;
	}
	function notnull2() {
		var judge = true;
		$("input[name='finish']").each(function() {
			var str = "";
			if ($(this).val().trim() == "" && !$(this).is(":hidden")) {
				judge = false;
				str = "必填信息  ";
			}
			$(this).next().children().text(str + "*");
		});
		$("input[name='unfinish']").each(function() {
			var str = "";
			if ($(this).val().trim() == "" && !$(this).is(":hidden")) {
				judge = false;
				str = "必填信息  ";
			}
			$(this).next().children().text(str + "*");
		});
		return judge;
	}
	function judge() {
		var judge = true;
		var max = 1;
		var index = 0;
		var i=0;
		$("select").each(function() {
			if (!$(this).is(":hidden")) {
				var str = "";
				if ($(this).val() >= max) {
					max = $(this).val();
				} else {
					if (index % 2 == 1) {
					i+=1;
					}
				}
				index++;
			}
		});
		if(i>0){
			str = "时间错误 ";
			judge = false;
			$("#cz1").children().text(str);
		}else{
			var judge = true;
		}
		return judge;
	}
</script>
<style type="text/css">
select {
	width: 70px;
}

a {
	cursor: pointer;
}

.ibox-content{
	position: relative;
}

form#searchForm{
	display: inline;
}
#contentTable{
	margin-top:20px;
}

h1{
	position: absolute;
	top:0;
	left:50%;
	margin-left:-43px;
	font-size:16px;
	color: #009f95;
	height:74px;
	line-height:86px;
}
.ibox-content h3{
	height:39px;
	line-height:39px;
	margin:0;
	color:#333;
}

table.dataTable{
	margin:0 !important;
	color:#333;
}

thead>tr:first-child td{
	font-weight:bold;
}

.table .table .form-control{
	width:100%;
	color:#333;
}
.table .table select.form-control{
} 

input.btn{
	float:right;
	margin-top:20px;
	margin-left:55px;
}
input[value="查询"]{
	float:none;
	margin:0;
}

.add-del-png {
	width: 15px;
	height: 15px;
}

.help-inline{
	margin-left: 5px;
}

.help-inline>.help-inline{
	font-size:10px;
}
</style>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
<div class="ibox">
	<div class="ibox-title">
		<h5>周计划总结 </h5>
		
	</div>
   <div class="ibox-content">
   	<sys:message content="${message}"/>
	<form style="text-align: center;" id="searchForm"
		action="${ctx}/user/userWeekplan/form" method="post"
		class="breadcrumb form-search">
		选择年月：<input name="plandate" id="date1" type="text" readonly="readonly"
			maxlength="20" class="form-control Wdate laydate-icon layer-date required"
			value="<fmt:formatDate value="${plandate}" pattern="yyyy-MM"/>"
			onclick="WdatePicker({dateFmt:'yyyy-MM',isShowClear:false});" /> <input
			id="btnSubmit" class="btn btn-primary btn-rounded btn-outline btn-sm"
			type="submit" value="查询" /><%-- &nbsp;<input id="btnCancel"
			class="btn btn-primary btn-rounded btn-outline btn-sm" type="button"
			value="返 回" onclick="window.location.href='${ctx}/user/userWorklog/'" /> --%>
		<%-- 
			<c:choose>
				<c:when test="${(isToday && canUpdate2 && (canInsert2 || userMonthsum.isdraft == '0'))||isToday && canUpdate && (canInsert || list1[0].isdraft == '0')}">onclick="window.location.href='${ctx}/user/userWorklog/'"</c:when>
				<c:otherwise>onclick="history.go(-1)"</c:otherwise>
		</c:choose>--%>
		<input type="hidden" 
			value="<fmt:formatDate value="${plandate}" pattern="yyyy-MM"/>"
			id="date2">
	</form>
	<p style="text-align: center;font-size: 16px;color:#1ab394;">
		<fmt:formatDate value="${plandate}" pattern="yyyy年MM月" />
	</p>

	<div id="contentTable" class="table  table-bordered table-condensed">
		<c:if
			test="${canInsert || (list1[0].isdraft == '0' && list1[0].firstdate.time == canUpdateStr)}">
			<form id="inputFormcz" action="${ctx}/user/userWeekplan/save"
				method="post" class="form-inline">
				<c:choose>
					<c:when test="${canInsert }">
						<h3 style="text-align: center">
							<font color="blue">第${newUserWeekplan.weeksign }周</font>&emsp;(开始日期：
							<fmt:formatDate value="${newUserWeekplan.firstdate}"
								pattern="yyyy-MM-dd" />
							)
						</h3>
						<input type="hidden" value="" name="id" />
						<input type="hidden"
							value="<fmt:formatDate value="${newUserWeekplan.firstdate}" pattern="yyyy-MM-dd"/>"
							name="firstdate" />
						<input type="hidden" name="plandate"
							value='<fmt:formatDate value="${newUserWeekplan.plandate}" pattern="yyyy-MM-dd"/>' />
						<input type="hidden" name="weeksign"
							value="${newUserWeekplan.weeksign  }" />
					</c:when>
					<c:otherwise>
						<h3 style="text-align: center">
							<font color="blue">第${list1[0].weeksign }周</font>&emsp;(开始日期：
							<fmt:formatDate value="${list1[0].firstdate}"
								pattern="yyyy-MM-dd" />
							)
						</h3>
						<input type="hidden" value="${list1[0].id }" name="id" />
						<input type="hidden"
							value="<fmt:formatDate value="${list1[0].firstdate}"
								pattern="yyyy-MM-dd" />"
							name="firstdate" />
						<input type="hidden" name="plandate"
							value='<fmt:formatDate value="${list1[0].plandate}" pattern="yyyy-MM-dd"/>' />
						<input type="hidden" name="weeksign" value="${list1[0].weeksign }" />
					</c:otherwise>
				</c:choose>
				<table id="contentTable"
					class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
					<thead id="box">
						<tr>
							<td width="100px" style="text-align: center">开始时间<span class='help-inline'><font
										color='red'>*</font>  </span></td>
							<td width="100px" style="text-align: center">结束时间<span class='help-inline'><font
										color='red'>*</font> <span id='cz1' class='help-inline'><font color='red'></font> </span> </span></td>
							<td width="250px" style="text-align: center">工作内容(1~255)<span class='help-inline'><font
										color='red'>*</font> <span id='cz2' class='help-inline'><font color='red'></font> </span></span></td>
							<td width="250px" style="text-align: center">交付物(1~255)<span class='help-inline'><font
										color='red'>*</font>  <span id='cz3' class='help-inline'><font color='red'></font> </span></span></td>
							<td width="100px" style="text-align: center">操作</td>
						</tr>
					</thead>
					<tbody>
						<c:if test="${canInsert || fn:length(list2[0])==0}">
							<tr>
								<td style='text-align: center;'><input type='hidden'
									name='wrid' value='null'><select name='beginday'
									class="form-control"><option value='1'>周一</option>
										<option value='2'>周二</option>
										<option value='3'>周三</option>
										<option value='4'>周四</option>
										<option value='5'>周五</option>
										<option value='6'>周六</option>
										<option value='7'>周日</option></select> 
								</td>
								<td style='text-align: center;'><select name='endday'
									class="form-control"><option value='1'>周一</option>
										<option value='2'>周二</option>
										<option value='3'>周三</option>
										<option value='4'>周四</option>
										<option value='5'>周五</option>
										<option value='6'>周六</option>
										<option value='7'>周日</option></select>
								</td>
								<td style='text-align: center;'><input type='text'
									class="form-control" name='content' value='' maxlength="255">
								</td>
								<td style='text-align: center;'><input type='text'
									name='deliverables' value='' maxlength="255"
									class="form-control">
								</td>
								<td style='text-align: center;'><a onclick='del1line(this)'><img
										class="add-del-png" src="${ctxStatic}/images/del.png" /></a><input
									type='hidden' name='delFlag' value='0'></td>
							</tr>
						</c:if>
						<c:if test="${!canInsert}">
							<c:forEach items="${list2[0]}" var="now">
								<tr>
									<td style="text-align: center;"><input type="hidden"
										name="wrid" value="${now.id}"><select name="beginday"
										class="form-control"><option value="1"
												<c:if test="${now.beginday==1}">selected</c:if>>周一</option>
											<option value="2"
												<c:if test="${now.beginday==2}">selected</c:if>>周二</option>
											<option value="3"
												<c:if test="${now.beginday==3}">selected</c:if>>周三</option>
											<option value="4"
												<c:if test="${now.beginday==4}">selected</c:if>>周四</option>
											<option value="5"
												<c:if test="${now.beginday==5}">selected</c:if>>周五</option>
											<option value="6"
												<c:if test="${now.beginday==6}">selected</c:if>>周六</option>
											<option value="7"
												<c:if test="${now.beginday==7}">selected</c:if>>周日</option></select>
									</td>
									<td style="text-align: center;"><select name="endday"
										class="form-control"><option value="1"
												<c:if test="${now.endday==1}">selected</c:if>>周一</option>
											<option value="2"
												<c:if test="${now.endday==2}">selected</c:if>>周二</option>
											<option value="3"
												<c:if test="${now.endday==3}">selected</c:if>>周三</option>
											<option value="4"
												<c:if test="${now.endday==4}">selected</c:if>>周四</option>
											<option value="5"
												<c:if test="${now.endday==5}">selected</c:if>>周五</option>
											<option value="6"
												<c:if test="${now.endday==6}">selected</c:if>>周六</option>
											<option value="7"
												<c:if test="${now.endday==7}">selected</c:if>>周日</option></select>
									</td>
									<td style="text-align: center;"><input type="text"
										name="content" value="${now.content}" maxlength="255"
										class="form-control required ">
									</td>
									<td style="text-align: center;"><input type="text"
										name="deliverables" value="${now.deliverables }"
										maxlength="255" class="form-control">
									</td>
									<td style="text-align: center;"><a
										onclick="del1line(this)"><img class="add-del-png"
											src="${ctxStatic}/images/del.png" /></a><input
										type="hidden" name="delFlag" value="0">&nbsp;&nbsp;&nbsp;&nbsp;<a
										href="${ctx}/user/userWeekplan/delete?id=${now.id}"><span
											style="color: red;">删除</span></a></td>
								</tr>
							</c:forEach>
						</c:if>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td style="text-align: center;"><a class="add1line"
								onclick="add1line()"
								style="cursor: pointer; text-decoration: none"><img
									class="add-del-png" src="${ctxStatic}/images/add.png" /></a></td>

						</tr>
					</tbody>

				</table>
				
				<input id="btnSubmit2" class="btn btn-myoa" type="submit"
					value="提 交" />
				<input id="btnSubmit1" class="btn btn-myoa" type="submit" value="存 草 稿" /> 
				<input type="hidden" id='isdraft' name="isdraft" value="0">

			</form>
		</c:if>

	</div>
























	<table id="contentTable"
		class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">


		<c:forEach items="${list1}" var="now1" varStatus="i">
			<table id="contentTable"
				class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
				<thead id="box">
					<tr>
						<td
							style="text-align: center; width: 30px; border: 1px solid blue;"><font
							color="blue">第${now1.weeksign }周</font>&emsp;(开始日期： <fmt:formatDate
								value="${now1.firstdate}" pattern="yyyy-MM-dd" />)</td>
						<td
							style="text-align: center; width: 30px; border: 1px solid blue;">提交状态：
							<c:choose>
								<c:when test="${now1.isdraft=='0'}">
									<font color="red">草稿</font>
								</c:when>
								<c:otherwise>
									<font color="blue">已提交</font>
								</c:otherwise>
							</c:choose>
						</td>
						<td
							style="text-align: center; width: 30px; border: 1px solid blue;">提交时间：<fmt:formatDate
								value="${now1.updateDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					</tr>
				</thead>
			</table>
			<table id="contentTable"
				class="table table-striped table-bordered table-condensed">
				<thead id="box">
					<tr>
						<td style="text-align: center;" width="100px">序号</td>
						<td style="text-align: center;" width="100px">开始时间</td>
						<td style="text-align: center;" width="100px">结束时间</td>
						<td style="text-align: center;" width="200px">工作计划</td>
						<td style="text-align: center;" width="200px">交付物</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list2[i.index] }" var="now2" varStatus="ii">
						<tr>
							<td style="text-align: center;">${ii.index+1 }</td>
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
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:forEach>
	</table>
	<br/>
	<br/>
	</div>
	</div>
	</div>
</body>
</html>