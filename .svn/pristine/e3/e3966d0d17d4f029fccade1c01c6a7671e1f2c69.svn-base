<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>通知管理</title>
	<meta name="decorator" content="default"/>
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no" />
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/mobile/css/mui.min.css" />
	<script src="${ctxStatic}/mobile/js/mui.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/mobile/oa/css/oaDoc.css" />
	<style class="text/css">
		.mui-input-row label{
			font-size:16px;
		}
		.mui-btn-primary{
			    border: 1px solid #12b5f7;
   				background-color: #12b5f7;
   				width:20%;
		}
		.mui-input-row label{
			width:27%;
		}
		.mui-input-row input{
			width: 75%;
		}
	</style>

	<script type="text/javascript">
	mui.init({
		swipeBack:true //启用右滑关闭功能
	});
	
	/*表单验证*/
    function doSubmit()
	{
		if($("#title").val()!=null&&$("#title").val()!="")
		{
			if($("#title").val().length>20)
			{
		 		mui.init().alert("标题长度过长","提示",['确定'],null,false); 
			}
			else
			{
   				if($("#content").val()!=null&&$("#content").val()!="")
   				{
 	  				if($("#type").val()!=null&&$("#type").val()!="")
 	  				{
 		  				if($("#status").val()!=null&&$("#status").val()!="")
 		  				{
 			 				if($("#oaNotifyRecordName").val()!=null&&$("#oaNotifyRecordName").val()!="")
 			 				{
 				  				$("#inputForm").submit();   
 			  				}
 			 				else
 			 				{
 				  				mui.init().alert("接收人不能为空","提示",['确定'],null,false); 
							}       			         			  
  		  				}
 		  				else
 		  				{
  			  				mui.init().alert("状态不能为空","提示",['确定'],null,false);
  		  				}
  	  				}
 	  				else
 	  				{
  		  				mui.init().alert("类型不能为空","提示",['确定'],null,false); 
  	  				}
				}
   				else
   				{
          			mui.init().alert("内容不能为空","提示",['确定'],null,false);
				}
   			}
		}
		else
		{
        	mui.init().alert("标题不能为空","提示",['确定'],null,false);
		}
	}
	</script>
</head>
<body class="mui-ios mui-ios-9 mui-ios-9-1">
 	<header class="mui-bar mui-bar-nav" style="position: fixed; top: 0px; left: 0; z-index: 9999;">
		<a class="mui-icon mui-icon-back mui-pull-left" onclick="location.href='${mctx}/oa/oaNotify/allList'"></a>
		<h1 class="mui-title">发布通知</h1>
	</header>
	<div class="mui-content">
		<form:form id="inputForm" modelAttribute="oaNotify" action="${mctx}/oa/oaNotify/save" method="post" class="mui-input-group">
			<form:hidden path="id"/>
			<input type="hidden" name="prePage" value="${param.prePage}"/>
			<sys:message content="${message}"/>
			<div class="mui-input-row">
				<label class="oaDocFormLabel">标题</label>
				<form:input path="title" htmlEscape="false" id="title" maxlength="64" placeholder="输入标题"/>				
			</div>
			<div >
				<form:textarea path="content" htmlEscape="false" rows="10" class="" id="content" placeholder="内容···" /> 							 
			</div>
			<div class="mui-input-row">
				<label class="oaDocFormLabel">类型</label>
				<form:select path="type" id="type">
					<form:options items="${fns:getDictList('my_notify_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"><font color="red"></font></span>
			</div>
			<div class="mui-input-row">
				<label class="oaDocFormLabel">状态</label>
				<form:select path="status" id="status">
					<form:options items="${fns:getDictList('oa_notify_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"> </span>
			</div> 
			<div class="mui-input-row">
				<label class="oaDocFormLabel">接收人</label>
					<sys:treeselect id="oaNotifyRecord" name="oaNotifyRecordIds" height="100% !important"  width="100% !important" value="${oaNotify.oaNotifyRecordIds}" labelName="actor.name" labelValue="${oaNotify.oaNotifyRecordNames}"
						title="参与者" url="/sys/office/treeData?type=3&isAll=true" cssClass="form-control required" allowClear="false" notAllowSelectParent="true" checked="true" />
					<span class="help-inline"><font color="red">*</font></span>
			</div>
			<div class="mui-button-row">
				<shiro:hasPermission name="oa:oaNotify:edit">				
					<button type="button" class="mui-btn mui-btn-primary" onclick="doSubmit()"  style="width:20%">保存</button>&nbsp;&nbsp;
				</shiro:hasPermission> 
			</div>
		</form:form>
	</div>
</body>
</html>