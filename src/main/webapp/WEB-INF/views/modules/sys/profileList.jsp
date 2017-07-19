<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>员工档案管理</title>
	<meta name="decorator" content="default"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<script type="text/javascript" src="${ctxStatic}/tableExport/libs/FileSaver/FileSaver.min.js"></script>
	<script type="text/javascript" src="${ctxStatic}/tableExport/tableExport.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		 changeh();
		$(".hideInfo").hide();
		/* $("#contentTable th,#contentTable td").css({"width":"150px"}); */
		$("#contentTable th").eq(0).css({"width":"20px"});
		$("#contentTable th").eq(1).css({"width":"30px"});
		$("#contentTable th").eq(2).css({"width":"40px"});
		$("#contentTable th").eq(3).css({"width":"60px"});
		$("#contentTable th").eq(4).css({"width":"30px"});
		$("#contentTable th").eq(5).css({"width":"40px"});
		$("#contentTable th").eq(26).css({"width":"60px"});
		$("#contentTable th").eq(27).css({"width":"100px"});
		trArray = $("#contentTable tr");
        var td;			           				            
          for (var i = 0; i < trArray.length; i++) {
              td = $(trArray[i]).find("td:eq(0)");
              $(td).css({"width":"20px"});
              td = $(trArray[i]).find("td:eq(1)");
              $(td).css({"width":"30px"});
              td = $(trArray[i]).find("td:eq(2)");
              $(td).css({"width":"40px"});
              td = $(trArray[i]).find("td:eq(3)");
              $(td).css({"width":"60px"});
              td = $(trArray[i]).find("td:eq(4)");
              $(td).css({"width":"30px"});
              td = $(trArray[i]).find("td:eq(5)");
              $(td).css({"width":"40px"});
              td = $(trArray[i]).find("td:eq(26)");
              $(td).css({"width":"60px"});
              td = $(trArray[i]).find("td:eq(27)");
              $(td).css({"width":"100px"});
          }	
		$("#showAll").toggle(
				  function(){
					  $(".hideInfo").show();
						$("#showAll").text("恢复默认");
						$(".tablediv").css({"overflow-x":"auto"});
						$("#contentTable th,#contentTable td").css({"width":"150px"});
						$("#contentTable th").eq(0).css({"width":"20px"});
						$("#contentTable th").eq(1).css({"width":"30px"});
						$("#contentTable th").eq(2).css({"width":"40px"});
						$("#contentTable th").eq(3).css({"width":"60px"});
						$("#contentTable th").eq(4).css({"width":"30px"});
						$("#contentTable th").eq(5).css({"width":"40px"});
						$("#contentTable th").eq(6).css({"width":"60px"});
						$("#contentTable th").eq(7).css({"width":"120px"});
						$("#contentTable th").eq(8).css({"width":"40px"});
						$("#contentTable th").eq(9).css({"width":"60px"});
						$("#contentTable th").eq(10).css({"width":"80px"});
						$("#contentTable th").eq(11).css({"width":"30px"});
						trArray = $("#contentTable tr");
				          var td;			           				            
				            for (var i = 0; i < trArray.length; i++) {
				                td = $(trArray[i]).find("td:eq(0)");
				                $(td).css({"width":"20px"});
				                td = $(trArray[i]).find("td:eq(1)");
				                $(td).css({"width":"30px"});
				                td = $(trArray[i]).find("td:eq(2)");
				                $(td).css({"width":"40px"});
				                td = $(trArray[i]).find("td:eq(3)");
				                $(td).css({"width":"60px"});
				                td = $(trArray[i]).find("td:eq(4)");
				                $(td).css({"width":"30px"});
				                td = $(trArray[i]).find("td:eq(5)");
				                $(td).css({"width":"40px"});
				                td = $(trArray[i]).find("td:eq(6)");
				                $(td).css({"width":"60px"});
				                td = $(trArray[i]).find("td:eq(7)");
				                $(td).css({"width":"120px"});
				                td = $(trArray[i]).find("td:eq(8)");
				                $(td).css({"width":"40px"});
				                td = $(trArray[i]).find("td:eq(9)");
				                $(td).css({"width":"60px"});
				                td = $(trArray[i]).find("td:eq(10)");
				                $(td).css({"width":"80px"});
				                td = $(trArray[i]).find("td:eq(11)");
				                $(td).css({"width":"30px"});
				            }	
				 },
				  function(){
					 $(".hideInfo").hide();
						$("#showAll").text("显示全部");
						$(".tablediv").css({"overflow-x":"hidden"});
						$("#contentTable th").eq(0).css({"width":"20px"});
						$("#contentTable th").eq(1).css({"width":"30px"});
						$("#contentTable th").eq(2).css({"width":"40px"});
						$("#contentTable th").eq(3).css({"width":"60px"});
						$("#contentTable th").eq(4).css({"width":"30px"});
						$("#contentTable th").eq(5).css({"width":"40px"});
						$("#contentTable th").eq(17).css({"width":"135px"});
						$("#contentTable th").eq(18).css({"width":"135px"});
						$("#contentTable th").eq(26).css({"width":"60px"});
						$("#contentTable th").eq(27).css({"width":"100px"});
						trArray = $("#contentTable tr");
				        var td;			           				            
				          for (var i = 0; i < trArray.length; i++) {
				              td = $(trArray[i]).find("td:eq(0)");
				              $(td).css({"width":"20px"});
				              td = $(trArray[i]).find("td:eq(1)");
				              $(td).css({"width":"30px"});
				              td = $(trArray[i]).find("td:eq(2)");
				              $(td).css({"width":"40px"});
				              td = $(trArray[i]).find("td:eq(3)");
				              $(td).css({"width":"60px"});
				              td = $(trArray[i]).find("td:eq(4)");
				              $(td).css({"width":"30px"});
				              td = $(trArray[i]).find("td:eq(5)");
				              $(td).css({"width":"40px"});
				              td = $(trArray[i]).find("td:eq(17)");
				              $(td).css({"width":"135px"});
				              td = $(trArray[i]).find("td:eq(18)");
				              $(td).css({"width":"135px"});
				              td = $(trArray[i]).find("td:eq(26)");
				              $(td).css({"width":"60px"});
				              td = $(trArray[i]).find("td:eq(27)");
				              $(td).css({"width":"100px"});
				          }	
				  }			
				);	
		function getNowFormatDate() {
		    var date = new Date();
		    var seperator1 = "-";
		    var seperator2 = ":";
		    var month = date.getMonth() + 1;
		    var strDate = date.getDate();
		    if (month >= 1 && month <= 9) {
		        month = "0" + month;
		    }
		    if (strDate >= 0 && strDate <= 9) {
		        strDate = "0" + strDate;
		    }
		    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate		          
		    return currentdate;
		}
		//勾选导出
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
					trArray = $("#exportTable tr");
			          var td;			           				            
			            for (var i = 0; i < trArray.length; i++) {
			                td = $(trArray[i]).find("td:eq(0)");
			                $(td).remove();
			            }			            			        						
			            $("#exportTable thead tr th:first").remove();
					var sFileName="员工档案"+getNowFormatDate()
					$("#exportTable").tableExport({worksheetName: '员工档案',fileName: sFileName,type:'excel', excelstyles:['border-bottom', 'border-top', 'border-left', 'border-right']});
	    	       	document.body.removeChild(tablee);
					top.layer.close(index);
				});				
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
	function changeh(){
		var innHeight=$('html').height();
		/* alert(innHeight); */
		if(innHeight>538){
			$('table tbody').height(innHeight-177-(innHeight-538));
		}else{
			$('table tbody').height(innHeight-220);
		}
		 
	};
	$(window).resize(function(){
		changeh();
	});
	</script>
	<style>
		.pull-left a .fa,.pull-left button .fa{
        	margin-right:4px;
        }
        td{mso-number-format:'\@';}
         table tbody {  
		    display:block;  
		    height:350px;  
		    overflow-y:scroll;
		}    
		table thead, tbody tr {  
		    display:table;  
		    width:100%;
		    table-layout:fixed;  
		}  
		  
		table thead {  
		    width: calc( 100% - 1em )  
		}  
	</style>
