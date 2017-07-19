<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>用户管理</title>
	<meta name="decorator" content="default" />
	<script type="text/javascript" src="${ctxStatic}/tableExport/libs/FileSaver/FileSaver.min.js"></script>
	<script type="text/javascript" src="${ctxStatic}/tableExport/tableExport.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#btnExport").click(function(){
		
				top.layer.confirm('确认要导出用户数据吗?', {icon: 3, title:'提示'}, function(index){
					if(getExplorer()=='ie'){
						ExportUtil.toExcel("contentTable");
					}else{
						method5("contentTable");
					}
					top.layer.close(index);
				});				
				
			});
			$("#btnExportSelect").click(function(){
				
				 var idChecks=$("input[name='idCheck']");
				var idChecksCount=0;
				for ( var i = 0; i < idChecks.length; i+=1) { 
					if(idChecks[i].checked){
						idChecksCount+=1;
					}
				}
				if(idChecksCount<1){
					top.layer.msg('请勾选至少一条数据后再进行导出');
				}else{
					top.layer.confirm('确认要导出用户数据吗?', {icon: 3, title:'提示'}, function(index){
						var tablee = document.createElement("table");
						var $tablee=$(tablee);
						$tablee.attr("id","exportTable");
						$tablee.addClass("table table-striped table-bordered table-hover table-condensed dataTables-example dataTable");
						$tablee.append($("#threadHead").clone());
						
						var tbody = document.createElement("tbody");
						var $tbody=$(tbody);
						for ( var i = 0; i < idChecks.length; i+=1) {

							if(idChecks[i].checked){
								$tbody.append($(idChecks[i]).parent().parent().parent().clone());
							}
						}
						$tablee.append($tbody);
						var tableee=$tablee[0];
						document.body.appendChild(tableee);
						var timex = new Date().Format("yyyyMMddhhmmss");
		    	        var name = "公司通讯录" + timex;
						$("#exportTable").tableExport({worksheetName: '公司通讯录',fileName: name,type:'excel', excelstyles:['border-bottom', 'border-top', 'border-left', 'border-right']});
		    	       	document.body.removeChild(tablee);
						top.layer.close(index);
					});
					
					
				} 
				
				
			});
			
			$("#btnPrintSelect").click(function(){
				var idChecks=$("input[name='idCheck']");
				var idChecksCount=0;
				for ( var i = 0; i < idChecks.length; i+=1) { 
					if(idChecks[i].checked){
						idChecksCount+=1;
					}
				}
				if(idChecksCount<1){
					top.layer.msg('请勾选至少一条数据后再进行打印');
				}else{
					for ( var i = 0; i < idChecks.length; i+=1) { 
						if(idChecks[i].checked){
							$(idChecks[i]).parent().parent().parent().removeClass("noprint");
						}else{
							$(idChecks[i]).parent().parent().parent().addClass("noprint");
						}
					}
					window.print();
				}
			});
			
			
			
			$("#checkAll").on('ifClicked', function(event){
				if(true == $(this).is(':checked')){
					$("input[name='idCheck']").iCheck('uncheck');
				}else{
					$("input[name='idCheck']").iCheck('check');
				}
				 
			});
			
			var subChk=$("input[name='idCheck']");
			
			subChk.on('ifClicked', function(event){
				if(true == $(this).is(':checked')){
					if(subChk.filter(":checked").length-1 >=subChk.length ){
						$("#checkAll").iCheck('check');
					}else{
						$("#checkAll").iCheck('uncheck');
					}
				}else{
					if(subChk.filter(":checked").length+1 >=subChk.length ){
						$("#checkAll").iCheck('check');
					}else{
						$("#checkAll").iCheck('uncheck');
					}
				}
				
			});
		});
		function page(n,s){
			if(n) $("#pageNo").val(n);
			if(s) $("#pageSize").val(s);
			$("#searchForm").attr("action","${ctx}/oa/cyTspOaMonthlyPlan/allList");
			$("#searchForm").submit();
	    	return false;
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
        	tableToExcel(tableid)  
        }
        
        
     // 对Date的扩展，将 Date 转化为指定格式的String
     // 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符， 
     // 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字) 
     // 例子： 
     // (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423 
     // (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18 
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
        
     var tableToExcel = (function () {
    	    var uri = 'data:application/vnd.ms-excel;base64,',
    	        template = '<html><head><meta charset="UTF-8"></head><body><table>{table}</table></body></html>',
    	        base64 = function (s) {
    	            return window.btoa(unescape(encodeURIComponent(s)))
    	        },
    	        format = function (s, c) {
    	            return s.replace(/{(\w+)}/g,
    	                function (m, p) {
    	                    return c[p];
    	                });
    	        };
    	    return function (table, name) {
    	        if (!table.nodeType) {
    	            table = document.getElementById(table)
    	        };
    	        var ctx = {
    	            worksheet: name || 'Worksheet',
    	            table: table.innerHTML
    	        };
    	        var downloadLink = document.createElement("a");
    	        downloadLink.href = 'data:application/vnd.ms-excel;base64,' + base64(format(
    	            template, ctx));
    	        var time1 = new Date().Format("yyyyMMddhhmmss");
    	        downloadLink.download = "公司通讯录" + time1 + ".xls";
    	        document.body.appendChild(downloadLink);
    	        downloadLink.click();
    	        document.body.removeChild(downloadLink);
    	    }
    	})()
        
	</script>
	<script type="text/javascript">
	$(document).ready(function() {
		
		var widthNum1=$(".blackBorder th:nth-of-type(1)").width()
		+$(".blackBorder th:nth-of-type(2)").width()
		+$(".blackBorder th:nth-of-type(3)").width()
		+$(".blackBorder th:nth-of-type(5)").width()+5*18;
		
		var widthNum2=$(".blackBorder th:nth-of-type(4) span:nth-of-type(1)").width()
		+$(".blackBorder th:nth-of-type(4) span:nth-of-type(2)").width()
		+$(".blackBorder th:nth-of-type(4) span:nth-of-type(5)").width()
		+$(".blackBorder th:nth-of-type(4) span:nth-of-type(6)").width()+6*17-1;
		
		
		$('.spanw').width(($(".table").width()-widthNum1-widthNum2)/2); 
		
		$(".blackBorder").each(function(){
			/* console.log($(this).find(".faall").find(".faspan").length); */
			$(this).find(".faall").each(function(){
				console.log($(this).find(".faspan").length);
				$(this).find(".fastart").height(($(this).find(".faspan").length)*30);
				$(this).find(".fastart span").css({"line-height":($(this).find(".faspan").length)*30 + "px"});
				$(this).find(".weekgre").css({"margin-top":(-($(this).find(".faspan").length)*30/2)+15+"px"});
				/* $(this).find(".fastart").children().css({"line-height":($(this).find(".faspan").length)*30)+"px"}); */
			});	
		});
		
		$("tr th span:nth-of-type(6),tr th span:nth-of-type(7),.faspan span:nth-of-type(3),.faspan span:nth-of-type(4)").width(($(".table").width()-642)/2);
		
		/* $(".blackBorder").each(function(i,domEle){
			
			$(domEle).children().each(function(j,divchild){
				$(domEle).children().each(function(k){
					 alert(k);
				});
			});
		}); */
		/* $(".fastart").height((j+1)*30); */
		
		/* alert($('.spanw').width()); */
		
		
		
		 /*$(".table tr td span").height($(".faspan").height());
		$(".table tr td span:nth-of-type(1),.table tr td span:nth-of-type(2),.table tr td span:nth-of-type(5),.table tr td span:nth-of-type(6)")
		.css({"line-height":$(".faspan").height()+"px"}); */
	})
	</script>
