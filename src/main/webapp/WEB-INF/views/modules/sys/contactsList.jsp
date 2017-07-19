<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>我的通讯录</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#inputForm").validate(
								{
									rules : {
										"accountManager.name" : {
											required : true
										},
										"businessManager.name" : {
											required : true
										},
										"technicalManager.name" : {
											required : true
										},
										"projectManager.name" : {
											required : true
										},
										"expectedMoney" : {
											number : true,
											min : 0,
											max : 9999999
										}
									},
									messages : {
										"accountManager.name" : {
											required : "必填信息",
										},
										"businessManager.name" : {
											required : "必填信息",
										},
										"technicalManager.name" : {
											required : "必填信息",
										},
										"projectManager.name" : {
											required : "必填信息",
										}
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

						/* $("#btnExport")
								.click(
										function() {
											top.$.jBox
													.confirm(
															"确认要导出通讯录吗？",
															"系统提示",
															function(v, h, f) {
																if (v == "ok") {
																	$(
																			"#searchForm")
																			.attr(
																					"action",
																					"${ctx}/oa/adress/export");
																	$(
																			"#searchForm")
																			.submit();
																}
															},
															{
																buttonsFocus : 1
															});
											top.$('.jbox-body .jbox-icon').css(
													'top', '55px');
										}); */
/* 						$("#btnImport")
								.click(
										function() {
											$
													.jBox(
															$("#importBox")
																	.html(),
															{
																title : "导入数据",
																buttons : {
																	"关闭" : true
																},
																bottomText : "导入文件不能超过5M，仅允许导入“xls”或“xlsx”格式文件！"
															});
										});
 */
						// 全选 
							$("#allChk").on('ifClicked', function(event){
				if(true == $(this).is(':checked')){
					$("input[name='subChk']").iCheck('uncheck');
				}else{
					$("input[name='subChk']").iCheck('check');
				}
				 
			});
	var subChk=$("input[name='subChk']");
	
	subChk.on('ifClicked', function(event){
		if(true == $(this).is(':checked')){
			if(subChk.filter(":checked").length-1 >=subChk.length ){
				$("#allChk").iCheck('check');
			}else{
				$("#allChk").iCheck('uncheck');
			}
		}else{
			if(subChk.filter(":checked").length+1 >=subChk.length ){
				$("#allChk").iCheck('check');
			}else{
				$("#allChk").iCheck('uncheck');
			}
		}
		
	});
						/* 批量删除 */
						 $("#del_model")
								.click(
										function() {
											// 判断是否至少选择一项 
											var checkedNum = $("input[name='subChk']:checked").length;
											if (checkedNum == 0) {
												top.layer.msg('请勾选至少一条数据后再进行删除');
												return;
											}
											// 批量选择 
											confirmx(
													"确定要删除所选联系人？",
													function() {
														var checkedList = new Array();
														$(
																"input[name='subChk']:checked")
																.each(
																		function() {
																			checkedList
																					.push($(
																							this)
																							.val());
																		});
														$
																.ajax({
																	type : "POST",
																	url : "${ctx}/oa/adress/deletemore",
																	data : {
																		'delitems' : checkedList
																				.toString()
																	},
																	success : function(result) {
																		top.layer.msg("删除联系人成功！");
																		/* top.$.jBox.tip.mess = 2;
																		top.$.jBox.tip(
																						"删除联系人成功！",
																						"success",
																						{
																							persistent : true,
																							opacity : 0
																						}); */
																		$("#messageBox")
																				.show();
																		$(
																				"[name ='subChk']:checkbox")
																				.attr(
																						"checked",
																						false);
																		window.location
																				.reload();
																	}
																});
													});
										}); 

						$("#btnPrintSelect").click(function(){
							var idChecks=$("input[name='subChk']");
							var idChecksCount=0;
							for ( var i = 0; i < idChecks.length; i+=1) { 
								if(idChecks[i].checked){
									idChecksCount+=1;
								}
							}
							if(idChecksCount<1){
								top.layer.msg('请勾选至少一条数据后再进行打印');
							}else{
								$("#right").removeClass("right");
								for ( var i = 0; i < idChecks.length; i+=1) { 
									if(idChecks[i].checked){
										$(idChecks[i]).parent().parent().removeClass("noprint");
									}else{
										$(idChecks[i]).parent().parent().addClass("noprint");
									}
								}
								window.print();
								$("#right").addClass("right");
							}
						});

						$("#btnPrintAll").click(function(){
							var idChecks=$("input[name='subChk']")
							$("#right").removeClass("right");
							for ( var i = 0; i < idChecks.length; i+=1) { 
								$(idChecks[i]).parent().parent().removeClass("noprint");
							} 
							window.print();
							$("#right").addClass("right");
						});
					});
