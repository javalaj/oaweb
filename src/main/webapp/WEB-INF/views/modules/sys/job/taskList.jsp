<%@ page language="java" import="java.util.*" pageEncoding="utf8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />


<%
	String path = request.getContextPath();
	String rootPath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ "/";
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("basePath", basePath);
	request.setAttribute("rootPath", rootPath);
	pageContext.setAttribute("newLineChar", "\n");
%>
<script type="text/javascript" src="${ctxStatic}/jquery/jquery-1.9.1.min.js" charset="utf-8"></script>
<style type="text/css">
.datagrid-mask {
	background: #ccc;
}

.datagrid-mask-msg {
	border-color: #95B8E7;
}

.datagrid-mask-msg {
	background: #ffffff url('../images/loading.gif') no-repeat scroll 5px
		center;
}

.datagrid-mask {
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	opacity: 0.3;
	filter: alpha(opacity = 30);
	display: none;
}

.datagrid-mask-msg {
	position: absolute;
	top: 50%;
	margin-top: -20px;
	padding: 12px 5px 10px 30px;
	width: auto;
	height: 16px;
	border-width: 2px;
	border-style: solid;
	display: none;
}

.list_table {
	border: 1px solid #CCCCCC;
	border-collapse: collapse;
	color: #333333;
	margin: 0 0 0;
	width: 100%;
}

.list_table tbody td {
	border-top: 1px solid #CCCCCC;
	text-align: left;
}

.list_table th {
	line-height: 1.2em;
	vertical-align: top;
}

.list_table td {
	line-height: 2em;
	font-size: 12px;
	vertical-align: central;
	align: left;
}

.list_table td input {
	width: 90%;
}

.list_table tbody tr:hover th,.list_table tbody tr:hover td {
	background: #EEF0F2;
}

.list_table thead tr {
	background: none repeat scroll 0 0 #09f;
	color: #fff;
	font-weight: bold;
	border-bottom: 1px solid #CCCCCC;
	border-right: 1px solid #CCCCCC;
}
</style>
</head>

