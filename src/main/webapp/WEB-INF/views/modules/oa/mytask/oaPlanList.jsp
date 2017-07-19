<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>日程管理</title>
	<meta name="decorator" content="default"/>
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/resources/css/style.css">	
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/fullcalendar-1.6.1/fullcalendar/fullcalendar.css">	
	<script src='${ctxStatic}/fullcalendar-1.6.1/jquery/jquery-ui-1.10.2.custom.min.js'></script>
	<script src='${ctxStatic}/fullcalendar-1.6.1/fullcalendar/fullcalendar.min.js'></script>
	<link rel='stylesheet' href='${ctxStatic}/fullcalendar-1.6.1/demos/cupertino/theme.css' />
	<script type="text/javascript">
	Date.prototype.format = function(fmt) { 
		
	     var o = { 
	        "M+" : this.getMonth()+1,                 //月份 
	        "d+" : this.getDate(),                    //日 
	        "H+" : this.getHours(),                   //小时 
	        "m+" : this.getMinutes(),                 //分 
	        "s+" : this.getSeconds(),                 //秒 
	        "S"  : this.getMilliseconds()             //毫秒 
	    }; 
	    if(/(y+)/.test(fmt)) {
	            fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
	    }
	     for(var k in o) {
	        if(new RegExp("("+ k +")").test(fmt)){
	             fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
	         }
	     }
	    return fmt;
	    
	}        
	
    var TimeFn = null;
    function dbclickfuntion(){
   	 clearTimeout(TimeFn);
   	window.location.href='${ctx}/oa/mytask/oaPlan/form';
   	 }
    
  	$(document).ready(function() {
  		
  		
  		today = new Date(); //获取当前时间 
  		var y = today.getDay();
  		var m = today.getMonth() + 1;
  		var d = today.getDate();
  		var c=Math.ceil((d+6-y)/7);
  		
  		$('#calendar').fullCalendar({
  			
  			theme: true,
  			header: {
  				left: 'prev,next today',
  				center: 'title',
  				right: 'month,basicWeek,basicDay',
  				
  			},
  			editable: true,
  			aspectRatio:2.35,
  		 titleFormat:{month: '个人日程安排  yyyy年-MMM',week:'yyyy年 第W周' },
  		dayClick: function(date, allDay, jsEvent, view)  {
	  		// 取消上次延时未执行的方法
	  	    clearTimeout(TimeFn);
	  		
	  	    //执行延时
	  	    TimeFn = setTimeout(function(){
	  	    	var timestamp = Date.parse(new Date());
	  	    	var a=date;
	  	    	 $.ajax({
	  	              url: "${ctx}/oa/mytask/oaPlan/datelist?timetamp="+timestamp,
	  	              type: "GET",
	  	            contentType : 'application/json;charset=utf-8', 
	  	              dataType:"json",
	  	              data: {'date':a.Format('yyyy-MM-dd')},
	  	              success: function(data){
	  	            	$('#contentTable').empty();
	  	            	for(i=0;i<data.length;i++){
	  	            		var type=data[i].planType;
	  	            		var endtime=data[i].endTime;
	  	            		var tip=data[i].tip;
	  	            		var endtime=new Date(data[i].endTime);
	  	            		var temp;
	  	            		if(tip==0){
	  	            			temp="<td>提醒十分钟</td>";
	  	            		}else if(tip==1){
	  	            			temp="<td>提醒二十分钟</td>";
	  	            		}else if(tip==2){
	  	            			temp="<td>提醒三十分钟</td>";
	  	            		}
	  	            		else if(tip==3){
	  	            			temp="<td>提醒一天</td>";
	  	            		}else{
	  	            			temp="<td>无提醒</td>";
	  	            		}
	  	            		var et;
	  	            		var ty;
	  	            		var ettr;
	  	            		var edt;
	  	            		if(type==2){
	  	            			ty="<td>会议</td>";
	  	            			et="<td>未设置结束时间</td>";
	  	            			ettr="<th>结束时间</th>";
	  	            		}else if(type==0){
	  	            			ty="<td>工作任务</td>";
	  	            			et="<td>"+data[i].endTime+"</td>";
	  	            			ettr="<th>结束时间</th>";
	  	            		}else{
	  	            			ettr="<th>结束时间</th>";
	  	            			ty="<td>私人活动</td>";
	  	            			et="<td>"+data[i].endTime+"</td>";
	  	            		}
	  	            		if(endtime!=null){
	  	            			endtime=edt;
	  	            		}else{
	  	            			edt='';
	  	            		}
	  	            		
	  	            		$("#contentTable").append(	
	  	            				
	  	            				
  	            					"<thead><tr><th>事件类型</th><th>日程名称</th><th>开始日期</th><th>开始时间</th>"+ettr+"<th>提醒</th><th>操作</th></tr></thead><tbody><tr>"+
  	            					ty+
  	            					"<td><a href=\"${ctx}/oa/mytask/oaPlan/upPaln?id="+data[i].id+"\"\"  style='color:blue;'  onclick=\"return confirmx('确认要编辑此任务吗？', this.href)\">"+data[i].planTitle+"</a></td><td>"+data[i].startDay+"</td><td>"+data[i].startTime+"</td>"+et+
  	            					temp+
  	            					"<td><a href=\"${ctx}/oa/mytask/oaPlan/delete?id="+data[i].id+"\"\"    class='btn btn-danger btn-xs'    onclick=\"return confirmx('确认要删除该日程吗？', this.href)\" ><i class='fa fa-trash'></i>删除</a></td></tr></tbody>"
  	            					)
	  	            		}
	  	              }
	  	    	 });
	  	    },300);	 
	  	}, 
  		 	events: [
        <c:forEach items="${page.list}" var="item" varStatus="status" >
       
  				{
  					
  					id:'${item.id}',
  						
  					
  					title: '${item.planTitle}...',
  					
  					start: '${item.startDay}',
  					backgroundColor:"green" ,
  					editable:false,
  					
  				},
       
  				</c:forEach>
  			]
  		});
  		/* hidefc(); */
  	});
  	function hidefc(){
  		hide();
  		function hide(){
  			var arr=$(".fc-event:not(:hidden)");
	        if(arr.length>2){
	           	$(".fc-event:gt(0)").css({"display":"none"});
	        	$(".fc-day-content>div").css({"height":"35px"});
	        }
  		}
		$(".fc-header-right .fc-button:first-child").click(function(){
			hide();
		})
			
		}
    </script>
    <!-- <script type="text/javascript">
    $(document).ready(function(){
        var arr=$(".fc-event:not(:hidden)");
        if(arr.length>2){
           	$(".fc-event:gt(0)").css({"display":"none"});
        	$(".fc-day-content>div").css({"height":"35px"});
        }
    });
    </script> -->
	<style type="text/css">
    #calendar{ width:800px;margin-left:-660px;} 
    /* #contentTable{width:100%;} */
    .planlist{position:absolute;top:450px;width:800px;margin-left: 20px;margin-top:10px;}
  </style>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
	<div class="ibox">
		<div class="ibox-content">
			<ul class="nav nav-tabs myoa-tabs">
				<li class="active"><a href="${ctx}/oa/mytask/oaPlan/">日程列表</a></li>
			</ul>
			<sys:message content="${message}" />
			<div class="main_2" style="margin-left:0px;">
					<div  class="mate">
						<div id="calendar" ></div>
					</div>
					<div class="planlist">
					<table id="contentTable" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">        		
					</table>
				</div>	
			</div>
		</div>
	</div>
</div>		
</body>



</html>