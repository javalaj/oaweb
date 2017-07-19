<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>聊天管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document).ready(function() {
		laydate({
			elem : '#createDate', //目标元素。由于laydate.js封装了一个轻量级的选择器引擎，因此elem还允许你传入class、tag但必须按照这种方式 '#id .class'
			event : 'focus' //响应事件。如果没有传入event，则按照默认的click
		});
	});

	layui
			.use(
					[ 'layim', 'laypage' ],
					function() {
						var layim = layui.layim, layer = layui.layer, laytpl = layui.laytpl, $ = layui.jquery, laypage = layui.laypage;

						//聊天记录的分页此处不做演示，你可以采用laypage，不了解的同学见文档：http://www.layui.com/doc/modules/laypage.html

						//开始请求聊天记录
						var param = location.search; //获得URL参数。该窗口url会携带会话id和type，他们是你请求聊天记录的重要凭据

						//实际使用时，下述的res一般是通过Ajax获得，而此处仅仅只是演示数据格式
						var res = ${data};
						

						//console.log(param)

						var html = laytpl(LAY_tpl.value).render({
							data : res.data
						});
						$('#LAY_view').html(html);

					});
	function search() {//查询，页码清零
		$("#pageNo").val(0);
		$("#searchForm").submit();
		return false;
	}

	function reset() {//重置，页码清零
		$("#pageNo").val(0);
		$("#searchForm div.form-group input").val("");
		$("#searchForm div.form-group select").val("");
		$("#searchForm").submit();
		return false;
	}
	function sortOrRefresh() {//刷新或者排序，页码不清零

		$("#searchForm").submit();
		return false;
	}
	function page(n, s) {//翻页
		$("#pageNo").val(n);
		$("#pageSize").val(s);
		$("#searchForm").submit();
		$("span.page-size").text(s);
		return false;
	}
</script>
</head>
<body>
	<div class="wrapper wrapper-content animated fadeInRight">

		<form:form id="searchForm" modelAttribute="chatHistory"
			action="${ctx}/iim/chatHistory/" method="post" class="form-inline">
			<input type="hidden" name="userid1" value="${chatHistory.userid1 }" />
			<input type="hidden" name="userid2" value="${chatHistory.userid2 }" />
			<input type="hidden" name="type" value="${chatHistory.type }" />
			<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
			<input id="pageSize" name="pageSize" type="hidden"
				value="${page.pageSize}" />
			<table:sortColumn id="orderBy" name="orderBy" value="${page.orderBy}"
				callback="sortOrRefresh();" />
			<!-- 支持排序 -->
			<div class="form-group">
				<span>消息内容：</span>
				<form:input path="msg" htmlEscape="false" maxlength="1024"
					class=" form-control input-sm" />
				<button class="btn btn-primary btn-rounded btn-outline btn-sm "
					onclick="search()">
					<i class="fa fa-search"></i> 查询
				</button>
			</div>
		</form:form>
		<br>
		<div class="layim-chat-main" style="height:450px;">
			<ul id="LAY_view"></ul>
		</div>

		<textarea title="消息模版" id="LAY_tpl" style="display:none;">
{{# layui.each(d.data, function(index, item){
  if(item.id == parent.layui.layim.cache().mine.id){ }}
    <li class="layim-chat-mine"><div class="layim-chat-user">
					<img src="{{ item.avatar }}"><cite><i>{{ layui.data.date(item.timestamp) }}</i>{{ item.username }}</cite>
				</div>
				<div class="layim-chat-text">{{ layui.layim.content(item.content) }}</div>
			</li>
  {{# } else { }}
    <li><div class="layim-chat-user">
					<img src="{{ item.avatar }}"><cite>{{ item.username }}<i>{{ layui.data.date(item.timestamp) }}</i>
					</cite>
				</div>
				<div class="layim-chat-text">{{ layui.layim.content(item.content) }}</div>
			</li>
  {{# }
}); }}
</textarea>
		<table:page page="${page}"></table:page>
	</div>
</body>
</html>