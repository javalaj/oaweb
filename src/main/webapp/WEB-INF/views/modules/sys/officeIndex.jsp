<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>机构管理</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treeview.jsp" %>
	<script type="text/javascript">
		function refresh(){//刷新
			
			window.location="${ctx}/sys/office/";
		}
	</script>
</head>
<body class="gray-bg">
	
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<div class="ibox-title">
				<h5>组织架构管理</h5>
			</div>
			<div class="ibox-content" style="padding: 10px;">
				<sys:message content="${message}"/>
				<div id="content" style="overflow:hidden;">
					<div id="left" style="overflow:auto;float:left;margin-right: 10px;">
						<a onclick="refresh()" class="pull-right">
							<i class="fa fa-refresh"></i>
						</a>
						<div id="ztree" class="ztree leftBox-content" style="padding: 0;"></div>
					</div>
					<div id="right" class="animated fadeInRight" style="float:left;">
						<iframe id="officeContent" name="officeContent" src="${ctx}/sys/office/list?id=&parentIds=" width="100%" height="91%" frameborder="0"></iframe>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var setting = {data:{simpleData:{enable:true,idKey:"id",pIdKey:"pId",rootPId:'0'}},
			callback:{onClick:function(event, treeId, treeNode){
					var id=treeNode.id;
					$('#officeContent').attr("src","${ctx}/sys/office/list?id="+id+"&parentIds="+treeNode.pIds);
				}
			}
		};
		
		function refreshTree(){
			$.getJSON("${ctx}/sys/office/treeData",function(data){
				$.each(data,function(i,treeNode){//自定义父节点图标
					if(treeNode.pId=='1'){
						treeNode.icon="${ctxStatic}/jquery-ztree/3.5.12/css/zTreeStyle/img/diy/1_close.png";
						treeNode.iconOpen="${ctxStatic}/jquery-ztree/3.5.12/css/zTreeStyle/img/diy/1_open.png";
						treeNode.iconClose="${ctxStatic}/jquery-ztree/3.5.12/css/zTreeStyle/img/diy/1_close.png";
					}
					
				});

				$.fn.zTree.init($("#ztree"), setting, data).expandAll(true);
			});
		}
		refreshTree();
		 
		var leftWidth = 180; // 左侧窗口大小
		var htmlObj = $("html"), mainObj = $("#main");
		var frameObj = $("#left, #openClose, #right, #right iframe");
		function wSize(){
			var strs = getWindowSize().toString().split(",");
			htmlObj.css({"overflow-x":"hidden", "overflow-y":"hidden"});
			mainObj.css("width","auto");
			frameObj.height(strs[0] - 130);
			var leftWidth = ($("#left").width() < 0 ? 0 : $("#left").width());
			$("#right").width($("#content").width()- leftWidth - $("#openClose").width()-12);
			$(".ztree").width(leftWidth - 10).height(frameObj.height() - 46);
		}
	</script>
	<script src="${ctxStatic}/common/wsize.min.js" type="text/javascript"></script>
</body>
</html>