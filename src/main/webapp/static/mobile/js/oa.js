
mui.init()

//首页自动轮播
mui("#slider").slider({
    interval: 5000
});

//底部导航链接
function index() {
	location.href = "index.html";
}
function maillist() {
	location.href = "maillist.html";
}
function message() {
	location.href = "message.html";
}
function mycenter() {
	location.href="${mctx}/sys/user/list";
}

function shoucang() {
	location.href = "shoucang.html";

}
function todo(){
	location.href = "${mctx}/mobile/act/task/";
	}
function tosend(){
	location.href = "${mctx}/mobile/act/task/tosend";
	}
function historic(){
	location.href = "${mctx}/mobile/act/task/historic";
	}

function daka() {
	location.href = "Map.html";
}

function rizhi() {
	location.href = "OALog.html";

}

function demo() {
	location.href = "Demo.html";

}

function gonggao() {
	location.href = "GongGao.html";	
}

function jixiao() {
	location.href = "index.html";
}

function qingjia() {
	location.href = "choujiang.html";
}

function xietong() {
	location.href = "xietong.html";
}

function user() {
	location.href = "User.html";
}
function collect() {
	location.href="MyCollent.html"
}
function tongzhi_detailes() {
	location.href = "GangGao_XingQing.html";

}

function xinwen_div() {
	location.href = "XinWen_XingQing.html"
}
function wendang_dettailes() {
	location.href = "WenDang_XingQing.html"
}


function liucheng_gz() {
	location.href = "shoucang.html";
}
		
function 


//我的
function User_Data() {
	location.href="${mctx}/sys/user/info";
}
 function updatapwd () {
 	location.href = "Updatapwd.html";
 }
function shezhi() {
	location.href = "User_SheZhi.html";
}
function fixed() {
	location.href = "FixedAsset.html";
}