<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>项目管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript" src="${ctxStatic}/export-excel/Blob.js" charset="utf-8"></script>
	<script type="text/javascript" src="${ctxStatic}/export-excel/FileSaver.min.js" charset="utf-8"></script>
	<script type="text/javascript" src="${ctxStatic}/export-excel/ExportUtil.js" charset="utf-8"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#searchForm").validate({
				submitHandler: function(form){
					oaLoading('正在提交，请稍候...');
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
			
			$("#btnPrint").click(function(){
				window.print();
			});
			
			$("#btnExport").click(function(){
				if(getExplorer()=='ie')  
	            {
					ExportUtil.toExcel("contentTable");
	            }else{
	            	method5('contentTable');
	            }
				
				
			});
			
		});
	     Date.prototype.Format = function (fmt) { //author: meizz 
	         var o = {
	             "M+": this.getMonth() + 1, //月份 
	             "d+": this.getDate(), //日 
	             "h+": this.getHours(), //小时 
	             "m+": this.getMinutes(), //分 
	             "s+": this.getSeconds(), //秒 
	             "S": this.getMilliseconds() //毫秒 
	         };
	         if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	         for (var k in o)
	         if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	         return fmt;
	     }
        //第五种方法  
        var idTmr;  
        function  getExplorer() {  
            var explorer = window.navigator.userAgent ;  
            //ie  
            if (explorer.indexOf("MSIE") >= 0) {  
                return 'ie';  
            }  
            //firefox  
            else if (explorer.indexOf("Firefox") >= 0) {  
                return 'Firefox';  
            }  
            //Chrome  
            else if(explorer.indexOf("Chrome") >= 0){  
                return 'Chrome';  
            }  
            //Opera  
            else if(explorer.indexOf("Opera") >= 0){  
                return 'Opera';  
            }  
            //Safari  
            else if(explorer.indexOf("Safari") >= 0){  
                return 'Safari';  
            }  
        }  
        function method5(tableid) {  
            if(getExplorer()=='ie')  
            {  
                var curTbl = document.getElementById(tableid);  
                var oXL = new ActiveXObject("Excel.Application");  
                var oWB = oXL.Workbooks.Add();  
                var xlsheet = oWB.Worksheets(1);  
                var sel = document.body.createTextRange();  
                sel.moveToElementText(curTbl);  
                sel.select();  
                sel.execCommand("Copy");  
                xlsheet.Paste();  
                oXL.Visible = true;  
  
                try {  
                    var fname = oXL.Application.GetSaveAsFilename("Excel.xls", "Excel Spreadsheets (*.xls), *.xls");  
                } catch (e) {  
                    print("Nested catch caught " + e);  
                } finally {  
                    oWB.SaveAs(fname);  
                    oWB.Close(savechanges = false);  
                    oXL.Quit();  
                    oXL = null;  
                    idTmr = window.setInterval("Cleanup();", 1);  
                }
  
            }  
            else  
            {  
                tableToExcel(tableid)  
            }  
        }  
        function Cleanup() {  
            window.clearInterval(idTmr);  
            CollectGarbage();  
        }  
        var tableToExcel = (function() {  
            var uri = 'data:application/vnd.ms-excel;base64,',  
                    template = '<html><head><meta charset="UTF-8"></head><body><table>{table}</table></body></html>',  
                    base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) },  
                    format = function(s, c) {  
                        return s.replace(/{(\w+)}/g,  
                                function(m, p) { return c[p]; }); }  
            return function(table, name) {  
                if (!table.nodeType) table = document.getElementById(table)  
                var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}  
                
                var downloadLink = document.createElement("a"); 
                downloadLink.href = 'data:application/vnd.ms-excel;base64,' + base64(format( 
                template, ctx)); 
                var time1 = new Date().Format("yyyyMMddhhmmss");
                downloadLink.download = "项目统计" +time1+ ".xls"; 
                document.body.appendChild(downloadLink); 
                downloadLink.click(); 
                document.body.removeChild(downloadLink); 
                
                //window.location.href = uri + base64(format(template, ctx))  
            }  
        })()
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			uiResize();
		});
		$(window).resize(function(){
			uiResize();
		});
		function uiResize() {
			//边框的高度,系数可调
			$("#mainIbox").height($(window).height()-70);
			//内容的高度,系数不可调
			$("#myoaProjectStatisTable").height($("#mainIbox").height()-130);
		}
	</script>
	<style> 
	 #myoaProjectStatisTable>table>thead>tr>th,
	 #myoaProjectStatisTable>table>tbody>tr>td {
	 	white-space: nowrap;
	 }
	@media print {   
		.noprint {    
			display: none    
		}   
	}
	</style>
