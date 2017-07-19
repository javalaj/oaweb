<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>我的任务管理</title>
<meta name="decorator" content="default" />
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
        
        .task .row{
        	margin-top:10px;
        }
        
        .task .form-horizontal{
        	margin:0;
        }
        .content{
            border: 1px solid #ddd;
            border-radius: 3px;
            padding-top: 0;
        }
        .top{
            background-color: #eff4f8;
            padding: 14px 15px 10px;
            color: #434f66;
            position: relative;
        }
        .top p{
            font-size: 16px;
        }
        .top span{
            margin:0 16px 0 8px;
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

        .info ul:first-child{
        	padding-bottom:20px;
        }
        .info ul:last-child{
        	padding-top:20px;
            border-top: 1px solid #c8c7cc;
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
        }
        .info ol li{
        	width: 65%;
        	height:38px;
        	line-height:38px;
    		margin-left: 6%;
        } 

        button{
            background-color: #35a5e7;
            color: #fff;
            float: left;
        }

    </style>
</head>

<body class="gray-bg">
<div class="container task">
    <div class="row">
        <div class="col-xs-8 col-xs-offset-2">
            <div class="content">
                <div class="top">
                    <p>主任务:【${oaProjectMain.projectName}】 - ${oaPlanMain.planTitle}</p>
                      <span>发布人：${mainActName}</span>
                    <time><fmt:formatDate value="${oaPlanMain.createDate}"
						pattern="yyyy-MM-dd" /></time>
                    <a href="${ctx}/oa/mytask/myTask/"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a>
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
                                <p><fmt:formatDate value="${oaPlanMain.startDay}"
						pattern="yyyy-MM-dd" />   ${oaPlanMain.startTime}</p>
                            </li>
                            <li>
                                <span>期望结束时间</span>
                                <p>${oaPlanMain.endTime}</p>
                            </li>
                            <li>
                                <span>发送对象</span>
                                <p>${nameMain}</p>
                            </li>
                            <li>
                                <span>相关文件</span>
                                <p><input type="hidden" id="billingFile${oaPlanMain.id}"value="${oaPlanMain.files}"/>
									<sys:ckfinder input="billingFile${oaPlanMain.id}" readonly="true" type="files" uploadPath="/oa/oaTask" selectMultiple="true"/></p>
                            </li>
                        </ul>
                        <ul>
                                 <li>
                                <span>任务办理情况</span>
                                <p>${oaPlanMain.remarks } </p>
                            </li>
                            <li>
                                <span>办理相关文件</span>
                                <p><input type="hidden" id="cc${oaPlanMain.id}"value="${oaPlanMain.backfiles}"/>
									<sys:ckfinder input="cc${oaPlanMain.id}" readonly="true" type="files" uploadPath="/oa/oaTask/replyFile" selectMultiple="true"/> </p>
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
                    <p>子任务:【${oaProjectChilds.projectName}】 -${oaPlanChilds.planTitle}</p>
                        <span>发布人：${childsActName}</span>
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
                                <p><fmt:formatDate value="${oaPlanChilds.startDay}"
						pattern="yyyy-MM-dd" />   ${oaPlanChilds.startTime}</p>
                            </li>
                            <li>
                                <span>期望结束时间</span>
                                <p>${oaPlanChilds.endTime}</p>
                            </li>
                            <li>
                                <span>发送对象</span>
                                <p>${nameChilds}</p>
                            </li>
                            <li>
                                <span>相关文件</span>
                                <p><input type="hidden" id="billingFile${oaPlanChilds.id}"value="${oaPlanChilds.files}"/>
									<sys:ckfinder input="billingFile${oaPlanChilds.id}" readonly="true" type="files" uploadPath="/oa/oaTask" selectMultiple="true"/></p>
                            </li>
                        </ul>
                        <ul>
                                 <li>
                                <span>任务办理情况</span>
                                <p>${oaPlanChilds.remarks } </p>
                            </li>
                            <li>
                                <span>办理相关文件</span>
                                <p><input type="hidden" id="aa${oaPlanChilds.id}"value="${oaPlanChilds.backfiles}"/>
									<sys:ckfinder input="aa${oaPlanChilds.id}" readonly="true" type="files" uploadPath="/oa/oaTask/replyFile" selectMultiple="true"/> </p>
                            </li>
                            </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <c:if test="${oaPlanChild.size()!=null}">
		<c:forEach items="${oaPlanChild }" var="oaPlanChild">
    <div class="row">
        <div class="col-xs-8 col-xs-offset-2">
            <div class="content">
                <div class="top">
                    <p>子任务:【${oaPlanChild.proname}】 -${oaPlanChild.planTitle}</p>
                        <span>发布人：${oaPlanChild.childActName}</span>
                    <time><fmt:formatDate value="${oaPlanChild. createDate}"
						pattern="yyyy-MM-dd" /></time>
                </div>
                <div class="main">
                    <div class="info">
                        <ul>
                            <li>
                                <span>任务描述</span>
                                <p>${oaPlanChild.content }</p>
                            </li>
                            <li>
                                <span>开始时间</span>
                                <p><fmt:formatDate value="${oaPlanChild.startDay}"
						pattern="yyyy-MM-dd" />   ${oaPlanChild.startTime}</p>
                            </li>
                            <li>
                                <span>期望结束时间</span>
                                <p>${oaPlanChild.endTime}</p>
                            </li>
                            <li>
                                <span>发送对象</span>
                                <p>${oaPlanChild.actName}</p>
                            </li>
                            <li>
                                <span>相关文件</span>
                                <p><input type="hidden" id="billingFile${oaPlanChild.id}"value="${oaPlanChild.files}"/>
									<sys:ckfinder input="billingFile${oaPlanChild.id}" readonly="true" type="files" uploadPath="/oa/oaTask" selectMultiple="true"/></p>
                            </li>
                        </ul>
                        <ul>
                         <li>
                                <span>任务办理情况</span>
                                <p>${oaPlanChild.remarks } </p>
                            </li>
                            <li>
                                <span>办理相关文件</span>
                                <p><input type="hidden" id="bb${oaPlanChild.id}"value="${oaPlanChild.backfiles}"/>
									<sys:ckfinder input="bb${oaPlanChild.id}" readonly="true" type="files" uploadPath="/oa/oaTask/replyFile" selectMultiple="true"/> </p>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </c:forEach>
    </c:if>
    </div>
 </body>

</html>