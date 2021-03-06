<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用户管理</title>
	<meta name="decorator" content="default"/>
	<link href="${ctxStatic}/jquery-ztree/3.5.12/css/zTreeStyle/metro.css" rel="stylesheet" type="text/css"/>
<script src="${ctxStatic}/jquery-ztree/3.5.12/js/jquery.ztree.all-3.5.min.js" type="text/javascript"></script>
	<style type="text/css">
		.ztree {overflow:auto;margin:0;_margin-top:10px;padding:0;}
	</style>
	<script type="text/javascript">
		function refresh(){//刷新
			
			window.location="${ctx}/sys/user/userIndex";
		}
	</script>

</head>
<body id="" class="gray-bg"  style="">		
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<div class="ibox-title">
				<h5>人员管理</h5>
			</div>
			<div class="ibox-content" style="padding: 10px;">
			
			<!-- 0:隐藏tip, 1隐藏box,不设置显示全部 -->
			<script type="text/javascript">top.$.jBox.closeTip();</script>

				<div id="content" style="overflow:hidden;">
					<div id="left" class="leftBox" style="overflow:auto;float:left;margin-right: 10px;" >
						<a onclick="refresh()" class="pull-right">
							<i class="fa fa-refresh"></i>
						</a>
						<div id="ztree" class="ztree leftBox-content"></div>
					</div>
					<div id="right"  class="animated fadeInRight" style="float: left;">
						<iframe id="officeContent" name="officeContent" src="${ctx}/sys/user/list" width="100%" height="91%" frameborder="0"></iframe>
					</div>
				</div>
			</div>
		</div>
	</div>	
	<script type="text/javascript">
		var setting = {data:{simpleData:{enable:true,idKey:"id",pIdKey:"pId",rootPId:'0'}},
			callback:{onClick:function(event, treeId, treeNode){
					var id = treeNode.id == '0' ? '' :treeNode.id;
					$('#officeContent').attr("src","${ctx}/sys/user/list?office.id="+id);
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
			$("#right").width($("#content").width()- leftWidth - $("#openClose").width() -12);
			$(".ztree").width(leftWidth - 10).height(frameObj.height() - 46);
		}
	</script>
	<script src="${ctxStatic}/common/wsize.min.js" type="text/javascript"></script>

	<script type="text/javascript">//<!-- 无框架时，左上角显示菜单图标按钮。
		if(!(self.frameElement && self.frameElement.tagName=="IFRAME")){
			$("body").prepend("<i id=\"btnMenu\" class=\"icon-th-list\" style=\"cursor:pointer;float:right;margin:10px;\"></i><div id=\"menuContent\"></div>");
			$("#btnMenu").click(function(){

				top.layer.open({
				    type: 2, 
				    area:['300px','350px'],
				    content: 'get:${ctx}/sys/menu/treeselect;JSESSIONID=09423fd44bb3449f89d0499b87310904' //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
				});
				//top.$.jBox('get:${ctx}/sys/menu/treeselect;JSESSIONID=09423fd44bb3449f89d0499b87310904', {title:'选择菜单', buttons:{'关闭':true}, width:300, height: 350, top:10});
				//if ($("#menuContent").html()==""){$.get("${ctx}/sys/menu/treeselect", function(data){$("#menuContent").html(data);});}else{$("#menuContent").toggle(100);}
			});
		}//-->
	</script>
</body>
</html>
