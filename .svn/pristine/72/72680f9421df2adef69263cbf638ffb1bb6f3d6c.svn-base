(function ($) {
    $.fn.extend({
    Scroll: function (opt, callback) {
 
    if (!opt) var opt = {};
    var _btnleft = $(opt.left);
    var _btnright = $(opt.right);
    var timerID;
    var _this = this.eq(0).find("div").eq(1);
        var lineW = _this.find("a:first").width(), //获取列宽
        line = opt.line ? parseInt(opt.line, 10) : parseInt(_this.width() / lineW, 10), //每次滚动的列数，默认为一屏，即父容器列宽
        speed = opt.speed ? parseInt(opt.speed, 10) : 500; //滚动速度，数值越大，速度越慢（毫秒） 
        timer = opt.timer ? parseInt(opt.timer, 10) : 3000; //滚动的时间间隔（毫秒）   
        if (line == 0) line = 1;
        var upWidth = 0 - line * lineW;
        //滚动函数              
            var scrollLeft = function () {
            if (!_this.is(":animated")) {
                _this.animate({
                    left: upWidth
                }, speed, function () {
                    for (i = 1; i <= line; i++) {
                        _this.find("a:first").appendTo(_this);
                    }
                    _this.css({ left: 0 });
                });
            }
        }
        var scrollRight = function () {
            if (!_this.is(":animated")) {
                for (i = 1; i <= line; i++) {
                    _this.find("a:last").show().prependTo(_this);
                }
                _this.css({ left: upWidth });
                _this.animate({
                    left: 0
                }, speed, function () {
                });
            }
        }                         //Shawphy:自动播放    
        var autoPlay = function () {
                //if (timer) timerID = window.setInterval(scrollLeft, timer);
				return;
        };
        var autoStop = function () {
            if (timer) window.clearInterval(timerID);
        };//鼠标事件绑定 
        _this.hover(autoStop, autoPlay).mouseout();
		_btnleft.css("cursor", "pointer").click(scrollLeft).hover(autoStop, autoPlay); 
		_btnright.css("cursor", "pointer").click(scrollRight).hover(autoStop, autoPlay);
        }
    })
})(jQuery);
$(document).ready(function () {
    $("#scrollable").Scroll({ line: 1, speed: 500, timer: 3000, left: ".prev", right: ".next"});

$("#scrollable2").Scroll({ line: 1, speed: 500, timer: 3000, left: ".prev2", right: ".next2"});
}); 



