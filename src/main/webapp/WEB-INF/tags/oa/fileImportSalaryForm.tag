<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="id" type="java.lang.String" required="true" description="编号"%>
<%@ attribute name="title" type="java.lang.String" required="true" description="窗口标题"%>
<%@ attribute name="buttonText" type="java.lang.String" required="true" description="按钮文字"%>
<%@ attribute name="actionUrl" type="java.lang.String" required="true" description="上传的地址"%>
<%@ attribute name="templateUrl" type="java.lang.String" required="true" description="模板文件下载的地址"%>
<%@ attribute name="filePathName" type="java.lang.String" required="true" description="后台文件参数名称"%>
<a href="#" onclick="openForm${id}()" class="btn btn-white btn-sm"><i class="fa fa-folder-open-o"></i>${buttonText}</a>
<script>
	var validateForm${id};
	function doSubmit${id}(){//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
		
	  if(validateForm${id}.form()){
		$("#inputForm${id}").submit();
		 return true;
	  }
	  return false;
	}	

	function openForm${id}(){
		var tpl = $("#tpl${id}").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
		var html=Mustache.render(tpl, {id:"${id}",filePathName:"${filePathName}",actionURL:"${actionUrl}",templateURL:"${templateUrl}"});
		layer.open({
		    type: 1,  
		    area: ['400px', '240px'],
		    title: "${title}",
	        maxmin: true, //开启最大化最小化按钮
		    content: html,
		    btn: ['确定', '关闭'],
		    yes: function(index, layero){
		    	if($("#uploadFile${id}").val()==null||$("#uploadFile${id}").val()==""){
		    		layer.msg('请选择导入文件！'); 
		    	}else{
		    		doSubmit${id}();
			    	layer.close(index);
		    	}
		    },
		    cancel: function(index){ 
		    	
	        }
		});
		validateForm${id}=$("#inputForm${id}").validate({
			submitHandler: function(form){
				layer.load(1);
				layer.msg('导入程序运行中', {
					  icon: 16,
					  time: 120*1000 //2秒关闭（如果不配置，默认是3秒）
					}, function(){
					  //do something
				}); 
				form.submit();
			},
			errorPlacement: function(error, element) {
			}
		});
	}
</script>

<script type="text/template" id="tpl${id}">
		<form id="inputForm{{id}}" action="{{actionURL}}" method="post" enctype="multipart/form-data" class="form-horizontal">
			<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer" >
				<tr>
					<td class="width-15 active" >工资月度</td>
					<td class="width-35" >
						<input name="salaryMonth" type="text" readonly="readonly" maxlength="20" class="form-control Wdate laydate-icon layer-date input-sm"
						onclick="WdatePicker({dateFmt:'yyyy-MM',isShowClear:true});"/>
					</td>
				</tr>
				<tr>
					<td class="width-15 active" >上传</td>
					<td class="width-35" >
						<input id="uploadFile{{id}}" name="{{filePathName}}" type="file"/>
					</td>
				</tr>
				<tr>
					<td class="width-15 active" >下载</td>
					<td class="width-35" >
						<a href="{{templateURL}}"><font color="green">点击下载模板</font></a>
					</td>
				</tr>
			</table>
		</form>
</script>	