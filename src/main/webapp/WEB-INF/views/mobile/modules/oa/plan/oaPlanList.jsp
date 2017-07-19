<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>日程管理</title>
	<meta name="decorator" content="default"/>
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no" />
	
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/resources/css/style.css">	
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/fullcalendar-1.6.1/fullcalendar/fullcalendar.css">	
	<script src='${ctxStatic}/fullcalendar-1.6.1/jquery/jquery-1.9.1.min.js'></script>
	<script src='${ctxStatic}/fullcalendar-1.6.1/jquery/jquery-ui-1.10.2.custom.min.js'></script>
	<script src='${ctxStatic}/fullcalendar-1.6.1/fullcalendar/fullcalendar.min.js'></script>
	<link rel='stylesheet' href='${ctxStatic}/fullcalendar-1.6.1/demos/cupertino/theme.css' />
	
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/mobile/css/mui.min.css" />
	<script src="${ctxStatic}/mobile/js/mui.min.js"></script>
	
	<script>
		mui.init({
			swipeBack: false,
		});
	</script>
	<script type="text/javascript">
	var selectedDate=null;
  	$(document).ready(function() {
  		$('#calendar').fullCalendar({
  			aspectRatio:1,
  			theme: true,
  			selectable:true,
  			unselectAuto:false,
  			editable: true,
  			select:function( startDate, endDate, allDay, jsEvent, view){
  				selectedDate=startDate;
  				getPlans(startDate);
			},
			unselect:function( view, jsEvent){
				if(view==null){
					selectedDate=null;
					$("#list").empty();
				}
			},
  			header: {
  				left: 'prev,today,next',
  				center: 'title',
  				right: 'month,basicWeek,basicDay',
  			},
  		 	titleFormat:{month: 'yyyy-MM',week:'yyyy-W',day:'yyyy' },
  		 	eventClick: function(event, jsEvent, view)  {
	  		}, 
  		 	events: [
       	 		<c:forEach items="${page.list}" var="item" varStatus="status" >
  				{
  					id:'${item.id}',
  					title: '${item.planTitle}',
  					start: '${item.startDay}',
  					editable:true,
  					backgroundColor:'#d7ebf9'
  				},
  				</c:forEach>
  			]
  		});
  		
  		
  	});
  	function confirmUrl(url,info){
  		var btnArray = ['是', '否']; 
  		mui.confirm(info, '提示', btnArray, function(e) { 
  			if (e.index == 0) { 
  				location.href=url;
  			}
  		});
  		
  	}
  	function getPlans(date){
  		$.ajax({
              url: "${mctx}/oa/plan/oaPlan/datelist",
              type: "GET",
              contentType : 'application/json;charset=utf-8', 
              dataType:"json",
              data: {'date':date},
              success: function(data){
            	$("#list").empty();
            	$.each(data,function(i, n){
            		
            		var tip=n.tip
            		var tipInfo="无提醒";
            		if(tip==0){
            			tipInfo="提醒十分钟";
            		}else if(tip==1){
            			tipInfo="提醒二十分钟";
            		}else if(tip==2){
            			tipInfo="提醒三十分钟";
            		}
            		else if(tip==3){
            			tipInfo="提醒一天";
            		}
            		n.tipInfo=tipInfo;
            		
            		var planType=n.planType;
            		var planTypeInfo="私人活动";
            		if(planType==2){
            			planTypeInfo="会议";
            		}else if(planType==0){
            			planTypeInfo="工作任务";
            		}
            		n.planTypeInfo=planTypeInfo;
            		
            		addCell(n);
            	});
              }
		});
  	}
	function addCell(data){
  		var tpl = $("#Tpl1").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
  		$("#list").append(Mustache.render(tpl, data));
  	}
	function addPlan(){
		//alert(selectedDate);
		location.href='${mctx}/oa/plan/oaPlan/form?startDay='+selectedDate;
	}
    </script>
    <script type="text/template" id="Tpl1">
		<li class="mui-table-view-cell">
			<p>
				<span style="color:#1a81d1">{{planTypeInfo}}</span>
				<span class="mui-pull-right" style="color:#1ab394;">{{startDay}}</span>
			</p>
			<p>
				<span style="color:#1a81d1;font-size: 12px;">{{tipInfo}}</span>
				<span class="mui-pull-right" style="color:#1ab394;">{{startTime}}</span>
			</p>
			<p style="color:#333;">{{planTitle}}</p>
			
			<p>&nbsp;&nbsp;<span class="mui-pull-right" style="color:#dd524d;">{{endTime}}</span></p>
			<p style="text-align:center">
				<button type="button" class="mui-btn mui-btn-primary" onclick="location.href='${mctx}/oa/plan/oaPlan/upPaln?id={{id}}';"><i class="fa fa-edit"></i>编辑</button>&nbsp;&nbsp;
				<button type="button" class="mui-btn mui-btn-danger" onclick="confirmUrl('${mctx}/oa/plan/oaPlan/delete?id={{id}}','确认要删除该日程吗？');"><i class="fa fa-close"></i>删除</button>
			</p>
		</li>
	</script>
</head>
<body class="mui-ios mui-ios-9 mui-ios-9-1">
	<!-- 侧滑导航根容器 -->
	    <header class="mui-bar mui-bar-nav">
	        <a class="mui-icon mui-icon-home mui-pull-left" onclick="location.href='${ctx}'"></a>
	        <a class="mui-icon mui-icon-plusempty mui-pull-right" onclick="addPlan();"></a>
			<h1 class="mui-title">我的日程</h1>
	    </header>
	    <div class="mui-content ">
			<sys:message content="${message}" />
			<ul class="mui-table-view"  style="margin-top:0px">
				<li class="mui-table-view-cell">
					<div id="calendar" style="margin-top:5px"></div>
				</li>
			</ul>
			<ul id="list" class="mui-table-view"  style="margin-top:0px">
			</ul>
	    </div>

</body>
</html>