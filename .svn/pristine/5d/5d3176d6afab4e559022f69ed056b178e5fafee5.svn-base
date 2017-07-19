<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>我的任务管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			function myfun(){
			     var value='${oaProject.projectName}';
			     var sel = document.getElementById('projectid');
			     for (var i = 0; i < sel.length; i++) {
			            if (sel[i].text == value) { //如果这一项的文本内容为客厅
			                sel[i].selected = true; //选中这一项
			            }
			        };
			    }
			        window.onload = myfun;//不要括号
			//$("#name").focus();
	$("#btnSubmit1").click(function(){
			$("#fruit").val("1")
			var judeg2 = checkdate();
			var judge1 = judgeInt(); 
			return judge1&&judeg2;
		})

			$("#btnSubmit").click(function() {
							var judeg2 = checkdate();
							var judge1 = judgeInt(); 
							return judge1&&judeg2;
							
						});
			
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
			
			 function checkdate(){
			 var judge = true;
				var str = "";
				var str1 = ""
				var str2 = "结束日期必须大于结束日期 *";
			   	var sDate = new Date($("input[name='startDaytime']").val().replace("-", "/").replace("-", "/"));
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
				var str1 = ""
				var str2 = "不能为空并且输入两位以上的字符 *";
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
					$(this).next().children().text("不能为空并且输入两位以上的字符 *");
				} else {
					$(this).next().children().text("");
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
   <style type="text/css">
        body{
            padding-top:20px;
        }
        ul,li{
            list-style-type: none;
            padding: 0;
            margin:10px 0;
        }
        ol + input[type="button"].btn{
        	margin-left:8.5%;
        }
        .content{
            border: 1px solid #ddd;
            border-radius: 3px;
            padding-top: 0;
        }
        .top{
            background-color: #eff4f8;
            padding: 0 15px;
            color:#434f66;
            height:42px;
            line-height:42px;
            position: relative;
        }
        .top p{
            font-size: 16px;
        }
        .top span{
            margin:0 16px 0 8px;
        }
        .top a{
            color: #434f66;
            position: absolute;
            top:0;
            right:15px;
        }
        .main{
            padding:25px 4% 40px;
            background-color: #fff;
            font-size: 14px;
        }

        .info{
            padding-bottom: 25px;
            margin-bottom: 30px;
        }

        ul li span{
            float: left;
            width: 18%;
            text-align: right;
            line-height: 36px;
        }
        span.filter-option pull-left{
        	color:#333;
        }

        ul li p{
            margin-left: 24%;
            color: #666;
            line-height: 36px;;
        }

        ul li input,ul li select{
            border-radius: 4px;
            line-height: 26px;
            border:1px solid #ddd;
            margin-left: 8%;
            width: 65%;
            height:34px;
            padding-left:8px;
        }

        ul li textarea{
            margin-left: 6%;
            width: 65%;
            height:110px;
            border-radius: 4px;
            color: #666;
            line-height: 26px;
            border-color: #ddd;
            padding-left:8px;
        }

        ul li button{
            margin-left: 6%;
            background-color: #35a5e7;
            color: #fff;
        }

        .reply ul li{
            margin-bottom: 10px;
        }

        .container-fluid button{
            background-color: #35a5e7;
            color: #fff;
            float: left;
            padding:6px 40px;
        }
        .sign{
            position: relative;
        }
        .sign:after{
            position: absolute;
            display: block;
            content: '*';
            color: red;
            top: 0;
            right: -15px;
        }

        .container-fluid .btn-keep{
            background-color: #366ee8;
        }

        ul li .send-user{
            width: 42%;
            margin-left: 24%;
            position: relative;
        }

        ul li .send-user input{
            height: 34px;
            border-color: #ddd;
            margin-left: 0;
        }

        ul li .send-user span{
            float: inherit;
            position: absolute;
            top: 0;
            right: -16%;
            padding: 0 22px;
            border-color: #ddd;
            height: 34px;
    		display: inline-flex;
        }

        ul li .Wdate{
            width: 30%;
        }

        ul li .check{
            margin-left: 26%;
        }

        ul li .check .radio-box{
            float: left;
            display: inline-block;
            width: 24px;
            height: 24px;
            margin-right: 10px;
            position: relative;
            background: #f25d5d;
            vertical-align: middle;
            border-radius: 100%;
            margin-top: 4px ;
        }

        ul li .check .radio-box:nth-of-type(2){
            background:#fea35b;
        }

        ul li .check .radio-box:nth-of-type(3){
            background:#fbd051;
        }

        ul li .check label{
            float: left;
            color: #666;
            font-weight: lighter;
            line-height: 36px;
            margin-right: 20px;
        }

        .radio-box input {
            opacity: 0;
            position: absolute;
            top:0;
            left:0;
            width: 100%;
            height:100%;
            z-index:100;/*使input按钮在span的上一层，不加点击区域会出现不灵敏*/
        }
        .radio-box span {
            display: block;
            width: 10px;
            height: 10px;
            border-radius: 100%;
            position: absolute;
            background: #fff;
            top: 50%;
            left:50%;
            margin: -5px 0  0 -5px;
            z-index:1;
        }
        .radio-box input[type="radio"] + span {
            opacity: 0;
        }
        .radio-box input[type="radio"]:checked + span {
            opacity: 1;
        }
        
        .info ul li .help-inline{
        	display: flex;
		    padding-left: 0;
		    width: 100%;
		    text-align: left;
		    margin-left: 26%;
		    font-size: 12px;
        }
        
        #content{
        	width:65%;
        	border-radius:4px;
        	margin-left: 8%;
        }
        
        #actorName{
        	margin-left:6%;
        }
        
        ul li input.btn-primary{
        	width:auto;
        	padding:6px 12px;
        }
        
        .row input{
        	padding:6px 8px;
        }
        
        #actorButton{
        	margin-left:-11px;
        }
        
        #btnSubmit{
        	margin-left:25%;
        	width:114px;
        	background:#366ee8;
        	color:#fff;
        }
        
        #btnSubmit:hover{
        	background:#1f5adb;
        }
        
        #btnSubmit1{
        	width:114px;
        	background:#35a5e7;
        	color:#fff;
        	margin-left:0;
        	margin-right:25%;
        	float:right;
        }
        
        #btnSubmit1:hover{
        	background:#366ee8;
        }
        
        #btnCancel:hover{
        	background: #1f96db;
        	color:#fff;
        }
       .upload-ph{
       		position: relative;
       		float:left;
       } 
       label.error{
       		position: absolute;
		    left: 110%;
		    display: inline;
		    height: 38px;
    		top: 10px;
       }
       .open .inner span{
       		float:inherit;
       		width:100%;
       		line-height:normal;
       		text-align:left;
       }
       .form-horizontal .bootstrap-select.btn-group{
       	margin-left:8%;
       }
       .filter-option,.caret{
       		color:#666;
       }
       
       button[data-toggle='dropdown']{
       		padding:0;
       		padding-left:6px;
       }
       .bs-searchbox input{
       		margin:0;
       }
       
       ol{
       	display:inline-block;
       	margin-left:10px;
       }
    </style>