</head>
<body style="padding: 0px"  class="gray-bg">
	<div class="wrapper wrapper-content">
		<div id="mainIbox" class="ibox">
			<div class="ibox-title">
				<h5>项目统计结果(共${list.size()}条)</h5>
				<div class="ibox-tools">
				</div>
			</div>
    		<div class="ibox-content">
				<div class="row noprint">
					<div class="col-sm-12">
						<form:form id="searchForm" modelAttribute="oaProjectSearchCondition" action="" method="post" class="breadcrumb form-search">
							<input id="contractType" name="contractType" type="hidden" value="${oaProjectViewCondition.contractType}"/>
							<input id="beginEstablishmentTime" name="beginEstablishmentTime" type="hidden" value="${oaProjectViewCondition.beginEstablishmentTime}"/>
							<input id="endEstablishmentTime" name="endEstablishmentTime" type="hidden" value="${oaProjectViewCondition.endEstablishmentTime}"/>
							<input id="statisticsWordType" name="statisticsWordType" type="hidden" value="${oaProjectViewCondition.statisticsWordType}"/>
						</form:form>
					</div>
				</div>
				<sys:message content="${message}"/>
				<!-- 工具栏 -->
				<div class="row noprint">
					<div class="col-sm-12">
						<div class="pull-left">	
							<input id="btnCancel" class="btn noprint" type="button" value="返 回" onclick="history.go(-1)"/>&nbsp;
							<input id="btnExport" class="btn btn-primary noprint" type="button" value="导出"/>&nbsp;
							<input id="btnPrint" class="btn btn-primary noprint" type="button" value="打印"/>&nbsp;&nbsp;&nbsp;
						</div>
						<div class="pull-right">
						</div>
					</div>
				</div>
				<div id="myoaProjectStatisTable" style="width: 100%;overflow:auto;padding-bottom:15px;">
					<table id="contentTable" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
						<thead>
							<tr>
								<th>序号</th>
								<c:if test="${fn:contains(oaProjectViewCondition.statisticsWordType, 'projectNo')}">
								<th>项目编号</th></c:if>
								<c:if test="${fn:contains(oaProjectViewCondition.statisticsWordType, 'projectName')}">
								<th>项目名称</th></c:if>
								<c:if test="${fn:contains(oaProjectViewCondition.statisticsWordType, 'expectedMoney')}">
								<th>预计金额</th></c:if>
								<c:if test="${fn:contains(oaProjectViewCondition.statisticsWordType, 'projectMoney')}">
								<th>项目金额</th></c:if>
								<c:if test="${fn:contains(oaProjectViewCondition.statisticsWordType, 'projectStage')}">
								<th>项目阶段</th></c:if>
								<c:if test="${fn:contains(oaProjectViewCondition.statisticsWordType, 'contractType')}">
								<th>服务类别</th></c:if>
								<c:if test="${fn:contains(oaProjectViewCondition.statisticsWordType, 'writeTime')}">
								<th>录入时间</th></c:if>
								<c:if test="${fn:contains(oaProjectViewCondition.statisticsWordType, 'accountManager')}">
								<th>客户经理</th></c:if>
								<c:if test="${fn:contains(oaProjectViewCondition.statisticsWordType, 'projectManager')}">
								<th>工程经理</th></c:if>
								<c:if test="${fn:contains(oaProjectViewCondition.statisticsWordType, 'businessManager')}">
								<th>商务支持</th></c:if>
								<c:if test="${fn:contains(oaProjectViewCondition.statisticsWordType, 'establishmentTime')}">
								<th>立项日期</th></c:if>
								<c:if test="${fn:contains(oaProjectViewCondition.statisticsWordType, 'expectedBidTime')}">
								<th>预计投标时间</th></c:if>
								<c:if test="${fn:contains(oaProjectViewCondition.statisticsWordType, 'technicalManager')}">
								<th>技术支持</th></c:if>
								<c:if test="${fn:contains(oaProjectViewCondition.statisticsWordType, 'isBid')}">
								<th>是否投标</th></c:if>
								<c:if test="${fn:contains(oaProjectViewCondition.statisticsWordType, 'contractMoney')}">
								<th>合同金额</th></c:if>
								<c:if test="${fn:contains(oaProjectViewCondition.statisticsWordType, 'actualBidTime')}">
								<th>实际投标时间</th></c:if>
								<c:if test="${fn:contains(oaProjectViewCondition.statisticsWordType, 'bookContractTime')}">
								<th>预计签约时间</th></c:if>
								<c:if test="${fn:contains(oaProjectViewCondition.statisticsWordType, 'actualContractTime')}">
								<th>实际签约时间</th></c:if>
								<c:if test="${fn:contains(oaProjectViewCondition.statisticsWordType, 'projectStartTime')}">
								<th>项目启动时间</th></c:if>
								<c:if test="${fn:contains(oaProjectViewCondition.statisticsWordType, 'document')}">
								<th>项目文档数</th></c:if>
								<c:if test="${fn:contains(oaProjectViewCondition.statisticsWordType, 'weekreport')}">
								<th>项目周报数</th></c:if>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${list}" var="oaProject"  varStatus="status">
							<tr>
								<td>
									${status.count}
								</td>
								<c:if test="${fn:contains(oaProjectViewCondition.statisticsWordType, 'projectNo')}">
								<td>
									${oaProject.projectNo}
								</td></c:if>
								<c:if test="${fn:contains(oaProjectViewCondition.statisticsWordType, 'projectName')}">
								<td>
									${oaProject.projectName}
								</td></c:if>
								<c:if test="${fn:contains(oaProjectViewCondition.statisticsWordType, 'expectedMoney')}">
								<td>
									${oaProject.expectedMoney}
								</td></c:if>
								<c:if test="${fn:contains(oaProjectViewCondition.statisticsWordType, 'projectMoney')}">
								<td>
									${oaProject.projectMoney}
								</td></c:if>
								<c:if test="${fn:contains(oaProjectViewCondition.statisticsWordType, 'projectStage')}">
								<td>
									${fns:getDictLabel(oaProject.projectStage, 'oa_project_projectStage', '')}
								</td></c:if>
								<c:if test="${fn:contains(oaProjectViewCondition.statisticsWordType, 'contractType')}">
								<td>
									${fns:getDictLabel(oaProject.contractType, 'oa_project_contractType', '')}
								</td></c:if>
								<c:if test="${fn:contains(oaProjectViewCondition.statisticsWordType, 'writeTime')}">
								<td>
									<fmt:formatDate value="${oaProject.writeTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
								</td></c:if>
								<c:if test="${fn:contains(oaProjectViewCondition.statisticsWordType, 'accountManager')}">
								<td>
									${oaProject.accountManager.name}
								</td></c:if>
								<c:if test="${fn:contains(oaProjectViewCondition.statisticsWordType, 'projectManager')}">
								<td>
									${oaProject.projectManager.name}
								</td></c:if>
								<c:if test="${fn:contains(oaProjectViewCondition.statisticsWordType, 'businessManager')}">
								<td>
									${oaProject.businessManager.name}
								</td></c:if>
								<c:if test="${fn:contains(oaProjectViewCondition.statisticsWordType, 'establishmentTime')}">
								<td>
									<fmt:formatDate value="${oaProject.establishmentTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
								</td></c:if>
								<c:if test="${fn:contains(oaProjectViewCondition.statisticsWordType, 'expectedBidTime')}">
								<td>
									<fmt:formatDate value="${oaProject.expectedBidTime}" pattern="yyyy-MM-dd"/>
								</td></c:if>
								<c:if test="${fn:contains(oaProjectViewCondition.statisticsWordType, 'technicalManager')}">
								<td>
									${oaProject.technicalManager.name}
								</td></c:if>
								<c:if test="${fn:contains(oaProjectViewCondition.statisticsWordType, 'isBid')}">
								<td>
									${fns:getDictLabel(oaProject.isBid, 'yes_no', '')}
								</td></c:if>
								<c:if test="${fn:contains(oaProjectViewCondition.statisticsWordType, 'contractMoney')}">
								<td>
									${oaProject.contractMoney}
								</td></c:if>
								<c:if test="${fn:contains(oaProjectViewCondition.statisticsWordType, 'actualBidTime')}">
								<td>
									<fmt:formatDate value="${oaProject.actualBidTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
								</td></c:if>
								<c:if test="${fn:contains(oaProjectViewCondition.statisticsWordType, 'bookContractTime')}">
								<td>
									<fmt:formatDate value="${oaProject.bookContractTime}" pattern="yyyy-MM-dd"/>
								</td></c:if>
								<c:if test="${fn:contains(oaProjectViewCondition.statisticsWordType, 'actualContractTime')}">
								<td>
									<fmt:formatDate value="${oaProject.actualContractTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
								</td></c:if>
								<c:if test="${fn:contains(oaProjectViewCondition.statisticsWordType, 'projectStartTime')}">
								<td>
									<fmt:formatDate value="${oaProject.projectStartTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
								</td></c:if>
								<c:if test="${fn:contains(oaProjectViewCondition.statisticsWordType, 'document')}">
								<td>
									${oaProject.documentCount}
								</td></c:if>
								<c:if test="${fn:contains(oaProjectViewCondition.statisticsWordType, 'weekreport')}">
								<td>
									${oaProject.weekreportCount}
								</td></c:if>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>