<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>保存成功</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">

		$(document).ready(function() {
			//$(".zdm tr td").css({"width":"20%"});
			$("#btnCancle2").click(function(){
				$("#iscancel").val("1");
				submitForm();
			})
			$("#btnSubmit").click(function(){
				if(yanzheng()){
					submitForm();
				}else{
					return false;
				}				
			})
			
			iscode()
			validateForm = $("#inputForm").validate({
				submitHandler: function(form){
					oaLoading('正在提交，请稍候...');
					form.submit();
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
			
			$(".add1line").click(
					function() {
						$(this)
							.parent()
							.parent()
							.before(
		 					'<tr class="main-content"><td><input name="date" type="text" readonly="readonly" maxlength="20" style="width: 100%;" class="laydate-icon form-control layer-date" value="" onclick="WdatePicker({dateFmt:\'yyyy-MM-dd\',isShowClear:false});" /></td><td><input type="text" name="currentunit" maxlength="80" style="width:100%" class="form-control required"/></td><td><input type="text" name="reason" style="width:100%" maxlength="80" class="form-control required" /></td><td><input type="text" name="meals" style="width:100%" class="form-control required" /></td><td><input type="text" name="alcoholtobacco" style="width:100%" class="form-control required" /></td><td><input type="text" name="numOur" maxlength="8" style="width:100%" class="form-control" /></td><td><input type="text" name="numCustomers" maxlength="8" class="form-control" style="width:100%" /></td><td><select name="ispriorapproval" class="form-control"  style="width: 100%" onclick="ispriorapprovalClick(this)"><option value="是">是</option><option value="否" selected="selected">否</option></select></td><td><a onclick="del1line(this)"><img class="add-del-png" src=\'${ctxStatic}/images/del.png\'  style="width:16px;height:16px"/></a><input type="hidden" name="delFlag" value="0"></td></tr>');
						return false;
				});
		});
		
		function yanzheng(){
			var num = true;
			//日期
			$("input[name=date]").each(function() {
				if (!$(this).is(":hidden") && $(this).val()=='') {
					top.layer.alert('请填写日期!', {
						icon : 0,
						title : '警告'
					});
					num = false;
					return false;
				}			
			})
			if(num==false){
				return false;
			}
			//往来单位
			$("input[name=currentunit]").each(function() {
				if (!$(this).is(":hidden") && $(this).val()=='') {
					top.layer.alert('请填写往来单位!', {
						icon : 0,
						title : '警告'
					});
					num = false;
					return false;
				}
			})
			if(num==false){
				return false;
			}
			//事由
			$("input[name=reason]").each(function() {
				if (!$(this).is(":hidden") && $(this).val()=='') {
					top.layer.alert('请填写事由!', {
						icon : 0,
						title : '警告'
					});
					num = false;
					return false;
				}
			})
			if(num==false){
				return false;
			}
			//餐费
			$("input[name=meals]").each(function() {
				if (!$(this).is(":hidden") && $(this).val()=='') {
					top.layer.alert('请填写餐费金额!', {
						icon : 0,
						title : '警告'
					});
					num = false;
					return false;
				}else{
					var meal= /^[0-9]+\.?[0-9]*$/;
					if (!meal.test($(this).val())) {
						top.layer.alert('餐费金额输入错误!', {
							icon : 0,
							title : '警告'
						});
						num = false;
						return false;
					}
				}
			})
			if(num==false){
				return false;
			}
			//烟酒
			$("input[name=alcoholtobacco]").each(function() {
				if (!$(this).is(":hidden") && $(this).val()=='') {
					top.layer.alert('请填写烟酒金额!', {
						icon : 0,
						title : '警告'
					});
					num = false;
					return false;
				}else{
					var meal= /^[0-9]+\.?[0-9]*$/;
					if (!meal.test($(this).val())) {
						top.layer.alert('烟酒金额输入错误!', {
							icon : 0,
							title : '警告'
						});
						num = false;
						return false;
					}
				}
			})
			if(num==false){
				return false;
			}
			//我司人数
			$("input[name=numOur]").each(function() {
				if (!$(this).is(":hidden") && $(this).val()=='') {
					top.layer.alert('请填写我司人数!', {
						icon : 0,
						title : '警告'
					});
					num = false;
					return false;
				}else{
					var meal= /^[0-9]*[1-9][0-9]*$/;
					if (!meal.test($(this).val())) {
						top.layer.alert('公司参与人数请输入大于0的整数!', {
							icon : 0,
							title : '警告'
						});
						num = false;
						return false;
					}
				}
			})
			if(num==false){
				return false;
			}
			//客户人数
			$("input[name=numCustomers]").each(function() {
				if (!$(this).is(":hidden") && $(this).val()=='') {
					top.layer.alert('请填写客户人数!', {
						icon : 0,
						title : '警告'
					});
					num = false;
					return false;
				}else{
					var meal= /^[0-9]*[1-9][0-9]*$/;
					if (!meal.test($(this).val())) {
						top.layer.alert('客户人数请输入大于0的整数!', {
							icon : 0,
							title : '警告'
						});
						num = false;
						return false;
					}
				}
			})
			if(num==false){
				return false;
			}
			return true;
		}
		
		function iscode(){
			var c = ${node};
			if(c !="0"){
				var tableId = document.getElementById("tab"); 
				/* for(var i=1;i<tableId.rows.length;i++)
				{
					alert(123);
					tableId.rows[i].cells[tableId.rows.length].className="display: none;";
					alert(456);
				}  */
			}			
		}
		
		function del1line(item) {
			$(item).next().val("1");
			$(item).parent().parent().hide();
			return false;
		}
		
		
		function submitForm(){
			var cdate = new Date($("input[name=cdate]").val());
			var jstr={
					enutil:{
						node:$("input[name=node]").val(),
						iscancel:$("input[name=iscancel]").val(),
						fruit:$("input[name=fruit]:checked").val(),
						examtext:$("input[name=examtext]").val(),
 						createname:$("input[name=createname]").val(),
 						cdate:cdate.getTime()
					},
					log:{
						id:$("#oaEnreimbStr").find("input[name=id]").val(),
						procInsId: $("input[name=procInsId]").val(),
// 						createBy:{id:$("input[name='createBy.id']").val()},
// 						createBy.date: $("input[name=createBy.date]").val(),
						cwtext: $("input[name=cwtext]").val(),
						moneyDouble: $("input[name=moneyDouble]").val(),
						moneyString: $("input[name=moneyString]").val(),
						officename: $("input[name=officename]").val()
					},
					list:[]
			};
			$(".main-content").each(function() {
				var date = new Date($(this).find("input[name=date]").val());
				var wr = {
						id:$(this).find("input[name=id]").val(),
						date :date.getTime(),//传到后台的日期是一个long字符
						currentunit : $(this).find("input[name=currentunit]").val(),
						reason : $(this).find("input[name=reason]").val(),
						meals : $(this).find("input[name=meals]").val(),
						alcoholtobacco : $(this).find("input[name=alcoholtobacco]").val(),
						numOur : $(this).find("input[name=numOur]").val(),
						numCustomers : $(this).find("input[name=numCustomers]").val(),
						ispriorapproval : $(this).find("select[name=ispriorapproval]").val()						
				};
				jstr.list.push(wr);	
			})
			var loading = layer.load();
			$.ajax({
				url : "${ctx}/oa/enreimb/oaEnreimb/save",
				type : "POST",
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify(jstr),
				dataType : "text",
				success : function(date) {	
					/* top.layer.alert('操作完成!', {
						icon : 0,
						title : '提示'
					});	 */
					layer.close(loading);
					window.location.href = "${ctx}/oa/enreimb/oaEnreimb/form?id="+date+"";
				}					
			});
			
			
			
		}
		
		
	/* 	
		function ispriorapprovalClick(item) {
			if ($(item).val() == '否') {
				$(item).parent().next().children().attr("readonly", false).next()
						.children().text("*");
			} else {
				$(item).parent().next().children().attr("readonly", true).val("")
						.next().children().text("");
			}
		}
		function del1line(item) {
			$(item).next().val("1");
			$(item).parent().parent().hide();
			return false;
		} */
	</script>
	
	<style type="text/css">
		.table tbody input{
		    min-width:50px;
		}
	</style>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
	<div class="ibox">
		<div class="ibox-title">
			<h5>申请-招待费</h5>
		</div>
		<div class="ibox-content">
			<%-- <form:form id="inputForm" class="form-horizontal"> --%>
			<legend style="margin-bottom:20px;">${title}</legend>
			<input type="hidden" name="token" value="${token }">
			<div id="oaEnreimbUtil">			
				<input type="hidden" value="${node}" name="node">
				<input type="hidden" value="0" name="iscancel" id="iscancel">
	  			<input type="hidden" value="${oaEnreimb.createBy.id}" name="createname">
	   			<input type="hidden" value="${oaEnreimb.createDate}" name="cdate">
			</div>
			<div id="oaEnreimbStr">					
				<input type="hidden" name="id" value="${oaEnreimb.id}">
				<input type="hidden" name="procInsId" value="${oaEnreimb.procInsId}">
	<%-- 			<input type="hidden" name="createBy.id" value="${oaEnreimb.createBy.id}"> --%>
				<%-- <input type="hidden" name="createBy.date" value="${oaEnreimb.createBy.date}"> --%>
				<input type="hidden" name="cwtext" value="${oaEnreimb.cwtext}">
				<input type="hidden" name="officename" value="${oaEnreimb.officename}">
				<input type="hidden" name="moneyDouble" value="${oaEnreimb.moneyDouble}">
				<input type="hidden" name="moneyString" value="${oaEnreimb.moneyString}">
			<%-- <form:hidden path="id"/>
			<form:hidden path="procInsId"/>
			<form:hidden path="createBy.id"/> --%>
			<sys:message content="${message}"/>
			</div>
		
<!-- <label>招 待 费 报 销 审 批 单</label> -->
			<div style="width:100%;">
				<table  class="table table-bordered  table-condensed dataTables-example dataTable no-footer zdm"  id="tab">
				<thead>
					<tr>
						<td rowspan="2" width="15%">日期<font color="red">*</font></td>
						<td rowspan="2" width="15%">往来单位<font color="red">*</font></td>
						<td rowspan="2" width="18%">洽谈事由及项目名称<font color="red">*</font></td>
						<td colspan="2" width="20%">实际金额</td>
						<td colspan="2" width="12%">参与人数</td>
						<td rowspan="2" width="14%">是否在事前报批</td>
						<c:if test="${node eq 0}"><td rowspan="2">操作</td>	</c:if>	
					</tr>
					<tr>
						<td>餐费<font color="red">*</font></td>
						<td>酒水/烟等<font color="red">*</font></td>
						<td>本公司<font color="red">*</font></td>
						<td>客户<font color="red">*</font></td>
					</tr>
				</thead>
				<tbody>
			
				<c:if test="${fn:length(listOaEnter)==0}">
					
					<tr class="main-content">
						<td>
						<input type="hidden" name="id" />
							<input name="date" type="text" readonly="readonly"
										maxlength="20" style="width: 100%;" class="laydate-icon form-control layer-date"
										value="<fmt:formatDate value="${oaEnter.date}" pattern="yyyy-MM-dd" />"
										onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" /><span
										class="help-inline"  onblur="judgeNull()"> </span>
						</td>
						<td>					
							<input type="text" name="currentunit" value="${oaEnter.currentunit}" maxlength="80"  style="width:100%"  class="form-control" onblur="judgeNull()"/>
							<span class="help-inline"></span>
						</td>
						<td>
							<input type="text" name="reason" value="${oaEnter.reason}" style="width:100%" maxlength="80" class="form-control"  onblur="judgeNull()"/>
							
						</td>
						<td>
							<input type="text" name="meals" value="${oaEnter.meals}" style="width:100%" class="form-control"  onblur="judgeNull()"/>
							
						</td>
						<td>
							<input type="text" name="alcoholtobacco" value="${oaEnter.alcoholtobacco}" style="width:100%" class="form-control"  onblur="judgeNull()"/>
							
						</td>
						<td>
							<input type="text" name="numOur" value="${oaEnter.numOur}" style="width:100%" maxlength="8" class="form-control" />
							
						</td>
						
						<td>
							<input type="text" name="numCustomers" value="${oaEnter.numCustomers}" style="width:100%" maxlength="8" class="form-control"   onblur="judgeNull()"/>
							
						</td>					
						<td>
							<select name="ispriorapproval" style="width: 100%" class="form-control"
								onclick="ispriorapprovalClick(this)"  onblur="judgeNull()"><option value="是">是</option>
								<option value="否" selected="selected">否</option></select>
						</td>
						<td><a onclick="del1line(this)"><img class="add-del-png"
								src='${ctxStatic}/images/del.png'  style="width:16px;height:16px"/></a><input type="hidden"
							name="delFlag" value="0"></td>
					</tr>				
				</c:if>
				<c:forEach var="oaEnter" items="${listOaEnter}">
					<tr class="main-content">
						<td>					
						<input type="hidden" name="id" value="${oaEnter.id }" />
							<c:if test="${node eq 0}">
								<input name="date" type="text" readonly="readonly"
											maxlength="20" style="width: 100%;" class="laydate-icon form-control layer-date"
											value="<fmt:formatDate value="${oaEnter.date}" pattern="yyyy-MM-dd" />"
											onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" /><span
											class="help-inline"  onblur="judgeNull()"></span>
							</c:if>
							<c:if test="${node ne 0}">
								<input name="date" type="text" class="form-control" value="<fmt:formatDate value="${oaEnter.date}" pattern="yyyy-MM-dd" />" readonly="readonly" style="border: none;min-width:130px;">
							</c:if>
						</td>
						<td>
							<c:if test="${node eq 0}">				
								<input type="text" name="currentunit" value="${oaEnter.currentunit}" required="required"  maxlength="80" style="width:100%"  class="form-control" onblur="judgeNull()"/>
							
							</c:if>
							<c:if test="${node ne 0}">
								<input type="text" name="currentunit" value="${oaEnter.currentunit}" class="form-control" readonly="readonly" style="border: none;width:100%">
							</c:if>
						</td>
						<td>
	 						<c:if test="${node eq 0}">
								<input type="text" name="reason" value="${oaEnter.reason}" style="width:100%" required="required" maxlength="80" class="form-control"  onblur="judgeNull()"/>						
						 	</c:if>
							<c:if test="${node ne 0}">
								<input type="text" name="reason" value="${oaEnter.reason}" readonly="readonly" style="border: none;width:100%">
							</c:if>
						</td>
						<td>
							<c:if test="${node eq 0}">
								<input type="text" name="meals" value="${oaEnter.meals}" style="width:100%" required="required" class="form-control"  onblur="judgeNull()"/>							
							</c:if>
							<c:if test="${node ne 0}">
								<input type="text" name="meals" value="${oaEnter.meals}" readonly="readonly" style="border: none;width:100%">
							</c:if>
						</td>
						<td>
							<c:if test="${node eq 0}">
								<input type="text" name="alcoholtobacco" value="${oaEnter.alcoholtobacco}" style="width:100%" required="required" class="form-control"  onblur="judgeNull()"/>							
							</c:if>
							<c:if test="${node ne 0}">
								<input type="text" name="alcoholtobacco" value="${oaEnter.alcoholtobacco}" readonly="readonly" style="border: none;width:100%">
							</c:if>
						</td>
						<td>
							<c:if test="${node eq 0}">
								<input type="text" name="numOur" value="${oaEnter.numOur}" style="width:100%" required="required" maxlength="8" class="form-control" />
								
							</c:if>
							<c:if test="${node ne 0}">
								<input type="text" name="numOur" value="${oaEnter.numOur}" readonly="readonly" style="border: none;width:100%">
							</c:if>
						</td>						
						<td>
							<c:if test="${node eq 0}">
								<input type="text" name="numCustomers" value="${oaEnter.numCustomers}" style="width:100%" required="required"  maxlength="8"class="form-control"   onblur="judgeNull()"/>
								
							</c:if>
							<c:if test="${node ne 0}">
								<input type="text" name="numCustomers" value="${oaEnter.numCustomers}" readonly="readonly" style="border: none;width:100%">
							</c:if>
						</td>					
						<td>
						<c:if test="${node eq 0}">
							<select name="ispriorapproval" style="width: 100%" class="form-control"
								onclick="ispriorapprovalClick(this)"  onblur="judgeNull()"><option value="是">是</option>
								<option value="否" selected="selected">否</option></select>
						</c:if>
							<c:if test="${node ne 0}">
								<input type="text" name="ispriorapproval" value="${oaEnter.ispriorapproval}" readonly="readonly" style="border: none;">
							</c:if>
						</td>
						<c:if test="${node eq 0}">
						<td><a onclick="del1line(this)"><img class="add-del-png"
								src='${ctxStatic}/images/del.png' style="width:16px;height:16px"/></a><input type="hidden"
							name="delFlag" value="0">
						</td>
						</c:if>
					</tr>
					</c:forEach>
					<c:if test="${node eq 0}">
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<c:if test="${node eq 0}"><td><a class="add1line"><img class="add-del-png"
												src="${ctxStatic}/images/add.png" style="width:16px;height:16px"/></a></td></c:if>
						</tr>
					</c:if>
					<c:if test="${node ne 0}">
						<tr>
							<td colspan="2">
								合计金额
							</td>
							<td colspan="6">
								${oaEnreimb.moneyDouble}
							</td>
						</tr>
						<tr>
							<td colspan="2">
								大写金额
							</td>
							<td colspan="6">
								${oaEnreimb.moneyString}
							</td>
						</tr>
						<tr>
							<td colspan="2">
								审核意见
							</td>
							<td colspan="6">
								<input type="radio" class="i-checks" name="fruit" value="0">同意
								<input type="radio" class="i-checks" name="fruit" value="1" checked="checked">不同意	
							</td>
						</tr>	
						<tr>
							<td colspan="2">审核留言</td>
							<td colspan="6"><input type="text" name="examtext" maxlength="90" class="form-control"/></td>
						</tr>
					</c:if>
				</tbody>
			</table>
			
			
			<%-- <table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
			   <tbody>
					<tr>
						<td class="width-15 active"><label class="pull-right">审核意见：</label></td>
						<td class="width-35">
						<c:if test="${node ne 0}">
							<div class="controls">
								<input type="radio" name="fruit" value="0">同意
								<input type="radio" name="fruit" value="1" <c:if test="${node ne 0}">checked="checked"</c:if>>不同意				
							</div>
						</c:if>
						</td>
						<td class="width-15 active"><label class="pull-right">审核留言：</label></td>
						<td class="width-35">
							<input name="examtext" maxlength="200" class="form-control" <c:if test="${node eq 0}">readonly="readonly"</c:if>>
						</td>
					</tr>
					<tr>
						<td class="width-15 active"><label class="pull-right">合计金额（小写）：</label></td>
						<td class="width-35">
							<form:input path="moneyDouble" htmlEscape="false" class="form-control "/>
						</td>
						<td class="width-15 active"><label class="pull-right">合计金额（大写）：</label></td>
						<td class="width-35">
							<form:input path="moneyString" htmlEscape="false" maxlength="100" class="form-control "/>
						</td>
					</tr>
				</tbody>
			</table>  --%>
			
			<div class="form-actions" style="text-align:center;">
				<input id="btnSubmit" class="btn btn-primary" type="submit" value="提交" />&nbsp;
				<c:if test="${not empty oaEnreimb.id && node eq 0}">
					<input id="btnCancle2" class="btn btn-primary" type="submit" value="取消申请" />&nbsp;
				</c:if>
				<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)" />&nbsp;

				<c:choose>
				<c:when test="${task != null}">&nbsp;
					<input onclick='btnPNGshow("${task.processDefinitionId}/${task.executionId}");'
					class="btn" type="button" value="流程跟踪" />
				</c:when>
				<c:otherwise>&nbsp;
					<input onclick='btnPNGshow2("${procDefId}");' class="btn"
					type="button" value="流程图" />
				</c:otherwise>
			</c:choose>	
			</div>
	<%-- 	</form:form> --%>
			</div>
		</div>
	</div>
</div>
	
</body>
</html>