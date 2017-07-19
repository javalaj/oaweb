<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="decorator" content="default"/>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />

<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/mobile/css/Base.css" />
<link rel="stylesheet" type="text/css"
	href="${ctxStatic}/mobile/css/oa.css" />
<link rel="stylesheet" href="${ctxStatic}/mobile/css/mui.css" />
<link rel="stylesheet" href="${ctxStatic}/mobile/css/oabase.css" />
<link rel="stylesheet" href="${ctxStatic}/liuxin/css/mobile.css" />
		<title>回复此任务</title>
<style type="text/css">
.gray-bg{
	height:100%;
	background-color:#efefef !important;
}
table{
	border:none;
}
table tr td{
	height:30px;
	line-height:30px;
	border:none;
}
.logDeTable{
	width:100%;
	margin-top:10px;
}
.header{
	background-color:#fff;
	font-size:14px;
	width:35%;
}
.fenge {
    width: 100%;
    height: 15px;
    background-color: #f6f6f6;
}
.log-span {
	word-wrap: break-word;
	word-break: break-all;
	font-size: 14px;
	padding:0 10px 0 5px;
}
.hespan{
	vertical-align: top;
}
.contentlog{
	margin:0 5px;
}
html input[type='button'],input[type='submit']{
	color: #fff;
    border: 1px solid #12b7f5;
    background-color: #12b7f5;
}
.mui-row div{
	margin-bottom:10px;
}
.mui-row div:first-child{
	padding-left:25%;
}
.mui-row div:last-child{
	padding-left:10%;
}
#flag{
	display:none;
}
ul li{
padding:0 10px;
font-size:14px;
}
ul li span{
	display: inline-block;
	width:35%;
	text-align:center;
	height:30px;
	line-height:30px;
}
</style>
	</head>
	<body class="gray-bg">
	<header class="mui-bar mui-bar-nav">
		<a href="${ctx}/m/oa/mytask/myTask/myup?id=${oaPlan.id}" class="mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">回复此任务</h1>
	</header>
	<div class="mui-content" style="heihgt:105%;">
			<table class="logDeTable">
					<tr>
					<td class="header"><span id="date" class="hespan"> 标题:</span></td>
					<td><span id="" class="contentlog"> ${oaPlan.planTitle}</span></td>
						</tr>
					<tr>
					<td class="header"><span id="date" class="hespan"> 关联项目:</span></td>
					<td><span id="" class="contentlog"> ${oaProject.projectName}</span></td>
					</tr>
					<tr>
					<td class="header"><span id="date" class="hespan"> 发布人:</span></td>
					<td><span id="" class="contentlog">${acName}</span></td>
						</tr>
					<tr>
					<td class="header"><span id="date" class="hespan"> 创建时间:</span></td>
					<td><span id="" class="contentlog">  <fmt:formatDate value="${oaPlan.createDate}" pattern="yyyy-MM-dd" /></span></td>
						</tr>
					<tr>
					<td class="header">
					<span id="problem" class="hespan">任务描述: </span></td>
					<td class="">
					<div class="log-span">
					<div>${oaPlan.content }</div>
						</div>
							</td>
						</tr>
				<tr>
					<td class="header"><span id="date" class="hespan"> 开始时间:</span></td>
					<td><span id="" class="contentlog"><fmt:formatDate value="${str }" pattern="yyyy-MM-dd HH:mm:ss"/>
					</span></td>
					</tr>
				<tr>
					<td class="header"><span id="date" class="hespan"> 期望结束:</span></td>
					<td><span id="" class="contentlog">	<fmt:formatDate value="${etr}" pattern="yyyy-MM-dd HH:mm:ss"/></span></td>
				</tr>
				<tr>
					<td class="header"><span id="date" class="hespan"> 发送对象:</span></td>
					<td><span id="" class="contentlog">${namee}</span></td>
				</tr>
					<tr>
					<td class="header hespan"><span id="date" class=""> 相关文件:</span></td>
					<td><span id="" class="contentlog"><input type="hidden" id="billingFile${oaPlan.id}"value="${oaPlan.files}"/>
									<sys:ckfinder input="billingFile${oaPlan.id}" readonly="true" type="files" uploadPath="/oa/oaTask" selectMultiple="true"/>
					</span></td>
				</tr>
			</table>	
			 <form:form id='inputForm'  action="${ctx}/m/oa/mytask/myTask/UpTaksRemarks" method="post"  modelAttribute="oaPlan">
                    <div class="row reply">
                    <input value="${oaPlan.id}" style="display: none;"
							name="reid">
                        <ul>
                            <li>
                                <span class="sign" style="text-align: left;margin-left: 15px;">任务办理情况:</span>
                          <form:textarea path="remarks" htmlEscape="false" rows="4"
							maxlength="255" class="form-control" style="width: 90%;margin: 0 15px;"/>
                            </li>
                        </ul>
                    </div>
                    <div class="mui-row" style="padding:10px 0;">
                    <div class="mui-col-xs-6">
                  		  <input id="flag"  name="flag" type="hidden" value="0"  />
                      	 <input id="btnSubmit1" class="btn btn-keep" type="submit"      value="保存"/>
                    </div>
                    <div class="mui-col-xs-6">
                     	 <input id="btnSubmit" class="btn col-xs-offset-3 btn-keep" type="submit"  value="办结"/>
                    </div>
                    </div>
                    </form:form>
		</div>
		 <script type="text/javascript"
	src="${ctxStatic}/jquery/jquery-1.9.1.min.js"></script>
		<script type="text/javascript">
		$("#btnSubmit1").click(function(){
			$("#flag").val("1");
		})
		</script>
	</body>
	
</html>
