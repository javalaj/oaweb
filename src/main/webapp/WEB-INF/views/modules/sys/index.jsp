<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
	<meta name="decorator" content="default"/>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<title>index</title>
	<link rel="stylesheet" href="${ctxStatic}/resources/css/amazeui.min.css">
	<link rel="stylesheet" href="${ctxStatic}/resources/css/chuyu_index.css">
	<%@include file="/WEB-INF/views/include/treeview.jsp" %>
	<link rel='stylesheet' href='${ctxStatic}/fullcalendar-1.6.1/demos/cupertino/theme.css' />
	<link type="text/css" href="${ctxStatic}/rest/restHome.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/fullcalendar/fullcalendar.css"/>
	<script type="text/javascript">
	function claim(taskId) {
		$.get('${ctx}/act/task/claim', {
			taskId : taskId
		}, function(data) {
			if (data == 'true') {
				top.$.jBox.tip('签收完成');
				location = '${ctx}/act/task/todo/';
			} else {
				top.$.jBox.tip('签收失败');
			}
		});
	}
	
	
	
	</script>
</head>
<body class="resthome">

<div class="container-fluid">
    <div class="row">
        <div class="col-xs-6 col-md-6 table-responsive">
        	<div class="panel panel-default">
        	<div class="panel-heading panel-title">
        	待办事项<a href="${ctx}/act/task/todo/" class="knowmore skin-txt">更多</a>
        	</div>
        	<table class="table todo">
                <tbody>
                  <c:choose>
                       <c:when test="${list.size()>0 }">
                <c:forEach   items="${list }"  var="act">
                <c:set var="task" value="${act.task}" />
				<c:set var="vars" value="${act.vars}" />
				<c:set var="procDef" value="${act.procDef}" />
				<c:set var="status" value="${act.status}" />
                <tr>
                    <td style="border-bottom:1px dashed #ddd;">
                    	<c:choose>
						<c:when test="${empty task.assignee}">
							<a href="javascript:claim('${task.id}');" title="签收任务">${fns:abbr(not
								empty act.vars.map.title ? act.vars.map.title : task.id, 60)}<span class="time">  <c:choose>
									<c:when test="${act.hour =='0小时前' }">1小时前</c:when>
									<c:otherwise>	${act.hour }</c:otherwise>
								</c:choose></span></a>
						</c:when> 
						 <c:when test="${procDef.name=='月绩效打分流程'and act.task.name=='提交申请'}">
							<a href="${ctx}/oa/cyTspOaMonthlyPlan/rejected?sameid=${task.description}">${fns:abbr(not
								empty act.vars.map.title ? act.vars.map.title : task.id, 60)}
							<span class="time">  <c:choose>
									<c:when test="${act.hour =='0小时前' }">1小时前</c:when>
									<c:otherwise>	${act.hour }</c:otherwise>
								</c:choose></span></a>
						</c:when> 
						<c:when test="${procDef.name=='月绩效打分流程'and act.task.name=='测试部门打分'}">
							<a href="${ctx}/oa/cyTspOaMonthlyPlan/test?sameid=${task.description}">${fns:abbr(not
								empty act.vars.map.title ? act.vars.map.title : task.id, 60)}
							<span class="time">  <c:choose>
									<c:when test="${act.hour =='0小时前' }">1小时前</c:when>
									<c:otherwise>	${act.hour }</c:otherwise>
								</c:choose></span></a>
						</c:when>
						<c:when test="${procDef.name=='月绩效打分流程'and act.task.name=='部门副总打分'}">
							<a href="${ctx}/oa/cyTspOaMonthlyPlan/vicePresident?sameid=${task.description}">${fns:abbr(not
								empty act.vars.map.title ? act.vars.map.title : task.id, 60)}
							<span class="time">  <c:choose>
									<c:when test="${act.hour =='0小时前' }">1小时前</c:when>
									<c:otherwise>	${act.hour }</c:otherwise>
								</c:choose></span></a>
						</c:when>
						<c:when test="${procDef.name=='招待费报销申请流程' and act.task.name=='报销人'}">
							   <a href="${ctx}/oa/entertainmentr/oaEntertainmentReimbursement/form?sameid=${task.description}">${fns:abbr(not
								empty act.vars.map.title ? act.vars.map.title : task.id, 60)}
							<span class="time">  <c:choose>
									<c:when test="${act.hour =='0小时前' }">1小时前</c:when>
									<c:otherwise>	${act.hour }</c:otherwise>
								</c:choose></span></a>
						</c:when>
						<c:when test="${procDef.name=='招待费报销申请流程' and act.task.name=='部门负责人'}">
							   <a href="${ctx}/oa/entertainmentr/oaEntertainmentReimbursement/exam?sameid=${task.description}">${fns:abbr(not
								empty act.vars.map.title ? act.vars.map.title : task.id, 60)}
							<span class="time">  <c:choose>
									<c:when test="${act.hour =='0小时前' }">1小时前</c:when>
									<c:otherwise>	${act.hour }</c:otherwise>
								</c:choose></span></a>
						</c:when>
						<c:when test="${procDef.name=='招待费报销申请流程' and act.task.name=='总经理'}">
							  <a href="${ctx}/oa/entertainmentr/oaEntertainmentReimbursement/exam1?sameid=${task.description}">${fns:abbr(not
								empty act.vars.map.title ? act.vars.map.title : task.id, 60)}<i></i>请您审批<span class="time">  <c:choose>
									<c:when test="${act.hour =='0小时前' }">1小时前</c:when>
									<c:otherwise>	${act.hour }</c:otherwise>
								</c:choose></span></a>
						</c:when>
						<c:when test="${procDef.name=='招待费报销申请流程' and act.task.name=='财务审核'}">
							  <a href="${ctx}/oa/entertainmentr/oaEntertainmentReimbursement/exam2?sameid=${task.description}">${fns:abbr(not
								empty act.vars.map.title ? act.vars.map.title : task.id, 60)}
							<span class="time">  <c:choose>
									<c:when test="${act.hour =='0小时前' }">1小时前</c:when>
									<c:otherwise>	${act.hour }</c:otherwise>
								</c:choose></span></a>
						</c:when>	
						<c:when test="${procDef.name=='周计划评价'}">
							  <a href="${ctx}/user/userWeekplan/viewMonthsum?sameid=${task.description}">${fns:abbr(not
								empty act.vars.map.title ? act.vars.map.title : task.id, 60)}
							<span class="time">  <c:choose>
									<c:when test="${act.hour =='0小时前' }">1小时前</c:when>
									<c:otherwise>	${act.hour }</c:otherwise>
								</c:choose></span></a>
						</c:when>
					<c:otherwise>
							 <a
								href="${ctx}/act/task/form?taskId=${task.id}&taskName=${fns:urlEncode(task.name)}&taskDefKey=${task.taskDefinitionKey}&commid=${fns:urlEncode(task.description)}&procInsId=${task.processInstanceId}&procDefId=${task.processDefinitionId}&status=${status}">${fns:abbr(not
								empty vars.map.title ? vars.map.title : task.id, 60)}<span class="time">
								  <c:choose>
									<c:when test="${act.hour =='0小时前' }">1小时前</c:when>
									<c:otherwise>	${act.hour }</c:otherwise>
								</c:choose>
								
							</span></a>
						</c:otherwise>
						</c:choose>
                  <!--   <a href="#"><i></i>AAA提交的《请假申请流程》请您审批</a>  --></td>
                </tr>
                </c:forEach>
                </c:when>
                <c:otherwise>
                  				  <tr>
                                 <td>暂无待办事项</td>
                                 </tr>
                </c:otherwise>
                </c:choose>
                </tbody>
            </table>
        	</div>
            
        </div>
        <div class="col-xs-6 col-md-6 table-responsive">
        <div class="panel panel-default">
        	<div class="panel-heading panel-title">
        	本周工作计划<span class="time skin-txt"><fmt:formatDate
								value="${Date}" pattern="yyyy-MM-dd" /> 第${weekOfMonth}周</span>
        	</div>
        	<table class="table">
                <tbody>
                    <c:choose>
                       <c:when test="${UserWeekrecordlist.size()>0 }">
                    <tr>
                        <td>
                            <table class="table table-em table-striped">
                            <tr class="bg-success">
                                    <td class="col-md-5">工作计划</td>
                                    <td class="col-md-4">交付物</td>
                                    <td class="col-md-3">时间</td>
                                </tr>
                          
             
                            <c:forEach items="${UserWeekrecordlist}" var="now2" >
                                
                                <tr>
                                    <td>${now2.content }</td>
                                    <td>${now2.deliverables }</td>
                                    <td><c:choose>
									<c:when test="${now2.beginday=='1' }">周一</c:when>
									<c:when test="${now2.beginday=='2' }">周二</c:when>
									<c:when test="${now2.beginday=='3' }">周三</c:when>
									<c:when test="${now2.beginday=='4' }">周四</c:when>
									<c:when test="${now2.beginday=='5' }">周五</c:when>
									<c:when test="${now2.beginday=='6' }">周六</c:when>
									<c:otherwise>周日</c:otherwise>
								</c:choose>、<c:choose>
									<c:when test="${now2.endday=='1' }">周一</c:when>
									<c:when test="${now2.endday=='2' }">周二</c:when>
									<c:when test="${now2.endday=='3' }">周三</c:when>
									<c:when test="${now2.endday=='4' }">周四</c:when>
									<c:when test="${now2.endday=='5' }">周五</c:when>
									<c:when test="${now2.endday=='6' }">周六</c:when>
									<c:otherwise>周日</c:otherwise>
								</c:choose></td>
                                </tr>
                                </c:forEach>
                            </table>
                        </td>
                    </tr>
                    </c:when>
                         <c:otherwise>
                                 <tr>
                                 <td>暂无周计划</td>
                                 </tr>
                                 </c:otherwise>
                     </c:choose>
                </tbody>
            </table>
        </div>  
        </div>
    </div>

    <div class="row">
        <div class="col-xs-6 col-md-6 table-responsive">
        <div class="panel panel-default">
        	<div class="panel-heading panel-title">
        		一周概览
        	</div>
        	<div class="ibox float-e-margins">
                <div class="ibox-content">
                    <div>
                        本人<span class="overview-span1"></span> 本部门<span  class="overview-span2"></span> 公司<span class="overview-span3"></span>
                    </div>

                    <div class="flot-chart">
                        <div class="flot-chart-content"id="flot-bar-chart" style="position: relative;">
                        	<div class="schedule">
                        		<div class="container1"></div>
                        		<div class="container2"></div>
                        		<div class="container3"></div>
                        	</div>
                        	<div class="schedule">
                        		<div class="container4"></div>
                        		<div class="container5"></div>
                        		<div class="container6"></div>
                        	</div>
                        	<div class="schedule">
                        		<div class="container7"></div>
                        		<div class="container8"></div>
                        		<div class="container9"></div>
                        	</div>
                        	<div class="schedule">
                        		<div class="container10"></div>
                        		<div class="container11"></div>
                        		<div class="container12"></div>
                        	</div>
                            <div class="xAxis x1Axis" style="color:#999999">

                                <div class="tickLabel" style="position:absolute;text-align:center;left:2.5%;top:183px;width:80px">项目</div>
                                <div class="tickLabel" style="position:absolute;text-align:center;left:27.5%;top:183px;width:80px">协同</div>
                                <div class="tickLabel" style="position:absolute;text-align:center;left:52.5%;top:183px;width:80px">文档</div>
                                <div class="tickLabel" style="position:absolute;text-align:center;left:77.5%;top:183px;width:80px">任务</div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
       	</div>      
        </div>
        <div class="col-xs-6 col-md-6 table-responsive">
        <div class="panel panel-default">
        	<div class="panel-heading panel-title">
        		常用功能
        	</div>
        	<div class="overview-icon">
            	<div>
            	<a href="${ctx}/act/task/todo/"><img src="${ctxStatic}/images/over-icon1.png"><span>协同办公</span></a>
            	<a href="${ctx}/user/userWorklog"><img src="${ctxStatic}/images/over-icon2.png"><span>工作日志</span></a>
            	<a href="${ctx}/oa/mytask/oaPlan"><img src="${ctxStatic}/images/over-icon3.png"><span>我的日程</span></a>
            	<a href="${ctx}/act/task/process/"><img src="${ctxStatic}/images/over-icon4.png"><span>新建事项</span></a>
            	</div>
            	<div>
            	<a href="${ctx}/oa/oaNotify/selfList"><img src="${ctxStatic}/images/over-icon5.png"><span>通知公告</span></a>
            	<a href="${ctx}/oa/doc/oaDoc/publicList"><img src="${ctxStatic}/images/over-icon6.png"><span>共享文档</span></a>
            	<a href="${ctx}/oa/coding/oaCoding"><img src="${ctxStatic}/images/over-icon7.png"><span>考勤管理</span></a>
            	<a href="${ctx}/oa/user/index"><img src="${ctxStatic}/images/over-icon8.png"><span>公司通讯录</span></a>
            	</div>
            </div>
        </div>   
        </div>
        
    </div>
    
    <div class="row">
    	<div class="col-xs-6 col-md-6 table-responsive">
    	<div class="panel panel-default">
        	<div class="panel-heading panel-title">
        	我的任务<a href="${ctx}/oa/mytask/myTask/mylist" class="knowmore skin-txt">更多</a>
        	</div>
        	<table class="table todo mission">
                <tbody>
                <c:choose>
                <c:when test="${taskList.size()>0 }">
                 <c:forEach items="${taskList}" var="list" >
                <tr>
                <c:if test="${list.state != '2' }">
                    <td><a href="${ctx}/oa/mytask/myTask/myup?id=${list.id}"><i></i>${list.planTitle}<span class="time">
                    <c:choose>
									<c:when test="${list.indexDay>0}">已超期${list.indexDay}天时间</c:when>
									<c:when test="${list.indexDay==0}">还剩${list.indexDay}天时间</c:when>
									<c:otherwise>还剩${list.indexDayi}天时间</c:otherwise>
								</c:choose>
                    </span></a>  </td>
                   </c:if>
                    
                </tr>
                
                </c:forEach>
                </c:when>
                <c:otherwise>
                <tr>
                <td>暂无任务</td>
                </tr>
                </c:otherwise>
                </c:choose>
                </tbody>
            </table>
        </div>    
        </div>
        
        <div class="col-xs-6 col-md-6 table-responsive">
        	<div class="panel panel-default">
        		<div class="panel-heading panel-title">
        		常用流程
        		</div>
        		<div class="flow clearfix">
            	<ul>
            		<li><a href="${ctx}/fixedassets/assetsEquipment/claimList?assetsEquipment.condition=1">固定资产申请流程</a></li>
            		<li><a href="${ctx}/oa/oaSealUse/form">用印申请流程</a></li>
            		<li><a href="${ctx}/oa/qualificationb/oaQualificationb/form">资质申请流程</a></li>
            		<li><a href="${ctx}/oa/coding/oaProVacate/form">员工请假流程</a></li>
            		<li><a href="${ctx}/oa/oaUsecar/form">用车申请流程</a></li>
            	</ul>
            	<ul>
            		<li><a href="${ctx}/oa/oaOutwork/form">员工出差申请流程</a></li>
            		<li><a href="${ctx}/oa/oaGoout/form">员工外出申请流程</a></li>
            		<li><a href="${ctx}/oa/coding/oaProVacate/tx">员工调休申请流程</a></li>
            		<li><a href="${ctx}/oa/oaForgetclock/form">员工忘打卡申请流程</a></li>
            		<li><a href="${ctx}/oa/oaOvertime/form">员工加班申请流程</a></li>
            	</ul>
            </div>
        	</div>
        </div>
    </div>
	<!-- content end -->

