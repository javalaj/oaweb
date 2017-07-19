<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="id" type="java.lang.String" required="true" description="编号"%>
<%@ attribute name="name" type="java.lang.String" required="true" description="隐藏域名称（ID）"%>
<%@ attribute name="value" type="java.lang.String" required="true" description="隐藏域值（ID）"%>
<%@ attribute name="labelName" type="java.lang.String" required="true" description="输入框名称（Name）"%>
<%@ attribute name="labelValue" type="java.lang.String" required="true" description="输入框值（Name）"%>
<%@ attribute name="title" type="java.lang.String" required="true" description="选择框标题"%>
<%@ attribute name="url" type="java.lang.String" required="true" description="树结构数据地址"%>
<%@ attribute name="checked" type="java.lang.Boolean" required="false" description="是否显示复选框，如果不需要返回父节点，请设置notAllowSelectParent为true"%>
<%@ attribute name="extId" type="java.lang.String" required="false" description="排除掉的编号（不能选择的编号）"%>
<%@ attribute name="isAll" type="java.lang.Boolean" required="false" description="是否列出全部数据，设置true则不进行数据权限过滤（目前仅对Office有效）"%>
<%@ attribute name="notAllowSelectRoot" type="java.lang.Boolean" required="false" description="不允许选择根节点"%>
<%@ attribute name="notAllowSelectParent" type="java.lang.Boolean" required="false" description="不允许选择父节点"%>
<%@ attribute name="module" type="java.lang.String" required="false" description="过滤栏目模型（只显示指定模型，仅针对CMS的Category树）"%>
<%@ attribute name="selectScopeModule" type="java.lang.Boolean" required="false" description="选择范围内的模型（控制不能选择公共模型，不能选择本栏目外的模型）（仅针对CMS的Category树）"%>
<%@ attribute name="allowClear" type="java.lang.Boolean" required="false" description="是否允许清除"%>
<%@ attribute name="allowInput" type="java.lang.Boolean" required="false" description="文本框可填写"%>
<%@ attribute name="cssClass" type="java.lang.String" required="false" description="css样式"%>
<%@ attribute name="cssStyle" type="java.lang.String" required="false" description="css样式"%>
<%@ attribute name="smallBtn" type="java.lang.Boolean" required="false" description="缩小按钮显示"%>
<%@ attribute name="hideBtn" type="java.lang.Boolean" required="false" description="是否显示按钮"%>
<%@ attribute name="disabled" type="java.lang.String" required="false" description="是否限制选择，如果限制，设置为disabled"%>
<%@ attribute name="dataMsgRequired" type="java.lang.String" required="false" description=""%>
<%@ attribute name="width" type="java.lang.String" required="false" description=""%>
<%@ attribute name="height" type="java.lang.String" required="false" description=""%>
	<input id="${id}Id" name="${name}" class="${cssClass}" type="hidden" value="${value}"/>
	<input id="${id}Name" name="${labelName}" ${allowInput?'':'readonly="readonly"'}  type="text" value="${labelValue}" data-msg-required="${dataMsgRequired}"
		class="${cssClass}" style="max-width: 240px;border-radius: 4px;background:#fff url(${ctxStatic }/common/img/search.png) no-repeat right;background-size:20px auto;${cssStyle}"/>
       		<%-- <span class="input-group-btn" style="position: absolute;left: 100%;top: 0;">
	       		 <button type="button"  id="${id}Button" class="btn <c:if test="${fn:contains(cssClass, 'input-sm')}"> btn-sm </c:if><c:if test="${fn:contains(cssClass, 'input-lg')}"> btn-lg </c:if>  btn-primary ${disabled} ${hideBtn ? 'hide' : ''}"><i class="fa fa-search"></i>
	             </button> 
       		 </span> --%>
<script type="text/javascript">
	$("#${id}Button, #${id}Name").click(function(){
		// 是否限制选择，如果限制，设置为disabled
		if ($("#${id}Button").hasClass("disabled")){
			return true;
		}
		
		// 正常打开	
		top.layer.open({
		    type: 2, 
		    area: ["${empty width?'300px':width}", "${empty height?'420px':height}"],
		    title:"选择${title}",
		    ajaxData:{selectIds: $("#${id}Id").val()},
		    content: "${ctx}/tag/treeselect?url="+encodeURIComponent("${url}")+"&module=${module}&checked=${checked}&extId=${extId}&isAll=${isAll}" ,
		    btn: ['确定', '${allowClear}'=='true'?'清除':'关闭']
    	       ,yes: function(index, layero){ //或者使用btn1
						var tree = layero.find("iframe")[0].contentWindow.tree;
						var ids = [], names = [], nodes = [];
						if ("${checked}" == "true"){
							nodes = tree.getCheckedNodes(true);
							for(var i=0; i<nodes.length; i++) {
								if (nodes[i].isParent){
									continue;
								} 
								if (nodes[i].level == 0 ){
									top.layer.msg("不能选择根节点（"+nodes[i].name+"）请重新选择。", {icon: 0});
									return false;
								}
								if (nodes[i].isParent ){								
									top.layer.msg("不能选择父节点（"+nodes[i].name+"）请重新选择。", {icon: 0});
									return false;
								}
								if (nodes[i].module == "" ){
									top.layer.msg("不能选择公共模型（"+nodes[i].name+"）请重新选择。", {icon: 0});
									return false;
								}  else if ("${module}"!="" ){							
									top.layer.msg("不能选择当前栏目以外的栏目模型，请重新选择。", {icon: 0});
									return false;
								}  			 			
								ids.push(nodes[i].id);
								names.push(nodes[i].name);							
								//break;
							}

						}else{
							nodes = tree.getSelectedNodes();
							for(var i=0; i<nodes.length; i++) {
								/* if (nodes[i].isParent){
									continue;
								}  */
								if (nodes[i].level == 0 && "${notAllowSelectRoot}"=="true"){
									top.layer.msg("不能选择根节点（"+nodes[i].name+"）请重新选择。", {icon: 0});
									return false;
								}
								if (nodes[i].isParent && "${notAllowSelectParent}"=="true"){								
									top.layer.msg("不能选择父节点（"+nodes[i].name+"）请重新选择。", {icon: 0});
									return false;
								}
								if (nodes[i].module == "" && "${selectScopeModule}"=="true"){
									top.layer.msg("不能选择公共模型（"+nodes[i].name+"）请重新选择。", {icon: 0});
									return false;
								}  else if ("${module}"!="" && nodes[i].module != "${module}"){							
									top.layer.msg("不能选择当前栏目以外的栏目模型，请重新选择。", {icon: 0});
									return false;
								}  			 			
								ids.push(nodes[i].id);
								names.push(nodes[i].name);							
								//break;
							}
						}
						
				
						$("#${id}Id").val(ids.join(",").replace(/u_/ig,""));
						$("#${id}Name").val(names.join(","));	
						$("#${id}Id").change();
						$("#${id}Name").change();						
						//$("#${id}Name").focus();
						top.layer.close(index);
				    	       },					
		    	      btn2:function(index){//清除
		    	    	   if('${allowClear}'=='true'){
		    	    		   $("#${id}Id").val("");
								$("#${id}Name").val("");
								$("#${id}Id").change();
								$("#${id}Name").change();					
									top.layer.close(index);
							return false;
							}else{}
		    	    	   
		    	       },		    	       
    	cancel: function(index){ //"x"关闭调用的

    	       }
		}); 
	
	});
</script>