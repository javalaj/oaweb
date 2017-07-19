<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>发起任务</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document).ready(function() {
		top.$.jBox.tip.mess = null;
	});
	function page(n, s) {
		location = '${ctx}/act/task/process/?pageNo=' + n + '&pageSize=' + s;
	}
</script>
<style type="text/css">
body, div, ul, ol, li, a, p, span {
	margin: 0;
	padding: 0;
}

ul, ol, li {
	list-style-type: none;
}

a {
	text-decoration: none;
	color: #666a6d;
}

.flowtb-left, .hrtable, .costtable {
	float: left;
}

.flowtb {
	width: 278px;
	border: 1px solid #ddd;
	margin: 0 20px 20px 0;
}

.flowtable ul {
	margin: 4px 6px 12px 6px;
}

.flowtable ul li {
	margin: 0 4px;
	border-bottom: 1px dashed #ddd;
}

.flowtable .flowtb-th {
	height: 36px;
	line-height: 36px;
	border-bottom: 1px solid #ddd;
	background: #efefef;
	font-size: 16px;
	text-align: center;
}

.flowtable ul li a {
	display: block;
	height: 36px;
	line-height: 36px;
}

.flowtable ul li a:hover {
	color: #35a5e7;
}
</style>
</head>
<body style="padding: 0px" class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<div class="ibox-title">
				<h5>新建事项 </h5>
			</div>
			<div class="ibox-content" style="overflow: hidden;">
				<!-- 工具栏 -->
				<div class="row">
					<div class="col-sm-12">
						<div class="pull-left">
							<%-- 		<a  class="btn btn-white btn-sm "  href="${ctx}/act/task/todo/"><i class="fa fa-hand-rock-o"></i>待办任务</a>
								<a  class="btn btn-white btn-sm "  href="${ctx}/act/task/historic/"><i class="fa fa-history"></i>已办任务</a>
								<a class="btn btn-white btn-sm "  href="${ctx}/act/task/tosend/"><i class="fa fa-location-arrow"></i>已发任务</a> --%>
						</div>
					</div>
				</div>
				<%-- <ul class="nav nav-tabs">
						<li><a  class="btn btn-white btn-sm "  href="${ctx}/act/task/todo/">待办任务</a></li>
						<li><a   class="btn btn-white btn-sm "  href="${ctx}/act/task/historic/">已办任务</a></li>
						<li><a  class="btn btn-white btn-sm "  href="${ctx}/act/task/tosend/">已发任务</a></li>
						<li class="active"><a  class="btn btn-white btn-sm "  href="${ctx}/act/task/process/">新建任务</a></li>
					</ul> --%>
				<sys:message content="${message}" />
				<div class="flowtable">
					<div class="flowtb-left">
						<div class="admtable flowtb">
							<p class="flowtb-th">行政类流程（6）</p>
							<ul>
								<li><a
									href="${ctx}/fixedassets/assetsEquipment/claimList?assetsEquipment.condition=1">固定资产领用流程</a>
								</li>
								<li><a href="${ctx}/oa/computerpurchase/computerPurchase">办公电脑申购流程</a>
								</li>
								<li><a href="${ctx}/oa/oaSealUse/form">用印（公章、合同章）申请流程</a></li>
								<li><a
									href="${ctx}/oa/qualificationb/oaQualificationb/form">资质借用申请流程</a>
								</li>
								<li><a href="${ctx}/oa/oaUsecar/form">用车申请流程</a></li>
								<li><a
									href="${ctx}/oa/publicprivatecar/oaPublicPrivateCars/form">私车公用申请流程</a>
								</li>

							</ul>
						</div>
						<div class="itemtable flowtb">
							<p class="flowtb-th">项目类流程（1）</p>
							<ul>
								<li><a href="${ctx}/oa/project/oaProjectApproval/form">售前项目立项申请流程</a>
								</li>
								<!-- <li><a href="#">合同审批流程</a></li>
								<li><a href="#">产品申购流程</a></li>
								<li><a href="#">合同归档流程</a></li>
								<li><a href="#">是否参与招投标流程</a></li>
								<li><a href="#">招投标流程</a></li>
								<li><a href="#">付款申请流程</a></li>
								<li><a href="#">验货完成流程</a></li>
								<li><a href="#">售后服务流程</a></li> -->
							</ul>
						</div>
					</div>
					<div class="hrtable flowtb">
						<p class="flowtb-th">人事类流程（10）</p>
						<ul>
							<li><a href="${ctx}/oa/emp/oaEmpJoinApproval/form">员工入职审批流程</a></li>
							<%--
							 <li><a href="${ctx}/oa/oaEmployeeFormal/form">员工转正申请流程</a></li>
							 --%>
							<li><a href="${ctx}/oa/oaEmployeeFormal/form">员工转正申请流程</a></li>
							<li><a href="${ctx}/oa/staffturnover/staffTurnover/form">人员异动申请流程</a></li>
							<li><a href="${ctx}/oa/coding/oaProVacate/form">员工请假申请流程</a>
							</li>
							<li><a href="${ctx}/oa/oaForgetclock/form">员工忘打卡申请流程</a></li>
							<li><a href="${ctx}/oa/oaOvertime/form">员工加班申请流程</a></li>
							<li><a href="${ctx}/oa/coding/oaProVacate/tx">员工调休申请流程</a></li>
							<li><a href="${ctx}/oa/oaGoout/form">员工外出申请流程</a></li>
							<li><a href="${ctx}/oa/oaOutwork/form">员工出差申请流程</a></li>
							<li><a href="${ctx}/oa/staff/oaStaffupdated/form">人员增补流程</a>
							</li>
						</ul>
					</div>
					<div class="costtable flowtb">
						<p class="flowtb-th">费用类流程（3）</p>
						<ul>
							<li><a href="${ctx}/oa/oaPcSubsidy/form">电脑补贴申请流程</a></li>
							<%-- <li><a href="${ctx}/oa/loan/oaLoanDailyApproval/form">员工日常借支流程</a>
							</li> --%>
							<li><a href="${ctx}/oa/oaSpacialLoan/form">专项借支流程</a></li>
							
							<li><a href="${ctx}/oa/enreimb/oaEnreimb/form?node=0">招待费申请流程</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