</div>

<!--[if (gte IE 9)|!(IE)]><!-->

<script src='${ctxStatic}/fullcalendar/fullcalendar.min.js'></script>
<script language="javascript" type="text/javascript">    
</script>
<script src="${ctxStatic}/resources/js/amazeui.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctxStatic}/highcharts/highcharts.js"></script>
<script type="text/javascript" src="${ctxStatic}/highcharts/exporting.js"></script>
<script type="text/javascript" src="${ctxStatic}/highcharts/data.js"></script>
<script type="text/javascript" src="${ctxStatic}/highcharts/grid.js"></script>
<script type="text/javascript" src="${ctxStatic}/resources/js/chuyu_index.js"></script>
<!-- 进度条插件 -->
<script type="text/javascript" src="${ctxStatic}/jqmeter/jqmeter.min.js"></script>
<script type="text/javascript">
    $(function(){
    	var oaProjectMyListCount='${oaProjectMyListCount}';
    	var oaProjectCompanyListCount='${oaProjectCompanyListCount}'
    	var oaProjectDivisionListCount='${oaProjectDivisionListCount}'
        $('.container1').jQMeter({
            goal:'500',
            raised:oaProjectMyListCount,
            orientation:'vertical',
            width:'20px',
            height:'150px',
            barColor:'#f25d5d',
            bgColor:'#fff',
            displayTotal:false
        });
        $('.container2').jQMeter({
            goal:'500',
            raised:oaProjectDivisionListCount,
            orientation:'vertical',
            width:'20px',
            height:'150px',
            barColor:'#fea35b',
            bgColor:'#fff',
            displayTotal:false
        });
        $('.container3').jQMeter({
            goal:'1000',
            raised:oaProjectCompanyListCount,
            orientation:'vertical',
            width:'20px',
            height:'150px',
            barColor:'#fbd051',
            bgColor:'#fff',
            displayTotal:false
        });
        
        
    	var myTodoTaskQueryCount='${myTodoTaskQueryCount}';
    	var divisionTodoTaskQueryCount='${divisionTodoTaskQueryCount}'
    	var companyTodoTaskQueryCount='${companyTodoTaskQueryCount}'
        $('.container4').jQMeter({
            goal:'500',
            raised:myTodoTaskQueryCount,
            orientation:'vertical',
            width:'20px',
            height:'150px',
            barColor:'#f25d5d',
            bgColor:'#fff',
            displayTotal:false
        });
        $('.container5').jQMeter({
            goal:'500',
            raised:divisionTodoTaskQueryCount,
            orientation:'vertical',
            width:'20px',
            height:'150px',
            barColor:'#fea35b',
            bgColor:'#fff',
            displayTotal:false
        });
        $('.container6').jQMeter({
            goal:'1000',
            raised:companyTodoTaskQueryCount,
            orientation:'vertical',
            width:'20px',
            height:'150px',
            barColor:'#fbd051',
            bgColor:'#fff',
            displayTotal:false
        });
        
        
        
        
      	var myDocCount='${myDocCount}';
    	var divisionDocCount='${divisionDocCount}'
    	var companyDocCount='${companyDocCount}'
        $('.container7').jQMeter({
            goal:'500',
            raised:myDocCount,
            orientation:'vertical',
            width:'20px',
            height:'150px',
            barColor:'#f25d5d',
            bgColor:'#fff',
            displayTotal:false
        });
        $('.container8').jQMeter({
            goal:'500',
            raised:divisionDocCount,
            orientation:'vertical',
            width:'20px',
            height:'150px',
            barColor:'#fea35b',
            bgColor:'#fff',
            displayTotal:false
        });
        $('.container9').jQMeter({
            goal:'1000',
            raised:companyDocCount,
            orientation:'vertical',
            width:'20px',
            height:'150px',
            barColor:'#fbd051',
            bgColor:'#fff',
            displayTotal:false
        });
        
      	var myPlanCount='${myPlanCount}';
    	var divisionPlanCount='${divisionPlanCount}'
    	var companyPlanCount='${companyPlanCount}'
        $('.container10').jQMeter({
            goal:'500',
            raised:myPlanCount,
            orientation:'vertical',
            width:'20px',
            height:'150px',
            barColor:'#f25d5d',
            bgColor:'#fff',
            displayTotal:false
        });
        $('.container11').jQMeter({
            goal:'500',
            raised:divisionPlanCount,
            orientation:'vertical',
            width:'20px',
            height:'150px',
            barColor:'#fea35b',
            bgColor:'#fff',
            displayTotal:false
        });
        $('.container12').jQMeter({
            goal:'1000',
            raised:companyPlanCount,
            orientation:'vertical',
            width:'20px',
            height:'150px',
            barColor:'#fbd051',
            bgColor:'#fff',
            displayTotal:false
        });
    });
</script>
<!-- 参数	类型	默认值	描述

goal	string	无默认值，必填参数	进度条的总长度。可以设置为字符串，如"$9000"，或整数，如:"9000"

raised	string	无默认值，必填参数	进度条的当前进度。可以设置为字符串，如"$5000"，或整数，如:"5000"

width	string	100%-水平宽度。（在水平进度条中必须设置）	设置进度条的水平宽度。可以设置为百分比或像素值

height	string	50px。（在垂直进度条中必须设置）	设置进度条的垂直高度。可以设置为百分比或像素值

bgColor	string	#444	进度条的背景颜色。支持hex、rgba和颜色关键字。

barColor	string	#bfd255	进度条的颜色。支持hex、rgba和颜色关键字。

orientation	string	horizontal	进度条的方向，可设置为： 'horizontal' 或 'vertical'。如果设置为垂直进度条，该参数必须设置。

displayTotal	boolean	true	是否显示进度条完成的百分比数。

animationSpeed	integer	2000	进度条动画时间，单位毫秒

counterSpeed	integer	2000	进度条计数的时间，单位毫秒 -->
<!--<![endif]-->
</body>
</html>
