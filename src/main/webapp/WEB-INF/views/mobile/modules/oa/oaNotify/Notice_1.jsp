<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
		<meta charset="UTF-8">
		<title>通知中心</title>
		<meta name="decorator" content="default"/>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link href="${ctxStatic}/mobile/frame_css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="${ctxStatic}/mobile/css/Base.css" />
		<link href="${ctxStatic}/common/jeesite.css" type="text/css"rel="stylesheet" />
		<link href="${ctxStatic}/jquery-jbox/2.3/Skins/Bootstrap/jbox.min.css" rel="stylesheet" />
		<script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>	
	<script src="${ctxStatic}/jquery-jbox/2.3/jquery.jBox-2.3.min.js" type="text/javascript"></script>
	<script src="${ctxStatic}/common/jeesite.js" type="text/javascript"></script>
	<script src="${ctxStatic}/messageBox/messageBox.js" type="text/javascript"></script>
	<script src="${ctxStatic}/mobile/frame_js/mui.min.js"></script>
    <style type="text/css">
    	a[class='mui-icon']{
    		margin-top:4px;
    	}
        .main {
            margin: 10px;
        }
        .log-footer{
            text-align:center;
            margin-top:3px;
            margin-bottom:3px;
        }
        .divheader {
            width: 100%;
            overflow: hidden;
            box-sizing: border-box;
            background: #f4f7f6;
            height: 50px;
        }

        .divheader>div {
            margin: 0px;
            padding: 0px;
            position: relative;
        }

        .divheader>div>.mui-icon{
            position: absolute;
            top:13px;
            right: 12px;
            color: #fff;
        }

        .top .mui-icon-arrowdown {
            transition: .5s all;
        }

        .trans-rota{
            transform: rotate(180deg);
            -ms-transform: rotate(180deg);
            -moz-transform: rotate(180deg);
            -wekit-transform: rotate(180deg);
            -o-transform: rotate(180deg);
        }


        .adiv {
            width: 100%;
            height: 32px;
            border-radius: 5px;
            border: 1px solid #CCCCCC;
            text-align: center;
            background: white;
        }

        .thisadiv {
            width: 100%;
            height: 50px;
            border-radius: 4px;
            border: 1px solid #32A5E7;
            text-align: center;
            background: #32A5E7;
        }

        a>div>span {
            height: 32px;
            line-height: 50px;
            text-align: center;
            font-size: 1.5rem;
            font-family: "微软雅黑";
            color: #333333;
        }
        .thisadiv>span {
            height: 32px;
            font-size: 1.5rem;
            font-family: "微软雅黑";
            color: #FFFFFF;
        }

        .header-title{
            height: 50px;
        }

        .header-title h1{
            line-height: 50px;
        }

        .yongche {
            width: 98%;
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

        .button_yn {
            width: 100%;
            height: 45px;
            padding: 10px;
        }

        .bottom_button {
            float: left;
            width: 40%;
            text-align: right;
        }

        .bottom_button_shanchu {
            width: 50%;
            float: right;
            text-align: left;
        }

        .bottoms span {
            color: #fff;
        }

        .tongzhi {
            margin: 0 10px;
        }

        .tongzhi_geren_title {
        	display:table;
        	padding:8px 0;
            width: 100%;
            padding-left: 10px;
            height: 30px;
            line-height: 30px;
            background-color: #eee;
        }
        
        .tongzhi_geren_title span{
        	font-size:14px;
        	margin-left:7px;
        }

        .tongzhi_list {
            padding: 15px 0;
            height: 50px;
            border-bottom: 1px solid #d4dde4;
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
            line-height: 14px;
            font-size: 1.4rem;
        }

        .tongzhi_list_input {
            float: left;
            height: 20px;
        }

        .tongzhi_p {
            text-align: center;
            float: left;
            overflow: hidden;
            /*自动隐藏文字*/
            text-overflow: ellipsis;
            /*文字隐藏后添加省略号*/
            white-space: nowrap;
            /*强制不换行*/
            width: 20em;
        }

        .yincang{
            display: none;
        }

        .mask{
            display: none;
            position: absolute;
            width: 100%;
            height: 100%;
            filter:alpha(opacity=60);
            background-color: #777;
            z-index: 998;
            opacity: .6;
            -ms-opacity: .6;
            -moz-opacity: .6;
            -wekit-opacity: .6;
            -o-opacity: .6;
        }
        .log-footer{
        	margin-top:10px;
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
		/*表单验证*/
        $("#send").click(function(){

            if($("#tit").val()!=null&&$("#tit").val()!=""){
              if($("#content").val()!=null&&$("#content").val()!=""){
                  $("#inputForm").submit();

			  }else{
                  mui.init().alert("内容不能为空","提示",['确定'],null,false);
			  }
			}else{
                mui.init().alert("标题不能为空","提示",['确定'],null,false);
			}

		})

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
				mui.init().alert("至少选择一项","提示",['确定'],null,false);
				return; 
			} 
			// 批量选择 
			mui.init().confirm("确定要收藏所选项目？","提示",['取消','确定'],function(e)
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
        //下拉显示查询
        //遮罩层
        $(document).ready(function(){
            var onOff=true;
            $('.main').hide();
            $('#down').click(function(){
                if(onOff){
                    $('.main').show({direction: "up" }, 500);
                    $('#down').addClass('trans-rota');
                    $('#mask').fadeIn();
                }else{
                    $('.main').hide({direction: "up" }, 500);
                    $('#down').removeClass('trans-rota');
                    $('#mask').fadeOut();
                }
                onOff=!onOff;
            });
        }); 
	</script>
</head>
<body>
<div class="divheader">
    <div class="top" align="center" >
        <header class="mui-bar mui-bar-nav header-title">
        	<!-- <a class=" mui-icon mui-icon-left-nav mui-pull-left" id="fanhui" style="display:none;" onclick="change1()"></a> -->
          <a class="mui-icon mui-icon-left-nav mui-pull-left" onclick="location.href='${ctx}'"></a>
            <h1 class="mui-title">通知中心</h1>
            <shiro:hasPermission name="oa:oaNotify:edit">
            <a class="mui-icon mui-icon-plus mui-pull-right" onclick="change2()" id="addNotice"></a>
            </shiro:hasPermission>
        </header>
    </div>

</div>

<div class="tonzhi _zhongxin"  id="zhixin">
    <div class="main">
        <form:form id="searchForm" modelAttribute="oaNotify" action="${ctx}/m/oa/oaNotify" method="post" class="breadcrumb form-search">
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
                </select>
            </div> --%>

            <div class="button_yn">
                <div class="bottom_button"><button type="submit" data-loading-text="查询中" class=" bottoms btnapp btn-submit  mui-btn  mui-btn-primary"><span>查询</span></button></div>
                <div class="bottom_button_shanchu"><button id="del_model" type="button" data-loading-text="提交中" class="bottoms btnapp btn-submit  mui-btn  mui-btn-primary" style="margin-left:43px;"><span>删除</span></button></div>
            </div>
        </form:form>
    </div>

    <div class="mask" id="mask"></div>

    <div class="fenge"></div>
    <div class="tongzhi_geren_title">
    <shiro:hasPermission name="oa:oaNotify:edit">
        <input type="checkbox" style="margin-right: 10px;" id="allChk"/><c:if test="${!oaNotify.self}"><span>我发布的通告</span></c:if><c:if test="${oaNotify.self}"><span>我的通告</span></c:if>
	</shiro:hasPermission>
    </div>

    <div class="tongzhi">
        <ul>
            <c:forEach items="${page.list}" var="oaNotify">
                <li class="tongzhi_list">
                <input class="tongzhi_list_input" name="subChk" type="checkbox" value="${oaNotify.id}" />
                        <span class="tongzhi_p"><%-- ${fns:getDictLabel(oaNotify.type, 'oa_notify_type', '')} --%></span>
                    <p><span class="tongzhi_name">
					<c:choose>
                        <c:when test="${oaNotify.files=='2'}">
                            <a href="${ctx}/m/oa/cyTspOaMonthlyPlan/personal?commid=${oaNotify.content}&id=${oaNotify.id}">
                                ${fns:abbr(oaNotify.title,30)}
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a href="${ctx}/m/oa/oaNotify/${requestScope.oaNotify.self?'view':'form'}?id=${oaNotify.id}">
                                ${fns:abbr(oaNotify.title,30)}
                            </a>
                        </c:otherwise>
                    </c:choose>
					</span>
					<span class="tongzhi_time">
					<fmt:formatDate value="${oaNotify.updateDate}" pattern="yyyy-MM-dd"/>
					</span></p>
                </li></c:forEach>
        </ul>

    </div>
   <%--  <div class="log-footer">
        <input type="button" id="leftbt" value="上一页" class="btnapp"
               onclick="page(${page.prev},${page.pageSize})"
        <c:if test="${page.firstPage}">disabled</c:if> />&nbsp;&nbsp;
        <input type="button" id="rightbt" value="下一页" class="btnapp"
               onclick="page(${page.next},${page.pageSize})"
        <c:if test="${page.lastPage}">disabled</c:if> />
    </div> --%>
    <table:pageMobile page="${page}" showPageOne="false"></table:pageMobile>
</div>


<div class="fabu_tongzhi" id="fabu" style="display:none;">
    <form:form id="inputForm" modelAttribute="oaNotify" action="${ctx}/m/oa/oaNotify/save" method="post" class="form-horizontal">
        <form:hidden path="id" />
        <input name="type" value="5" type="hidden">
        <%-- <div class="yongche">
            <span >类型:</span>
            <select name="type" id="type" class="bumen  riqi_selects" >
                <option value="1" <c:if test="${oaNotify.type eq '1'}">selected</c:if>><span>会议公告</span></option>
                <option value="2" <c:if test="${oaNotify.type eq '2'}">selected</c:if>><span>奖惩公告</span></option>
                <option value="3" <c:if test="${oaNotify.type eq '3'}">selected</c:if>><span>活动公告</span></option>
                <option value="4" <c:if test="${oaNotify.type eq '4'}">selected</c:if>><span>流程通知</span></option>
            </select>
        </div> --%>
        <div class="yongche">
            <span>标题:</span>
            <input  style="border:1px solid red;" name="title"  id="tit" maxlength="20" class="input-medium" autocomplete="off" placeholder="请输入标题"/>
        </div>  
        <div class="yongche">
            <span>内容:</span>
            <textarea  rows="14"  name="content" placeholder="请输入内容" id="content" style="overflow: auto;width: 85%;border: 1px solid red;"></textarea>
            <sys:ckeditor replace="content" uploadPath="/oa/notify" />
            <input type="hidden" id="files" name="files" value=""/>
             <div class="yongche">
            <span>类型:</span>
           <form:select path="type"  id="type" style="width:10%;border:1px solid red;">
						<form:option value="" label="" />
						<form:options items="${fns:getDictList('oa_notify_type')}"
							itemLabel="label" itemValue="value" htmlEscape="false" />
					</form:select>
        </div>
        <div class="yongche">
				<span>状态</span>
	        
						<form:select path="status">
							<form:option value="" label="全部"/>
							<form:options items="${fns:getDictList('oa_notify_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
					<span class="help-inline"><font color="red">*发布后不能修改</font> </span>
			</div> 
        <div class="yongche">
            <span>接收人:</span>	<sys:treeselect id="oaNotifyRecord" name="oaNotifyRecordIds"
						value="${oaNotify.oaNotifyRecordIds}"
						labelName="oaNotifyRecordNames"
						labelValue="${oaNotify.oaNotifyRecordNames}" title="接收人"
						url="/sys/office/treeData?type=3" 					
						checked="true" allowClear="true"  style="border:1px solid red;"/>         
        </div> 
            <div  style="text-align:center;margin-top:10px;margin-bottom:10px;">
                <button type="button" data-loading-text="提交中"id="send"  class="bottoms btnapp btn-submit  mui-btn  mui-btn-primary" ><span>发布</span></button>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <button onClick="history.go(-1)" type="button"  class="bottoms btnapp btn-submit  mui-btn  mui-btn-primary "><span>取消</span></button>
                <%--<button onclick="history.go(-1)" type="button" data-loading-text="提交中" class="bottoms btnapp btn-submit  mui-btn  mui-btn-primary" onclick="location.href='${ctx}/m/oa/oaNotify/save?status=0'"><span>草稿</span></button>	--%>
            </div></div>




    </form:form>

</div>

<%-- <script src="${ctxStatic}/mobile/frame_js/mui.min.js"></script> --%>
<script type="text/javascript">

    window.onload = function() {
        //设置第一个的a背景为蓝色
        /* document.getElementById("asynergy").setAttribute("class", "thisadiv"); */
    }
    /*我的通告*/
    function change1() {
        /* document.getElementById("asynergy").setAttribute("class", "thisadiv");
        document.getElementById("ainfrom").setAttribute("class", "adiv"); */
        document.getElementById("zhixin").setAttribute("class", "");
        document.getElementById("fabu").setAttribute("class", "yincang");
        $('#fabu').css("display","none");
        $('#fanhui').css("display","none");
        $('#fanhuizhen').css("display","block");
        document.getElementById("down").setAttribute("class", "mui-icon mui-icon-arrowdown mui-pull-left");
        document.getElementById("addNotice").setAttribute("class", "mui-icon mui-icon-plus mui-pull-right");
    }
    /*发布通告*/
    function change2() {
        /* document.getElementById("asynergy").setAttribute("class", "adiv");
        document.getElementById("ainfrom").setAttribute("class", "thisadiv"); */
        $('#fabu').css("display","block");
        document.getElementById("zhixin").setAttribute("class", "yincang");
        document.getElementById("fabu").setAttribute("class", "");
        document.getElementById("down").setAttribute("class", "yincang");
        document.getElementById("addNotice").setAttribute("class", "yincang");
        $('#fanhui').css("display","block");
        $('#fanhuizhen').css("display","none");
    }
</script>
<script src="${ctxStatic}/mobile/js/mui.min.js"></script>
	    <script src="${ctxStatic}/mobile/js/mobile.js"></script>
		<jsp:include page="/WEB-INF/views/mobile/modules/sys/foot.jsp"></jsp:include>
	
</body>
</html>