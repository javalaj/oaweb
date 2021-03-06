<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="decorator" content="default"/>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link rel="stylesheet" type="text/css" href="${ctxStatic}/mobile/css/Base.css" />
		<link href="${ctxStatic}/mobile/frame_css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="${ctxStatic}/mobile/css/mui.css" />
		<link rel="stylesheet" href="${ctxStatic}/mobile/css/oabase.css" />
		<script src="${ctxStatic}/mobile/js/mui.min.js"></script>
		<title>编辑子任务</title>
		<style type="text/css">
		.gray-bg{
			height:100%;
			background-color:#efefef !important;
		}
		.mui-content{
			background-color:#fff;
		}
		.logDeTable{
			border:none;
		}
		.logDeTable tr td{
			height:30px;
			line-height:30px;
			border:none;
			padding-left:10px;
		}
		.logDeTable{
			width:100%;
			margin-top:10px;
		}
		.logDeTable .header{
			background-color:#fff;
			font-size:14px;
			width:35%;
		}
		.fenge {
		    width: 100%;
		    height: 15px;
		    background-color: #f6f6f6;
		}
		.logDeTable .log-span {
			word-wrap: break-word;
			word-break: break-all;
			font-size: 14px;
			padding:0 10px 0 5px;
		}
		.logDeTable .hespan{
			vertical-align: top;
		}
		.logDeTable .contentlog{
			margin:0 5px;
		}
		.logDeTable html input[type='button'],input[type='submit']{
			color: #fff;
		    border: 1px solid #12b7f5;
		    background-color: #12b7f5;
		}
		.logDeTable .mui-row div{
			margin-bottom:10px;
		}
		.logDeTable .mui-row div:first-child{
			padding-left:25%;
		}
		.logDeTable .mui-row div:last-child{
			padding-left:10%;
		}
		.logDeTable #flag{
			display:none;
		}
		.logDeTable ul li{
		padding:0 10px;
		font-size:14px;
		}
		.logDeTable ul li span{
			height:30px;
			line-height:30px;
		}
		
		/* 子任务部分 */
		.table{
		border:none;
	}
	.table > tbody > tr > td{
		border:none;
	}
	.table > tbody > tr > td input{
		margin-bottom:0;
	}
	.table > tbody > tr > td:first-child{
		font-size:14px;
		color:#666;
		width:20%;
		padding:0;
		height:auto;
	}
	.table > tbody > tr > td .check .radio-box{
            float: left;
            display: inline-block;
            width: 24px;
            height: 24px;
            margin-right: 5px;
            position: relative;
            background: #f25d5d;
            vertical-align: middle;
            border-radius: 100%;
            margin-top: 6px ;
        }

        .table > tbody > tr > td .check .radio-box:nth-of-type(2){
            background:#fea35b;
        }

        .table > tbody > tr > td .check .radio-box:nth-of-type(3){
            background:#fbd051;
        }

        .table > tbody > tr > td .check label{
            float: left;
            color: #666;
            font-weight: lighter;
            line-height: 36px;
            margin-right: 10px;
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
        #fruit{
        	display:none;
        }
        .mui-row{
        	margin-bottom:10px;
        }
        .mui-row div{
        	text-align:center;
        }
        .mui-row div input{
        	height:32px;
        	line-height:32px;
        	font-size:16px;
        	padding:0 18px;
        	border: 1px solid #12b7f5;
    		background-color: #12b7f5;
        }
        #btnSubmit{
        	margin-right:25%;
        }
        
        </style>
	</head>

	<body>
	<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">编辑子任务</h1>
	</header>
		<div class="mui-content" >
			<table class="logDeTable" border="" cellspacing="0" cellpadding="0" style="padding:0 10px;">
					<tr>
					<td class="header"><span id="date" class="hespan"> 标题:</span></td>
					<td><span id="" class="contentlog"> ${oaPlanForm.planTitle}</span></td>
						</tr>
					<tr>
					<td class="header"><span id="date" class="hespan"> 关联项目:</span></td>
					<td><span id="" class="contentlog"> ${oaProject.projectName}</span></td>
					</tr>
					<tr>
					<td class="header"><span id="date" class="hespan"> 发布人:</span></td>
					<td><span id="" class="contentlog">${oaPlanForm.actName }</span></td>
						</tr>
					<tr>
					<td class="header"><span id="date" class="hespan"> 创建时间:</span></td>
					<td><span id="" class="contentlog">  <fmt:formatDate value="${oaPlanForm.createDate }" pattern="yyyy-MM-dd" /></span></td>
						</tr>
					<tr>
					<td class="header hespan">
					<span id="problem">任务描述: </span></td>
					<td class="">
					<div class="log-span">
					<div>${oaPlanForm.content}</div>
						</div>
							</td>
						</tr>
				<tr>
					<td class="header"><span id="date" class="hespan"> 开始时间:</span></td>
					<td><span id="" class="contentlog"><fmt:formatDate value="${str}" pattern="yyyy-MM-dd HH:mm:ss"/>
					</span></td>
					</tr>
				<tr>
					<td class="header"><span id="date" class="hespan"> 期望结束:</span></td>
					<td><span id="" class="contentlog"><fmt:formatDate value="${etr}" pattern="yyyy-MM-dd HH:mm:ss"/></span></td>
				</tr>
				<tr>
					<td class="header"><span id="date" class="hespan"> 发送对象:</span></td>
					<td><span id="" class="contentlog"> ${namee }</span></td>
				</tr>
					<tr>
					<td class="header"><span id="date" class="hespan"> 相关文件:</span></td>
					<td><span id="" class="contentlog"><input type="hidden" id="billingFile${oaPlanForm.id}"value="${oaPlanForm.files}"/>
									<sys:ckfinder input="billingFile${oaPlanForm.id}" readonly="true" type="files" uploadPath="/oa/oaTask" selectMultiple="true"/>
					</span></td>
				</tr>
						<tr>
					<td class="header">
					<span id="problem" class="hespan">办理情况 :</span></td>
					<td class="">
					<div class="log-span">
					<div>${oaPlanForm.remarks } </div>
						</div>
							</td>
						</tr>
						<tr>
					<td class="header"><span id="date" class="hespan"> 办理相关文件:</span></td>
					<td><span id="" class="contentlog"> <input type="hidden" id="dd${oaPlanForm.id}"value="${oaPlanForm.backfiles}"/>
									<sys:ckfinder input="dd${oaPlanForm.id}" readonly="true" type="files" uploadPath="/oa/oaTask/replyFile" selectMultiple="true"/>
					</span></td>
				</tr>
			</table>
			<div class="fenge"></div>
			<div class="new-tab">
			<form:form id="inputForm" modelAttribute="oaPlan" action="${ctx}/m/oa/mytask/myTask/subtasksave" method="post" class="form-horizontal">
			
		<form:hidden path="id"/>
			<input value="${oaPlanForm.id}" style="display: none;"
						name="reid">
			<table class="table mui-row" border="" cellspacing="0" cellpadding="0">
					<tr>
					<td><span id="date"> 任务名称:</span></td>
					<td>
						<form:input name="planTitle" path="planTitle" htmlEscape="false"   class=" input-group"/>
						</td>
						</tr>
					<tr>
					<td><span id="date" class="hespan"> 关联项目:</span></td>
					<td> 
					<c:if test="${empty oaProject.projectName }">
					主任务没有关联项目,子任务无法关联
					</c:if>
						<c:if test="${!empty oaProject.projectName }">
						<select class="input-group" disabled="true"    name="projectid" 
					id="projectid">
						<%-- <option value="${oaProjecti.id}">${oaProjecti.projectName}</option> --%>
                             <option value="${oaProject.id}">${oaProject.projectName}</option> 
										<c:forEach items="${pagei}" var="oaProject" varStatus="status">
							<option value="${oaProject.id}">${oaProject.projectName}</option>
									</c:forEach>
                                </select>
					</c:if>
						</td>
					</tr>
					<tr>
					<td>
					<span id="problem" class="hespan">任务描述 </span></td>
					<td class="">
					<div class="log-span">
					<div>  <form:textarea path="content" htmlEscape="false" rows="4" maxlength="2000" cols="45" class="form-control "/></div>
						</div>
							</td>
						</tr>
				<tr>
					<td><span id="date" > 开始时间</span></td>
					<td> <span id="">
					<input
					name="startDaytime" class="mui-datetime" type="text"
					readonly="readonly"
					value='<fmt:formatDate value="${startDaytime}" pattern="yyyy-MM-dd HH:mm"/>' /></span>
					</td>
					</tr>
				<tr>
					<td><span id="date" > 期望结束</span></td>
					<td><span id="" >
					<input
					name="endTime" type="text" class="mui-datetime"
					readonly="readonly"
					value='<fmt:formatDate value="${strsub}" pattern="yyyy-MM-dd HH:mm"  />' />
						</span>
				</td>
				</tr>
				<tr>
					<td><span id="date" class="hespan"> 优先级</span></td>
					<td><span id="" class="contentlog input-group check"> 
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
                                </span>
                        </td>
					</tr>
				<tr>
					<td><span id="date" class="hespan"> 发送对象</span></td>
					<td>
					 <sys:treeselect id="actor" name="actor" value="${oaPlan.actor.id}" labelName="actor.name" labelValue="${name}"
						title="参与者" url="/sys/office/treeData?type=3" cssClass="form-control required" allowClear="true" notAllowSelectParent="true" checked="true" />
						</td>
				</tr>
			</table>
			 <div class="mui-row">
			 <div class="mui-col-xs-6">
                 <input id="fruit" class="btn col-sm-offset-4 btn-keep"  name="Fruit" type="hidden" value="0"  /><input id="btnSubmit1" class="btn col-xs-offset-3 btn-keep" type="submit" value="草 稿"/>
             </div>
             <div class="mui-col-xs-6">
                    	<input id="btnSubmit" class="btn col-xs-offset-2 btn-keep" type="submit" value="保 存"/>
             </div>
             </div>
	</form:form>
	</div>
	</div>
	 <sys:mui-datetime></sys:mui-datetime>
	 <script type="text/javascript"
	src="${ctxStatic}/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
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
});

