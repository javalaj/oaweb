<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>分配角色</title>
	<meta name="decorator" content="blank"/>
	<%@include file="/WEB-INF/views/include/treeview.jsp" %>
	<script type="text/javascript">
	
		var officeTree;
		var selectedTree;//zTree已选择对象
		var userTree;
		
		
		// 初始化
		$(document).ready(function(){
			officeTree = $.fn.zTree.init($("#officeTree"), setting, officeNodes);
			selectedTree = $.fn.zTree.init($("#selectedTree"), setting, selectedNodes);
		});

		var setting = {view: {selectedMulti:false,nameIsHTML:true,showTitle:false,dblClickExpand:false},
				data: {simpleData: {enable: true}},
				callback: {onClick: treeOnClick}};
		
		var officeNodes=[
	            <c:forEach items="${officeList}" var="office">
	            {id:"${office.id}",
	             pId:"${not empty office.parent?office.parent.id:0}", 
	             name:"${office.name}"},
	            </c:forEach>];
	
		var pre_selectedNodes =[
   		        <c:forEach items="${userList}" var="user">
   		        {id:"${user.id}",
   		         pId:"0",
   		         name:"<font color='red' style='font-weight:bold;'>${user.name}</font>"},
   		        </c:forEach>];
		
		var selectedNodes =[
		        <c:forEach items="${userList}" var="user">
		        {id:"${user.id}",
		         pId:"0",
		         name:"<font color='red' style='font-weight:bold;'>${user.name}</font>"},
		        </c:forEach>];
		
		var pre_ids = "${selectIds}".split(",");
		var ids = "${selectIds}".split(",");
		var pre_userNodes=[];
		//点击选择项回调
		function treeOnClick(event, treeId, treeNode, clickFlag){
			$.fn.zTree.getZTreeObj(treeId).expandNode(treeNode);
			if("officeTree"==treeId){
				$.get("${ctx}/sys/role/users?officeId=" + treeNode.id+"&roleId=${role.id}", function(userNodes){
					pre_userNodes=[];
					$.each( userNodes, function(i, n){
						if(!checkIdExistInIdList(ids,n.id)){
							pre_userNodes.push(n);
						}
					});
					userTree=$.fn.zTree.init($("#userTree"), setting, pre_userNodes);
				});
			}
			if("userTree"==treeId){
				if($.inArray(String(treeNode.id), ids)<0){
					selectedTree.addNodes(null, treeNode);
					ids.push(String(treeNode.id));
					userTree.removeNode(treeNode);
				}
			};
			if("selectedTree"==treeId){
				if($.inArray(String(treeNode.id), pre_ids)>0){
					top.$.jBox.tip("角色原有成员不能清除！", 'info');
				}else{
					selectedTree.removeNode(treeNode);
					ids.splice($.inArray(String(treeNode.id), ids), 1);
					userTree.addNodes(null, treeNode);
				}
			}
		};
		function clearAssign(){
			var submit = function (v, h, f) {
			    if (v == 'ok'){
					var tips="";
					if(pre_ids.sort().toString() == ids.sort().toString()){
						tips = "未给角色【${role.name}】分配新成员！";
					}else{
						tips = "已选人员清除成功！";
					}
					//筛选出备选人员ID数组（ids）与缓存人员ID数组（pre_ids）的人员ID差集放到一个零时数组（tempArray）中去
					var tempArray=[];
					$.each( ids, function(i, n){
						if(!checkIdExistInIdList(pre_ids,n)){
							tempArray.push(n);
						}
					});
					//将备选树（selectedTree）中为零时数组ID的节点加入到当前选择树（userTree）中去
					var treeObj =$.fn.zTree.getZTreeObj("selectedTree");
					var nodes =treeObj.getNodes();
					$.each( nodes, function(i, n){
						if(checkIdExistInIdList(tempArray,n.id)){
							var obj =$.fn.zTree.getZTreeObj("userTree");
							obj.addNodes(null, n);
						}
					});
					//重置备选树（selectedTree）
					ids=pre_ids.slice(0);
					selectedNodes=pre_selectedNodes;
					$.fn.zTree.init($("#selectedTree"), setting, selectedNodes);
			    	top.$.jBox.tip(tips, 'info');
			    } else if (v == 'cancel'){
			    	// 取消
			    	top.$.jBox.tip("取消清除操作！", 'info');
			    }
			    return true;
			};
			tips="确定清除角色【${role.name}】下的已选人员？";
			top.$.jBox.confirm(tips, "清除确认", submit);
		};
		
		function checkIdExistInIdList(array,o) {
			var result=false;
			$.each( array, function(i, n){
				if(n==o){
					result=true;
				}
			});
			return result;
		}
	</script>
</head>
<body>
	<div id="assignRole" class="row wrapper wrapper-content">
		<div class="col-sm-4" style="border-right: 1px solid #A8A8A8;">
			<p>所在部门：</p>
			<div id="officeTree" class="ztree"></div>
		</div>
		<div class="col-sm-4">
			<p>待选人员：</p>
			<div id="userTree" class="ztree"></div>
		</div>
		<div class="col-sm-4" style="padding-left:16px;border-left: 1px solid #A8A8A8;">
			<p>已选人员：</p>
			<div id="selectedTree" class="ztree"></div>
		</div>
	</div>
	<div id="test" class="row-fluid span12">
	</div>
</body>
</html>
