
//自定义js
var layer,form;
layui.use(['layer'], function(){  // 如果只加载一个组件，可以不填数组。如：layui.use('form')
	layer = layui.layer; // 获取layer组件
});
layui.use(('form'), function(){  // 如果只加载一个组件，可以不填数组。如：layui.use('form')
	form = layui.form; // 获取form组件
});
     