<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>我的任务管理</title>
<meta name="decorator" content="default" />
<!-- <script type="text/javascript">
	$(document).ready(
			function() {
				//$("#name").focus();
				$("#inputForm")
						.validate(
								{
									rules: {
										"compere.name": {
									        required: true
									     },
									     "actor.name": {
										        required: true
										     },
									},
								    messages: {
								    	"compere.name": {
								          required: "必填信息",
								        },
								        "actor.name": {
									          required: "必填信息",
									        },
								    },
									submitHandler : function(form) {
										//loading('正在提交，请稍等...');
										form.submit();
									},
									errorContainer : "#messageBox",
									errorPlacement : function(error, element) {
										$("#messageBox").text("输入有误，请先更正。");
										if (element.is(":checkbox")
												|| element.is(":radio")
												|| element.parent().is(
														".input-append")) {
											error.appendTo(element.parent()
													.parent());
										} else {
											error.insertAfter(element);
										}
									}

								});

				$("#projectidName").change(function() {
					$(this).valid();
				});
				$("#actorName").change(function() {
					$(this).valid();
				});
				$("#select").change(function() {
					var select = $("#select").val();
					if (select == 0) {
						//工作任务					
					} else if (select == 1) {
						window.location.href = "${ctx}/oa/mytask/oaPlan/href";
					} else {
						//会议
						window.location.href = "${ctx}/oa/mytask/oaPlan/form";
					}

				})
				$("#compereName").change(function(){  
					$(this).valid();  
				});
				$("#actorName").change(function(){  
					$(this).valid();  
				});
			});
	function choose() {
		var title = $("#projectid option:selected'").val();
		if (title == null || title == '') {
			top.$.jBox.tip.mess = 1;
			top.$.jBox.tip("类型不能为空！", "error", {
				persistent : true,
				opacity : 0
			});
			$("#messageBox").show();
			return false;
		}
	}
</script> -->
	    <style type="text/css">
        ul,li{
            list-style-type: none;
            padding: 0;
            margin-bottom: 0;
        }
        .task li{
        	display:inline-block;
        	width:100%;
        	height:38px;
        	line-height:38px;
        }
        .row{
        	margin-top:20px;
        }
        .content{
            border: 1px solid #ddd;
            border-radius: 3px;
            padding-top: 0;
        }
        .top{
            background-color: #eff4f8;
    		color: #434f66;
            padding: 14px 15px 10px;
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
            margin-bottom: 40px;
        }
        .info ol li{
        	width: 65%;
        	height:38px;
        	line-height:38px;
    		margin-left: 6%;
        } 
        .info ul li span{
            float: left;
            width: 18%;
            text-align: right;
            color: #333;
        }

        .info ul li p{
            margin-left: 24%;
            color: #666;
            line-height: 36px;;
        }

        input[type="button"]{
            background-color: #35a5e7;
            color: #fff;
        }
        input[type="button"]:hover{
        	background:#366ee8;
        	color: #fff;
        }

    </style>
