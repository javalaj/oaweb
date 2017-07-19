/**
 * @param message 要显示的消息
 * @param onTimeout 在超时的时候执行的方法
 * @returns
 */
function oaLoading(message,onTimeout){
	layer.load(1, {time: 9999999*1000}); //又换了种风格，并且设定最长等待10秒 
	layer.msg(message, {
		  icon: 16,
		  time: 9999999*1000 //2秒关闭（如果不配置，默认是3秒）
		}, onTimeout);
}
