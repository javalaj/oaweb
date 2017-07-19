<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>整理后每日打卡资料管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document).ready(function() {

	});
	function page(n, s) {
		$("#pageNo").val(n);
		$("#pageSize").val(s);
		$("#searchForm").submit();
		return false;
	}
	function to(str) {
		$("#searchDate").val(str);
		$("#btnSubmit").click();
	}
	function vacateApply(){
		window.location = "/oa/a/oa/coding/oaProVacate/form";
	}
</script>
<style type="text/css">
ul,ol,li {
	list-style: none;
}

.oa {
	width: 1200px;
}

.year-month {
	float: left;
	width: 148px;
	overflow: hidden;
	position: relative;
	padding: 10px;
}

.year-month ul {
	margin: 10px;
}

.year-month ul li {
	line-height: 24px;
}

.weeks {
	float: left;
	border-left: 1px solid #dedede;
	padding-left: 10px;
}

.week-table {
	width: 450px;
	border: 1px solid #dedede;
	overflow: hidden;
	float: left;
}

.secondweek,.forthweek,.sixthweek {
	margin-left: 40px;
}

.thirdweek,.fifthweek {
	clear: both;
}

.thirdweek,.forthweek,.fifthweek,.sixthweek {
	margin-top: 30px;
}

.week-table li {
	float: left;
}

.weektb-tb {
	clear: both;
}

.weektb-tb {
	border-top: 1px solid #dedede;
	margin-left: 0px;
}

.weektb-th {
	margin-left: 0px;
}

.weektb-th li,.weektb-tb li {
	width: 90px;
	height: 32px;
	line-height: 32px;
	text-align: center;
}

.weektb-th li {
	background: #eee;
	font-size: 16px;
}

.late li {
	color: #e51212;
}
</style>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/oa/coding/oaCollectCoding/">每日打卡资料列表</a>
		</li>
	</ul>
	<form:form id="searchForm" modelAttribute="oaCollectCoding"
		action="${ctx}/oa/coding/oaCollectCoding/" method="post"
		class="breadcrumb form-search">
		<legend>${user.name}${date}考勤报告</legend>
		<input type="hidden" name="searchDate" id="searchDate" />
		<ul class="ul-form">
			<li class="btns"><input id="btnSubmit" class="btn btn-primary"
				type="submit" value="查询" />
			</li>
			<li class="btns"><input id="vacate" class="btn btn-primary"
				type="button" value="请假" onclick="vacateApply()"/>
			</li>
			<li class="btns">	<input id="btnCancel" class="btn" type="button" value="返 回"
				onclick="history.go(-1)" /></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<div class="oa">
		<div class="year-month">
			<a href="javascript:void(0);">2016</a>
			<ul>
				<li><a href="javascript:void(0);" onclick="to('2016-01');">2016-01</a>
				</li>
				<li><a href="javascript:void(0);" onclick="to('2016-02');">2016-02</a>
				</li>
				<li><a href="javascript:void(0);" onclick="to('2016-03');">2016-03</a>
				</li>
				<li><a href="javascript:void(0);" onclick="to('2016-04');">2016-04</a>
				</li>
				<li><a href="javascript:void(0);" onclick="to('2016-05');">2016-05</a>
				</li>
				<li><a href="javascript:void(0);" onclick="to('2016-06');">2016-06</a>
				</li>
				<li><a href="javascript:void(0);" onclick="to('2016-07');">2016-07</a>
				</li>
				<li><a href="javascript:void(0);" onclick="to('2016-08');">2016-08</a>
				</li>
				<li><a href="javascript:void(0);" onclick="to('2016-09');">2016-09</a>
				</li>
				<li><a href="javascript:void(0);" onclick="to('2016-10');">2016-10</a>
				</li>
				<li><a href="javascript:void(0);" onclick="to('2016-11');">2016-11</a>
				</li>
				<li><a href="javascript:void(0);" onclick="to('2016-12');">2016-12</a>
				</li>
			</ul>
		</div>
		<div class="weeks">
			<c:forEach items="${oacc }" var="oacc" varStatus="index">
				<c:if test="${index.index%7==0 }">
					<c:if test="${index.index/7==0 }">
						<ul class="week-table firstweek">
					</c:if>
					<c:if test="${index.index/7==1 }">
						<ul class="week-table secondweek">
					</c:if>
					<c:if test="${index.index/7==2 }">
						<ul class="week-table thirdweek">
					</c:if>
					<c:if test="${index.index/7==3 }">
						<ul class="week-table forthweek">
					</c:if>
					<c:if test="${index.index/7==4 }">
						<ul class="week-table fifthweek">
					</c:if>
					<c:if test="${index.index/7==5 }">
						<ul class="week-table sixthweek">
					</c:if>

					<li>
						<ul class="weektb-th">
							<c:if test="${index.index/7==0 }">
								<li>第一周</li>
							</c:if>
							<c:if test="${index.index/7==1 }">
								<li>第二周</li>
							</c:if>
							<c:if test="${index.index/7==2 }">
								<li>第三周</li>
							</c:if>
							<c:if test="${index.index/7==3 }">
								<li>第四周</li>
							</c:if>
							<c:if test="${index.index/7==4 }">
								<li>第五周</li>
							</c:if>
							<c:if test="${index.index/7==5 }">
								<li>第六周</li>
							</c:if>
							<li>星期</li>
							<li>签到</li>
							<li>签退</li>
							<li>状态</li>
						</ul></li>
				</c:if>
				<li>
					<ul class="weektb-tb">
						<li><fmt:formatDate value="${oacc.createDate}"
								pattern="yyyy-MM-dd" /></li>
						<c:if test="${index.index%7==0}">
							<li>一</li>
						</c:if>
						<c:if test="${index.index%7==1}">
							<li>二</li>
						</c:if>
						<c:if test="${index.index%7==2}">
							<li>三</li>
						</c:if>
						<c:if test="${index.index%7==3}">
							<li>四</li>
						</c:if>
						<c:if test="${index.index%7==4}">
							<li>五</li>
						</c:if>
						<c:if test="${index.index%7==5}">
							<li>六</li>
						</c:if>
						<c:if test="${index.index%7==6}">
							<li>日</li>
						</c:if>
						<c:if test="${oacc.codingBegindate == null }">
							<li>---</li>
						</c:if>
						<c:if test="${oacc.codingBegindate != null }">
							<li><fmt:formatDate value="${oacc.codingBegindate}"
									pattern="HH:mm" /></li>
						</c:if>
						<c:if test="${oacc.codingEnddate == null }">
							<li>---</li>
						</c:if>
						<c:if test="${oacc.codingEnddate != null }">
							<li><fmt:formatDate value="${oacc.codingEnddate}"
									pattern="HH:mm" /></li>
						</c:if>
						<li>${oacc.workingType}</li>
					</ul></li>
				<li><c:if test="${index.index%7==6 }">
						</ul>
					</c:if>
			</c:forEach>
</body>
</html>