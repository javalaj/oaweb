<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>我的任务管理</title>
<meta name="decorator" content="default" />
<!-- <script type="text/javascript">
		$(document).ready(function() {
			$("#allChk").click(function() { 
				$("input[name='subChk']").prop("checked",this.checked); 
				}); 
				// 单选 
				var subChk = $("input[name='subChk']") 
				subChk.click(function() { 
				$("#allChk").prop("checked", subChk.length == subChk.filter(":checked").length ? true:false); 
				}); 
				/* 批量收藏 */ 
				$("#store").click(function() { 
				// 判断是否至少选择一项 
				var checkedNum = $("input[name='subChk']:checked").length; 
				if(checkedNum == 0) { 
					top.layer.msg('请勾选至少一条数据后再进行收藏');
					$("#messageBox").show();
				return; 
				} 
				// 批量选择 
				confirmx("确定要收藏所选项目？",function() { 
				var checkedList1 = new Array(); 
				$("input[name='subChk']:checked").each(function() { 
				checkedList1.push($(this).val()); 
				}); 
				$.ajax({ 
				type: "POST", 
				url: "${ctx}/oa/mytask/myTask/store", 
				data: {'delitem':checkedList1.toString()}, 
				 success: function(result) { 
					 top.$.jBox.tip.mess = 2;
						top.$.jBox.tip("收藏成功！", "success", {
							persistent : true,
							opacity : 0
						});
						$("#messageBox").show();
				$("[name ='subChk']:checkbox").attr("checked", false); 
				window.location.reload(); 
				} 
				}); 
				} );
				});
				
				
				$("#subTask").click(function() { 
					// 判断是否至少选择一项 
					var checkedNum = $("input[name='subChk']:checked").length; 
					if(checkedNum == 0) { 
						top.$.jBox.tip.mess = 2;
						top.$.jBox.tip("至少选择一项", "info", {
							persistent : true,
							opacity : 0
						});
						$("#messageBox").show();
					return; 
					}else if(checkedNum > 1){
						top.layer.msg('请勾选至少一条数据后再进行操作');
						$("#messageBox").show();
					return; 
						
					}
					// 批量选择 
					confirmx("确定为该任务添加子任务？",function() { 
					var checkedList1 = new Array(); 
					$("input[name='subChk']:checked").each(function() { 
					checkedList1.push($(this).val()); 
					}); 
					window.location.href="${ctx}/oa/mytask/myTask/subform?delitem="+checkedList1.toString();
					});
					});
				
				
				$("#spass").click(function() { 
					// 判断是否至少选择一项 
					var checkedNum = $("input[name='subChk']:checked").length; 
					if(checkedNum == 0) { 
						top.layer.msg('请勾选至少一条数据后再进行办结');
						$("#messageBox").show();
					return; 
					} 
					// 批量选择 
					confirmx("确定要办理所选任务？",function() { 
					var checkedList1 = new Array(); 
					$("input[name='subChk']:checked").each(function() { 
					checkedList1.push($(this).val()); 
					}); 
					$.ajax({ 
					type: "POST", 
					url: "${ctx}/oa/mytask/myTask/passtask", 
					data: {'delitem':checkedList1.toString()}, 
					 dataType: "html",
				     async : true, 
					success: function(data) {
						if(data=='1'){
							top.layer.msg('所选任务已办结无法继续办结');
						}else{
						 top.$.jBox.tip.mess = 2;
							top.$.jBox.tip("办理成功！", "success", {
								persistent : true,
								opacity : 0
							});
						}
							$("#messageBox").show();
					$("[name ='subChk']:checkbox").attr("checked", false); 
					window.location.reload(); 
					} 
					}); 
					} );
					});
				
				
				$("#del_model").click(function() { 
					// 判断是否至少选择一项 
					var checkedNum = $("input[name='subChk']:checked").length; 
					if(checkedNum == 0) { 
						top.layer.msg('请勾选至少一条数据后再进行删除');
						$("#messageBox").show();
					return; 
					} 
					// 批量选择 
					confirmx("确定要办理所选任务？",function() { 
					var checkedList1 = new Array(); 
					$("input[name='subChk']:checked").each(function() { 
					checkedList1.push($(this).val()); 
					}); 
					$.ajax({ 
					type: "GET", 
					url: "${ctx}/oa/mytask/oaPlan/deletemore", 
					data: {'delitem':checkedList1.toString()}, 
					 success: function(result) { 
						 top.$.jBox.tip.mess = 2;
							top.$.jBox.tip("删除成功！", "success", {
								persistent : true,
								opacity : 0
							});
							$("#messageBox").show();
					$("[name ='subChk']:checkbox").attr("checked", false); 
					window.location.reload(); 
					} 
					}); 
					} );
					});
		});
		function page(n,s){
			  
			$("#pageNo").val(n);
		    $("#pageSize").val(s);
			$("#searchForm").attr("action","${ctx}/oa/mytask/myTask/selectmylist");
			$("#searchForm").submit();
	    	return false;
        }
	</script> -->