</script>
<script type="text/javascript">
	function clickTree(id) {
		location.href = "${ctx}/oa/adress/contacts?groupId=" + id;
	}
	//function menuTree(id,name){
	//	alert(id+""+name+"");
	//}

	$(function() {
		//去掉默认的contextmenu事件，否则会和右键事件同时出现。
		$(".groupDiv")[0].oncontextmenu = function(e) {
			e.preventDefault();
		};
		//012左键滚轮右键
		$(".show").mousedown(function(e) {
			if (e.button == 2) {
				//alert("你点了右键");
				//关闭所有li
				$(".update").hide();
				$(".show").children().show();
				//打开当前点击的li
				$(this).children().hide();
				$(this).prev().show();
				// $("#btnGroup").addClass("in").attr("aria-hidden",false).attr("style","display:block;");
			} else if (e.button == 0) {
				clickTree($(this).parent().val());
			}
		});

		//移动到指定分组
		function move2Group() {
		}

	});
	
	//保存对分组名字的修改
	function updateGroup(id,item) {
		//alert(id+" "+$(item).prev().val());
		location.href = "${ctx}/oa/adress/updateGroup?groupId=" + id+"&name="+encodeURI(encodeURI($(item).prev().val()));
		return false;
	}

	//删除对应的分组
	function deleteGroup(id) {
		//alert(id);
		location.href = "${ctx}/oa/adress/deleteGroup?groupId=" + id;
		return false;
	}

</script>
<script type="text/javascript">
$(document).ready(function() {
	$("#contentTable thead th").eq(0).css({"width":"20px"});
	$("#contentTable thead th").eq(1).css({"width":"50px"});
	$("#contentTable thead th").eq(2).css({"width":"140px"});
	$("#contentTable thead th").eq(3).css({"width":"80px"});
	$("#contentTable thead th").eq(4).css({"width":"80px"});
	$("#contentTable thead th").eq(5).css({"width":"80px"});
	$("#contentTable thead th").eq(6).css({"width":"80px"});
	$("#contentTable thead th").eq(7).css({"width":"150px"});
	$("#contentTable thead th").eq(8).css({"width":"180px"});
	$("#contentTable thead th").eq(9).css({"width":"120px"});
	trArray = $("#contentTable tr");
    var td;			           				            
      for (var i = 0; i < trArray.length; i++) {
          td = $(trArray[i]).find("td:eq(0)");
          $(td).css({"width":"20px"});
          td = $(trArray[i]).find("td:eq(1)");
          $(td).css({"width":"50px"});
          td = $(trArray[i]).find("td:eq(2)");
          $(td).css({"width":"140px"});
          td = $(trArray[i]).find("td:eq(3)");
          $(td).css({"width":"80px"});
          td = $(trArray[i]).find("td:eq(4)");
          $(td).css({"width":"80px"});
          td = $(trArray[i]).find("td:eq(5)");
          $(td).css({"width":"80px"});
          td = $(trArray[i]).find("td:eq(6)");
          $(td).css({"width":"80px"});
          td = $(trArray[i]).find("td:eq(7)");
          $(td).css({"width":"150px"});
          td = $(trArray[i]).find("td:eq(8)");
          $(td).css({"width":"180px"});
          td = $(trArray[i]).find("td:eq(9)");
          $(td).css({"width":"120px"});
      }	
});
</script>
<style>
@media print {
	.noprint {
		display: none
	}
}

.groupLi {
	width:100%;
	cursor: pointer;
	list-style: none;
	display: block;
	height: 25px;
	line-height: 20px;
	text-indent: 25px;
	background: url(${ctxStatic}/liuxin/img/group2.png) left top
		no-repeat;
}

.groupLiClick {
	color: #0663a2;
	background-color: #ddd;
	width: 130px;
}

/* .groupDiv {
	margin-top: 50px;
} */
.address {
	height:100%;
	overflow:hidden;
}
.inputname {
	width: 70px;
	height: 20px !important;
	margin: 0px;
	padding: 1px !important;
	text-overflow:ellipsis;
}

#left {
	float: left;
	width: 15%;
	height: 100%;
	overflow: auto;
}

.right {
	float: right;
	width: 85%;
	height:100%;
	min-height:410px;
	padding-left: 10px;
}
.accordion-heading {
	height: 34px;
	line-height: 34px;
	font-size: 14px;
}
.show div input[type="text"]{
		background: none;
}
.show div input[type="text"]:hover{
	cursor:pointer; 
	color:#0663a2;
}

.groupLiClick{
		background-color:#fff;
}
.update a{
	font-size:12px;
}
 #contentdiv{
	height: 390px;
	margin-bottom: 10px;
} 