$(function () {

    $('#container').highcharts({
        data: {
            table: 'datatable'
        },
        chart: {
            type: 'column',
            alignTicks: false,
            borderColor: '#FFFFFF',
	      	plotBorderWidth: 0,
	      	plotShadow: false,
	      	plotBackgroundImage: null,
	      	plotBackgroundColor : '#ffffff'
        },
        title: {
            text: ''
        },
        yAxis: {  
            title:'',  

            /* gridLineWidth: 1,    //设置横向分区线宽度   */

            lineColor:'#ffffff',//设置y轴颜色  

            labels:{  
                enabled:false  
              },
            tickLength: 0,  
			gridLineWidth : 0,
        },
        xAxis: {
        	lineColor: '#66b3ff',
        }, 
        legend : {
			align : 'left',
			layout : 'vertical',
			verticalAlign : 'top',
			floating : true
		}, 
        credits : {
            enabled : false
        },
        exporting : {
            enabled : false
            //用来设置是否显示‘打印’,'导出'等功能按钮，不设置时默认为显示 
        },
        colors: ['#66b3ff', '#d0d0d0'],
        tooltip: {
            formatter: function () {
                return '<b>' + this.series.name + '</b><br/>' +
                    this.point.y + ' ' + this.point.name.toLowerCase();
            }
        }
    });
    
    $('#container1').highcharts({
        data: {
            table: 'datatable1'
        },
        chart: {
            type: 'column',
            borderColor: '#FFFFFF',
            plotBorderWidth: 0,
	      	plotShadow: false,
        },
        title: {
            text: ''
        },
        yAxis: {  
            title:'',  

            gridLineWidth: 1,    //设置横向分区线宽度  

            lineColor:'#ffffff',//设置y轴颜色  

            labels:{  

                enabled:false  

              },
            tickLength: 0,  
			gridLineWidth : 0,
        },
        xAxis: {
        	lineColor: '#00bb00',
        },
        legend : {
			align : 'left',
			layout : 'vertical',
			verticalAlign : 'top',
			
			floating : true
		}, 
        credits : {
            enabled : false
        },
        exporting : {
            enabled : false
            //用来设置是否显示‘打印’,'导出'等功能按钮，不设置时默认为显示 
        },
        colors: ['#00bb00', '#d0d0d0'],
        tooltip: {
            formatter: function () {
                return '<b>' + this.series.name + '</b><br/>' +
                    this.point.y + ' ' + this.point.name.toLowerCase();
            }
        }
    });
    
    $('#container2').highcharts({
        data: {
            table: 'datatable2'
        },
        chart: {
            type: 'column',
            borderColor: '#FFFFFF',
            plotBorderWidth: 0,
	      	plotShadow: false,
        },
        title: {
            text: ''
        },
        yAxis: {  
            title:'',  

            gridLineWidth: 1,    //设置横向分区线宽度  

            lineColor:'#ffffff',//设置y轴颜色  

            labels:{  

                enabled:false  

              },
            tickLength: 0,  
			gridLineWidth : 0,
        },
        xAxis: {
        	lineColor: '#ea0000',
        },
        legend : {
			align : 'left',
			layout : 'vertical',
			verticalAlign : 'top',
			
			floating : true
		}, 
        credits : {
            enabled : false
        },
        exporting : {
            enabled : false
            //用来设置是否显示‘打印’,'导出'等功能按钮，不设置时默认为显示 
        },
        colors: ['#ea0000', '#d0d0d0'],
        tooltip: {
            formatter: function () {
                return '<b>' + this.series.name + '</b><br/>' +
                    this.point.y + ' ' + this.point.name.toLowerCase();
            }
        }
    });
    
    $('#container3').highcharts({
        data: {
            table: 'datatable3'
        },
        chart: {
            type: 'column',
            borderColor: '#FFFFFF',
            plotBorderWidth: 0,
	      	plotShadow: false,
        },
        title: {
            text: ''
        },
        yAxis: {  
            title:'',  

            gridLineWidth: 1,    //设置横向分区线宽度  

            lineColor:'#ffffff',//设置y轴颜色  

            labels:{  

                enabled:false  

              },
            tickLength: 0,  
			gridLineWidth : 0,
        },
        xAxis: {
        	lineColor: '#ea7500',
        },
        legend : {
			align : 'left',
			layout : 'vertical',
			verticalAlign : 'top',
			
			floating : true
		}, 
        credits : {
            enabled : false
        },
        exporting : {
            enabled : false
            //用来设置是否显示‘打印’,'导出'等功能按钮，不设置时默认为显示 
        },
        colors: ['#ea7500', '#d0d0d0'],
        tooltip: {
            formatter: function () {
                return '<b>' + this.series.name + '</b><br/>' +
                    this.point.y + ' ' + this.point.name.toLowerCase();
            }
        }
    });
    
    $('#container4').highcharts({
        data: {
            table: 'datatable4'
        },
        chart: {
            type: 'column',
            borderColor: '#FFFFFF',
            plotBorderWidth: 0,
	      	plotShadow: false,
        },
        title: {
            text: ''
        },
        yAxis: {  
            title:'',  

            gridLineWidth: 1,    //设置横向分区线宽度  

            lineColor:'#ffffff',//设置y轴颜色  

            labels:{  

                enabled:false  

              },
            tickLength: 0,  
			gridLineWidth : 0,
        },
        xAxis: {
        	lineColor: '#ffd306',
        },
        legend : {
			align : 'left',
			layout : 'vertical',
			verticalAlign : 'top',
			
			floating : true
		}, 
        credits : {
            enabled : false
        },
        exporting : {
            enabled : false
            //用来设置是否显示‘打印’,'导出'等功能按钮，不设置时默认为显示 
        },
        colors: ['#ffd306', '#d0d0d0','#000000'],
        tooltip: {
            formatter: function () {
                return '<b>' + this.series.name + '</b><br/>' +
                    this.point.y + ' ' + this.point.name.toLowerCase();
            }
        }
    });
});


function Percentage(num, total) 
{ 
    return (Math.round(num / total * 10000) / 100.00 + "%");// 小数点后两位百分比
}