<style type="text/css">
.ul-form li {
	margin-left: 100px;
}

.btns {
	margin-left: 0px;
}
        
        ol + input[type="button"].btn{
        	margin-left:20px;
        }
       
       .ibox {
       	background-color: #fff;
       }
        .container-fluid button{
            float: left;
        }
        
        .container-fluid button .fa{
        	margin-right:4px;
        }
        .container-fluid .newtask{
        	display: inline-block;
        	width:100%;
        	margin-top:10px;
        }
        
        
        
        .container-fluid input{
            width: 241px;
            margin-right:10px;
            float: left;
        }
        .container-fluid a{
            line-height: 32px;
            margin-left: 20px;
        }
        
        
        .info ol li {
		    width: 65%;
		    height: 38px;
		    line-height: 38px;
		    margin-left: 6%;
		}
        .file-main{
            height: 48px;
            padding:0 30px;
            background-color: #efefef;
            border-top:1px solid #ddd;
            border-bottom:1px solid #ddd;
            line-height: 48px;
        }
        .file-main span,.file-main time,.file-main div{
            display: inline-block;
            text-overflow: ellipsis;
    		white-space: nowrap;
    		overflow: hidden;
        }

        .file-main span{
            width: 18px;
            height:18px;
            position: relative;
            top:7px;
            margin-right: 10px;
        }
        .file-main time{
            width: 135px;
            height: 46px;
    		line-height: 46px;
            position: relative;
        }
        .file-main time:after{
            content: '';
            position: absolute;
            width: 1px;
            height: 28px;
            background-color: #c8c7cc;
            right:0;
            top:10px;
        }
		
        .file-main .state-red{
        	border-radius: 50%;
        	top:-15px;
            background-color: #f35d5e;
        }
        .file-main .state-gray{
         	border-radius: 50%;
        	top:-13px;
            background-color: #fbd051;
        }

        .file-main .state-orange{
        	border-radius: 50%;
        	top:-13px;
            background-color: #fea35b;
        }

        .title-time{
            height:31px;
            line-height: 31px;
            font-weight: bolder;
        }
        .state{
        	display:inline;
            padding:0 2%;
            width:12% ;
        }

        .file-content{
            width: 30%;
            margin:0 3%;
        }
        .file-content span{
            display: inline;
        }

        .Upload{
            width: 15%;
            padding:0 1%;
            position: relative;
            text-overflow: ellipsis;
    		white-space: nowrap;
    		overflow: hidden;
        }
        .Upload img{
            display: inline-block;
            width:36px;
            height: 36px;
            border-radius: 50%;
            margin-right: 10%;
            position: absolute;
            top:5px;
            left:-40px;
        }
        .file-main a{
            margin-left: 3%;
            color: #333;
        }
        ul,li{
            list-style-type: none;
        }
        .file-main .operate{
            position: relative;
            cursor: pointer;
            text-align: center;
            display: inline-block;
    		height: 48px;
    		line-height:48px;
            min-width: 32px;
    		left: 10%;
    		overflow: visible;
    		top:-18px;
        }
        .operate .myoa-project-oprate-cont a{
            color:#35a5e7;
            font-size:13px;
        }

        .operate a:hover{
            color:#35a5e7;
            text-decoration: none;
        }

        .myoa-project-oprate-cont{
            position: absolute;
		    top: 90%;
		    right: -20px;
		    width: 82px;
		    border: 1px solid #ddd;
		    border-radius: 4px;
		    box-shadow: 0 0 2px 1px rgba(0,0,0,0.06);
		    padding:0 4px 5px 0;
		    background-color: #fff;
		    display: none;
		    z-index:99999;
        }
        
        .myoa-project-oprate-cont li{
        	list-style: none;
			text-align: center;
			height: 22px;
			line-height: 22px;
			font-size: 13px;
        }
        
        .myoa-project-oprate-cont>li>a{
        	color: #35a5e7;
        }
        .myoa-project-oprate-cont>li>a:hover{
        	border-bottom:1px solid #35a5e7;
        }

        .myoa-project-oprate-cont:before{
                position: absolute;
			    top: -7px;
			    left: 36px;
			    display: inline-block;
			    border-right: 6px solid transparent;
			    border-bottom: 6px solid #ddd;
			    border-left: 6px solid transparent;
			    border-bottom-color: rgba(0,0,0,0.3);
			    content: '';
        }

        .operate:hover .myoa-project-oprate-cont{
            display: block;
        }
    </style>
    <script type="text/javascript">
    function newForm(){
    	location.href="${ctx}/oa/mytask/myTask/form";
    }
    </script>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
	<div class="ibox">
		<c:if test="${th==null }">
		<ul class="nav nav-tabs myoa-tabs">
		    <li class="active"><a href="${ctx}/oa/mytask/myTask/list">我布置的任务（<span>${map.sum }</span>）</a></li>
		    <li><a href="${ctx}/oa/mytask/myTask/mylist">我收到的任务（<span>${mapi.sum }</span>）</a></li>
		</ul>
		</c:if>
		<c:if test="${th==1 }">
		<ul class="nav nav-tabs myoa-tabs">
			<li><a href="${ctx}/oa/mytask/myTask/list">我布置的任务（<span>${map.sum }</span>）</a></li>
		    <li class="active"><a   href="${ctx}/oa/mytask/myTask/mylist">我收到的任务（<span>${mapi.sum }</span>）</a></li>    
		</ul>
		</c:if>
		<div class="container-fluid" style="padding: 15px; padding-bottom:80px;">
    		<div class="clearfix">
        
        		<form:form id="searchForm" modelAttribute="oaPlan" action="${ctx}/oa/mytask/myTask/selectmylist" method="post" class="form-inline">
						<input id="pageNo" name="pageNo" type="hidden"
						value="${page.pageNo}" />
						<input id="pageSize" name="pageSize" type="hidden"
						value="${page.pageSize}" />
						<table:sortColumn id="orderBy" name="orderBy"
						value="${page.orderBy}" callback="page();" />
      					<form:input path="planTitle" htmlEscape="false" placeholder="查找任务名称" maxlength="200" class="form-control input-sm" />
       			 		<button class="btn btn-primary btn-rounded btn-outline btn-sm " type="submit"><i class="fa fa-search"></i>查询</button>
     	  		</form:form>
        		<a href="${ctx}/oa/mytask/myTask/taskState?State=2">已完成的任务（<span>${mapb.sumb }</span>）</a>
        		<c:if test="${th==null }">
        		<div class="newtask"><button class="btn btn-white btn-sm" onclick="newForm();"><i class="fa fa-plus"></i>新建任务</button></div>
        		</c:if>
    		</div>
			<sys:message content="${message}" />
			    <div class="tab-content">
			        <ul class="tab-pane active" id="received-task">
			        <c:forEach items="${page.list}" var="oaTask">
			            <li>
			                <time class="title-time"><fmt:formatDate value="${oaTask.startDay }"
										pattern="yyyy-MM-dd" /></time>
			                <div class="file-main" >
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
			                    <time class="title-time">
			                    <fmt:formatDate value="${oaTask.endDate }" pattern="yyyy-MM-dd" /></time>	
			                    <div class="state">
			                    <c:if test="${oaTask.issueState == 1 }">
			                    <c:choose>
										<c:when test="${oaTask.state == 1}">
											进行中
										</c:when>
										<c:when test="${oaTask.state == 2 }">
											已完成
										</c:when>
										<c:otherwise>
										  已超期
										</c:otherwise>
									</c:choose> 
			                    </c:if>
			                           <c:if test="${oaTask.issueState == 0 }">
			                   				  草稿
			                    </c:if>
			                 </div>
			                    <div class="file-content">
			                    		<c:if test="${th==null }">
			                    		<a href="${ctx}/oa/mytask/myTask/up?id=${oaTask.id}">${oaTask.planTitle} </a>
										</c:if>
										<c:if test="${th==1 }">
										<a href="${ctx}/oa/mytask/myTask/myup?id=${oaTask.id}">${oaTask.planTitle}</a>
										</c:if>
										</div>
			                    <div class="Upload" style="overflow: hidden; text-overflow: ellipsis;white-space: nowrap;"><img href="uer.png">${oaTask.actor.name }</div>
			                    <div class="operate">
			                  
			                     <c:choose>
										<c:when test="${oaTask.state == 2 }">
										</c:when>
										<c:otherwise>
										  <a href="#"> <span class="glyphicon glyphicon-option-horizontal" aria-hidden="true"></span></a>
										      <ul class="myoa-project-oprate-cont">
													    <c:if test="${th==null }">
			                   					 <li><a href="${ctx}/oa/mytask/myTask/up?id=${oaTask.id}">详情</a></li>
						           				 <li><a href="${ctx}/oa/mytask/oaPlan/deletemore?delitem=${oaTask.id}">删除</a></li>
						            </c:if>
						            	<c:if test="${th==1 }">
						            	 		  	<li><a href="${ctx}/oa/mytask/myTask/myup?id=${oaTask.id}">详情</a></li>
						            	 			<li><a href="${ctx}/oa/mytask/myTask/myup?id=${oaTask.id}">回复</a></li>
						         	   		<!-- 	<li><a href="#">办结</a></li> -->
						           				<%-- 	 <li><a href="${ctx}/oa/mytask/oaPlan/deletemore?delitem=${oaTask.id}">删除</a></li> --%>
						            	</c:if>
						            	 </ul>
										</c:otherwise>
									</c:choose> 
			                    </div>
			                </div>
			            </li>
			            </c:forEach>
			        </ul>
			    </div>
			</div>
	</div>
