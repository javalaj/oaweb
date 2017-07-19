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
					[ 'layer', 'element', 'upload', 'form' ],
					function() {
						var layer = layui.layer, form = layui.form, upload = layui.upload, element = layui
								.element();
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
		var id = $('#id').val();
		var groupname = $('#groupname').val();
		var sign = $('#sign').val();
		var avatar = $('#avatar').val();
		var maxpeople = $("input[name='maxpeople']:checked").val();
		if (groupname == "") {
			layer.msg('请填写群名称!');
			return false;
		} else {
			$.ajax({
				type : "POST",
				url : "${ctx}/iim/contact/createGroup",
				dataType : "json",
				contentType : "application/json;charset=UTF-8",
				data : JSON.stringify({
					id : id,
					groupname : groupname,
					avatar : avatar,
					sign : sign,
					maxpeople : maxpeople
				}),
				success : function(data) {
					var obj = eval(data);
					if (obj.status == '0') {
						layer.msg('修改群成功!');
						$(window.parent.$("#findg")).attr('src',
								$(window.parent.$("#findg")).attr('src'));
						$(window.parent.$("#manageg")).attr('src',
								$(window.parent.$("#manageg")).attr('src'));
					}else{
						layer.msg('修改群失败!');
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
			<div class="search-top">
				<a href="javascript:" onclick="self.location=document.referrer;" class="search-return"><i class="layui-icon">&#xe603;</i>&nbsp;返回</a>
			</div>
			<div class="build-img">
				<img id="avatar1" src="${group.avatar}" alt="" /> <input
					type="hidden" name="avatar" id="avatar" value="${group.avatar}">
				<input type="hidden" name="id" id="id" value="${group.id}">

			</div>

			<div class="layui-box group-addimg">
				<input type="file" name="file" class="layui-upload-file">
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">群名称</label>
				<div class="layui-input-block">
					<input type="text" name="groupname" id="groupname" required
						value="${group.groupname}" lay-verify="required"
						placeholder="输入群的名字" autocomplete="off"
						class="layui-input group-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">群标签</label>
				<div class="layui-input-block">
					<input type="text" name="sign" id="sign" required
						lay-verify="required" placeholder="输入群的简单介绍" value="${group.sign}"
						autocomplete="off" class="layui-input group-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">群规模</label>
				<div class="layui-input-block group-size">
					<c:if test="${group.maxpeople==50}">
						<input type="radio" name="maxpeople" value="50" title="50人"
							checked>
						<input type="radio" name="maxpeople" value="100" title="100人">
					</c:if>
					<c:if test="${group.maxpeople==100}">
						<input type="radio" name="maxpeople" value="50" title="50人">
						<input type="radio" name="maxpeople" value="100" title="100人"
							checked>
					</c:if>

				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block group-submit">

					<input type="button" class="layui-btn btn-build"
						onclick="creatGroup();" value="修改群" />

				</div>
			</div>
		</div>
	</form>
</body>
</html>