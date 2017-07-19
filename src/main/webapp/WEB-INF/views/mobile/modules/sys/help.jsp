<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta name="decorator" content="default"/>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no" />
    <title>帮助</title>
    <link rel="stylesheet" href="${ctxStatic}/mobile/css/mui.css" />
    <link rel="stylesheet" href="${ctxStatic}/mobile/css/oabase.css" />
   <style type="text/css">
   		.fankui{
   			margin:10px;
   		}
   </style>
</head>
	<body class="setting">
		<header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">帮助</h1>
		</header>
		
		<div class="mui-content">
			<!--  <div class="msg-header">
				<div id="msgtab" class="mui-segmented-control mui-segmented-control-primary">
					<a class="mui-control-item mui-active" id="helpid">帮助</a>
					<a class="mui-control-item " id="feedbackid">反馈</a>					
				</div>-->
			</div>
			
		    <div class="xin-main" id="help">
				<ul class="mui-table-view flow-tem">
					<li class="mui-table-view-cell"><a
						href="${ctx}/m/sys/user/helpdetail?num=1"
						class="mui-navigate-right">OA移动端可以提交哪些审批流程？</a></li>
					<li class="mui-table-view-cell">
					<a href="${ctx}/m/sys/user/helpdetail?num=2" class="mui-navigate-right">如何查看需要我处理的事项？</a>
					</li>
					<li class="mui-table-view-cell"><a href="${ctx}/m/sys/user/helpdetail?num=3"
						class="mui-navigate-right">如何查看我办理过的事项？</a></li>
					<li class="mui-table-view-cell"><a
						href="${ctx}/m/sys/user/helpdetail?num=4" class="mui-navigate-right">如何上传、共享文档？</a>
					</li>
					<li class="mui-table-view-cell"><a
						href="${ctx}/m/sys/user/helpdetail?num=5" class="mui-navigate-right">公司通讯录和个人通讯录、共享通讯录的区别？</a>
					</li>
					<li class="mui-table-view-cell"><a
						href="${ctx}/m/sys/user/helpdetail?num=6"
						class="mui-navigate-right">如何查看本部门同事当日的出勤情况？</a></li>			
				</ul>
			</div>
			
			<div class="fankui" id="feedback"  style="display: none;">
				<form action="${ctx}/m/sys/user/save" method="post">
					<div class="feedback-opinion">
						<span>意见类别：</span>
						<select name="type">
							<option value="0">漏洞提交</option>
							<option value="1">新功能建议</option>
						</select>
					</div>
					<input type="text" value="" name="title" placeholder="请输入标题" required="required"/>
					<textarea rows="8" name="opinion" required="required" placeholder="请输入意见内容"></textarea>
					<div class="bottom-button">
						<button type="submit" data-loading-text="提交中" class="btnapp btn-submit">提交
						</button>
					</div>
				</form>
			</div>
		</div>
	    <script src="${ctxStatic}/mobile/js/mui.min.js"></script>
	    <script src="${ctxStatic}/mobile/js/mobile.js"></script>
	
	<script type="text/javascript">
	$(document).ready(function() {
		   mui.init();
	   document.getElementById('helpid').addEventListener('tap',function(){  
	    //点击响应逻辑  
		   help();
	   });  
	   document.getElementById('feedbackid').addEventListener('tap',function(){  
		    //点击响应逻辑  
			   feedback();
		   });
		/* function help(){
    		document.getElementById("feedback").style.display="none";
    		document.getElementById("help").style.display="block";
    	}
    	function feedback(){
    		document.getElementById("feedback").style.display="block";
    		document.getElementById("help").style.display="none";
    	} */
	    
	});
	
	
	
	</script>
	</body>
</html>