</div>
	
</body>
<%-- <body>
	
	<body class="gray-bg">
<div class="wrapper wrapper-content">
<div class="ibox ">
<div class="ibox-title noprint">
		<h5>任务列表 </h5>
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
    
   <div class="ibox-content ">
   	<sys:message content="${message}"/>
   	<div class="row">
	<div class="col-sm-12">
	<form:form id="searchForm" modelAttribute="oaPlan"
		
		
		action="${ctx}/oa/mytask/myTask/selectmylist" method="post"
		class="form-inline">
		<input id="pageNo" name="pageNo" type="hidden"
						value="${page.pageNo}" />
					<input id="pageSize" name="pageSize" type="hidden"
						value="${page.pageSize}" />
					<table:sortColumn id="orderBy" name="orderBy"
						value="${page.orderBy}" callback="page();" />
			接收人：
			<sys:treeselect id="actor" name="actor" value="${oaPlan.actor.id}" labelName="actor.name" labelValue="${oaPlan.actor.name }"
			
					title="参与者" url="/sys/office/treeData?type=3" cssClass="form-control input-sm" allowClear="true" />&nbsp;&nbsp;&nbsp;
			
			<form:input path="planTitle"
					htmlEscape="false" placeholder="查找任务名称" maxlength="200"
					class="form-control" />
	<br/>
	</div>
	
	</div>
	<div class="pull-left">
	<c:if test="${th==null }">
		<a class="btn btn-white btn-sm " href="${ctx}/oa/mytask/myTask/form"><i class="fa fa-plus"></i>新建任务</a>
		<a class="btn btn-primary btn-rounded btn-outline btn-sm " href="${ctx}/oa/mytask/myTask/list"><i class="fa fa-search"></i>我布置的任务<span
				style="color: red;">(${map.sum })</span></a>
		<a class="btn btn-primary btn-rounded btn-outline btn-sm " href="${ctx}/oa/mytask/myTask/mylist"><i class="fa fa-search"></i>我收到的任务<span
				style="color: red;">(${mapi.sum })</span></a> <shiro:hasPermission
				name="oa:mytask:mytask:all">
				<a href="${ctx}/oa/oaTask/">所有任务<span
						style="color: red;">(11)</span></a>
			</shiro:hasPermission>
			</c:if>
			<c:if test="${th==1 }">
		<a class="btn btn-white btn-sm" href="${ctx}/oa/mytask/myTask/form"><i class="fa fa-plus"></i>新建任务</a>
		<a class="btn btn-primary btn-rounded btn-outline btn-sm " href="${ctx}/oa/mytask/myTask/list"><i class="fa fa-search"></i>我布置的任务<span
				style="color: red;">(${map.sum })</span></a>
		<a class="btn btn-primary btn-rounded btn-outline btn-sm " href="${ctx}/oa/mytask/myTask/mylist"><i class="fa fa-search"></i>我收到的任务<span
				style="color: red;">(${mapi.sum })</span></a> <shiro:hasPermission
				name="oa:mytask:mytask:all">
				<a href="${ctx}/oa/oaTask/">所有任务<span
						style="color: red;">(11)</span></a>
			</shiro:hasPermission>
			</c:if>
				<a href="${ctx}/oa/mytask/myTask/taskState?State=1"  class="btn btn-primary btn-rounded btn-outline btn-sm "><i class="fa fa-search"></i>进行中<span style="color: red;">(${mapa.suma })</span></a>
					<a href="${ctx}/oa/mytask/myTask/taskState?State=2"  class="btn btn-primary btn-rounded btn-outline btn-sm "><i class="fa fa-search"></i>已完成<span style="color: red;">(${mapb.sumb })</span></a>
					<a href="${ctx}/oa/mytask/myTask/taskState?State=3"  class="btn btn-primary btn-rounded btn-outline btn-sm "><i class="fa fa-search"></i>已超期<span style="color: red;">(${mapc.sumc })</span></a>															
	<a href="javascript:void(0);" id="store"
										class="btn btn-white btn-sm"><i class="fa"></i>★收藏</a>
					<c:if test="${th==null }"> <a href="javascript:void(0);" id="del_model"
										class="btn btn-white btn-sm"><i class="fa fa-trash-o"></i>删除</a><table:delRow url="${ctx}/oa/mytask/oaPlan/deletemore" id="contentTable"></table:delRow></c:if></li>
	
	</div>
		<div class="pull-right">
		<input id="btnSubmit"
				class="btn btn-primary btn-rounded btn-outline btn-sm" type="submit" value="查询" /> 
				<c:if test="${th==1}"> <input
				id="subTask" class="btn btn-primary btn-rounded btn-outline btn-sm" type="button" value="编辑子任务" /></c:if>
				<input id="spass" class="btn btn-primary btn-rounded btn-outline btn-sm" type="button" value="办结" />
	</div>
	</form:form>
	<div style="width: 100%; overflow: auto;">
	<table id="contentTable"
		class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable " style="white-space: nowrap;">
		<thead>
			<tr>
				<th><input type="checkbox" id="allChk" /></th>
				<th style="text-align: center">任务名称</th>
				<th style="text-align: center">关联项目</th>
				<th style="text-align: center">任务发起人</th>
				<th style="text-align: center">发起部门</th>
				<th >接收人</th>
				<th style="text-align: center">任务开始日期</th>
				<th style="text-align: center">开始时间</th>
				<th style="text-align: center">期望完成时间</th>
				<th style="text-align: center">实际完成时间</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list}" var="oaTask">
				<tr>
					<td ><input type="checkbox" name="subChk" value="${oaTask.id}"  />

					</td>
					<td><c:choose>
							<c:when test="${oaTask.prefer == 0}">
								<img class="add-del-png" src='${ctxStatic}/images/1.jpg' />
							</c:when>
							<c:when test="${oaTask.prefer == 1 }">
								<img class="add-del-png" src='${ctxStatic}/images/2.jpg' />
							</c:when>
							<c:otherwise>
								<img class="add-del-png" src='${ctxStatic}/images/3.jpg' />
							</c:otherwise>
						</c:choose> <c:if test="${th==null }"><a href="${ctx}/oa/mytask/myTask/up?id=${oaTask.id}">
							${oaTask.planTitle} </a></c:if>
							<c:if test="${th==1 }">
							<a href="${ctx}/oa/mytask/myTask/myup?id=${oaTask.id}">${oaTask.planTitle}</a>
							</c:if>
							
							</td>

					<td style="text-align: center">${oaTask.projectid.projectName}</td>
					<td style="text-align: center">${oaTask.createBy.name}</td>
					<td style="text-align: center">${oaTask.createBy.office.name}</td>
					 <td >${oaTask.actor.name }</td>
					<td style="text-align: center"><fmt:formatDate value="${oaTask.startDay }"
							pattern="yyyy-MM-dd" /></td>
					<td style="text-align: center"> ${oaTask.startTime}</td>
					<td style="text-align: center">${oaTask.endTime }</td>
					<td style="text-align: center"><fmt:formatDate value="${oaTask.factTime }"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
                   
					<shiro:hasPermission name="oa:oaTask:edit"><td>
    				<a href="${ctx}/oa/oaTask/form?id=${oaTask.id}">修改</a>
					<a href="${ctx}/oa/oaTask/delete?id=${oaTask.id}" onclick="return confirmx('确认要删除该我的任务吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	
	<table:page page="${page}"></table:page>
		<br/>
	<br/>
	</div>
	</div>
	</div>
</body> --%>
</html>