</head>
<body class="gray-bg">
<form:form id="inputForm" modelAttribute="oaPlan" action="${ctx}/oa/mytask/oaPlan/mytasksave" method="post" class="form-horizontal">
		<form:hidden path="id"/>
<div class="container">
    <div class="row">
        <div class="col-xs-8 col-xs-offset-2">
            <div class="content">
                <div class="top">
                    <p>新建任务</p>
                    <a href="${ctx}/oa/mytask/myTask/"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a>
                </div>
                <div class="main">
                    <div class="info">
                        <ul>
                            <li>
                                <span class="sign">任务名称</span>
                                <form:input name="planTitle" path="planTitle" htmlEscape="false" maxlength="200"  class=" input-group"/>
						<span class="help-inline"><font color="red"></font></span>
                            </li>
                            <li>
                                <span>任务描述</span>
                             <form:textarea path="content" htmlEscape="false" rows="4" maxlength="2000" cols="45" class="form-control "/>
                            </li>
                            <li>
                                <span>所属项目</span>
                                <c:if test="${empty oaProject.projectName }">
                                <select class=" selectpicker" data-style="btn-inverse" data-live-search="true" name="projectid" id="projectid">
                                	<option value="0" >请选择所关联项目</option>
									<c:forEach items="${page}" var="oaProject" varStatus="status">
									<option value="${oaProject.id}" >${oaProject.projectName}</option>
									</c:forEach>
                                </select>
                                </c:if>
                                    <c:if test="${!empty oaProject.projectName }">
                                <select class="input-group"  name="projectid" id="projectid">
									<c:forEach items="${page}" var="oaProject" varStatus="status">
									<option value="${oaProject.id}" >${oaProject.projectName}</option>
									</c:forEach>
                                </select>
                                </c:if>
                            </li>
                            <li>
                                <span class="sign">开始时间</span>
                               <input   name="startDaytime" type="text" readonly="readonly" maxlength="20" class="laydate-icon form-control layer-date input-sm required"
								value="<fmt:formatDate value="${startDaytime}"  pattern="yyyy-MM-dd HH:mm:ss"/>"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false,minDate:'%y-%M-%d %H:%m:%s'});"/>
								<span class="help-inline"> </span>
                            </li>
                            <li>
                                <span class="sign">期望结束时间</span>
                            <input  name="endTime" type="text" readonly="readonly" maxlength="20" class="laydate-icon form-control layer-date input-sm required"
							value="<fmt:formatDate value="${etr}" pattern="yyyy-MM-dd HH:mm:ss"/>"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false,minDate:'%y-%M-%d %H:%m:%s'});"/>
							<span class="help-inline"><span id="cz" class="help-inline"><font color="red"></font> </span>
                            </li>
                            <li>
                                <span class="sign">优先级</span>
                                <div class="input-group check">
                                <c:if test="${empty oaPlan.prefer}">
                                    <div class="radio-box"><input class="input-group" type="radio" name="prefer" id="hot" 		value="0" checked><span></span></div><label>紧急</label>
                                    <div class="radio-box"><input class="input-group" type="radio" name="prefer" id="orange"  value="1"><span></span></div><label>一般</label>
                                    <div class="radio-box"><input class="input-group" type="radio" name="prefer" id="yeelow"  value="2"><span></span></div><label>暂缓</label>
                                </c:if>
                                       <c:if test="${oaPlan.prefer==0}">
                                    <div class="radio-box"><input class="input-group" type="radio" name="prefer" id="hot" 		value="0" checked><span></span></div><label>紧急</label>
                                    <div class="radio-box"><input class="input-group" type="radio" name="prefer" id="orange"  value="1"><span></span></div><label>一般</label>
                                    <div class="radio-box"><input class="input-group" type="radio" name="prefer" id="yeelow"  value="2"><span></span></div><label>暂缓</label>
                                </c:if>
                                       <c:if test="${oaPlan.prefer==1 }">
                                    <div class="radio-box"><input class="input-group" type="radio" name="prefer" id="hot" 		value="0" ><span></span></div><label>紧急</label>
                                    <div class="radio-box"><input class="input-group" type="radio" name="prefer" id="orange"  value="1" checked><span></span></div><label>一般</label>
                                    <div class="radio-box"><input class="input-group" type="radio" name="prefer" id="yeelow"  value="2"><span></span></div><label>暂缓</label>
                                </c:if>
                                       <c:if test="${oaPlan.prefer==2 }">
                                    <div class="radio-box"><input class="input-group" type="radio" name="prefer" id="hot" 		value="0" ><span></span></div><label>紧急</label>
                                    <div class="radio-box"><input class="input-group" type="radio" name="prefer" id="orange"  value="1"><span></span></div><label>一般</label>
                                    <div class="radio-box"><input class="input-group" type="radio" name="prefer" id="yeelow"  value="2" checked><span></span></div><label>暂缓</label>
                                </c:if>
                                </div>

                            </li>
                            <li>
                                <span class="sign">发送对象</span>
                                <div class="input-group send-user">
                                <sys:treeselect id="actor" name="actor" value="${oaPlan.actor.id}" labelName="actor.name" labelValue="${name}"
						title="参与者" url="/sys/office/treeData?type=3&isAll=true" cssClass="form-control required" allowClear="true" notAllowSelectParent="true" checked="true" />
                                </div>
                            </li>
                            <li>
                                <span>相关文件</span>
                             	<form:hidden id="files" path="files" htmlEscape="false" maxlength="2000" class="form-control"/>
										<sys:ckfinder input="files" type="files" uploadPath="/oa/oaTask" selectMultiple="true"/>
                            </li>
                        </ul>
                    </div>
                    <div class="row clearfix">
                    	  <input id="fruit" class="btn col-sm-offset-4 btn-keep"  name="Fruit" type="hidden" value="0"  />
                    	  <input id="btnSubmit" class="btn col-xs-offset-2 btn-keep" type="submit" value="提 交"/>
                    	  <input id="btnSubmit1" class="btn col-xs-offset-3 btn-keep" type="submit" value="存 草 稿"/>
                    	
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</form:form>
<script type="text/javascript">
					function history() {
			location.href="${ctx}/oa/mytask/myTask/";
		}
					</script>
