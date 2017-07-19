<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>公司通讯录</title>
	<meta name="decorator" content="default"/>
	<link href="${ctxStatic}/jquery-ztree/3.5.12/css/zTreeStyle/metro.css" rel="stylesheet" type="text/css"/>
	<script src="${ctxStatic}/jquery-ztree/3.5.12/js/jquery.ztree.all-3.5.min.js" type="text/javascript"></script>
	<style type="text/css">
		.ztree {overflow:auto;margin:0;_margin-top:10px;padding:10px 0 0 10px;}
		.ztree li a.curSelectedNode {
		    padding-top: 0px;
		    background-color: #93a4b5;
		    height: 21px;
		    opacity: 0.8;
		    color: white;
		    text-decoration: none;
		}
		.ztree li a:link,a:visited,a:hover {
		     text-decoration:none !important;
		}
	</style>
	<script type="text/javascript">
		function refresh(){//刷新
			window.location="${ctx}/oa/user/index";
		}
		$(document).ready(function() {
			uiResize();
		});
		$(window).resize(function(){
			uiResize();
		});
		function uiResize() {
			//边框的高度,系数可调
			$("#mainIbox").height($(window).height()-45);
			//内容的高度,系数不可调
			$("#mainContent").height($("#mainIbox").height()-62);
		}
	</script>
</head>
<body style="padding: 0px"  class="gray-bg">
	<div class="wrapper wrapper-content">
		<div id="mainIbox" class="ibox" style="margin-bottom: 0px">
			<div class="ibox-title">
				<h5>公司通讯录</h5>
				<div class="ibox-tools">
				</div>
			</div>
			<div id="mainContent" class="ibox-content" style="padding: 0px 10px 20px 10px;">
				<div id="content" style="height:100%;">
					<div id="left"  style="width:15%;height:100%;float:left;overflow:auto">
						<a onclick="refresh()" class="pull-right">
							<i class="fa fa-refresh"></i>
						</a>
						<div id="ztree" class="ztree" style="overflow: visible;"></div>
					</div>
					<div id="right" style="width:85%;height:100%;float:right;" >
						<iframe id="officeContent" name="officeContent" src="${ctx}/oa/user/list" width="100%" height="100%" frameborder="0"></iframe>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var setting = {
			data:{simpleData:{enable:true,idKey:"id",pIdKey:"pId",rootPId:'0'}},
			callback:{
				onClick:function(event, treeId, treeNode){
					var id = treeNode.id == '0' ? '' :treeNode.id;
					$('#officeContent').attr("src","${ctx}/oa/user/list?office.id="+id);
				}
			}
		};
		function refreshTree(){
			$.getJSON("${ctx}/sys/office/treeData",function(data){
				$.fn.zTree.init($("#ztree"), setting, data).expandAll(true);
			});
		}
		refreshTree();
	</script>
</body>
</html>
