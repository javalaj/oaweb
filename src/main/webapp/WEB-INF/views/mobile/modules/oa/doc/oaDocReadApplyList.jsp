<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>文档借阅申请处理</title>
	<meta name="decorator" content="default"/>
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no" />
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/mobile/css/mui.min.css" />
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/mobile/oa/css/oaDoc.css" />
	<script src="${ctxStatic}/mobile/js/mui.min.js"></script>
	<script>
		mui.init({
			swipeBack:true //启用右滑关闭功能
		});
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			//全选
			$("#allChk").change(function(){
				$("input[name='subChk']").prop("checked",this.checked); //如果点击全选按钮就全选
			});
			
			var subChk=$("input[name='subChk']");
			subChk.change(function(){
				if(subChk.filter(":checked").length >=subChk.length ){
					$("#allChk").attr("checked","checked");
				}else{
					$("#allChk").removeAttr("checked");
				}
			});
			
		});
		function todo(changTolendStatus){
			
			//判断是否至少选择一项
			var checkedNum = $("input[name='subChk']:checked").length;
			if(checkedNum <= 0){
				top.layer.msg("请至少选择一项！");
				return;
			}

			var checkedList = new Array();
			$("input[name='subChk']:checked").each(function(){
				checkedList.push($(this).val());
			});
			$.ajax({
				type:"POST",
				url:"${mctx}/oa/doc/oaDocReadApply/updateLendStatusBatch", 
				data:{"items":checkedList.toString(),"changTolendStatus":changTolendStatus},  //获取选择的集合
				dataType: 'json',
				success:function(data){  
					window.location.reload();              
				}
			});	
			
			//window.location.href = "${ctx}/oa/doc/oaDocReadApply/updateLendStatus?doc.id=${oaDocReadApply.doc.id}"+"&doc.title="+encodeURIComponent('${oaDocReadApply.doc.title}')+"&lendStatus=0"+"&changTolendStatus="+changTolendStatus+"&oaDocReadApplyId="+oaDocReadApplyId;
		}
		
	</script>
</head>
<body class="mui-ios mui-ios-9 mui-ios-9-1" style="background-color: #f7f7f7;">
 	<header class="mui-bar mui-bar-nav" style="position: fixed; top: 0px; left: 0; z-index: 9999;">
		<a class="mui-icon mui-icon-left-nav mui-pull-left" onclick="location.href='${mctx}/oa/doc/oaDoc/'"></a>
		<h1 class="mui-title">文档借阅申请处理</h1>
	</header>
	<oam:message content="${message}"/>
	<div class="mui-content" style="background-color: #f7f7f7;">
		<form:form id="searchForm" modelAttribute="oaDocReadApply" action="${mctx}/oa/doc/oaDocReadApply/" method="post" class="form-inline">
			<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
			<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		</form:form>
		<ul class="mui-table-view">
			<c:choose>
				<c:when test="${page.list.size()>0}">
					<li class="mui-table-view-cell">
						<div class="mui-button-row">
							<button type="button" class="mui-btn mui-btn-primary" onclick="todo(1)"><i class="fa "></i>同意</button>
							<button type="button" class="mui-btn mui-btn-danger" onclick="todo(2)"><i class="fa "></i>不同意</button>
						</div>
					</li>
					<li class="mui-table-view-cell mui-checkbox mui-left">
						<span style="color:#1a81d1">
							全选
						</span>
						<input name="checkbox" type="checkbox" id="allChk">
					</li>
					<c:forEach items="${page.list}" var="oaDocReadApply" varStatus="status">
						<li class="mui-table-view-cell mui-checkbox mui-left">
							<span style="color:#1a81d1">
								${oaDocReadApply.lendUser.name}
							</span>
							<p class="mui-pull-right">
								<fmt:formatDate value="${oaDocReadApply.createDate}" pattern="yyyy.MM.dd"/>
							</p>
							<p class="mui-ellipsis">${oaDocReadApply.doc.title}</p>
							<input name="subChk" type="checkbox" value="${oaDocReadApply.id}">
						</li>
					</c:forEach>				
				</c:when>
				<c:otherwise>
					<li class="mui-table-view-cell">
						<p class="mui-ellipsis">当前没有需要处理的阅读申请</p>
					</li>
				</c:otherwise>
			</c:choose>			
		</ul>
		<table:pageMobile page="${page}" showPageOne="false"></table:pageMobile>
	</div>
</body>
</html>