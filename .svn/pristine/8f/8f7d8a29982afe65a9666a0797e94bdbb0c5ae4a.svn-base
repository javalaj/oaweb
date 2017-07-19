<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>合同统计</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript" src="${ctxStatic}/export-excel/Blob.js" charset="utf-8"></script>
	<script type="text/javascript" src="${ctxStatic}/export-excel/FileSaver.min.js" charset="utf-8"></script>
	<script type="text/javascript" src="${ctxStatic}/export-excel/ExportUtil.js" charset="utf-8"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#searchForm").validate({
				submitHandler: function(form){
					oaLoading('正在提交，请稍等...');
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
                downloadLink.download = "合同统计" +time1+ ".xls"; 
                document.body.appendChild(downloadLink); 
                downloadLink.click(); 
                document.body.removeChild(downloadLink); 
                
                //window.location.href = uri + base64(format(template, ctx))  
            }  
        })()
	</script>
	<style>     
	@media print {   
		.noprint {    
			display: none    
		}   
	}
	</style>
</head>
<body style="padding: 0px"  class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<div class="ibox-title">
				<h5>合同统计结果(共${list.size()}条)</h5>
				<div class="ibox-tools">
				</div>
			</div>
    		<div class="ibox-content">
				<div class="row noprint">
					<div class="col-sm-12">
						<form:form id="searchForm" modelAttribute="oaProjectSearchCondition" action="" method="post" class="breadcrumb form-search">
						</form:form>
					</div>
				</div>
				<sys:message content="${message}"/>
				<!-- 工具栏 -->
				<div class="row noprint">
					<div class="col-sm-12">
						<div class="pull-left">	
							<input id="btnCancel" class="btn noprint" type="button" value="返 回" onclick="history.go(-1)"/>&nbsp;
							<input id="btnPrint" class="btn btn-primary noprint" type="button" value="打印"/>&nbsp;&nbsp;&nbsp;
						</div>
						<div class="pull-right">
						</div>
					</div>
				</div>

				<table id="contentTable" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
					<thead>
						<tr>
							<th colspan="11">
								合同类别：${realContractTypeName}
								<br/>
								服务类别：
								${fns:getDictLabel(oaContractStatisticsCondition.contractType, 'oa_project_contractType', '全部类别')}
								<br/>
								立项区间：
								<fmt:formatDate value="${oaContractStatisticsCondition.beginEstablishmentTime}" pattern="yyyy-MM-dd"/>
								~
								<fmt:formatDate value="${oaContractStatisticsCondition.endEstablishmentTime}" pattern="yyyy-MM-dd"/>
							</th>
						</tr>
						<tr style="border:1px solid black">
							<th>序号</th>
							<th>项目编号</th>
							<th>项目名称</th>
							<th>项目阶段</th>
							<th>预计金额</th>
							<th>合同编号</th>
							<th>合同名称</th>
							<th>合同金额</th>
							<th>已执行</th>
							<th>待执行</th>
							<th>立项日期</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="oaContractStatistics"  varStatus="status">
							<tr style="border:1px solid black">
								<td>
									${status.count}
								</td>
								<td>
									${oaContractStatistics.projectNo}
								</td>
								<td>
									${oaContractStatistics.projectName}
								</td>
								<td>
									${oaContractStatistics.projectStageLabel}
								</td>
								<td>
									${oaContractStatistics.expectedMoney}
								</td>
								<td>
									${oaContractStatistics.contractNo}
								</td>
								<td>
									${oaContractStatistics.contractName}
								</td>
								<td>
									${oaContractStatistics.contractMoney}
								</td>
								<td>
									${oaContractStatistics.completedMoney}
								</td>
								<td>
									${oaContractStatistics.leftMoney}
								</td>
								<td>
									<fmt:formatDate value="${oaContractStatistics.establishmentTime}" pattern="yyyy-MM-dd"/>
								</td>
							</tr>
						</c:forEach>
						<tr style="border:1px solid black">
							<td>
								合计
							</td>
							<td colspan="6">
							</td>
							<td>
								${totalContractMoney}
							</td>
							<td>
								${totalCompletedMoney}
							</td>
							<td>
								${totalLeftMoney}
							</td>
							<td>
								<fmt:formatDate value="${oaContractStatistics.establishmentTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>