/* .blackBorder th{
	min-width:60px;
} */
.blackBorder > td {
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
}
/* 表头固定 */
.table thead,tbody tr{
	width: calc( 100% - 1em );
    table-layout: fixed;
    display: table;
}
tbody tr{
	width: 100%;
}

.table tbody{
	overflow-y:  scroll;
    display:  block;
    height: 310px;
}
@media screen and (max-height:600px){
	#contentdiv{
		height: 300px;
	}
	.table tbody{
		height: 230px;
	}
}
</style>
<!-- <script type="text/javascript">
function changeh(){
		var innHeight=$('html').height();
		/* alert(innHeight); */
		if(innHeight>538){
			$('#contentdiv').height(innHeight-170-(innHeight-538));
		}else{
			$('#contentdiv').height(innHeight-160);
		} 
	};
	$(document).ready(function() {
		 changeh();
	});
	$(window).resize(function(){
		changeh();
	});
</script> -->
<script type="text/javascript">
	$(document).ready(function() {
		uiResize();
	});
	$(window).resize(function(){
		uiResize();
	});
	function uiResize() {
		//边框的高度,系数可调
		$("#mainIbox").height($(window).height()-45);
		//内容的高度,系数不可调
		$("#mainContent").height($("#mainIbox").height()-62);
	}
	
	
  function empty(){
	  $("#name").val("");
	  $("#iphone").val("");
  }
</script>
</head>
<%-- <body>
 <div class="ibox-content">
	<ul class="nav nav-tabs noprint">
		<li class=" active noprint"><a href="${ctx}/oa/adress/contacts">个人通讯录</a></li>
		<li class="noprint"><a href="${ctx}/oa/adress/ShareContactsList">共享通讯录</a></li>
	</ul> --%>
	
	
	
	
	<body class="gray-bg myoa-print-page">
