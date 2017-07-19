<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>我的任务管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					//loading('正在提交，请稍等...');
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
			$("#files").hidde();
		});
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
	<style type="text/css">
        ul,li{
            list-style-type: none;
            padding: 0;
            margin-bottom: 0;
        }
        .row {
		    margin-top: 20px;
		}
        .task li{
        	display:inline-block;
        	width:100%;
        	height:38px;
        	line-height:38px;
        }
        .content{
            border: 1px solid #ddd;
            border-radius: 3px;
            padding-top: 0;
        }
        .top{
            background-color: #eff4f8;
            padding: 14px 15px 10px;
            color:#434f66;
            position: relative;
        }
        .top p{
            font-size: 16px;
        }
        .top span{
        	font-size:13px;
            margin:0 16px 0 8px;
        }
        .top a{
            color: #434f66;
            position: absolute;
            top:18px;
            right:15px;
        }
        .main{
            padding:25px 4% 40px;
            background-color: #fff;
        }

        .info ul:first-child{
        	padding-bottom:20px;
        }
        .info ul:last-child{
        	padding-top:20px;
            border-top: 1px solid #c8c7cc;
        }
        .info ul li span{
            float: left;
            width: 18%;
            text-align: right;
            color: #333;
        }

        .info ul li p{
            margin-left: 24%;
            color: #666;
            line-height: 38px;;
        }
        
        .info ol{
        	margin-left: 24%;
        }
        
        .info ol li {
		    height: 38px;
		    line-height: 38px;
		}

        button{
            background-color: #35a5e7;
            color: #fff;
            float: left;
        }

    </style>
</head>

<body class="gray-bg">
	<div class="container task">
    <div class="row">
        <div class="col-xs-8 col-xs-offset-2">
            <div class="content">
                <div class="top">
                    <p>【${oaProject.projectName}】 - ${oaPlan.planTitle }</p>
                      <span>发布人：${actName}</span>
                    <time><fmt:formatDate value="${oaPlan. createDate}"
						pattern="yyyy-MM-dd" /></time>
                    <a href="${ctx}/oa/mytask/myTask/"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a>
                </div>
                <div class="main">
                    <div class="info">
                        <ul>
                            <li>
                                <span>任务描述</span>
                                <p>${oaPlan.content }</p>
                            </li>
                            <li>
                                <span>开始时间</span>
                                <p><fmt:formatDate value="${oaPlan.startDay}"
						pattern="yyyy-MM-dd" />   ${oaPlan.startTime}</p>
                            </li>
                            <li>
                                <span>期望结束时间</span>
                                <p>${oaPlan.endTime}</p>
                            </li>
                            <li>
                                <span>发送对象</span>
                                <p>${masterName}</p>
                            </li>
                            <li>
                                <span>相关文件</span>
                                <p><input type="hidden" id="billingFile${oaPlan.id}"value="${oaPlan.files}"/>
									<sys:ckfinder input="billingFile${oaPlan.id}" readonly="true" type="files" uploadPath="/oa/oaTask" selectMultiple="true"/></p>
                            </li>
                        </ul>
                        <ul>
                            <li>
                                <span>任务办理情况</span>
                                <p>${oaPlan.remarks } </p>
                            </li>
                            <li>
                                <span>办理相关文件</span>
                                <p><input type="hidden" id="hh${oaPlan.id}"value="${oaPlan.backfiles}"/>
									<sys:ckfinder input="hh${oaPlan.id}" readonly="true" type="files" uploadPath="/oa/oaTask/replyFile" selectMultiple="true"/> </p>
                            </li>
                            </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <c:if test="${oaPlanChild.size()!=null}">
		<c:forEach items="${oaPlanChild }" var="oaPlanChild">
  <div class="row">
        <div class="col-xs-8 col-xs-offset-2">
            <div class="content">
                <div class="top">
                    <p>【${oaPlanChild.proname}】 -${oaPlanChild.planTitle}</p>
                        <span>发布人：${oaPlanChild.childActName}</span>
                    <time><fmt:formatDate value="${oaPlanChild. createDate}"
						pattern="yyyy-MM-dd" /></time>
                </div>
                <div class="main">
                    <div class="info">
                        <ul>
                            <li>
                                <span>任务描述</span>
                                <p>${oaPlanChild.content }</p>
                            </li>
                            <li>
                                <span>开始时间</span>
                                <p><fmt:formatDate value="${oaPlanChild.startDay}"
						pattern="yyyy-MM-dd" />   ${oaPlanChild.startTime}</p>
                            </li>
                            <li>
                                <span>期望结束时间</span>
                                <p>${oaPlanChild.endTime}</p>
                            </li>
                            <li>
                                <span>发送对象</span>
                                <p>${oaPlanChild.actName}</p>
                            </li>
                            <li>
                                <span>相关文件</span>
                                <p><input type="hidden" id="billingFile${oaPlanChild.id}"value="${oaPlanChild.files}"/>
									<sys:ckfinder input="billingFile${oaPlanChild.id}" readonly="true" type="files" uploadPath="/oa/oaTask" selectMultiple="true"/></p>
                            </li>
                        </ul>
                        <ul>
                                  <li>
                                <span>任务办理情况</span>
                                <p>${oaPlanChild.remarks } </p>
                            </li>
                            <li>
                                <span>办理相关文件</span>
                             <p><input type="hidden" id="ccc${oaPlanChild.id}"value="${oaPlanChild.backfiles}"/>
									<sys:ckfinder input="ccc${oaPlanChild.id}" readonly="true" type="files" uploadPath="/oa/oaTask/replyFile" selectMultiple="true"/> </p>
                            </li>
                            </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</c:forEach>