<title>task</title>
<body class="bgray">
	<form id="addForm" method="post">

		<table class="list_table">
			<thead>
				<tr>
					<td style="width: 20xp">id&nbsp;&nbsp;&nbsp;</td>
					<td>name</td>
					<td>group</td>
					<td>状态&nbsp;&nbsp;</td>
					<td>cron表达式</td>
					<td>描述</td>
					<td>同步否</td>
					<td>类路径</td>
					<td>spring id</td>
					<td>方法名</td>
					<td>操作</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="job" items="${taskList}">
					<tr>
						<td>${job.jobId }</td>
						<td>${job.jobName }</td>
						<td>${job.jobGroup }</td>
						<td>${job.jobStatus }<c:choose>
								<c:when test="${job.jobStatus=='1' }">
									<a href="javascript:;"
										onclick="changeJobStatus('${job.jobId}','stop')">停止</a>&nbsp;
								</c:when>
								<c:otherwise>
									<a href="javascript:;"
										onclick="changeJobStatus('${job.jobId}','start')">开启</a>&nbsp;
								</c:otherwise>
							</c:choose>
						</td>
						<td>${job.cronExpression }</td>
						<td>${job.description }</td>
						<td>${job.isConcurrent }</td>
						<td>${job.beanClass }</td>
						<td>${job.springId }</td>
						<td>${job.methodName }</td>
						<td><a href="javascript:;" onclick="updateCron('${job.jobId}')">更新cron</a></td>
					</tr>
				</c:forEach>
				<tr>
					<td>n</td>
					<td><input type="text" name="jobName" id="jobName"></input></td>
					<td><input type="text" name="jobGroup" id="jobGroup"></input></td>
					<td>0<input type="hidden" name="jobStatus" value="0"></input></td>
					<td><input type="text" name="cronExpression"
						id="cronExpression"></input></td>
					<td><input type="text" name="description" id="description"></input></td>
					<td><select name="isConcurrent" id="isConcurrent">
							<option value="1">1</option>
							<option value="0">0</option>
					</select></td>
					<td><input type="text" name="beanClass" id="beanClass"></input></td>
					<td><input type="text" name="springId" id="springId"></input></td>
					<td><input type="text" name="methodName" id="methodName"></input></td>
					<td><input type="button" onclick="add()" value="保存" /></td>
				</tr>
			</tbody>
		</table>
	</form>
	<script>
	(function($){
        $.fn.serializeJson = function(){
            var jsonData1 = {};
            var serializeArray = this.serializeArray();
            // 先转换成{"id": ["12","14"], "name": ["aaa","bbb"], "pwd":["pwd1","pwd2"]}这种形式
            $(serializeArray).each(function () {
                if (jsonData1[this.name]) {
                    if ($.isArray(jsonData1[this.name])) {
                        jsonData1[this.name].push(this.value);
                    } else {
                        jsonData1[this.name] = [jsonData1[this.name], this.value];
                    }
                } else {
                    jsonData1[this.name] = this.value;
                }
            });
            // 再转成[{"id": "12", "name": "aaa", "pwd":"pwd1"},{"id": "14", "name": "bb", "pwd":"pwd2"}]的形式
            var vCount = 0;
            // 计算json内部的数组最大长度
            for(var item in jsonData1){
                var tmp = $.isArray(jsonData1[item]) ? jsonData1[item].length : 1;
                vCount = (tmp > vCount) ? tmp : vCount;
            }

            if(vCount > 1) {
                var jsonData2 = new Array();
                for(var i = 0; i < vCount; i++){
                    var jsonObj = {};
                    for(var item in jsonData1) {
                        jsonObj[item] = jsonData1[item][i];
                    }
                    jsonData2.push(jsonObj);
                }
                return JSON.stringify(jsonData2);
            }else{
                return "[" + JSON.stringify(jsonData1) + "]";
            }
        };
    })(jQuery);
	
		function validateAdd() {
			if ($.trim($('#jobName').val()) == '') {
				alert('name不能为空！');
				$('#jobName').focus();
				return false;
			}
			if ($.trim($('#jobGroup').val()) == '') {
				alert('group不能为空！');
				$('#jobGroup').focus();
				return false;
			}
			if ($.trim($('#cronExpression').val()) == '') {
				alert('cron表达式不能为空！');
				$('#cronExpression').focus();
				return false;
			}
			if ($.trim($('#beanClass').val()) == '' && $.trim($('#springId').val()) == '') {
				$('#beanClass').focus();
				alert('类路径和spring id至少填写一个');
				return false;
			}
			if ($.trim($('#methodName').val()) == '') {
				$('#methodName').focus();
				alert('方法名不能为空！');
				return false;
			}
			return true;
		}
		function add() {
			
			if (validateAdd()) {
				alert($("#addForm").serializeJson());
				showWaitMsg();
				$.ajax({
					type : "POST",
					async : false,
					dataType : "json",
					contentType : 'application/json;charset=utf-8', 
					cache : false,
					url : "${ctx}/sys/job/sysScheduleJob/add",
					data : $("#addForm").serializeJson(),
					success : function(data) {
						hideWaitMsg();
						if (data.flag) {

							location.reload();
						} else {
							alert(data.msg);
						}

					},
	              	error: function(res){
	              		alert(res);
		            	location.reload();
		            	
		            }
					//end-callback
					
				});//end-ajax
			}
		}
		function changeJobStatus(jobId, cmd) {
			showWaitMsg();
			$.ajax({
				type : "POST",
				async : false,
				dataType : "json",
				contentType : 'application/json;charset=utf-8', 
				cache : false,
				url : "${ctx}/sys/job/sysScheduleJob/changeJobStatus",
				data : {
					jobId : jobId,
					cmd : cmd
				},
				success : function(data) {
					hideWaitMsg();
					if (data.flag) {

						location.reload();
					} else {
						alert(data.msg);
					}

				},
              	error: function(res){
              		
	            	location.reload();
	            	alert("提交失败");
	            }
				//end-callback
			});//end-ajax
		}
		function updateCron(jobId) {
			var cron = prompt("输入cron表达式！", "")
			if (cron) {
				showWaitMsg();

				$.ajax({
					type : "POST",
					async : false,
					dataType : "json",
					contentType : 'application/json;charset=utf-8', 
					cache : false,
					url : "${ctx}/sys/job/sysScheduleJob/updateCron",
					data : {
						jobId : jobId,
						cron : cron
					},
					success : function(data) {
						hideWaitMsg();
						if (data.flag) {

							location.reload();
						} else {
							alert(data.msg);
						}

					},
	              	error: function(res){
	              		
		            	location.reload();
		            	alert("提交失败");
		            }
					//end-callback
				});//end-ajax
			}

		}
		function showWaitMsg(msg) {
			if (msg) {

			} else {
				msg = '正在处理，请稍候...';
			}
			var panelContainer = $("body");
			$("<div id='msg-background' class='datagrid-mask' style=\"display:block;z-index:10006;\"></div>").appendTo(panelContainer);
			var msgDiv = $("<div id='msg-board' class='datagrid-mask-msg' style=\"display:block;z-index:10007;left:50%\"></div>").html(msg).appendTo(
					panelContainer);
			msgDiv.css("marginLeft", -msgDiv.outerWidth() / 2);
		}
		function hideWaitMsg() {
			$('.datagrid-mask').remove();
			$('.datagrid-mask-msg').remove();
		}
	</script>
</body>
</html>