<style>
@media print {
	.noprint {
		display: none
	}
	.blackBorder{
		border:1px solid black
	}
}
.noExp{
	display: none
}

.table-c table {
	border-right: 1px solid #F00;
	border-bottom: 1px solid #F00
}

.table-c table td {
	border-left: 1px solid #F00;
	border-top: 1px solid #F00
}

.table .tdmain{
	padding:0;
}


.table tr th span,.table tr td span{
	display:inline-block;
	padding:0 8px;
}
.table tr th span,.table .fastart span,.table tr td .faspan span{
border-right:1px solid #ddd;
}

.table tr .fastart{
	float:left;
}

.table tr .faspan{
	display: inline-block;
}

.table th span:last-child{
	border:none;
}
.table tr td span{
	height:30px;
	line-height:30px;
	margin-left:-4px;
}

.table tr td span:first-child{
	margin-left:0;
}

.table .faall{
	display:table;
}

.table .fastart span{
 height:100%;
}

.table tr .faspan span:nth-type-of(3),.table tr td span:nth-type-of(4){
	word-break:normal;display:block;word-wrap:break-word;overflow: hidden;
}

.table tr th span{
}
.table tr td .faall{
	border-bottom:1px solid #ddd;
}

.table tr td .faall:last-child{
	border:none;
}
.faall>span{
	float:right;
}
</style>
</head>
<oa:bodyPrint>
	<div class="wrapper wrapper-content">
				
				<div class="row">
					<div class="col-sm-12">
						<form:form id="searchForm" modelAttribute="user" action="${ctx}/oa/cyTspOaMonthlyPlan/allList" method="post" class="form-inline noprint">
							<input id="pageNo" name="pageNo" type="hidden" value="${listWeekPlan.pageNo}" />
							<input id="pageSize" name="pageSize" type="hidden" value="${listWeekPlan.pageSize}" />
							<input id="pageSize" name="offid" type="hidden" value="${offid}" />
							<div class="form-group">
								<label>选择年月：
								<input name="plandate" id="date1" type="text" readonly="readonly"
			maxlength="20" class="form-control Wdate laydate-icon layer-date required"
			value="<fmt:formatDate value="${end}" pattern="yyyy-MM"/>"
			onclick="WdatePicker({dateFmt:'yyyy-MM',isShowClear:false});" />
								</label>
							</div>
						</form:form>
						<sys:message content="${message}" />
						<!-- 工具栏 -->
						<div class="row noprint">
							<div class="col-sm-12">
								<div class="pull-left">
								</div>
								<div class="pull-right">
									<button class="btn btn-primary btn-rounded btn-outline btn-sm "
										onclick="return page();">
										<i class="fa fa-search"></i> 查询
									</button>
									<button id="btnReset" class="btn btn-primary btn-rounded btn-outline btn-sm "
										onclick="reset();">
										<i class="fa fa-refresh"></i> 重置
									</button>
								</div>
							</div>
						</div>	
						<table id="contentTable" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
							<thead id="threadHead">
								<tr class="blackBorder">
									<th class="tdmain"><span style="width:60px;">姓名</span><span style="width:80px;">归属部门</span><span style="width:60px;">计划周</span><span style="width:70px;">开始时间</span><span style="width:70px;">结束时间</span><span>工作计划</span><span>交付物</span><span style="width:70px;">个人权重</span><span style="width:60px;">任务分</span><span style="width:60px;">周总分</span></th>
									<th style="width:60px;">月平均分</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach  items="${map}" var="map">
									<tr class="blackBorder">
										<td class="tdmain">
										<c:forEach items="${map.value}" var="weekplan">
										<div class="faall">
										<div class="fastart">
										<span style="width:60px;">${weekplan.name}</span>
											<span style="width:80px;">${weekplan.officeName}</span>
											<span style="width:60px;">${weekplan.weeksign}</span>
											</div>
											<c:forEach items="${weekplan.userweekrecord}" var="userweekrecord">
											<div class="faspan clearfix" style="">
											<span style="width:70px;">
											
									<c:choose>
										<c:when test="${userweekrecord.beginday=='1' }">周一</c:when>
										<c:when test="${userweekrecord.beginday=='2' }">周二</c:when>
										<c:when test="${userweekrecord.beginday=='3' }">周三</c:when>
										<c:when test="${userweekrecord.beginday=='4' }">周四</c:when>
										<c:when test="${userweekrecord.beginday=='5' }">周五</c:when>
										<c:when test="${userweekrecord.beginday=='6' }">周六</c:when>
										<c:otherwise>周日</c:otherwise>
									</c:choose></span>
									<span style="width:70px;"><c:choose>
										<c:when test="${userweekrecord.endday=='1' }">周一</c:when>
										<c:when test="${userweekrecord.endday=='2' }">周二</c:when>
										<c:when test="${userweekrecord.endday=='3' }">周三</c:when>
										<c:when test="${userweekrecord.endday=='4' }">周四</c:when>
										<c:when test="${userweekrecord.endday=='5' }">周五</c:when>
										<c:when test="${userweekrecord.endday=='6' }">周六</c:when>
										<c:otherwise>周日</c:otherwise>
									</c:choose>
									</span>
									<span>
									${userweekrecord.content}
									</span>
									<span>
									${userweekrecord.deliverables}
									</span>
									<span style="width:70px;">
										${userweekrecord.important}
									</span>
									<span style="width:60px;">
									${userweekrecord.testScore }
									</span>
									
									</div>
									</c:forEach>
									<span style="width:60px;" class="weekgre">
									${weekplan.weekSum }
									</span>
										</div>
										</c:forEach>
										</td>
										<td>${map.key }</td>
									</tr>
									</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
</oa:bodyPrint>
</html>