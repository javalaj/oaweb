<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>收到的任务回复</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				
				submitHandler: function(form){
					oaLoading('操作正在进行中，请耐心等待');
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
		});
	</script>
	    <style type="text/css">
        body{
            padding-top:20px;
        }
        ul,li{
            list-style-type: none;
            padding: 0;
            margin-bottom: 0;
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
    		color: #434f66;
            padding: 14px 15px 8px;
            position: relative;
        }
        .top p{
            font-size: 16px;
            font-weight: bolder;
        }
        .top span{
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

        .info{
            border-bottom: 1px solid #c8c7cc;
            padding-bottom: 25px;
            margin-bottom: 40px;
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
        
        .info ol li{
        	width: 65%;
        	height:38px;
        	line-height:38px;
    		margin-left: 6%;
        } 

        button{
            background-color: #35a5e7;
            color: #fff;
            float: left;
        }
        
        #btnSubmit{
        	margin-left:25%;
        	background:#35a5e7;
        	color:#fff;
        }
        
        #btnSubmit1{
        	background:#35a5e7;
        	color:#fff;
        	margin-left:0;
        	margin-right:25%;
        	float:right;
        }
        
        #btnSubmit:hover,#btnSubmit1:hover{
        	background:#1f5adb;
        }

    </style>
</head>
<body class="gray-bg">
<div class="container task">
    <div class="row">
        <div class="col-xs-8 col-xs-offset-2">
            <div class="content">
                <div class="top">
                    <p>【${oaProject.projectName}】 -${oaPlan.planTitle }</p>
                    <span>发布人：${acName}</span>
                    <time><fmt:formatDate value="${oaPlan. createDate}"
						pattern="yyyy-MM-dd" /></time>
                    <a href="${ctx}/oa/mytask/myTask/mylist"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a>
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
                                <p><fmt:formatDate value="${str }" pattern="yyyy-MM-dd HH:mm:ss"/></p>
                            </li>
                            <li>
                                <span>期望结束时间</span>
                                <p>	<fmt:formatDate value="${etr}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
                            </li>
                            <li>
                                <span>发送对象</span>
                                <p>${masterName}</p>
                            </li>
                            <li>
                                <span>相关文件</span>
                                <p> <input type="hidden" id="billingFile${oaPlan.id}"value="${oaPlan.files}"/>
									<sys:ckfinder input="billingFile${oaPlan.id}" readonly="true" type="files" uploadPath="/oa/oaTask" selectMultiple="true"/> </p>
                            </li>
                                <li>
                                <span>任务办理情况</span>
                                <p>${oaPlan.remarks } </p>
                            </li>
                            <li>
                                <span>办理相关文件</span>

                                <p><input type="hidden" id="cc${oaPlanMian.id}"value="${oaPlanMian.backfiles}"/>
									<sys:ckfinder input="cc${oaPlanMian.id}" readonly="true" type="files" uploadPath="/oa/oaTask/replyFile" selectMultiple="true"/> </p>
<%-- =======
                                <p><input type="hidden" id="${oaPlan.id}"value="${oaPlan.backfiles}"/>
									<sys:ckfinder input="${oaPlan.id}" readonly="true" type="files" uploadPath="/oa/oaTask/replyFile" selectMultiple="true"/> </p>
