<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>查找群</title>
<meta name="decorator" content="iim" />
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">


<script type="text/javascript">
	layui
			.use(
					[ 'layer', 'element', 'upload', 'form' ],
					function() {
						var layer = layui.layer, form = layui.form, upload = layui.upload, element = layui
								.element();

					});

	function searchGroup() {
		var groupname = $("#groupname1").val();
		$
				.ajax({
					type : "POST",
					url : "${ctx}/iim/contact/searchGroup",
					data : {
						'groupname' : groupname
					},
					success : function(data) {
						var obj = eval(data);
						var ht = "";
						$(obj).each(
										function(index) {
											var val = obj[index];
											ht += "<li><div class=\"group-img\"><img src=\""+val.avatar+"\"/></div><div class=\"group-info\"><p class=\"group-name\">"
													+ val.groupname
													+ "</p><p>"
													+ val.sign
													+ "</p><p class=\"group-sign\"><i class=\"layui-icon\">&#xe613;</i><span>"
													+ val.nowpeople
													+ "</span>/<span>"
													+ val.maxpeople
													+ "</span></p><a href=\"javascript:void(0)\" onclick=\"addGroup('"
													+ val.id
													+ "');return false;\" class=\"apply-in\">申请入群</a></div></li>";
										});

						var tophtml = "<ul class=\"group-column\">"
						var bothtml = "</ul>";
						$("#search-column").html(tophtml + ht + bothtml);
					}
				});

	}

	function addGroup(groupid) {
		$.ajax({
			type : "POST",
			url : "${ctx}/iim/contact/addGroup",
			data : {
				"groupid" : groupid
			},
			success : function(data) {
				var obj = eval(data);
				if (obj.status == '0') {
					layer.msg('申请已发送成功!');
					/* $(window.parent.$("#manageg")).attr('src',
							$(window.parent.$("#manageg")).attr('src')); */
							load();
							
				} else if (obj.status == '2') {
					layer.msg('群员人数已满!');
				} else if (obj.status == '1') {
					layer.msg(obj.msg);
				}

			}
		});
	}
	
	function load()
	{
		$
		.ajax({
			type : "POST",
			url : "${ctx}/iim/contact/searchGroup",
			data : {
				'groupname' : ''
			},
			success : function(data) {
				var obj = eval(data);
				var ht = "";
				$(obj).each(
								function(index) {
									var val = obj[index];
									ht += "<li><div class=\"group-img\"><img src=\""+val.avatar+"\"/></div><div class=\"group-info\"><p class=\"group-name\">"
											+ val.groupname
											+ "</p><p>"
											+ val.sign
											+ "</p><p class=\"group-sign\"><i class=\"layui-icon\">&#xe613;</i><span>"
											+ val.nowpeople
											+ "</span>/<span>"
											+ val.maxpeople
											+ "</span></p><a href=\"javascript:void(0)\" onclick=\"addGroup('"
											+ val.id
											+ "');return false;\" class=\"apply-in\">申请入群</a></div></li>";
								});

				var tophtml = "<ul class=\"group-column\">"
				var bothtml = "</ul>";
				$("#search-column").html(tophtml + ht + bothtml);
			}
		});
	}
	
	
</script>
</head>
<body>
	<div class="findgroup">
		<form class="layui-form">
			<div class="search">
				<input type="text" name="groupname" id="groupname1"
					lay-verify="title" autocomplete="off" placeholder="请输入要查找的群名或关键字" /><input
					type="button" class="search-submit" onclick="searchGroup();"
					value="查找" />
			</div>
		</form>
		<div class="search-cont">
			<div id="search-column">
				<ul class="group-column">
					<c:forEach items="${grouplist}" var="groupep">
						<li>
							<div class="group-img">
								<img src="${groupep.avatar}" alt="" />
							</div>
							<div class="group-info">
								<p class="group-name">${groupep.groupname}</p>
								<p>${groupep.sign}</p>
								<p class="group-sign">
									<i class="layui-icon">&#xe613;</i><span>${groupep.nowpeople}</span>
									/ <span>${groupep.maxpeople}</span>
								</p>
								<a href="javascript:void(0)"
									onclick="addGroup('${groupep.id}');return false;"
									class="apply-in">申请入群</a>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>