$("#btnSubmit1").click(function(){
	$("#fruit").val("1")
	var judge1 = judgeInt(); 
	if(judge1){
		var judge4=sdatelength();
	}if(judge4){
		var judge5=edatelength();
	} if(judge5){
		var judeg2 = checkdate();
	} if(judeg2){
		var judge3=actorName();
	}
	if(judge1&&judeg2&&judge3&&judge4&&judge5){
		return true;
	}else{
		return false;
	}
})
	$("#btnSubmit").click(function() {
		var judge1 = judgeInt(); 
		if(judge1){
			var judge4=sdatelength();
		}if(judge4){
			var judge5=edatelength();
		} if(judge5){
			var judeg2 = checkdate();
		} if(judeg2){
			var judge3=actorName();
		}
		if(judge1&&judeg2&&judge3&&judge4&&judge5){
			return true;
		}else{
			return false;
		}
				});
function judgeInt() {
	var judge = true;
	$("input[name='planTitle']").each(function() {
			if (!(/\S{2,}/.test($(this).val()))) {
				judge = false;
				 mui.alert("任务名称:不能为空并且输入两位以上的字符！", "系统提示");
			} else {
			}
	});
	return judge;
}
function checkdate(){
	 var judge = true;
	   	var sDate = new Date($("input[name='startDaytime']").val().replace("-", "/").replace("-", "/"));
	    var eDate = new Date($("input[name='endTime']").val().replace("-", "/").replace("-", "/"));
	    if(sDate > eDate)
	    {
	    judge = false;
	    mui.alert("开始日期大于结束日期！", "系统提示");
	   }
	    return judge;
	    }
function sdatelength(){
	 var judge = true;
	   	var sDate = $("input[name='startDaytime']").val();
	    if(sDate.length == 0)
	    {
	    judge = false;
	    mui.alert("请填写开始时间！", "系统提示");
	   }
	    return judge;
	    }  
function edatelength(){
	 var judge = true;
	    var eDate =$("input[name='endTime']").val();
	    if(eDate.length == 0)
	    {
	    judge = false;
	    mui.alert("请填写结束时间！", "系统提示");
	   }
	    return judge;
	    }  
function actorName(){
	 var judge=true;
	 var actorvalue=$("input[name='actor.name']").val();
	 if(actorvalue.length==0){
		 judge = false;
		    mui.alert("请填写发送对象！", "系统提示");
	 }
	  return judge;
}   
</script>
	</body>

</html>