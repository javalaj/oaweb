<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>我的通告</title>
		<link rel="stylesheet" type="text/css" href="${ctxStatic}/mobile/css/mui.min.css" />
		<link rel="stylesheet" type="text/css" href="${ctxStatic}/mobile/css/Base.css" />
		<link href="${ctxStatic}/common/jeesite.css" type="text/css" rel="stylesheet" />
		<link href="${ctxStatic}/jquery-jbox/2.3/Skins/Bootstrap/jbox.min.css" rel="stylesheet" />
	</head>
	
	<script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>	
	<script src="${ctxStatic}/jquery-jbox/2.3/jquery.jBox-2.3.min.js" type="text/javascript"></script>
	<script src="${ctxStatic}/common/jeesite.js" type="text/javascript"></script>
	<script src="${ctxStatic}/messageBox/messageBox.js" type="text/javascript"></script>
	<script src="${ctxStatic}/mobile/frame_js/mui.min.js"></script>
	
	<style type="text/css">
		.main {
			margin: 10px;
		}
		
		.yongche {
			width: 100%;
			height: 40px;
			padding: 5px 0px;
			box-sizing: border-box;
			line-height: 30px;
		}
		
		.yongche span {
			float: left;
			width: 15%;
			line-height: 30px;
			text-align: center;
		}
		
		.bumen {
			float: left;
			width: 85%;
			height: 35px;
			border: 1px solid #ddd !important;
			margin-bottom: 0px;
			padding: 0px 5px;
			color: #666666;
		}
		
		.yongche input {
			width: 85%;
			height: 35px !important;
			border-radius: 3px;
			color: #666666;
			line-height: 35px;
		}
		
		.yongche h5 {
			color: red;
			line-height: 35px;
			text-align: left;
		}
		
		.fenge {
			width: 100%;
			height: 15px;
			background-color: #f6f6f6;
		}
		
		.button_yn {
			width: 100%;
			height: 45px;
			padding: 10px;
			text-align: center;
		}
		
		.bottom_button {
			float: left;
			width: 20%;
		}
		
		.bottom_button_shanchu {
			padding-left: 15px;
			width: 60%;
			float: left;
			text-align: left;
		}
		

		
		.bottoms span {
			color: #fff;
		}
		
		.tongzhi {
			margin: 0 10px;
		}
		
		.tongzhi_geren_title {
			width: 100%;
			padding-left: 10px;
			height: 30px;
			line-height: 30px;
			background-color: #eee;
		}
		
		.tongzhi_list {
			padding: 10px 0;
			height: 64px;
			/* border-bottom: 1px solid #d4dde4; */
		}
		
		.tongzhi_title {
			clear: both;
		}
		
		.tongzhi_name {
			float: left;
			margin-left: 20px;
			font-size: 1.4rem;
			color: #0062CC;
		}
		
		.tongzhi_time {
			float: right;
			height: 20px;
			line-height: 10px;
			font-size: 1.4rem;
		}
		
		.tongzhi_list_input {
			clear: both;
			margin-right: 5px;
		}
		
		.tongzhi_p {
			overflow: hidden;
			/*自动隐藏文字*/
			text-overflow: ellipsis;
			/*文字隐藏后添加省略号*/
			white-space: nowrap;
			/*强制不换行*/
			width: 22em;
		}
		
		.log-footer {
			width: 100%;
			height: 52px;
			background: #F6F6F6;
			text-align: center;
			padding-top: 10px;
		}
	</style>
	
	<script type="text/javascript">
	$(document).ready(function() 
	{ 
		// 全选 
		$("#allChk").click(function() { 
			$("input[name='subChk']").prop("checked",this.checked); 
		}); 
		// 单选 
		var subChk = $("input[name='subChk']") 
		
		subChk.click(function() { 
			$("#allChk").prop("checked", subChk.length == subChk.filter(":checked").length ? true:false); 
		}); 
		
		/* 批量删除 */ 
		$("#del_model").click(function() 
		{ 
			// 判断是否至少选择一项 
			var checkedNum = $("input[name='subChk']:checked").length; 
			
			if(checkedNum == 0) 
			{ 
				mui.init().alert("至少选择一项","消息",['确定'],null,false);
				
				return; 
			} 
		
		// 批量选择 
			mui.init().confirm("确定要删除所选项目？","消息",['取消','确定'],function(e)
			{
				if (e.index == 1) 
				{
	                 var checkedList = new Array(); 
		        
					$("input[name='subChk']:checked").each(function() { 
						checkedList.push($(this).val()); 
					}); 
					
					$.ajax({ 
						type: "POST", 
						url: "${ctx}/oa/oaNotify/deletemore", 
						data: {'delitems':checkedList.toString()}, 
						success: function(result) 
						{ 
							mui.init().alert("删除成功","消息",['确定'],null,false);
						
							$("[name ='subChk']:checkbox").attr("checked", false); 
							
							window.location.reload(); 
						} 
					});
	            } 
			});
		}); 
		
	});
		 
	$(document).ready(function() 
	{ 
		// 全选 
		$("#allChk").click(function() { 
			$("input[name='subChk']").prop("checked",this.checked); 
		}); 
		// 单选 
		var subChk = $("input[name='subChk']")
		 
		subChk.click(function() { 
			$("#allChk").prop("checked", subChk.length == subChk.filter(":checked").length ? true:false); 
		}); 
		/* 批量收藏 */ 
		$("#store").click(function() 
		{ 
			// 判断是否至少选择一项 
			var checkedNum = $("input[name='subChk']:checked").length; 
			
			if(checkedNum == 0) 
			{ 
				mui.init().alert("至少选择一项","消息",['确定'],null,false);
				return; 
			} 
			// 批量选择 
			mui.init().confirm("确定要收藏所选项目？","消息",['取消','确定'],function(e)
			{
				if (e.index == 1)
				{
					var checkedList1 = new Array(); 
	        	
					$("input[name='subChk']:checked").each(function() 
					{ 
						checkedList1.push($(this).val()); 
					}); 
					
					$.ajax({ 
						type: "POST", 
						url: "${ctx}/oa/oaNotify/store", 
						data: {'delitem':checkedList1.toString()}, 
						success: function(result) 
						{ 
							mui.init().alert("收藏成功！","消息",['确定'],null,false);
							
							$("[name ='subChk']:checkbox").attr("checked", false); 
						
							window.location.reload(); 
						} 
					});
				}
			});
		}); 		
	}); 
	
	
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
        
	</script>
	
	<body>
		<div class="main">
		<form:form id="searchForm" modelAttribute="oaNotify" action="${ctx}/m/oa/oaNotify/self" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
			<div class="yongche">
				<span>标题：</span>
				<form:input path="title" htmlEscape="false" maxlength="200" class="input-medium" autocomplete="off"/>
			</div>
			<%-- <div class="yongche">
				<span>类型：</span>
				<select name="type" class="bumen  riqi_selects">
					<option value=""><span></span></option>
					<option value="1" <c:if test="${oaNotify.type eq '1'}">selected</c:if>><span>会议公告</span></option>
					<option value="2" <c:if test="${oaNotify.type eq '2'}">selected</c:if>><span>奖惩公告</span></option>
					<option value="3" <c:if test="${oaNotify.type eq '3'}">selected</c:if>><span>活动公告</span></option>
					<option value="4" <c:if test="${oaNotify.type eq '4'}">selected</c:if>><span>流程通知</span></option>
					<option value="5" <c:if test="${oaNotify.type eq '5'}">selected</c:if>><span>内部通知</span></option>
				</select>
			</div> --%>

			<div class="button_yn" >
				<button type="submit" data-loading-text="提交中" class=" bottoms btnapp btn-submit  mui-btn  mui-btn-primary"><span>查询</span></button>
				<button id="del_model" type="button" data-loading-text="提交中" class="  bottoms btnapp btn-submit  mui-btn  mui-btn-primary"><span>删除</span></button>
				<button id="store" type="button" data-loading-text="提交中" class=" bottoms btnapp btn-submit  mui-btn  mui-btn-primary"><span>收藏</span></button>
			</div>
		</form:form>
		</div>
		<div class="fenge"></div>

		<div class="tongzhi_geren_title">
			<input type="checkbox" style="margin-right: 10px;" id="allChk"/><span>我的通告</span>

		</div>

		<div class="tongzhi">
			<ul>
				<c:forEach items="${page.list}" var="oaNotify">
				<li class="tongzhi_list">		
					<p><span class="tongzhi_name">
					<c:choose>
					<c:when test="${oaNotify.files=='2'}">
					   <a href="${ctx}/m/oa/cyTspOaMonthlyPlan/personal?commid=${oaNotify.content}&id=${oaNotify.id}">
						 ${fns:abbr(oaNotify.title,50)}
					</a>
					</c:when>
					<c:otherwise>
					<a href="${ctx}/m/oa/oaNotify/${requestScope.oaNotify.self?'view':'form'}?id=${oaNotify.id}">
						${fns:abbr(oaNotify.title,50)}
					</a>
					</c:otherwise>
				</c:choose>
					</span>
					<span class="tongzhi_time">
					<fmt:formatDate value="${oaNotify.updateDate}" pattern="yyyy-MM-dd"/>
					</span></p>
					<p class="tongzhi_title"><input class="tongzhi_list_input" name="subChk" type="checkbox" value="${oaNotify.id}" />
						<span class="tongzhi_p">${fns:getDictLabel(oaNotify.type, 'oa_notify_type', '')}</span>
					</p>
				</li></c:forEach>
			</ul>
			
		</div>
		<div class="log-footer">
			<input type="button" id="leftbt" value="上一页" class="btnapp"
				onclick="page(${page.prev},${page.pageSize})"
				<c:if test="${page.firstPage}">disabled</c:if> /> 
				<input type="button" id="rightbt" value="下一页" class="btnapp"
				onclick="page(${page.next},${page.pageSize})"
				<c:if test="${page.lastPage}">disabled</c:if> />
		</div>
		
		<script type="text/javascript">
			mui.init()

			function liucheng_gz() {
				location.href = "LiuCheng_XieTong.html";
			}
		</script>
	</body>

</html>