</head>
<body>
	<sys:message content="${message}"/>
	<!-- 查询条件 -->
	<div class="row" >
	<div class="col-sm-12">
	<form:form id="searchForm" modelAttribute="user" action="${ctx}/sys/user/profileList" method="post" class="form-inline ">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<input name="office.id" type="hidden" value="${user.office.id}"/>
		<sys:tableSort id="orderBy" name="orderBy" value="${page.orderBy}" callback="page();"/>
		<div class="form-group">				
			<span>姓&nbsp;&nbsp;&nbsp;名：</span><form:input path="name" htmlEscape="false" maxlength="50" class="form-control" style="width:200px;"/>			
		</div>
	</form:form>
	<br/></div></div>	
		<!-- 工具栏 -->
	<div class="row">
	<div class="col-sm-12">
		<div class="pull-left">
			<%-- <shiro:hasPermission name="sys:user:import"> --%>
						<%-- <table:importExcel url="${ctx}/sys/user/import"></table:importExcel> --%>
						<%-- <oa:fileImportForm  actionUrl="${ctx}/sys/user/import" 
												buttonText="导入" 
												templateUrl="${ctxStatic}/template/sys/user/profileData.xlsx" 
												title="员工档案EXCEL导入" 
												id="sysImport"
												filePathName="file"></oa:fileImportForm> --%>	<!-- 导入按钮 -->
					<%-- </shiro:hasPermission> --%>
					<%-- <shiro:hasPermission name="sys:user:export"> --%>
					<!-- 导出按钮 -->
						<button id="btnExportSelect" class="btn btn-white btn-sm" ><i class="fa fa-file-excel-o"></i>导出</button>						
						<table:editProfile url="${ctx}/sys/user/profileForm" id="contentTable"></table:editProfile>
						<button id="profileOutState" class="btn btn-white btn-sm " data-toggle="tooltip"
						data-placement="left" onclick="window.location.href='${ctx}/sys/user/profileOutState'"  title="离职人员档案">
						 离职人员档案
					</button>
						 <button class="btn btn-white btn-sm " data-toggle="tooltip"
							data-placement="left" id="showAll"  title="显示全部">
							 显示全部
						</button>																				 
