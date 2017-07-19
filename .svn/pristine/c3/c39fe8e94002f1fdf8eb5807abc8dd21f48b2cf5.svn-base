
function init(){
	if (!window.WebSocket){
		alert("你的浏览器不支持websocket，请升级到IE10以上浏览器，或者使用谷歌、火狐、360浏览器。");
	}
	webSocket =   new WebSocket(wsServer);
	webSocket.onerror = function(event) {
		/*  alert("websockt连接发生错误，请刷新页面重试!")*/
	};
	webSocket.onopen = function(event) {
		webSocket.send("_online_user_"+currentLoginName);
	};
}

function waitForConnection(callback, interval) {// 判断连接是否建立
	
    if (webSocket.readyState === 1) {
        callback();
    } else {
        var that = this;
        setTimeout(function () {
            that.waitForConnection(callback, interval);
        }, interval);
    }
}