<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>我的任务管理</title>
	<meta name="decorator" content="default"/>
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no" />
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#btnSubmit1").click(function(){
				$("#fruit").val("1");
			})

			$("#btnSubmit").click(function() {
				var judeg2 = checkdate();
				var judge1 = judgeInt(); 
				return judge1&&judeg2;
			});
			
			$("#inputForm").validate({
				
				submitHandler: function(form){
					loading('正在保存，请稍等...');
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
			
			 function checkdate(){
			 var judge = true;
				var str = "";
				var str1 = "*"
				var str2 = "结束日期必须大于结束日期 *";
			   	var sDate = new Date($("input[name='startDay']").val().replace("-", "/").replace("-", "/"));
			    var eDate = new Date($("input[name='endTime']").val().replace("-", "/").replace("-", "/"));
			    if(sDate > eDate)
			    {
			    judge = false;
			 	str = str2;
			   }
			    $("#cz").children().text(str);
			    return judge;
			    }
			
			function judgeInt() {
				var judge = true;
				var str = "";
				var str1 = "*"
				var str2 = "不能为空并且输入两位以上的数 *";
				$("input[name='planTitle']").each(function() {
						if (!(/\S{2,}/.test($(this).val()))) {
							judge = false;
							str = str2;
						} else {
							str = str1;
						}
						$(this).next().children().text(str);
				});
				return judge;
			}
			$("input[name='planTitle']").blur(function(){
				if (!(/\S{2,}/.test($(this).val()))) {
					$(this).next().children().text("不能为空并且输入两位以上的数 *");
				} else {
					$(this).next().children().text("*");
				}
			})
			
			$("#projectidName").change(function(){  
				$(this).valid();  
			});
			$("#actorName").change(function(){  
				$(this).valid();  
			});
			$("#select").change(function(){
			     var select=$("#select").val();
				if(select==0){
					//工作任务					
				}else if(select==1){
					window.location.href="${ctx}/oa/mytask/oaPlan/href";
				}else{
					//会议
					window.location.href="${ctx}/oa/mytask/oaPlan/form";
				}
			})
		});
	
		
		function setSelectUserNo(radioObj) {

			var radioCheck = $(radioObj).val();
			if ("1" == radioCheck) {
				$(radioObj).attr("checked", false);
				$(radioObj).val("0");

			} else {
				$(radioObj).val("1");

			}
		}
			function choose(){
			var title=$("#projectid option:selected'").val();
		 	if(title==null || title==''){
				top.$.jBox.tip.mess = 1;
				top.$.jBox.tip("类型不能为空！", "error", {
					persistent : true,
					opacity : 0
				});
				$("#messageBox").show();
				return false;
		 	}}
			
			

			
	</script>
</head>
<body>
	<sys:message content="${message}"/>	
	<form:form id="inputForm" modelAttribute="oaPlan" action="${mctx}/oa/plan/oaPlan/mytasksave" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
			<tr>
				<td class="width-15 active" colspan="2">
					<input id="btnCancel" class="btn btnCancel" type="button" value="返 回" onclick="location.href='${mctx}/oa/plan/oaPlan'"/>
					<shiro:hasPermission name="oa:mytask:mytask:edit">
						<input id="fruit"  name="Fruit" type="hidden" value="0"  />
						<input id="btnSubmit1" class="btn btn-primary" type="submit" value="草 稿"/>&nbsp;
						<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;
					</shiro:hasPermission>
				</td>
			</tr>
			<tr>
				<td class="width-15 active" colspan="2">
					<div style='text-align:center'><fieldset><legend>计划任务编辑</legend></fieldset></div>
				</td>
			</tr>
			<tr>
				<td class="width-15 active">计划类型</td>
				<td class="width-35">
					<form:select path="planType" class="form-control"  id="select"  cssStyle="width: 100%">
						<form:option value="" label=""/>
						<form:options items="${fns:getDictList('plan_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
					<span class="help-inline"><font color="red">*</font> </span>
				</td>
			</tr>
			<tr>
		    	<td class="width-15 active">任务名称</td>
				<td class="width-35">
					<form:input name="planTitle" path="planTitle" htmlEscape="false" maxlength="200"  class="form-control" cssStyle="width: 100%"/>
					<span class="help-inline"><font color="red">*</font></span>
				</td>
			</tr>
			<tr>	
				<td class="width-15 active">内容</td>
				<td class="width-35">
					<form:textarea path="content" htmlEscape="false" rows="4" maxlength="2000" cols="50" class="form-control " cssStyle="width: 100%"/>
				</td>
			</tr>
			<tr>	
				<td class="width-15 active">优先级</td>
				<td class="width-35">
					<form:select path="prefer" class="form-control"  id="select" cssStyle="width: 100%">
						<form:option value="" label="" />
						<form:options items="${fns:getDictList('prefer')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
					<span class="help-inline"><font color="red">*</font> </span>
				</td>
			</tr>
			<tr>	
				<td class="width-15 active">任务日期</td>
				<td class="width-35">
					<input   name="startDay" type="text" readonly="readonly" maxlength="20" class="laydate-icon form-control layer-date input-sm required"
						value="<fmt:formatDate value="${oaPlan.startDay}" pattern="yyyy-MM-dd"/>"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false,minDate:'%y-%M-%d'});"/>
					<span class="help-inline"><font color="red">*</font> </span>
				</td>
			</tr>
			<tr>	
				<td class="width-15 active">关联项目</td>
				<td class="width-35">
					<select  class="form-control" name="projectid" id="projectid" >
					<option value="${oaProject.id}">${oaProject.projectName}</option>
					<c:forEach items="${page}" var="oaProject" varStatus="status">
						<option value="${oaProject.id}" >${oaProject.projectName}</option>
						</c:forEach>
					</select>
				</td> 
			</tr>
			<tr>	
				<td class="width-15 active">任务开始时间</td>
				<td class="width-35">
					<input name="startTime" type="text" readonly="readonly" maxlength="20" class="laydate-icon form-control layer-date input-sm required"
						value="<fmt:formatDate value="${str}" pattern="HH:mm:ss"/>"
						onclick="WdatePicker({dateFmt:'HH:mm',isShowClear:false,qsEnabled:true,quickSel:['08:30','12:00','13:00','13:30','17:30']});"/>
					<span class="help-inline"><font color="red">*</font> </span>
				</td>
			</tr>
			<tr>	
				<td class="width-15 active">任务期望完成时间</td>
				<td class="width-35">
					<input  name="endTime" type="text" readonly="readonly" maxlength="20" class="laydate-icon form-control layer-date input-sm required"
						value="<fmt:formatDate value="${etr}" pattern="yyyy-MM-dd HH:mm:ss"/>"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false,minDate:'%y-%M-%d %H:%m:%s'});"/>
					<span class="help-inline"><font color="red">*</font> </span><span id="cz" class="help-inline"><font color="red"></font></span>
				</td>
			</tr>
			<tr>
		 		<td class="width-15 active">任务反馈</td>
				<td class="width-35">
					<form:textarea path="remarks" htmlEscape="false" rows="4"  cols="60" maxlength="255" class="form-control "/>
				</td>
			</tr> 
			<tr>
				<td class="width-15 active">分配人员</td>
				<td class="width-35">
					<sys:treeselect id="actor" name="actor" value="${oaPlan.actor.id}" labelName="actor.name" labelValue="${name}"
						title="参与者" url="/sys/office/treeData?type=3" cssClass="form-control input-sm required" allowClear="true" notAllowSelectParent="true" checked="true" />
				</td>
			</tr>
		</table>
	</form:form>
</body>
</html>