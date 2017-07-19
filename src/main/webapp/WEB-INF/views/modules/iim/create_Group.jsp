<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>群管理</title>
<meta name="decorator" content="iim" />
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">


<script type="text/javascript">
	layui
			.use(
					[ 'layim', 'layer', 'element', 'upload', 'form' ],
					function() {
						var layer = layui.layer, form = layui.form, upload = layui.upload, element = layui
								.element();
						var layim = layui.layim;
						layui.upload({
							url : '${ctx}/iim/contact/uploadGroupImage', //上传接口
							success : function(res) { //上传成功后的回调
								console.log(res); //上传成功返回值，必须为json格式
								avatar1.src = res.url;
								$("#avatar").val(res.url);
							}
						});

					});

	function creatGroup() {
		var groupname = $('#groupname').val();
		var sign = $('#sign').val();
		var avatar = $('#avatar').val();
		var maxpeople = $("input[name='maxpeople']:checked").val();

		if (groupname == "") {
			layer.msg('请填写群名称!');
			var la = window.parent.layui.layer;
			console.info(la);
			
		/* 	  //增加一个群组
		      la.addList({
		        type: 'group'
		        ,avatar: "http://tva3.sinaimg.cn/crop.64.106.361.361.50/7181dbb3jw8evfbtem8edj20ci0dpq3a.jpg"
		        ,groupname: 'Angular开发'
		        ,id: "12333333"
		        ,members: 0
		      }); */

			/* var la = window.parent.layui.layer;

			//var body = la.getChildFrame('body', 0);
			var iframeWin = window[la.find('iframe')[0]['name']]; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();

			console.info(iframeWin); */

			return false;
		} else {
			$.ajax({
				type : "POST",
				url : "${ctx}/iim/contact/createGroup",
				dataType : "json",
				contentType : "application/json;charset=UTF-8",
				data : JSON.stringify({
					groupname : groupname,
					avatar : avatar,
					sign : sign,
					maxpeople : maxpeople
				}),
				success : function(data) {
					var obj = eval(data);
					if (obj.status == '0') {
						layer.msg('创建群成功!');
						$("#avatar1").attr('src',
								"${ctxStatic}/common/img/group.png");
						$("#groupname").val("");
						$("#sign").val("");
						$("input[name='maxpeople'][value='100']").attr(
								"checked", true);
						$(window.parent.$("#findg")).attr('src',
								$(window.parent.$("#findg")).attr('src'));
						$(window.parent.$("#manageg")).attr('src',
								$(window.parent.$("#manageg")).attr('src'));

						top.location.href="${ctx}/sys/user/chat";
						//var la=window.parent.layui.layer;
						//console.info(la);
						//layui.load();

					}

				}
			});

		}

	}
</script>
</head>
<body>
	<form class="layui-form" id="creategroup">
		<div class="buildgroup">
			<div class="build-img">
				<img id="avatar1" src="${ctxStatic}/common/img/group.png" alt="" />
				<input type="hidden" name="avatar" id="avatar"
					value="${ctxStatic}/common/img/group.png">

			</div>

			<div class="layui-box group-addimg">
				<input type="file" name="file" class="layui-upload-file">
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">群名称</label>
				<div class="layui-input-block">
					<input type="text" name="groupname" id="groupname" required
						lay-verify="required" placeholder="输入群的名字" autocomplete="off"
						class="layui-input group-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">群标签</label>
				<div class="layui-input-block">
					<input type="text" name="sign" id="sign" required
						lay-verify="required" placeholder="输入群的简单介绍" autocomplete="off"
						class="layui-input group-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">群规模</label>
				<div class="layui-input-block group-size">
					<input type="radio" name="maxpeople" value="50" title="50人">
					<input type="radio" name="maxpeople" value="100" title="100人"
						checked>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block group-submit">
					<input type="button" class="layui-btn btn-build"
						onclick="creatGroup();" value="创建群" />
					<button type="reset" class="layui-btn layui-btn-primary ">重置</button>
				</div>
			</div>
		</div>
	</form>
</body>
</html>