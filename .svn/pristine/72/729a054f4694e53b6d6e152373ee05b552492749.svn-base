<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>文章管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		/* $(document).ready(function() {
            if($("#link").val()){
                $('#linkBody').show();
                $('#url').attr("checked", true);
            }
			$("#title").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
                    if ($("#categoryId").val()==""){
                        $("#categoryName").focus();
                        top.$.jBox.tip('请选择归属栏目','warning');
                    }else if (CKEDITOR.instances.content.getData()=="" && $("#link").val().trim()==""){
                        top.$.jBox.tip('请填写正文','warning');
                    }else{
                        loading('正在提交，请稍等...');
                        form.submit();
                    }
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
		}); */
		var validateForm;
		function doSubmit(){//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
		  if(validateForm.form()){
			  $("#inputForm").submit();
			  return true;
		  }

		  return false;
		}
		$(document).ready(function() {
			$("#name").focus();
			validateForm = $("#inputForm").validate({
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
	</script>
</head>
<body>
<%-- 	<ul class="nav nav-tabs">
		<li><a href="${ctx}/cms/article/?category.id=${article.category.id}">文章列表</a></li>
		<li class="active"><a href="<c:url value='${fns:getAdminPath()}/cms/article/form?id=${article.id}&category.id=${article.category.id}'><c:param name='category.name' value='${article.category.name}'/></c:url>">文章<shiro:hasPermission name="cms:article:edit">${not empty article.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="cms:article:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/> --%>
	<form:form id="inputForm" modelAttribute="article" action="${ctx}/cms/article/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<%-- <div class="form-actions">
			<shiro:hasPermission name="cms:article:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div> --%>
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
		   <tbody>
		      <tr>
		         <td  class="width-15 active"><label class="pull-right"><font color="red">*</font>归属栏目:</label></td>
		         <td class="width-35" ><sys:treeselect id="category" name="category.id" value="${article.category.id}" labelName="category.name" labelValue="${article.category.name}"
					title="栏目" url="/cms/category/treeData" module="article" selectScopeModule="true" notAllowSelectRoot="false" notAllowSelectParent="true" cssClass="required form-control m-b"/>
					<input id="url" type="checkbox" class="i-checks" onclick="if(this.checked){$('#linkBody').show()}else{$('#linkBody').hide()}$('#link').val()"><span>外部链接</span></td>
		         <td  class="width-15 active"><label class="pull-right"><font color="red">*</font>标题:</label></td>
		         <td  class="width-35" > <form:input path="title" htmlEscape="false" maxlength="200" class=" required form-control m-b"/>
		<span>颜色:</span>
				<form:select path="color" class="form-control m-b">
					<form:option value="" label="默认"/>
					<form:options items="${fns:getDictList('color')}" itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select>
				</td>
		      </tr>
		      <tr>
		         <td  class="width-15 active"><label class="pull-right">外部链接:</label></td>
		         <td class="width-35" >	<form:input path="link" htmlEscape="false" maxlength="200" class="form-control m-b"/>
                <span class="help-inline">绝对或相对地址。</span></td>
		         <td  class="width-15 active"><label class="pull-right">关键字:</label></td>
		         <td  class="width-35" ><form:input path="keywords" htmlEscape="false" maxlength="200" class="form-control m-b"/>
				<span class="help-inline">多个关键字，用空格分隔。</span></td>
		      </tr>
		      <tr>
		         <td  class="width-15 active"><label class="pull-right">权重:</label></td>
		         <td class="width-35" ><form:input path="weight" htmlEscape="false" maxlength="200" class="form-control m-b"/>
				<span>
					<input id="weightTop" type="checkbox" onclick="$('#weight').val(this.checked?'999':'0')" class="form-control m-b"><label for="weightTop">置顶</label>
				</span>过期时间：
				<input id="weightDate" name="weightDate" type="text" readonly="readonly" maxlength="20" class="form-control m-b"
					value="<fmt:formatDate value="${article.weightDate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true});"/>
				<span class="help-inline">数值越大排序越靠前，过期时间可为空，过期后取消置顶。</span></td>
		         <td  class="width-15 active"><label class="pull-right">摘要:</label></td>
		         <td  class="width-35" >
					<form:textarea path="description" htmlEscape="false" rows="4" maxlength="200" class="form-control m-b" /></td>
		      </tr>
		      <tr>
		         <td  class="width-15 active"><label class="pull-right">缩略图:</label></td>
		         <td class="width-35" > <input type="hidden" id="image" name="image" value="${article.imageSrc}"  class="form-control m-b"/>
				<sys:ckfinder input="image" type="thumb" uploadPath="/cms/article" selectMultiple="false" /></td>
				 <td  class="width-15 active"><label class="pull-right">正文:</label></td>
		         <td class="width-35" ><form:textarea id="content" htmlEscape="true" path="articleData.content" rows="4" maxlength="200" class="form-control m-b"/>
				<%-- <sys:ckeditor replace="content" uploadPath="/cms/article" /> --%></td>		         		         
		      </tr>	
		      <tr>
		         <td  class="width-15 active"><label class="pull-right">来源:</label></td>
		         <td class="width-35" > <form:input path="articleData.copyfrom" htmlEscape="false" maxlength="200" class="form-control m-b"/></td>
				 <td  class="width-15 active"><label class="pull-right">相关文章:</label></td>
		         <td class="width-35" ><form:hidden id="articleDataRelation" path="articleData.relation" htmlEscape="false" maxlength="200" class="form-control m-b"/>
				<ol id="articleSelectList"></ol>
				<a id="relationButton" href="javascript:" class="btn">添加相关</a>
				<script type="text/javascript">
					var articleSelect = [];
					function articleSelectAddOrDel(id,title){
						var isExtents = false, index = 0;
						for (var i=0; i<articleSelect.length; i++){
							if (articleSelect[i][0]==id){
								isExtents = true;
								index = i;
							}
						}
						if(isExtents){
							articleSelect.splice(index,1);
						}else{
							articleSelect.push([id,title]);
						}
						articleSelectRefresh();
					}
					function articleSelectRefresh(){
						$("#articleDataRelation").val("");
						$("#articleSelectList").children().remove();
						for (var i=0; i<articleSelect.length; i++){
							$("#articleSelectList").append("<li>"+articleSelect[i][1]+"&nbsp;&nbsp;<a href=\"javascript:\" onclick=\"articleSelectAddOrDel('"+articleSelect[i][0]+"','"+articleSelect[i][1]+"');\">×</a></li>");
							$("#articleDataRelation").val($("#articleDataRelation").val()+articleSelect[i][0]+",");
						}
					}
					$.getJSON("${ctx}/cms/article/findByIds",{ids:$("#articleDataRelation").val()},function(data){
						for (var i=0; i<data.length; i++){
							articleSelect.push([data[i][1],data[i][2]]);
						}
						articleSelectRefresh();
					});
					$("#relationButton").click(function(){
						top.$.jBox.open("iframe:${ctx}/cms/article/selectList?pageSize=8", "添加相关",$(top.document).width()-220,$(top.document).height()-180,{
							buttons:{"确定":true}, loaded:function(h){
								$(".jbox-content", top.document).css("overflow-y","hidden");
							}
						});
					});
				</script></td>		         		         
		      </tr>	 
		      <tr>
		         <td  class="width-15 active"><label class="pull-right">是否允许评论:</label></td>
		         <td class="width-35" > <form:radiobuttons path="articleData.allowComment" items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false" class="i-checks"/></td>
				 <td  class="width-15 active"><label class="pull-right">推荐位:</label></td>
		         <td class="width-35" > <form:checkboxes path="posidList" items="${fns:getDictList('cms_posid')}" itemLabel="label" itemValue="value" htmlEscape="false" class="i-checks"/></td>		         		         
		      </tr>	 
		      <tr>
		         <td  class="width-15 active"><label class="pull-right">发布时间:</label></td>
		         <td class="width-35" ><input id="createDate" name="createDate" type="text" readonly="readonly" maxlength="20" class="form-control m-b"
					value="<fmt:formatDate value="${article.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/></td>
				 <td  class="width-15 active"><label class="pull-right"><font color="red">*</font>发布状态:</label></td>
		         <td class="width-35" ><shiro:hasPermission name="cms:article:audit"><form:radiobuttons path="delFlag" items="${fns:getDictList('cms_del_flag')}" itemLabel="label" itemValue="value" htmlEscape="false" class="required i-checks"/></shiro:hasPermission></td>		         		         
		      </tr>
		       <tr>
		         <td  class="width-15 active"><label class="pull-right">自定义视图内容:</label></td>
		         <td class="width-35" > <shiro:hasPermission name="cms:article:audit"><form:select path="customContentView" class="form-control m-b">
                          <form:option value="" label="默认视图"/>
                          <form:options items="${contentViewList}" htmlEscape="false"/>
                      </form:select>
                      <span class="help-inline">自定义内容视图名称必须以"${article_DEFAULT_TEMPLATE}"开始</span></shiro:hasPermission></td>
				 <td  class="width-15 active"><label class="pull-right">自定义视图参数:</label></td>
		         <td class="width-35" ><shiro:hasPermission name="cms:article:audit"><form:input path="viewConfig" htmlEscape="true" class="form-control m-b"/>
                      <span class="help-inline">视图参数例如: {count:2, title_show:"yes"}</span></shiro:hasPermission></td>		         		         
		      </tr>	
		      <c:if test="${not empty article.id}">
		    <tr>
		         <td  class="width-15 active"><label class="pull-right">查看评论:</label></td>
		         <td class="width-35" colspan="3" > <input id="btnComment" class="form-control m-b" type="button" value="查看评论" onclick="viewComment('${ctx}/cms/comment/?module=article&contentId=${article.id}&status=0')"/>
					<script type="text/javascript">
						function viewComment(href){
							top.$.jBox.open('iframe:'+href,'查看评论',$(top.document).width()-220,$(top.document).height()-180,{
								buttons:{"关闭":true},
								loaded:function(h){
									$(".jbox-content", top.document).css("overflow-y","hidden");
									$(".nav,.form-actions,[class=btn]", h.find("iframe").contents()).hide();
									$("body", h.find("iframe").contents()).css("margin","10px");
								}
							});
							return false;
						}
					</script></td>
				
		      </tr></c:if>	 	    
		    </tbody>
		  </table>		
	</form:form>
</body>
</html>