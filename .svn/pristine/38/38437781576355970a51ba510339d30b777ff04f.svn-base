<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>主子表管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
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
		});
		function addRow(list, idx, tpl, row){
			$(list).append(Mustache.render(tpl, {
				idx: idx, delBtn: true, row: row
			}));
			$(list+idx).find("select").each(function(){
				$(this).val($(this).attr("data-value"));
			});
			$(list+idx).find("input[type='checkbox'], input[type='radio']").each(function(){
				var ss = $(this).attr("data-value").split(',');
				for (var i=0; i<ss.length; i++){
					if($(this).val() == ss[i]){
						$(this).attr("checked","checked");
					}
				}
			});
		}
		function delRow(obj, prefix){
			var id = $(prefix+"_id");
			var delFlag = $(prefix+"_delFlag");
			if (id.val() == ""){
				$(obj).parent().parent().remove();
			}else if(delFlag.val() == "0"){
				delFlag.val("1");
				$(obj).html("&divide;").attr("title", "撤销删除");
				$(obj).parent().parent().addClass("error");
			}else if(delFlag.val() == "1"){
				delFlag.val("0");
				$(obj).html("&times;").attr("title", "删除");
				$(obj).parent().parent().removeClass("error");
			}
		}
	</script>
</head>
<body  class="gray-bg">
<div class="wrapper wrapper-content">
<div class="ibox">
<div class="ibox-title">
		<h5>主子表表单 </h5>
		<div class="ibox-tools">
			<a class="collapse-link">
				<i class="fa fa-chevron-up"></i>
			</a>
			<a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#">
				<i class="fa fa-wrench"></i>
			</a>
			<ul class="dropdown-menu dropdown-user">
				<li><a href="#">选项1</a>
				</li>
				<li><a href="#">选项2</a>
				</li>
			</ul>
			<a class="close-link">
				<i class="fa fa-times"></i>
			</a>
		</div>
	</div>      
    <div class="ibox-content">
	<form:form id="inputForm" modelAttribute="testDataMain" action="${ctx}/test/testDataMain/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
		   <tbody>
		      <tr>
		         <td  class="width-15 active"><label class="pull-right"><font color="red">*</font>归属用户:</label></td>
		         <td class="width-35" ><sys:treeselect id="user" name="user.id" value="${testDataMain.user.id}" labelName="user.name" labelValue="${testDataMain.user.name}"
					title="用户" url="/sys/office/treeData?type=3" cssClass="form-control m-b required " allowClear="true" notAllowSelectParent="true"/></td>
		         <td  class="width-15 active"><label class="pull-right"><font color="red">*</font>归属部门:</label></td>
		         <td  class="width-35" > <sys:treeselect id="office" name="office.id" value="${testDataMain.office.id}" labelName="office.name" labelValue="${testDataMain.office.name}"
					title="部门" url="/sys/office/treeData?type=2" cssClass="form-control m-b required " allowClear="true" notAllowSelectParent="true"/>
				</td>
		      </tr>
		      <tr>
		         <td  class="width-15 active"><label class="pull-right"><font color="red">*</font>归属区域:</label></td>
		         <td class="width-35" >	<sys:treeselect id="area" name="area.id" value="${testDataMain.area.id}" labelName="area.name" labelValue="${testDataMain.area.name}"
					title="区域" url="/sys/area/treeData" cssClass="form-control m-b required " allowClear="true" notAllowSelectParent="true"/></td>
		         <td  class="width-15 active"><label class="pull-right">名称:</label></td>
		         <td  class="width-35" ><form:input path="name" htmlEscape="false" maxlength="100" class="form-control m-b"/></td>
		      </tr>
		      <tr>
		         <td  class="width-15 active"><label class="pull-right">性别:</label></td>
		         <td class="width-35" ><form:radiobuttons path="sex" items="${fns:getDictList('sex')}" itemLabel="label" itemValue="value" htmlEscape="false" class="i-checks"/></td>
		         <td  class="width-15 active"><label class="pull-right">加入日期:</label></td>
		         <td  class="width-35" >
					<input name="inDate" type="text" readonly="readonly" maxlength="20" class="form-control m-b "
					value="<fmt:formatDate value="${testDataMain.inDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/></td>
		      </tr>
		      <tr>
		         <td  class="width-15 active"><label class="pull-right">备注信息:</label></td>
		         <td colspan="3" style="text-align: center;" class="width-35" ><form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="form-control m-b "/></td>		         
		      </tr>	   
		    </tbody>
		  </table>						
<table id="contentTable" class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
						<caption>业务子表</caption>
						<thead>
							<tr>
								<th class="hide"></th>
								<th>名称</th>
								<th>备注信息</th>
								<shiro:hasPermission name="test:testDataMain:edit"><th width="10">&nbsp;</th></shiro:hasPermission>
							</tr>
						</thead>
						<tbody id="testDataChildList">
						</tbody>
						<shiro:hasPermission name="test:testDataMain:edit"><tfoot>
							<tr><td colspan="4"><a href="javascript:" onclick="addRow('#testDataChildList', testDataChildRowIdx, testDataChildTpl);testDataChildRowIdx = testDataChildRowIdx + 1;" class="btn btn-white btn-sm "><i class="fa fa-plus"></i></a></td></tr>
						</tfoot></shiro:hasPermission>
					</table>
					<script type="text/template" id="testDataChildTpl">//<!--
						<tr id="testDataChildList{{idx}}">
							<td class="hide">
								<input id="testDataChildList{{idx}}_id" name="testDataChildList[{{idx}}].id" type="hidden" value="{{row.id}}"/>
								<input id="testDataChildList{{idx}}_delFlag" name="testDataChildList[{{idx}}].delFlag" type="hidden" value="0"/>
							</td>
							<td>
								<input id="testDataChildList{{idx}}_name" name="testDataChildList[{{idx}}].name" type="text" value="{{row.name}}" maxlength="100" class="form-control m-b "/>
							</td>
							<td>
								<input id="testDataChildList{{idx}}_remarks" name="testDataChildList[{{idx}}].remarks" type="text" value="{{row.remarks}}" maxlength="255" class="form-control m-b  "/>
							</td>
							<shiro:hasPermission name="test:testDataMain:edit"><td class="text-center" width="10">
								{{#delBtn}}<span class="close" onclick="delRow(this, '#testDataChildList{{idx}}')" title="删除">&times;</span>{{/delBtn}}
							</td></shiro:hasPermission>
						</tr>//-->
					</script>
					<script type="text/javascript">
						var testDataChildRowIdx = 0, testDataChildTpl = $("#testDataChildTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
						$(document).ready(function() {
							var data = ${fns:toJson(testDataMain.testDataChildList)};
							for (var i=0; i<data.length; i++){
								addRow('#testDataChildList', testDataChildRowIdx, testDataChildTpl, data[i]);
								testDataChildRowIdx = testDataChildRowIdx + 1;
							}
						});
					</script>
		<div class="form-actions " style="text-align:center;">
			<shiro:hasPermission name="test:testDataMain:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div> 
	</form:form>
	<br/>
	<br/>
	</div>
	</div>
</div>
</body>
</html>