</c:if>
    </div>

	
 				

<%-- <body class="gray-bg">
<div class="wrapper wrapper-content">
<div class="ibox">
<div class="ibox-title">
		<h5>主任务： </h5>
		<div class="ibox-tools">
			<a class="collapse-link">
				<i class="fa fa-chevron-up"></i>
			</a>
			<a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#">
				<i class="fa fa-wrench"></i>
			</a>
			<a class="close-link">
				<i class="fa fa-times"></i>
			</a>
		</div>
	</div>
   <div class="ibox-content">
   	<sys:message content="${message}"/>
   	<div class="row">
	<div class="col-sm-12">
	<br/>
	</div>
	</div>
	<form:form id="inputForm" modelAttribute="oaPlan"
		action="${ctx}/oa/mytask/oaPlan/mytasksave" method="post"
		class="form-horizontal">
		<form:hidden path="id" />
		<sys:message content="${message}" />
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
			<tr>
				<td style="text-align: center">计划类型：</td>
				<td style="text-align: center">工作任务</td>
				<td style="text-align: center">任务名称：</td>
				<td style="text-align: center">${oaPlan.planTitle }</td>

			</tr>
			<tr>
				<td style="text-align: center">内容：</td>
				<td><textarea rows="4" maxlength="2000" class="input-xxlarge "
						readonly="readonly">${oaPlan.content }</textarea></td>
				<td style="text-align: center">附件：</td>
				<td> <input type="hidden" id="billingFile${oaPlan.id}"value="${oaPlan.files}"/>
									<sys:ckfinder input="billingFile${oaPlan.id}" readonly="true" type="files" uploadPath="/oa/oaTask" selectMultiple="true"/></td>
			</tr>
			<tr>
				<td style="text-align: center">优先级1：</td>
				<td><c:choose>
							<c:when test="${oaPlan.prefer=='0'}">
						1
							</c:when>
							<c:when test="${oaPlan.prefer=='1'}">
						2
							</c:when>
									<c:when test="${oaPlan.prefer=='2'}">
						3
							</c:when>
							<c:otherwise>
								4
							</c:otherwise>
						</c:choose></td>
				<td style="text-align: center">任务日期：</td>
				<td><fmt:formatDate value="${oaPlan.startDay}"
						pattern="yyyy-MM-dd" /></td>
				<td>反馈附件：</td>	
			<td>
				<form:hidden id="backfiles" path="backfiles" htmlEscape="false" maxlength="2000" class="input-xlarge"/>
				<sys:ckfinder input="backfiles" type="files" uploadPath="/oa/oaTask" selectMultiple="true"/>
		</td>
			</tr>
			<tr>
				<td>状态：</td>
		
			<td>	 <form:radiobuttons path="state" items="${fns:getDictList('status')}" itemLabel="label" itemValue="value" htmlEscape="false" class=""/> 
			</td>
				<td style="text-align: center">关联项目：</td>
				<td>${oaProject.projectName}</td>
			</tr>
			<tr>
				<td style="text-align: center">任务开始时间：</td>
				<td >${oaPlan.startTime}</td>
				<td style="text-align: center">任务期望完成时间：</td>
				<td >${oaPlan.endTime}</td>
			</tr>
	
			<tr>
				<td style="text-align: center">任务反馈：</td>

				<td colspan="3"><textarea  rows="4"
						maxlength="255" class="input-xxlarge" readonly="readonly" >${oaPlan.remarks }</textarea></td>
			</tr>
		<tr>
			<td style="text-align: center">完成人员:</td>
				<td colspan="3">${masterName}</td>
				</tr>
			<tr>
				<td style="text-align: center" colspan="3"></td>
				<td style="text-align: center"><c:if test="${oaPlanChild.size()==null}"><input id="btnCancel" class="btn" type="button"
					value="返 回" onclick="history()" />
					</c:if></td>
			</tr>
		</table>
	</form:form>
	<br/>
	<br/>
	</div>
	</div>
	</div>
		<c:if test="${oaPlanChild.size()!=null}">
		<c:forEach items="${oaPlanChild }" var="oaPlanChild">
		<div class="wrapper wrapper-content">
