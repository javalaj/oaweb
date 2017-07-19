<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>回复任务</title>
<meta name="decorator" content="default"/>
<script type="text/javascript">
$(document).ready(function() {
	//$("#name").focus();
	$("#inputForm").validate({
		
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
<style type="text/css">
        body{
            padding-top:20px;
        }
        ul,li{
            list-style-type: none;
            padding: 0;
            margin-bottom: 0;
        }
        ol + input[type="button"].btn {
		    margin-left: 6%;
		}
        .task li{
        	display:inline-block;
        	width:100%;
        	height:38px;
        	line-height:38px;
        }
        .content{
            border: 1px solid #ddd;
            border-radius: 3px;
            padding-top: 0;
        }
        .top{
            background-color: #eff4f8;
    		color: #434f66;
            padding: 14px 15px 8px;
            position: relative;
        }
        .top p{
            font-size: 16px;
            font-weight: bolder;
        }
        .top span{
            margin:0 16px 0 8px;
        }
        .top a{
            color: #434f66;
            position: absolute;
            top:18px;
            right:15px;
        }
        .main{
            padding:25px 4% 40px;
            background-color: #fff;
        }

        .info{
            border-bottom: 1px solid #c8c7cc;
            padding-bottom: 25px;
        }
        
        .info ol li{
        	width: 65%;
        	height:38px;
        	line-height:38px;
    		margin-left: 6%;
        } 

        .reply{
            margin:20px 0 40px;
        }

        .reply span{
            line-height: 34px;
        }
        
        .reply ol{
        	width: 65%;
        	height:38px;
        	line-height:38px;
    		margin-left: 6%;
    		display:inline;
        } 

        ul li span{
            float: left;
            width: 18%;
            text-align: right;
            color: #333;
        }

        ul li p{
            margin-left: 24%;
            color: #666;
        }
        .reply li{
        	display:inline;
        }
        .reply ul li:last-child{
        	margin-top:10px;
        }
        .reply input[type='button']{
        	margin-left:6%;
        	float:left;
        }

        .reply ul li textarea{
            margin-left: 24%;
            width: 65%;
            height:110px;
            border-radius: 4px;
            color: #666;
            line-height: 26px;
            border-color: #ddd;
            margin-bottom:15px;
        }

        ul li button{
            margin-left: 6%;
            background-color: #35a5e7;
            color: #fff;
        }

        .reply ul li{
            margin-bottom: 10px;
        }

        .container-fluid button{
            background-color: #35a5e7;
            color: #fff;
            float: left;
            padding:6px 40px;
        }
        .sign{
            position: relative;
        }
        .sign:after{
            position: absolute;
            display: block;
            content: '*';
            color: red;
            top: 0;
            right: -15px;
        }
        
        .container-fluid .btn{
        	padding:6px 40px;
        	color:#fff;
        }

        .container-fluid .btn-keep{
            background-color: #366ee8;
        }
        
        #btnSubmit{
        	margin-left:25%;
        	width:114px;
        	background:#366ee8;
        	color:#fff;
        }
        
        #btnSubmit:hover{
        	background:#1f5adb;
        }
        
        #btnSubmit1{
        	width:114px;
        	background:#35a5e7;
        	color:#fff;
        	margin-left:0;
        	margin-right:25%;
        	float:right;
        }
        
        #btnSubmit1:hover{
        	background:#366ee8;
        }
        label.error{
        	display: inline;
        	width: 70px;
		    float: right;
		    line-height: 16px;
		    margin-top: -37px;
		    margin-right: -10px;
        }
    </style>
</head>
<body class="gray-bg">
<div class="container task">
    <div class="row">
     <div class="col-md-8 col-md-offset-2">
            <div class="content">
                <div class="top">
                    <p>【${oaProject.projectName}】 -${oaPlan.planTitle }</p>
                    <span>发布人：${acName}</span>
                    <time><fmt:formatDate value="${oaPlan. createDate}"
						pattern="yyyy-MM-dd" /></time>
                    <a href="${ctx}/oa/mytask/myTask/myup?id=${oaPlan.id}"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a>
                </div>
                   <div class="main">
                    <div class="info">
                        <ul>
                            <li>
                                <span>任务描述</span>
                                <p>${oaPlan.content }</p>
                            </li>
                            <li>
                                <span>开始时间</span>
                                <p><fmt:formatDate value="${str }" pattern="yyyy-MM-dd HH:mm:ss"/></p>
                            </li>
                            <li>
                                <span>期望结束时间</span>
                                <p>	<fmt:formatDate value="${etr}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
                            </li>
                            <li>
                                <span>发送对象</span>
                                <p>${namee}</p>
                            </li>
                            <li>
                                <span>相关文件</span>
                                <p> <input type="hidden" id="billingFile${oaPlan.id}"value="${oaPlan.files}"/>
									<sys:ckfinder input="billingFile${oaPlan.id}" readonly="true" type="files" uploadPath="/oa/oaTask" selectMultiple="true"/> </p>
                            </li>
                             
                        </ul>
                    </div>
                    <form:form id='inputForm'  action="${ctx}/oa/mytask/myTask/UpTaksRemarks" method="post"  modelAttribute="oaPlan">
                    <div class="row reply">
                        <ul>
                        <input value="${oaPlan.id}" style="display: none;"
							name="reid">
                            <li class="clearfix">
                                <span class="sign">任务办理情况</span>
                          <form:textarea path="remarks" htmlEscape="false" rows="4"
							maxlength="255" class="form-control required" />
                            
                            </li>
                            <li>
                                <span>相关任务</span>
                              	<form:hidden id="backfiles" path="backfiles" htmlEscape="false" maxlength="2000" class="form-control"/>
										<sys:ckfinder input="backfiles" type="files" uploadPath="/oa/oaTask/replyFile" selectMultiple="true"/>
                            </li>
                        </ul>
                    </div>
                    <div class="container-fluid">
                  		  <input id="flag"  name="flag" type="hidden" value="0"  />
                      	 <input id="btnSubmit1" class="btn col-xs-offset-2 btn-keep" type="submit"      value="保存"/>
                     	 <input id="btnSubmit" class="btn col-xs-offset-3 btn-keep" type="submit"  value="办结"/>
                    </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
$("#btnSubmit1").click(function(){
	$("#flag").val("1");
})
</script>
</body>
</html>