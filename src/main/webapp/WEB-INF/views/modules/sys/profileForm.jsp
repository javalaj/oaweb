<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html lang="en">
<head>
    <title>编辑员工档案</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
 // 手机号码验证
   
	$(document).ready(function() {
		$("#no").focus();
		//手机号码验证
		 jQuery.validator.addMethod("isMobile", function(value, element) {
		        var length = value.length;
		        var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
		        return this.optional(element) || (length == 11 && mobile.test(value));
		    }, "请正确填写您的手机号码");
		// 身份证号码验证
		 jQuery.validator.addMethod("isIdCardNo", function(value, element) {
			 var card=/^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/;
		 return this.optional(element) || (card.test(value));
		 }, "请正确输入您的身份证号码");
		// email邮箱验证
		 /*  jQuery.validator.addMethod("isEmail", function(value, element) {
		 var email = /^[A-Za-zd]+([-_.][A-Za-zd]+)*@([A-Za-zd]+[-.])+[A-Za-zd]{2,5}$/; //电话号码格式010-12345678
		 return this.optional(element) || (email.test(value));
		 }, "请正确填写您的Email地址");  */
		$("#inputForm").validate({
			rules: {
				mobile : {
			            required : true,
			            minlength : 11,
			            // 自定义方法：校验手机号在数据库中是否存在
			            // checkPhoneExist : true,
			            isMobile : true
			        },
			        identificationum:{
			        	required:true,
			        	isIdCardNo:true
			        	  
			        	}/* ,
			        	email:{
			        		required:true,
			        		isEmail:true
			        		} */
			},
			messages: {			
				mobile : {
			            required : "请输入手机号",
			            minlength : "确认手机不能小于11个字符",
			            isMobile : "请正确填写您的手机号码"
			        },
			        identificationum:{
			        	required:"请输入身份证号",
			        	isIdCardNo:"请输入正确的身份证号"
			        	}/* ,
			        	email:{
			        		required: true,
			        		isEmail: "请输入一个有效的Email地址"
			        		} */
			       
			},
			submitHandler: function(form){
			oaLoading('操作正在进行中，请耐心等待');
				form.submit();
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
	});
</script>
    <style>
        .ibox-title{
            position: relative;
        }
        .ibox-title a {
            color: #434f66;
            position: absolute;
            top: 13px;
            right: 15px;
        }

        .table > tbody > tr > td{
            border: none;
            height: 50px;
            line-height: 50px;
            padding:0 8px;
        }
		.table td,.table th{
			text-align:center;
		}
		
        .table tr td{
            text-overflow:ellipsis;
            white-space: nowrap;
            height:40px;
            line-height: 40px;
            padding:0;
            text-align:left;
        }

        .table tr td:first-child{
            padding-left:10px;
            text-align:left;
        }
        .table tr td:nth-of-type(2n-1){
        	max-width:150px;
        }
        
        .table tr td:nth-of-type(2n-1) span{
        	position: relative;
        }
        
        .table tr td:last-child{
        	text-align:left;
        }
        
        .table tr td input,.table tr td select,.table tr td textarea{
        	text-align:left;
        	overflow: hidden;
            text-overflow:ellipsis;
            white-space: nowrap;
        }
        
        .table tr td input{
        	float:left;
        }
        
        .table tr td label.error{
        	display: inline-block;
		    line-height: 14px;
		    height: 14px;
		    float: left;
		    margin-top:10px;
        }
        
      /*  .table tr td .layer-date + label.error{
        	float: right;
		    position: relative;
		    top: 15px;
		    right: 20px;
        } */
        .table tr.myoa-timeline td label.error{
        	float: none;
        }
        .row #btnSubmit{
        	float:left;
        	margin-left:35%;
        }
        .row #btnCancel{
        	float:right;
        	margin-right:35%;
        } 
        .sgin-red:after{
        	position: absolute;
		    display: block;
		    content: '*';
		    color: red;
		    top: -20px;
		    right:-5px;
        }
        
       .table tr .period{
        		overflow: initial;
			    text-overflow: inherit;
			    white-space: inherit;
        	}
        
        @media (max-width:1360px){
        	.period input{
        		width:45%;
        	}
        	.period span{
        		display:inline-block;
        		text-align:center;
        	}
        }
    </style>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-xs-10 col-xs-offset-1">
            <div class="ibox">
                <div class="ibox-title">
                    <h5>编辑员工档案</h5>
                    <a href="#" onclick="window.location.href='${ctx}/sys/user/profileList'"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a></div>
                <div class="ibox-content">
                    <div class="row">
                	<form:form id="inputForm" modelAttribute="user" action="${ctx}/sys/user/saveProfile" method="post" class="form-horizontal">
            		<form:hidden path="id"/>
            		<sys:message content="${message}"/>
                            <table class="table col-xs-6">
                                <tr>
                                    <td><span>员工工号：</span></td>
                                    <td><span>${user.no }</span></td>
                                    <td><span>姓名：</span></td>
                                    <td><span>${user.name}</span></td>
                                </tr>
                                <tr>
                                    <td><span>部门：</span></td>
                                    <td><span>${user.office.name}</span></td>
                                    <td><span class="sgin-red">性别：</span></td>
                                    <td><form:select path="gender" class=" form-control required selectpicker" data-style="btn-inverse"  data-live-search="true" >
                					<form:options items="${fns:getDictList('sex')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
                				</form:select></td>
                                </tr>
                                <tr>
                                    <td><span>婚姻状态：</span></td>
                                    <td>
                                    <form:select path="marriage"  class="form-control selectpicker" data-style="btn-inverse"  data-live-search="true">
                					<form:options items="${fns:getDictList('marriage')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
                				</form:select>
                                    </td>
                                    <td><span>籍贯：</span></td>
                                    <td><form:input path="registeredAdd" htmlEscape="false" maxlength="50" class=" form-control "/></td>
                                
                                </tr>
                                <tr>
                                    <td><span>职务：</span></td>
                                    <td><form:select path="title" class=" form-control required selectpicker" data-style="btn-inverse"  data-live-search="true">
                					<form:options items="${fns:getDictList('user_position')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
                					</form:select></td>
                					<td><span>岗位：</span></td>
                                    <td><span>${user.duty}</span></td>
                                </tr>
                                <tr>
                                    <td><span>出生年月：</span></td>
                                    <td><input id="pDate" name="birthday" type="text" maxlength="20" class="laydate-icon form-control layer-date input-sm "  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true})"
                          					 value="<fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd"/>"
                          					/></td>
                          			<td><span>年龄：</span></td>
                                    <td>${user.age}</td>
                                </tr>
                                <tr>
                                    <td><span class="sgin-red">毕业院校：</span></td>
                                    <td><form:input path="school" htmlEscape="false" maxlength="50" class=" form-control required"/> </td>
                                	<td><span>最高学历：</span></td>
                                    <td><form:input path="education" htmlEscape="false" maxlength="50" class=" form-control "/></td>
                                </tr>
                                <tr>
                                    <td><span class="sgin-red">专业：</span></td>
                                    <td><form:input path="major" htmlEscape="false" maxlength="50" class=" form-control required"/></td>
                                	<td><span class="sgin-red">毕业时间：</span></td>
                                    <td><input  name="graduateDate" type="text" maxlength="20" class="laydate-icon form-control layer-date input-sm required"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true})"
                       					 value="<fmt:formatDate value="${user.graduateDate}" pattern="yyyy-MM-dd"/>" 
                     					/>
                                </tr>
                                <tr>
                                    <td><span>参加工作时间：</span></td>
                                    <td><input  name="workdate" type="text" maxlength="20" class="laydate-icon form-control layer-date input-sm required"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true})"
                       					 value="<fmt:formatDate value="${user.workdate}" pattern="yyyy-MM-dd"/>" 
                     					/></td>
                     				<td><span>身份证号码：</span></td>
                                    <td><form:input path="identificationum" htmlEscape="false" maxlength="19" class=" form-control " style="width:100%"/></td>
                                </tr>
                                <tr>
                                    <td><span class="sgin-red">联系方式：</span></td>
                                    <td><form:input path="mobile" htmlEscape="false" maxlength="11" class=" form-control required" style="width:100%"/>
                    				<!-- <span class="help-inline"><font color="red">*</font> </span></td> -->
                                	<td><span class="sgin-red">入职时间：</span></td>
                                    <td><input id="indate" name="indate" type="text" maxlength="20" class="laydate-icon form-control layer-date input-sm required"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true,maxDate:'%y-%M-%d'})"
                          					 value="<fmt:formatDate value="${user.indate}" pattern="yyyy-MM-dd"/>" 
                          					/>
                          			</td>
                                </tr>
                                <tr>
                                    <td><span>转正日期： <font color="red">*</font> </span></span></td>
                                    <td><input id="pDate" name="pdate" type="text" maxlength="20" class="laydate-icon form-control layer-date input-sm required"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true,minDate:'#F{$dp.$D(\'indate\')}'})"
                       					 value="<fmt:formatDate value="${user.pdate }" pattern="yyyy-MM-dd"/>"
                     					/></td>
                     					<td><span>入职年限(年)：</span></td>
                                    <td>${user.workYear}</td>
                                </tr>
                                <tr>
                                    <td><span  class="sgin-red">是否已办社保：</span></td>
                                    <td>
                                    <form:select path="socialSecurity" class=" form-control required selectpicker" data-style="btn-inverse"  data-live-search="true">
                            		<form:options items="${fns:getDictList('user_socialSecurity')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
                            	</form:select>
                                    </td>
                                    <td><span class="sgin-red">是否已签合同：</span></td>
                                    <td>
                                    <form:select path="postcode" class=" form-control required selectpicker" data-style="btn-inverse"  data-live-search="true">
                            		<form:options items="${fns:getDictList('user_socialSecurity')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
                            	</form:select>
                                    </td>
                                </tr>
                                <tr>
                                    <td><span class="sgin-red">档案编号：</span></td>
                                    <td><form:input path="fileNumber" htmlEscape="false" maxlength="100" class=" form-control required"/>
                                	<td><span>现为第几次签订劳动：</span></td>
                                    <td><form:select path="contractNum" class="form-control selectpicker" data-style="btn-inverse"  data-live-search="true">
                                	<form:options items="${fns:getDictList('user_contractNum')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
                                	</form:select></td>
                                </tr>
                                <tr>
                              		<td><span class="sgin-red">员工状态：</span></td>
	                                <td colspan="3"><form:select path="state" class="form-control required selectpicker" data-style="btn-inverse"  data-live-search="true">
	                            	<form:options items="${fns:getDictList('user_state')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
	                            	</form:select></td>
                               </tr>
                                <tr class="myoa-timeline">
                                	<td><span  class="sgin-red">劳动合同期限：</span></td>
                                    <td class="period"  colspan="3"><input  name="contractStart" type="text" maxlength="20" class="laydate-icon form-control layer-date input-sm required"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true})"
                          					 value="<fmt:formatDate value="${user.contractStart}" pattern="yyyy-MM-dd"/>" 
                          					/><span> - </span> 
                                		<input  name="contractEnd" type="text" maxlength="20" class="laydate-icon form-control layer-date input-sm required"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true})"
                              					 value="<fmt:formatDate value="${user.contractEnd}" pattern="yyyy-MM-dd"/>" 
                              					/>
                                	</td>
                                </tr>
                                <tr>
                            
                                <td style="vertical-align:top;"><span>备注：</span></td>
                                    <td rowspan="2"  colspan="3"><textarea style="height:120px;"  name="remarks" class="form-control"></textarea></td>
                                </tr>
                            </table>
                            <div class="row">
                            	
                					<shiro:hasPermission name="user:user:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
                				
                					<input id="btnCancel" class="btn" type="button" value="返 回" onclick="window.location.href='${ctx}/sys/user/profileList'"/>
                				
                			</div>
                            </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>