<%-- 	    <button class="btn btn-white btn-sm " data-toggle="tooltip"
						data-placement="left" onclick="window.location.href='${ctx}/sys/user/profileList'" title="刷新">
						<i class="glyphicon glyphicon-repeat"></i> 刷新
					</button> --%>
			</div>
			<div class="pull-right">
					<button class="btn btn-primary btn-rounded btn-outline btn-sm "
						onclick="search()" style="outline-style: none;">
						<i class="fa fa-search"></i> 查询
					</button>
					<button class="btn btn-primary btn-rounded btn-outline btn-sm " style="outline-style: none;"
						onclick="reset()">
						<i class="fa fa-refresh"></i> 重置
					</button>
				</div>
	</div>
	</div>
	<div class="tablediv" style="width:100%;max-height:500px;">	
	<table id="contentTable" class="table table-striped table-bordered  table-hover table-condensed  dataTables-example dataTable no-footer">
		<thead id="threadHead"><tr><th  style="width: 20px" id="checkHeader"><input type="checkbox"
										id="checkAll" class="i-checks"/></th><th>序号</th><th>部门</th><th>姓名</th><th >性别</th><th >状态</th><th class="hideInfo">婚姻状况</th><th class="hideInfo">籍贯</th><th class="hideInfo">职务</th><th class="hideInfo">岗位</th><th class="hideInfo">出生年月</th><th class="hideInfo">年龄</th><th class="hideInfo">毕业院校</th><th class="hideInfo">最高学历</th><th class="hideInfo">专业</th><th class="hideInfo">毕业时间</th><th class="hideInfo">参加工作时间</th><th >身份证号码</th><th>联系方式</th><th class="hideInfo">入职时间</th><th class="hideInfo">转正日期</th><th class="hideInfo">入职工作年限(年)</th><th class="hideInfo">是否已办社保</th><th class="hideInfo">是否已签合同</th><th class="hideInfo">劳动合同期限</th><th class="hideInfo">视为第几次签订劳动合同</th><th>档案编号</th><th>备注</th> <%-- <shiro:hasPermission name="sys:user:edit"><th>操作</th></shiro:hasPermission> --%></tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="user"  varStatus="status">
			<tr>
				<tr>
				<td style="width: 20px"><input type="checkbox" name="idCheck" value="${user.id}" id="${user.id}" class="i-checks"/></td>								
				<td style="width: 40px">${status.index + 1}</td>
				<td>${user.office.name}</td>
				<td>${user.name}</td>
				<td >${fns:getDictLabel(user.gender, 'sex', '')}</td>
				<td>${fns:getDictLabel(user.state, 'user_state', '')}</td>
				<td  class="hideInfo">${fns:getDictLabel(user.marriage, 'marriage', '')}</td>
				<td  class="hideInfo">${user.registeredAdd}</td>
				<td  class="hideInfo">${fns:getDictLabel(user.title, 'user_position', '')}</td>
				<td  class="hideInfo">${user.duty}</td>
				<td  class="hideInfo"><fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd"/></td>
				<td  class="hideInfo">${user.age}</td>
				<td  class="hideInfo">${user.school}</td>
				<td  class="hideInfo">${user.education}</td>
				<td  class="hideInfo">${user.major}</td>
				<td  class="hideInfo"><fmt:formatDate value="${user.graduateDate}" pattern="yyyy-MM-dd"/></td>
				<td  class="hideInfo"><fmt:formatDate value="${user.workdate}" pattern="yyyy-MM-dd"/></td>
				<td class="identification" data-tableexport-msonumberformat="\@"><c:if test="${not empty user.identificationum}">${user.identificationum}</c:if></td>
				<td>${user.mobile}</td>
				<td  class="hideInfo"><fmt:formatDate value="${user.indate}" pattern="yyyy-MM-dd"/></td>
				<td  class="hideInfo"><fmt:formatDate value="${user.pdate}" pattern="yyyy-MM-dd"/></td>
				<td  class="hideInfo">${user.workYear}</td>
				<td  class="hideInfo">${fns:getDictLabel(user.socialSecurity, 'user_socialSecurity', '')}</td>
				<td  class="hideInfo">${fns:getDictLabel(user.postcode, 'user_socialSecurity', '')}</td>
				<td  class="hideInfo"><c:if test="${not empty user.contractStart &&not empty user.contractEnd}">
				<fmt:formatDate value="${user.contractStart}" pattern="yyyy-MM-dd"/>至<fmt:formatDate value="${user.contractEnd}" pattern="yyyy-MM-dd"/></c:if></td>
				<td  class="hideInfo">${fns:getDictLabel(user.contractNum, 'user_contractNum', '')}</td>
				<td>${user.fileNumber}</td>
				<td>${user.remarks}</td>
				<%-- <shiro:hasPermission name="sys:user:edit"><td>
    			<a href="${ctx}/sys/user/profileForm?id=${user.id}" class="btn btn-success btn-xs"><i class="fa fa-edit"></i>修改</a>															
				</td></shiro:hasPermission> --%>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	</div>
	<table:page page="${page}"></table:page>
</body>
</html>