<div class="ibox">
<div class="ibox-title">
		<h5>子任务:</h5>
		<div class="ibox-tools">
			<a class="collapse-link">
				<i class="fa fa-chevron-up"></i>
			</a>
			<a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#">
				<i class="fa fa-wrench"></i>
			</a>
			<a class="close-link">
				<i class="fa fa-times"></i>
			</a>
		</div>
	</div>
   <div class="ibox-content">
   	<sys:message content="${message}"/>
   	<div class="row">
	<div class="col-sm-12">
	<br/>
	</div>
	</div>
		
			<form:form modelAttribute="oaPlanI" method="post"
		class="form-horizontal">
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
			<tr>
				<td>计划类型：</td>
				<td>工作任务
				</td>
				<td>任务名称：</td>
				<td>${oaPlanChild.planTitle}</td>

			</tr>
			<tr>
				<td>内容：</td>
				<td><textarea  rows="4" maxlength="2000" class="input-xxlarge "
						readonly="readonly" >${oaPlanChild.content }</textarea></td>
				<td>附件：</td>
				<td> <input type="hidden" id="billingFile${oaPlanChild.id}"value="${oaPlanChild.files}"/>
									<sys:ckfinder input="billingFile${oaPlanChild.id}" readonly="true" type="files" uploadPath="/oa/oaTask" selectMultiple="true"/></td>
			</tr>
			<tr>
				<td>优先级：</td>
				<td><c:choose>
							<c:when test="${oaPlanChild.prefer == 0}">
					1
							</c:when>
							<c:when test="${oaPlanChild.prefer == 1 }">
						2
							</c:when>
									<c:when test="${oaPlanChild.prefer == 2 }">
						3
							</c:when>
							<c:otherwise>
								4
							</c:otherwise>
						</c:choose></td>
				<td>任务日期：</td>
				<td><fmt:formatDate value="${oaPlanChild.startDay}"
						pattern="yyyy-MM-dd" /></td>
			
			</tr>
			<tr>
				<td>关联项目：</td>
				<td colspan="3">${oaPlanChild.proname}</td>
			</tr>
			<tr>
				<td>任务开始时间：</td>
				<td>${oaPlanChild.startTime}</td>
				<td>任务期望完成时间：</td>
				<td>${oaPlanChild.endTime}</td>
			</tr>
			<tr>
				<td>任务反馈：</td>

				<td colspan="3"><textarea rows="4" maxlength="255" class="input-xxlarge "
						readonly="readonly">${oaPlanChild.remarks }</textarea></td>
			</tr>
			<tr>
				<td>完成人员:</td>
				<td colspan="3">${oaPlanChild.actName}</td>
			</tr>
			<tr>
				<td colspan="3"></td>
				<td></td>
			</tr>
		</table>
					</form:form>
		</c:forEach>
		</c:if>	
		<c:if test="${oaPlanChild.size()!=null}">
		<form:form modelAttribute="oaPlanI" method="post"
		class="form-horizontal">
		<table class="table-form">
			<tr >
				<td><input id="btnCancel" class="btn" type="button" value="返 回"
					onclick="history" /></td>
			</tr>
		</table>
					</form:form>
	<br/>
	<br/>
	</div>
	</div>
	</div>
					</c:if> --%>
							<script type="text/javascript">
					function history() {
			location.href="${ctx}/oa/mytask/myTask/";
		}
					</script>
</body>
</html>