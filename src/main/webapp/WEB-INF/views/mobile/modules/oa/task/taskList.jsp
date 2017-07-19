<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="decorator" content="default"/>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>我的任务</title>
		<meta name="" content="no-cache" http-equiv="Pragma" />
		<meta name="" content="no-cache" http-equiv="Cache-Control" />
		<meta name="" content="0" http-equiv="expires" />
		<link href="${ctxStatic}/mobile/frame_css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="${ctxStatic}/mobile/css/mui.css" />
		<link rel="stylesheet" href="${ctxStatic}/mobile/css/oabase.css" />
		<!-- <script type="text/javascript">
			$(document).ready(function(){
				$("#searchsy").click(
					function(){
						$("#query").show();
					});
			})
		</script> -->
		<style type="text/css">
			.search-form, .bottom-button {
				padding: 0;
				margin: 0;
			}
			.statediv {
				width: 100%;
				box-sizing: border-box;
				padding: 10px;
				text-align: center;
				border-bottom: 1px solid #F6F6F6;
			}			
			.statediv  span {
				display: inline-block;
				width: 32%;
			}			
			.statea {	
				display: inline-block;			
            	outline: none;
   				width: 80px;
   				height: 26px;
   				line-height: 24px;
				background: white;
				border: 1px solid #909090;
				border-radius: 6px;			    
			    color: #666;
			}
			.thisstatea {	
				display: inline-block;			
            	outline: none;
   				width: 80px;
   				height: 26px;
   				line-height: 24px;
				background: #12b7f5;
				border: 1px solid #12b7f5;
				border-radius: 6px;			    
			    color: #fff;							
			}			
			
			/* #slider {
				margin-top: 53px;
			}
			
			.divtask {
				width: 100%;
				box-sizing: border-box;
				padding: 10px;
				overflow: hidden;
			} */						
			
			/* #name {
				color: #57B2E9;
				margin-right: 10px;
			}
			
			#date {
				color: #858585;
				margin-left: 10px;
			}
			
			.taskmain {
				float: left;
				display: inline-block;
				width: 100%;
				height: 90px;
				padding-top: 10px;
			}
			
			#taskleft {
				width: 60%;
				position: absolute;
			}
			
			.taskcon {
				font-size: 16px;
				color: #333333;
			}
			
			.divtaskcon {
				margin-top: 10px;
				margin-bottom: 10px;
			}
			
			#taskright {
				height: 70px;
				margin-left: 70%;
				border: 1px solid #F6F6F6;
				padding-top: 10px;
			}
			
			.taskimg {
				margin-top: 10px;
			}
			
			#taskright>div>span {
				font-size: 13px;
				color: #333333;
			}
			
			#spanrightdate {
				margin-right: 5px;
			} */
			
			.mui-scroll-wrapper {
				margin-top: 88px;
				margin-bottom: 50px;
			}
			/*搜索行*/
			/* .ssdiv1 {
				width: 100%;
				height: 40px;
				float: left;
				margin-top: 52px;
			}
			
			#ssdi12 {
				display: inline-block;
				float: left;
				margin-left: 10px;
				height: 40px;
				width: 70%;
			}
			#ssdi13{
				display: inline-block;
				float: left;
				margin-left: 10px;
			}
			#ssdi12>input {
				padding: 6px;
				height: 30px;
				margin-top: 5px;
				font-size: 16px;
				font-family: "微软雅黑";
				color: #000;
			}
			#ssdi13>input {
				padding: 0px 10px 0px 10px;
				height: 30px;
				margin-top: 5px;
				font-size: 16px;
				font-family: "微软雅黑";
				color: #000;
			}
			       .state-red{
        	border-radius: 50%;
        	top:-15px;
            background-color: #f35d5e;
        }
         .state-gray{
         	border-radius: 50%;
        	top:-13px;
            background-color: #fbd051;
        }

         .state-orange{
        	border-radius: 50%;
        	top:-13px;
            background-color: #fea35b;
        } */
        p {
        	font-size:16px;
        }
        span {
				font-size: 14px;				
			}
        .main-tit>span{
			font-size:17px;
			color:#333;
		}
        
        .mui-segmented-control{
        	border: 1px solid #12b7f5;
        }
        .mui-segmented-control .mui-control-item.mui-active{
        	background-color: #12b7f5;
        }
        .teamtask-icon{
        	color: #32a5e7;
        }
        .teamtask-icon .msg-type{
        	color: #333;
        }
        .mui-media-body p{
        	overflow: hidden;
        	text-overflow: ellipsis;
			white-space: nowrap;
			color:#666;
        }
        .state{
        	text-align:right;
        }
       .state span {
        	padding: 4px 8px;
        	font-size: 12px;
        	background-color: #ff9f00;
        	border-radius: 4px;
        	color: #fff;
        }
        .state span.mytask-ing {
        	background-color: #ff9f00;
        }
        .state span.mytask-done {
        	background-color: #1ab394;
        }
        .state span.mytask-draft {
        	background-color: #12b7f5;
        }
        .state span.mytask-overtime {
        	background-color: #f25d5d;
        }
        .mui-segmented-control .mui-control-item{
        	color: #12b7f5;
        	border-color: #12b7f5;
    		border-left: 1px solid #12b7f5;
        }
        .teamtask-icon span:nth-of-type(2){
        	display: inline-block;
        	width: 60%;
        	overflow: hidden;
			text-overflow: ellipsis;
			white-space: nowrap;
        	
        }
		.team-header{
			position: fixed;
    		z-index: 999;
		}
		/* #oaBarTab {
			z-index: -1;
		} */
		</style>
		
	</head>
	<body class="teamwork">
		<div class="team-header">
			<div id="segmentedControl" class="mui-segmented-control mui-segmented-control-primary">
				<a class="mui-control-item mui-active" 
				id="list">我布置的任务</a> <a
					class="mui-control-item" 
				id="mylist"	>我收到的任务</a>
			</div>
		</div>				

		<div class="main-tit teamtask-tit" style="margin-top:48px;">
			<span>我布置的任务</span> <a class="mui-pull-right"
				href="${ctx}/m/oa/mytask/myTask/form" onclick="addsyer()"><span
				class="mui-icon mui-icon-plus"></span></a> <a class="mui-pull-left"
				id="searchsy"><span
				class="mui-icon mui-icon-search"></span></a>
		</div>
		
		<div class="mui-scroll-wrapper">
			<div class="mui-scroll">
				<div id="query" class="mui-content" style="display: none;width:100%;margin-top:-1px;">
					<form:form id="searchForm" modelAttribute="oaPlan" class="search-form"
						action="${ctx}/m/oa/mytask/myTask/selectmylist">
						<ul class="userinfo-edit search-edit">
							<li><label class="form-left">任务名:</label>
								<input type="text" id="plantitle" name="planTitle" value="${planTitle}" />
							</li>
							<li><div class="bottom-button">
									<button type="reset" class="btnapp btn-next"
										data-loading-text="取消中">重置</button>
									<!-- <button type="button" class="btnapp btn-next" onclick="clearForm();"
										>重置</button> -->
									<button type="submit" class="btnapp btn-submit"
										data-loading-text="提交中">查询</button>
								</div>
							</li>
						</ul>
					</form:form>
				</div>
				<div id="daiban" class="mui-control-content oa-contents mui-active">				
					<div class="statediv">
						<span >
							<a class="statea" onclick="click1()" id="a1">进行中(${mapa.suma })</a>
						</span>
						<span >
							<a class="statea" onclick="click2()" id="a2">已完成(${mapb.sumb })</a>
						</span>
						<span >
							<a class="statea" onclick="click3()" id="a3">已超期(${mapc.sumc })</a>
						</span>
					</div>
					<div>
						<ul class="mui-table-view ">
							<c:forEach items="${page.list}" var="oaTask">
								<li class="mui-table-view-cell mui-media">
									<a href="${ctx}/m/oa/mytask/myTask/up?id=${oaTask.id}">										
										<div class="mui-row">
											<div class="mui-col-xs-9">
												<div class="teamtask-icon">
												<c:choose>
														<c:when test="${oaTask.prefer == 0}">
															 <span class="state-red"></span>
														</c:when>
														<c:when test="${oaTask.prefer == 1 }">
															 <span class="state-orange"></span>
														</c:when>
														<c:otherwise>
														  <span class="state-gray"></span>	
														</c:otherwise>
													</c:choose> 
												<%-- 	<img class="mui-media-object mui-pull-left"
														src="${ctxStatic}/mobile/images/touxiang.png" alt="协同消息" /> --%>
														<span>${oaTask.actor.name }</span>
														<span class="msg-type mui-pull-right"><fmt:formatDate value="${oaTask.createDate }" pattern="yyyy-MM-dd" /></span>
														
												</div>
												<div class="mui-media-body">
													<p>${oaTask.planTitle}</p>
												</div>
											</div>
											<div class="mui-col-xs-3">
												<div class="state">													 
													<c:if test="${oaTask.issueState == 1 }">
						                    			<c:choose>
													<c:when test="${oaTask.state == 1}">
														<span class="mytask-ing">进行中</span>
													</c:when>
													<c:when test="${oaTask.state == 2 }">
														<span class="mytask-done">已完成</span>
													</c:when>
													<c:otherwise>
													    <span class="mytask-overtime"> 已超期</span>
													</c:otherwise>
												</c:choose> 
						                    	</c:if>
						                           <c:if test="${oaTask.issueState == 0 }">
						                   				<span class="mytask-draft"> 草稿</span>
						                    	</c:if>						                    
											</div>
											</div>
										</div>																				
								</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>		
		</div>
		<jsp:include page="/WEB-INF/views/mobile/modules/sys/foot.jsp"></jsp:include>
		<%-- <script type="text/javascript" src="${ctxStatic}/jquery/jquery-2.1.1.min.js"></script> --%>
		<script src="${ctxStatic}/mobile/js/mui.min.js"></script>
		<script src="${ctxStatic}/mobile/js/mobile.js"></script>
		<!-- <script type="text/javascript">
			 var h = document.documentElement?document.documentElement.clientHeight:document.body.clientHeight;
			var oaBar = document.getElementById('oaBarTab');
			oaBar.style.top = (h -50) + "px";
			oaBar.style.position = "absolute"; 
			
		</script> -->
		<script type="text/javascript">
		mui.init()(function($) {
			$('.mui-scroll-wrapper').scroll({
				indicators : true
			//是否显示滚动条
			});
		})(mui);
		$(document).ready(function() {
			function myfun(){
			    var value='${Stateflag}';
			  
   				if(value==1){
   					$("#a1").addClass("thisstatea");
   				}
   				if(value==2){
   					$("#a2").addClass("thisstatea");
   				}
   				if(value==3){
   					$("#a3").addClass("thisstatea");
   				}
			}
			
			window.onload = myfun;//不要括号			
			mui.init();
		    document.getElementById('searchsy').addEventListener('tap',function(){  
		    //点击响应逻辑  
			   searchsy();		    			   
		    });  		    		   
			
		   document.getElementById('list').addEventListener('tap', function(){  
			   console.log("tosend");
		       list();
		       return true;
		   }); 
		   document.getElementById('mylist').addEventListener('tap', function(){  
			   console.log("tosend");
		       mylist();
		       return true;
		   }); 
		    function searchsy() {
		        document.getElementById('query').style.display = document
		                .getElementById('query').style.display == 'none' ? 'block'
		                : 'none';
		    }
		    
		    function list() {
		        location.href = "${ctx}/m/oa/mytask/myTask/list";
		    }
		    function mylist() {
		        location.href = "${ctx}/m/oa/mytask/myTask/mylist";
		    }
		    
		    $('#plantitle').focus(function(){
				$('#oaBarTab').hide();
				$(".mui-scroll-wrapper").css("margin-bottom","0");
			});
			$('#plantitle').blur(function(){
				$('#oaBarTab').show();
			});
		    
		});
function click1() {
	/*样式改变*/
/* 	document.getElementById("a1").setAttribute("class", "thisstatea");
	document.getElementById("a2").setAttribute("class", "statea");
	document.getElementById("a3").setAttribute("class", "statea"); */
	location.href="${ctx}/m/oa/mytask/myTask/taskState?State=1";
}
/*进行中点击*/
function click2() {
	/*样式改变*/
/* 	document.getElementById("a1").setAttribute("class", "statea");
	document.getElementById("a2").setAttribute("class", "thisstatea");
	document.getElementById("a3").setAttribute("class", "statea"); */
	location.href="${ctx}/m/oa/mytask/myTask/taskState?State=2";
}
/*进行中点击*/
function click3() {
	/*样式改变*/
/* 	document.getElementById("a1").setAttribute("class", "statea");
	document.getElementById("a2").setAttribute("class", "statea");
	document.getElementById("a3").setAttribute("class", "thisstatea"); */
	location.href="${ctx}/m/oa/mytask/myTask/taskState?State=3";
}

/* function clearForm(){
  $("#plantitle").val("");
} */
</script>
	</body>

</html>