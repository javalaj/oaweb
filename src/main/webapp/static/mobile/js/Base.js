		var title=document.getElementById("title").getAttribute("data");
		//console.log(title);
//				 var $body = $('body');
        document.title = title;
        // hack在微信等webview中无法修改document.title的情况
//      var $iframe = $('<iframe src="/favicon.ico"></iframe>');
//      $iframe.on('load',function() {
//          setTimeout(function() {
//              $iframe.off('load').remove();
//          }, 0);
//      }).appendTo($body); 
		 