>>>>>>> .r4539 --%>
                            </li>
                        </ul>
                    </div>
                    <input type="text" id=”id“ value="${oaPlan.id}" style="display: none;"> 
                    <div class="row">
                    <c:choose>
							<c:when test="${oaPlan.state==2 }">
							</c:when>
							<c:otherwise>
								 <input id="btnSubmit1" class="btn col-md-offset-2 btn-keep" type="button" onclick="reply();" value="回复此任务"/>
							 <input id="btnSubmit" class="btn col-md-offset-1 btn-keep" type="button"   onclick="childForm();"  value="编辑子任务"/>
							</c:otherwise>
						</c:choose> 
                    </div>
                </div>
            </div>

        </div>
    </div>
    </div>
    	<script type="text/javascript">
    	    function reply(){
    	    	var id='${oaPlan.id}';
  				location.href="${ctx}/oa/mytask/myTask/subform?delitem="+id+"&flag="+1;
    	    }
  			function childForm(){
  				var id='${oaPlan.id}';
  				location.href="${ctx}/oa/mytask/myTask/subform?delitem="+id+"&flag="+2;
    	    }
    	
					function history() {
			location.href="${ctx}/oa/mytask/myTask/mylist";
		}
			</script>
</body>
<%-- <body class="gray-bg">
<div class="wrapper wrapper-content">
<div class="ibox">
<div class="ibox-title">
		<h5>收到的任务： </h5>
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
	<form:form id="inputForm" modelAttribute="oaPlan" action="${ctx}/oa/mytask/myTask/UpTaksRemarks" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
	<table class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
				<tr>
		<td>计划类型：</td>
				<td>
				工作任务<input value="${oaPlan.id}" style="display: none;"
					name="reid">
				</td>
	    	<td>任务名称：</td>
			<td>
			${oaPlan.planTitle }
			</td>
				</tr>
			<tr>	
			<td>内容：</td>
			<td>
				<textarea rows="4" maxlength="2000" class="input-xxlarge" readonly="readonly" >${oaPlan.content }</textarea>
			</td>
			<td>附件：</td>
			<td>
				 <input type="hidden" id="billingFile${oaPlan.id}"value="${oaPlan.files}"/>
									<sys:ckfinder input="billingFile${oaPlan.id}" readonly="true" type="files" uploadPath="/oa/oaTask" selectMultiple="true"/>
		</td>
		</tr>
		<tr>	
		<td>优先级：</td>
		<td>
		<c:choose>
							<c:when test="${oaPlan.prefer == 0}">
							1
							</c:when>
							<c:when test="${oaPlan.prefer == 1 }">
							2
							</c:when>
							<c:when test="${oaPlan.prefer == 2 }">
							3
							</c:when>
							<c:otherwise>
							4
							</c:otherwise>
						</c:choose>
				</td>
					<td>任务日期：</td>
				<td>
				<fmt:formatDate value="${oaPlan.startDay}" pattern="yyyy-MM-dd"/>
					</td>
			<td>反馈附件：</td>	
			<td>
				<form:hidden id="backfiles" path="backfiles" htmlEscape="false" maxlength="2000" class="input-xlarge"/>
				<sys:ckfinder input="backfiles" type="files" uploadPath="/oa/oaTask" selectMultiple="true"/>
		</td>
		</tr>
		<tr>	
			<td>关联项目：</td>
			<td>
				${oaProject.projectName}
				</td> 
				</tr>
				<tr>	
					<td>任务开始时间：</td>
					<td>
			<fmt:formatDate value="${str}" pattern="HH:mm:ss"/>
				
				</td>
			<td>任务期望完成时间：</td>
			<td>
				<fmt:formatDate value="${etr}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
		</tr>
		<tr>
	 	<td >任务反馈：</td>
		
			<td colspan="3" >
				<form:textarea class="form-control " path="remarks" htmlEscape="false" rows="4"  cols="60" maxlength="255" />
			</td>
			</tr> 
			<tr>
			<td>分配人员:</td>
			<td colspan="3">
				${name}
			</td>
			</tr>
			<tr>
			<td colspan="3"></td>
			<td > 
			
			<shiro:hasPermission name="oa:mytask:mytask:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history()"/>
			</td>
		</tr>
		</table>
	<br/>
	<br/>
	</div>
	</div>
	</div>
				<script type="text/javascript">
					function history() {
			location.href="${ctx}/oa/mytask/myTask/";
		}
					</script>
	</form:form>
</body> --%>
</html>