</body>
<%-- <body class="gray-bg">
<div class="wrapper wrapper-content">
<div class="ibox">
<div class="ibox-title">
		<h5>新建任务： </h5>
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
	<form:form id="inputForm" modelAttribute="oaPlan" action="${ctx}/oa/mytask/oaPlan/mytasksave" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
	<table class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
				<tr>
		<td style="text-align: center">计划类型：</td>
				<td >
				<form:select path="planType" class="form-control"  id="select"  cssStyle="width: 40%">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('plan_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
				</td>
	    	<td style="text-align: center">任务名称：</td>
			<td >
				<form:input name="planTitle" path="planTitle" htmlEscape="false" maxlength="200"  class="form-control" cssStyle="width: 55%"/>
				<span class="help-inline"><font color="red">*</font></span>
			</td>
				</tr>
			<tr>	
			<td style="text-align: center">内容：</td>
			<td>
				<form:textarea path="content" htmlEscape="false" rows="4" maxlength="2000" cols="50" class="form-control "/>
			</td>
			<td style="text-align: center">附件：</td>
			<td style="text-align: center">
				<form:hidden id="files" path="files" htmlEscape="false" maxlength="2000" class="form-control"/>
				
				<sys:ckfinder input="files" type="files" uploadPath="/oa/oaTask" selectMultiple="true"/>
		</td>
		</tr>
		<tr>	
		<td style="text-align: center">优先级：</td>
		<td >
		<form:select path="prefer" class="form-control"  id="select" cssStyle="width: 70%">
					<form:option value="" label="" />
					<form:options items="${fns:getDictList('prefer')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
		<span class="help-inline"><font color="red">*</font> </span>
				</td>
					<td style="text-align: center">任务日期：</td>
				<td >
				<input   name="startDay" type="text" readonly="readonly" maxlength="20" class="laydate-icon form-control layer-date input-sm required"
					value="<fmt:formatDate value="${oaPlan.startDay}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false,minDate:'%y-%M-%d'});"/>
					<span class="help-inline"><font color="red">*</font> </span>
					</td>
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
			<td >
				<select  class="form-control" name="projectid" id="projectid" >
				<option value="${oaProject.id}">${oaProject.projectName}</option>

				<c:forEach items="${page}" var="oaProject" varStatus="status">
					<option value="${oaProject.id}" >${oaProject.projectName}</option>
					</c:forEach>
				</select>
				<!-- <span class="help-inline"><font color="red">*</font> </span> -->
				</td> 
				</tr>
				<tr>	
				<td style="text-align: center">任务开始时间：</td>
					<td >
			<input  name="startTime" type="text" readonly="readonly" maxlength="20" class="laydate-icon form-control layer-date input-sm required"
					value="<fmt:formatDate value="${str}" pattern="HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'HH:mm',isShowClear:false,qsEnabled:true,quickSel:['08:30','12:00','13:00','13:30','17:30']});"/>
					<span class="help-inline"><font color="red">*</font> </span>
				</td>

		<td style="text-align: center">任务期望完成时间：</td>
			<td  style="width: 30%">
				<input  name="endTime" type="text" readonly="readonly" maxlength="20" class="laydate-icon form-control layer-date input-sm required"
					value="<fmt:formatDate value="${etr}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false,minDate:'%y-%M-%d %H:%m:%s'});"/>
				<span class="help-inline"><font color="red">*</font><span id="cz" class="help-inline"><font color="red"></font> </span>
				</td >

		</tr>
		<tr>
	 	<td style="text-align: center" >任务反馈：</td>
		
			<td colspan="3">
				<form:textarea path="remarks" htmlEscape="false" rows="4"  cols="60" maxlength="255" class="form-control "/>
			</td>
			</tr> 
			<tr>
			<td style="text-align: center">分配人员:</td>
			<td style="text-align: center">


				<sys:treeselect id="actor" name="actor" value="${oaPlan.actor.id}" labelName="actor.name" labelValue="${name}"
			
					title="参与者" url="/sys/office/treeData?type=3" cssClass="form-control input-sm required" allowClear="true" notAllowSelectParent="true" checked="true" />
			</td>
		<!-- 	<td>是否发布</td>
				<td><label><input  name="Fruit" type="radio" value="0"  
						onclick="setSelectUserNo(this);" />&nbsp;&nbsp;保存草稿暂时不发布</label><span
					style="color: red;">&nbsp;&nbsp;&nbsp;&nbsp;(默认不选,发布任务)</span></td> -->
			
			</tr>
			<tr>
			<td colspan="3"></td>
			<td style="text-align: center" > 
			<shiro:hasPermission name="oa:mytask:mytask:edit"><input id="fruit"  name="Fruit" type="hidden" value="0"  /><input id="btnSubmit1" class="btn btn-primary" type="submit" value="草 稿"/>&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn btnCancel" type="button" value="返 回" onclick="history()"/>
			</td>
		</tr>
		</table>
	</form:form>
	<br/>
	<br/>
	</div>
	</div>
	</div>
			
</body> --%>
</html>