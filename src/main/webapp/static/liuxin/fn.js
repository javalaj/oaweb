//显示流程跟踪信息
function btnPNGshow(str) {
	var src = "/oa/a/act/task/trace/photo/" + str
	top.layer.open({
		type : 2,
		area : [ '80%', '80%' ],
		title : "流程跟踪图",
		maxmin : true, // 开启最大化最小化按钮
		shadeClose : true,
		content : src
	// 这里content是一个普通的String
	});
}
// 显示流程图
function btnPNGshow2(str2) {
	/*
	 * top.$.jBox.open("iframe:/oa/a/act/task/processPic?procDefId=" + str2,
	 * "流程图", 1400, 500, { buttons : { "关闭" : true }, submit : function(v, h, f) { },
	 * loaded : function(h) { $(".jbox-content", top.document)
	 * .css("overflow-y", "hidden"); } });
	 */
	var src = "/oa/a/act/task/processPic?procDefId=" + str2
	top.layer.open({
		type : 2,
		area : [ '80%', '80%' ],
		title : "流程图",
		maxmin : true, // 开启最大化最小化按钮
		shadeClose : true,
		content : src
	// 这里content是一个普通的String
	});
}

// 收藏
var sc = '0';
function shoucang(mctx, title, url, type, sign) {
	if (sc == '0') {
		sc = '1';
		var jstr = {
			title : title,
			url : url,
			type : type,
			sign : sign
		};
		// ajax
		$.ajax({
			url : mctx + '/user/userFavorite/ajaxSave',
			type : 'POST', // GET
			async : true, // 或false,是否异步
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(jstr),
			dataType : 'text', // 返回的数据格式：json/xml/html/script/jsonp/text
			success : function(data) {
				if (data == 'success') {
					// 收藏
					$("#userimg41").hide();
					$("#userimg42").show();
					new_alert("收藏成功！", " ");
				} else {
					// 取消收藏 del
					new_alert("收藏失败！", " ");
				}
				sc = '0';
			}
		})
	}
}
// 取消收藏
var qxsc = '0';
function QXshoucang(mctx, title, url, type, sign) {
	if (qxsc == '0') {
		qxsc = '1';
	var jstr = {
		title : title,
		url : url,
		type : type,
		sign : sign
	};
	// ajax
	$.ajax({
		url : mctx + '/user/userFavorite/ajaxDel',
		type : 'POST', // GET
		async : true, // 或false,是否异步
		contentType : "application/json;charset=utf-8",
		data : JSON.stringify(jstr),
		dataType : 'text', // 返回的数据格式：json/xml/html/script/jsonp/text
		success : function(data) {
			if (data == 'success') {
				// 收藏
				$("#userimg42").hide();
				$("#userimg41").show();
				new_alert("取消收藏成功！", " ");
			} else {
				// 取消收藏 del
				new_alert("取消收藏失败！", " ");
			}
			qxsc = '0';
		}
	})
	}
}
// 带有草稿按钮的 弹出框 ,草稿按钮 回调页面caogao方法
// 带有草稿按钮的弹出框
function openDialog2(title, url, width, height, btnstr, target) {
	top.layer.open({
		type : 2,
		area : [ width, height ],
		title : title,
		maxmin : true, // 开启最大化最小化按钮
		content : url,
		btn : btnstr.split(","),
		yes : function(index, layero) {
			var body = top.layer.getChildFrame('body', index);
			var iframeWin = layero.find('iframe')[0]; // 得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
			var inputForm = body.find('#inputForm');
			var top_iframe;
			if (target) {
				top_iframe = target;// 如果指定了iframe，则在改frame中跳转
			} else {
				top_iframe = top.getActiveTab().attr("name");// 获取当前active的tab的iframe
			}
			inputForm.attr("target", top_iframe);// 表单提交成功后，从服务器返回的url在当前tab中展示

			if (iframeWin.contentWindow.caogao()) {
				// top.layer.close(index);//关闭对话框。
				setTimeout(function() {
					top.layer.close(index)
				}, 100);// 延时0.1秒，对应360 7.1版本bug
			}

		},
		btn2 : function(index, layero) {
			var body = top.layer.getChildFrame('body', index);
			var iframeWin = layero.find('iframe')[0]; // 得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
			var inputForm = body.find('#inputForm');
			var top_iframe;
			if (target) {
				top_iframe = target;// 如果指定了iframe，则在改frame中跳转
			} else {
				top_iframe = top.getActiveTab().attr("name");// 获取当前active的tab的iframe
			}
			inputForm.attr("target", top_iframe);// 表单提交成功后，从服务器返回的url在当前tab中展示

			if (iframeWin.contentWindow.doSubmit()) {
				// top.layer.close(index);//关闭对话框。
				setTimeout(function() {
					top.layer.close(index)
				}, 100);// 延时0.1秒，对应360 7.1版本bug
			} else {
				return false;
			}

		},
		cancel : function(index) {
		}
	});

}

// 手机提示语句统一调用方法
function new_alert(content, title) {
	mui.alert(content, title);
}