</head>
<body class="gray-bg">
<div class="container task">
    <div class="row">
        <div class="col-xs-8 col-xs-offset-2">
            <div class="content">
                <div class="top">
                    <p>【${oaProjectMain.projectName}】 -${oaPlanMain.planTitle}</p>
                    <span>发布人：${actNameMain}</span>
                    <time><fmt:formatDate value="${oaPlanMain. createDate}"
						pattern="yyyy-MM-dd" /></time>
                    <a href="${ctx}/oa/mytask/myTask/mylist"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a>
                </div>
                <div class="main">
                    <div class="info">
                        <ul>
                            <li>
                                <span>任务描述</span>
                                <p>${oaPlanMain.content }</p>
                            </li>
                            <li>
                                <span>开始时间</span>
                                <p><fmt:formatDate value="${strMain }" pattern="yyyy-MM-dd HH:mm:ss"/></p>
                            </li>
                            <li>
                                <span>期望结束时间</span>
                                <p>	<fmt:formatDate value="${etrMain}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
                            </li>
                            <li>
                                <span>发送对象</span>
                                <p>${actNameMainsss}</p>
                            </li>
                            <li>
                                <span>相关文件</span>
                                <p> <input type="hidden" id="billingFile${oaPlanMain.id}"value="${oaPlanMain.files}"/>
									<sys:ckfinder input="billingFile${oaPlanMain.id}" readonly="true" type="files" uploadPath="/oa/oaTask" selectMultiple="true"/></p>
                            </li>
                                <li>
                                <span>任务办理情况</span>
                                <p>${oaPlanMain.remarks } </p>
                            </li>
                            <li>
                                <span>办理相关文件</span>
                                <p><input type="hidden" id="dd${oaPlanMain.id}"value="${oaPlanMain.backfiles}"/>
									<sys:ckfinder input="dd${oaPlanMain.id}" readonly="true" type="files" uploadPath="/oa/oaTask/replyFile" selectMultiple="true"/> </p>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
      <div class="row">
        <div class="col-xs-8 col-xs-offset-2">
            <div class="content">
                <div class="top">
                    <p>【${oaProjectChilds.projectName}】 -${oaPlanChilds.planTitle }</p>
                    <span>发布人：${actNameChilds}</span>
                    <time><fmt:formatDate value="${oaPlanChilds. createDate}"
						pattern="yyyy-MM-dd" /></time>
                    
                </div>
                <div class="main">
                    <div class="info">
                        <ul>
                            <li>
                                <span>任务描述</span>
                                <p>${oaPlanChilds.content }</p>
                            </li>
                            <li>
                                <span>开始时间</span>
                                <p><fmt:formatDate value="${strChilds }" pattern="yyyy-MM-dd HH:mm:ss"/></p>
                            </li>
                            <li>
                                <span>期望结束时间</span>
                                <p>	<fmt:formatDate value="${etrChilds}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
                            </li>
                            <li>
                                <span>发送对象</span>
                                <p>${nameChilds}</p>
                            </li>
                            <li>
                                <span>相关文件</span>
                                <p> <input type="hidden" id="billingFile${oaPlanChilds.id}"value="${oaPlanChilds.files}"/>
									<sys:ckfinder input="billingFile${oaPlanChilds.id}" readonly="true" type="files" uploadPath="/oa/oaTask" selectMultiple="true"/> </p>
									
                            </li>
                             <li>
                                <span>任务办理情况</span>
                                <p>${oaPlanChilds.remarks } </p>
                            </li>
                            <li>
                                <span>办理相关文件</span>
                                <p>
                                
                                 <input type="hidden" id="cc${oaPlanChilds.id}"value="${oaPlanChilds.backfiles}"/>
									<sys:ckfinder input="cc${oaPlanChilds.id}" readonly="true" type="files" uploadPath="/oa/oaTask/replyFile" selectMultiple="true"/>
                              </p>
                            </li>
                        </ul>
                    </div>
                    <div class="row">
                 
                  		   <c:choose>
							<c:when test="${oaPlanChilds.state==2}">
							</c:when>
							<c:otherwise>
							    <input id="btnSubmit1" class="btn col-xs-offset-3 btn-keep" type="button" onclick="reply();" value="回复此任务"/>
							 <input id="btnSubmit" class="btn col-xs-offset-2 btn-keep" type="button"   onclick="childForm();"  value="编辑子任务"/>
							</c:otherwise>
						</c:choose> 
                    </div>
                </div>
            </div>

        </div>
    </div>
    </div>
    	<script type="text/javascript">
    	    function reply(){
    	    	var id='${oaPlanChilds.id}';
  				location.href="${ctx}/oa/mytask/myTask/subform?delitem="+id+"&flag="+1;
    	    }
  			function childForm(){
  				var id='${oaPlanChilds.id}';
  				location.href="${ctx}/oa/mytask/myTask/subform?delitem="+id+"&flag="+2;
    	    }
    	
					function history() {
			location.href="${ctx}/oa/mytask/myTask/mylist";
		}
			</script>
</body>
</html>