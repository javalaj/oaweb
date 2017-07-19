<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>我的通讯录</title>
<meta name="decorator" content="default" />
<script type="text/javascript">

var validateForm;
var iphonesFlag=true;
var emailsFlag=true;
$(document).ready(function() {
	

	function myfun(){
	    
	    
	     var value='${cytspoaaddressgroup.name}';
	     var sel = document.getElementById('sel');
	     for (var i = 0; i < sel.length; i++) {
	            if (sel[i].text == value) { //如果这一项的文本内容为客厅
	                sel[i].selected = true; //选中这一项
	            }
	        };
	    };
	    　
	window.onload = myfun;//不要括号
	validateForm = $("#inputForm").validate({
		submitHandler: function(form){
			form.submit();
			oaLoading('正在提交，请稍候...');
		},
		errorContainer: "#messageBox",
		errorPlacement: function(error, element) {
			$("#messageBox").text("输入有误，请先更正。");
			if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
				error.appendTo(element.parent().parent());
			} else {
				error.insertAfter(element);
			}
	}
});
 //验证手机号
	$("input[name='iphone']").keyup(function(){
	
		var iphones=$("input[name='iphone']").val();
		$.ajax({
			url:"${ctx}/oa/adress/formCheck",
			type:"post",
			dataType:"json",
			data:{iphone:iphones},
			success:function(data){
				for(var i = 0; i < data.length; i++) {
					if(iphones==data[i].iphone){
						iphonesFlag=false;
						break;
					}
					else{
						iphonesFlag=true;
						$("#iphonesTip").text("");
					}
				}
			}
		});
	});	
	//验证邮箱号
	$("input[name='email']").keyup(function(){
		
		
		var emails=$("input[name='email']").val();
		var ids=$("#oaid").val();
		$.ajax({
			url:"${ctx}/oa/adress/formCheck",
			type:"post",
			dataType:"json",
			data:{email:emails},
			success:function(data){
				for(var i = 0; i < data.length; i++) {
					if(emails==data[i].email){
						emailsFlag=false;
						break;
					}
					else{
						emailsFlag=true;
						$("#emailsTip").text("");
					}
				}
			}
		});
		
	}); 
	
	
})

function doSubmit() {
var judge1 = notnull();
var judge2 = notnull1();
if(validateForm.form()){
		if (judge1&&judge2) {
			if(iphonesFlag&&emailsFlag){
				$("#inputForm").submit();
				return true;
			}else{
				if(!emailsFlag&&iphonesFlag){
					$("#emailsTip").text("*邮箱号码重复");
					return false;
				}else if(!iphonesFlag&&emailsFlag){
					$("#iphonesTip").text("*手机号码重复");
					return false;
				}else{
					$("#inputForm").submit();
					oaLoading('正在提交，请稍候...');
					return true;
				}
				/* 
				
				
				if(!iphonesFlag&&!emailsFlag){
					$("#emailsTip").text("*邮箱号码重复");
					$("#iphonesTip").text("*手机号码重复");
					return false;
				}else{
				if(iphonesFlag){
					if(emailsFlag){
						
					}else{
						$("#emailsTip").text("*邮箱号码重复");
						return false;
					}
				}else{
					$("#iphonesTip").text("*手机号码重复");
					return false;
				}
				} */
			}
			
	} else {
		return false;
	}
		
}
	return false;
}
function notnull() {
	var judge = true;
	var str = "";
	var str1 = ""
	var str2 = "*输入正确的手机号码";
	$("input[name='iphone']").each(function() {
			if (!(/^[1]([3][0-9]{1}|59|58|88|89)[0-9]{8}$/.test($(this).val()))) {
				judge = false;
				str = str2;
			} else {
				str = str1;
			}
			$("#iphonesTip").text(str);
	});
	return judge;
}

function notnull1() {
	var judge = true;
	var str = "";
	var str1 = ""
	var str2 = "*输入正确的邮箱地址";
	$("input[name='email']").each(function() {
			if (!(/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/.test($(this).val()))) {
				judge = false;
				str = str2;
			} else {
				judge = true;
				str = str1;
			}
			$("#emailsTip").text(str);
	});
	return judge;
}


</script>
</head>
<body>
	<form:form id="inputForm" modelAttribute="cytspoaaddress"
		action="${ctx}/oa/adress/save" method="post" class="form-horizontal">
		<table
			class="table table-condensed dataTables-example dataTable no-footer myoa-newitem-table">
			<tbody>
			<form:hidden path="id"/>
				<tr>
					<td>姓名: <span class="help-inline"><font color="red">*</font></span></td>
					<td><form:input path="name"
							htmlEscape="false" maxlength="64" class="form-control required"/>
					</td>											
				</tr>
				<tr>					
					<td>公司: <span class="help-inline"><font color="red">*</font></span></td>
					<td><form:input path="company"
							htmlEscape="false" maxlength="64" class="form-control required"/>
					</td>	
				</tr>
				<tr>
					<td>岗位: <span class="help-inline"><font color="red">*</font></span></td>
					<td  ><form:input path="position"
							htmlEscape="false" maxlength="64" class="form-control required"/>	</td>									
				</tr>
				<tr>
					
					<td>手机号: <span class="help-inline"><font color="red" >*</font></span></td>
					<td ><form:input path="iphone" name="iphone"
							htmlEscape="false"  maxlength="64" class="form-control "/><span class="help-inline"><font color="red" id="iphonesTip"></font></span>
						</td>
				</tr>
				<tr>
					<td>办公电话:</td>
					<td ><form:input path="oph"
							htmlEscape="false" maxlength="64" class="form-control"/>
						</td>
					
				</tr>
				<tr>
					
					<td>QQ:</td>
					<td  ><form:input path="qq"
							htmlEscape="false" maxlength="64" class="form-control"/>
						</td>
				</tr>
				<tr>
					<td>电子邮箱: <span class="help-inline"><font color="red" >*</font></span></td>
					<td>
					<form:input path="email"  
							htmlEscape="false" maxlength="64" class="form-control "/><span class="help-inline"><font color="red" id="emailsTip"></font></span>
						</td>					
				</tr>
				<tr>					
					<td>联系地址: <span class="help-inline"><font color="red">*</font></span></td>
					<td><form:input path="ofaddress"
							htmlEscape="false" maxlength="64" class="form-control required"/>
						</td>
				</tr>
				<tr>
					<td>选择分组:</td>
                    <c:if test="${empty cytspoaaddressgroup.name}">
	                    <td><select 
	                        name="select" data-style="btn-inverse" data-live-search="true" 
						class="selectpicker" >
	                            <option value="0">请选择</option>
	                            <c:forEach items="${treeList}"
	                                var="treeList">
	                                <option name="id" value="${treeList.groupId }">${treeList.name }</option>
	                            </c:forEach>
	                    </select></td>
                    </c:if>
                    <c:if test="${!empty cytspoaaddressgroup.name}">
                    <td><select 
                        name="select" data-style="btn-inverse" data-live-search="true" 
					class="selectpicker"  id='sel' >
                    
                            <c:forEach items="${treeList}"
                                var="treeList">
                                <option id='optionid'  name="id" value="${treeList.groupId }">${treeList.name }</option>
                            </c:forEach>
                    </select></td></c:if>
				</tr>
			</tbody>
		</table>
	</form:form>

</body>
</html>