<div class="wrapper wrapper-content">
<div id="mainIbox" class="ibox" style="margin-bottom: 0px">
	<div class="ibox-title noprint">
		<h5>个人通讯录 </h5>
	</div>
    
   <div id="mainContent" class="ibox-content" style="padding-top: 0px; padding-right: 10px;">
   	<sys:message content="${message}"/>
	
	<div  class="address">
		<div id="left" class="accordion-group noprint">
			<div class="accordion-heading">
				分组
			</div>
			<div class="groupDiv">
				<ul>
					<li	class="groupLi">
					<div class="update" hidden="true">
						<input class="inputname" type="text" name="name" value="全部联系人" style="height: 20px;">
					</div>
					<div class="show" title="全部联系人">
						<div>全部联系人&nbsp;</div>
					</div></li>
					<c:forEach var="now" items="${treeList}">
						<li	class="groupLi <c:if
								test="${cytspoaaddress.groupId==now.groupId}">groupLiClick</c:if>" value="${now.groupId }">
							<div class="update" hidden="true" style="white-space: nowrap;">
								<input class="inputname" type="text" name="name" value="${now.name}">
								<a onclick="updateGroup(${now.groupId},this)">保存</a>&nbsp;
								<a onclick="deleteGroup(${now.groupId})">删除</a>
							</div>
							<div class="show" title="${now.name}">
								<div><input disabled="disabled" type="text" style="width:100px; height: 20px; border:none; text-overflow:ellipsis; white-space:nowrap; overflow:hidden;" value="${now.name}"></div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div id="openClose" class="close">&nbsp;</div>
		<div id="right" class="right">
			<form:form id="searchForm" modelAttribute="cytspoaaddress"
				action="${ctx}/oa/adress/contacts" method="post"
				class="form-inline  noprint">
				<input id="pageNo" name="pageNo" type="hidden"
					value="${page.pageNo}" />
				<input id="pageSize" name="pageSize" type="hidden"
					value="${page.pageSize}" />
				<input id="groupId" type="hidden" name="groupId"
					value="${cytspoaaddress.groupId}">
				<sys:tableSort id="orderBy" name="orderBy" value="${page.orderBy}"
					callback="page();" />
					
				<div class="form-group">
					<label><span>姓名：</span>
					<form:input path="name" htmlEscape="false" maxlength="50"
						class="form-control" placeholder="输入姓名查找" /></label>
					<label><span>手机：</span>
					<form:input path="iphone" htmlEscape="false" maxlength="50"
						class="form-control" placeholder="输入手机号查找" /></label>
									 <%-- <table:exportExcel url="${ctx}/oa/adress/export"></table:exportExcel> 
									 <table:importExcel url="${ctx}/sys/user/import1"></table:importExcel> --%>
				<!--  <input id="btnExport"	class="btn btn-white btn-sm" type="button" value="导出" /> -->  <!-- <input
						id="btnImport" class="btn btn-white btn-sm" type="button" value="导入" /> -->
										<%-- <button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="window.location.href='${ctx}/oa/adress/contacts'"><i class="fa fa-trash"></i> 清空</button> --%>
				</div>
			<div class="row">
				<div class="col-sm-12">
				<div  class="pull-left">
					<a class="btn btn-white btn-sm " href="${ctx}/oa/adress/ShareContactsList">共享通讯录</a><!--
					 <input id="btnPrintAll" class="btn btn-white btn-sm" type="button" value="打印全部" /> -->
				<!-- 	<input id="btnPrintSelect" class="btn btn-white btn-sm" type="button" value="打印勾选" /> -->
						<a href="#" onclick="openDialogViewPrint('全部联系人', '${ctx}/oa/adress/all','80%', '80%')"
										class="btn btn-white btn-sm">打印</a>
					<a href="#" onclick="openDialog('新建联系人', '${ctx}/oa/adress/form','800px', '600px')"
										class="btn btn-white btn-sm"><i class="fa fa-edit"></i> 新增联系人</a>
					<a href="#" onclick="openDialog('新建分组', '${ctx}/oa/adress/groupform','800px', '280px')"
										class="btn btn-white btn-sm"><i class="fa fa-edit"></i> 新建分组</a>
										<a href="javascript:void(0);" id="del_model"
										class="btn btn-white btn-sm"><i class="fa fa-trash"></i> 删除</a>
										<button class="btn btn-white btn-sm " data-toggle="tooltip" data-placement="left" onclick="window.location.href='${ctx}/oa/adress/contacts'" title="刷新"><i class="glyphicon glyphicon-repeat"></i> 刷新</button>
										</div>
										
					<div  class="pull-right">
					
						<button class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="return page();">
							<i class="fa fa-search"></i> 查询
						</button>
							<button id="btnReset" class="btn btn-primary btn-rounded btn-outline btn-sm "
										onclick="empty();">
										<i class="fa fa-refresh"></i> 重置
									</button>
					</div>
				</div>
			</div>
			</form:form>
			<sys:message content="${message}" />
			 <div id="contentdiv" style="overflow-x: auto;overflow-y:hidden;">
			<table id="contentTable"
				class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable"  >
				<thead id="threadHead">
					<tr class="blackBorder">
						<th class="noprint"><input type="checkbox" id="allChk" name="idCheck" class="i-checks"/></th>
						<th>姓名</th>
						<th>公司</th>
						<th>岗位</th>
						<th>手机号</th>
						<th>办公电话</th>
						<th>QQ号</th>
						<th>电子邮箱</th>
						<th>联系地址</th>
						<th class="noprint">操作</th>
				</thead>
				<tbody>
					<c:forEach items="${page.list}" var="cytspoaaddress">
						<tr class="blackBorder">
							<td class="noprint noexport"><input type="checkbox" name="subChk"  class="i-checks"
								value="${cytspoaaddress.id}"  /></td>
							<td title="${cytspoaaddress.name}">${cytspoaaddress.name}</td>
							<td title="${cytspoaaddress.company}">${cytspoaaddress.company}</td>
							<td title="${cytspoaaddress.position}">${cytspoaaddress.position}</td>
							<td title="${cytspoaaddress.iphone}">${cytspoaaddress.iphone}</td>
							<td title="${cytspoaaddress.oph}">${cytspoaaddress.oph}</td>
							<td title="${cytspoaaddress.qq}">${cytspoaaddress.qq}</td>
							<td title="${cytspoaaddress.email}">${cytspoaaddress.email}</td>
							<td title="${cytspoaaddress.ofaddress}">${cytspoaaddress.ofaddress}</td>
							<td class="noprint" >
							<a href="#" onclick="openDialog('修改联系人', '${ctx}/oa/adress/form?id=${cytspoaaddress.id}','800px', '600px')"
										class="btn btn-success btn-xs"><i class="fa fa-edit"></i> 修改</a>
								<c:if test="${cytspoaaddress.shareFlag==1}">
									<a
								href="${ctx}/oa/adress/share?id=${cytspoaaddress.id}"
								onclick="return confirmx('确认要分享该联系人吗？', this.href)" class="btn btn-primary btn-xs"><i class="fa fa-search-plus"></i> 共享</a>
								</c:if>
						</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
				<span class="noprint" ><table:page page="${page}" ></table:page></span>
	</div>
	</div>
	</div>
	</div>
	</div>
	
	<script src="${ctxStatic}/common/wsize.min.js" type="text/javascript"></script>

</body>
</html>