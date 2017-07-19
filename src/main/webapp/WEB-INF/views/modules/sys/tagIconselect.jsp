<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>图标选择</title>
	<meta name="decorator" content="blank"/>
    <style type="text/css">
    	.page-header {clear:both;margin:0 20px;padding-top:20px;}
		.the-icons {padding:25px 10px 15px;list-style:none;}
		.the-icons li {float:left;width:22%;line-height:25px;margin:2px 5px;cursor:pointer;}
		.the-icons i {margin:1px 5px;font-size:16px;} .the-icons li:hover {background-color:#efefef;}
        .the-icons li.active {background-color:#0088CC;color:#ffffff;}
        .the-icons li:hover i{font-size:20px;}
    </style>
    <script type="text/javascript">
	    $(document).ready(function(){
	    	$("#icons li").click(function(){
	    		$("#icons li").removeClass("active");
	    		$("#icons li i").removeClass("icon-white");
	    		$(this).addClass("active");
	    		$(this).children("i").addClass("icon-white");
	    		$("#icon").val($(this).find('i').attr('class').split(" ")[1]);
	    	});
	    	$("#icons li").each(function(){
	    		if ($(this).text()=="${value}"){
	    			$(this).click();
	    		}
	    	});
	    	$("#icons li").dblclick(function(){
	    		top.$.jBox.getBox().find("button[value='ok']").trigger("click");
	    	});
	    });
    </script>
</head>
<body>
<input type="hidden" id="icon" value="${value}" />
<div id="icons">
		
			    <h2 class="page-header">66 New Icons in 4.4</h2>
			     <ul class="the-icons">
				   <li class="fa-hover col-md-3 col-sm-4"><i class="iconfont icon-yijianfankui"></i> yijianfankui</li>
				   <li class="fa-hover col-md-3 col-sm-4"><i class="iconfont icon-project"></i> project</li>
				   <li class="fa-hover col-md-3 col-sm-4"><i class="iconfont icon-geren"></i> geren</li>
				   <li class="fa-hover col-md-3 col-sm-4"><i class="iconfont icon-wangzhanguanli"></i> wangzhanguanli</li>
				   <li class="fa-hover col-md-3 col-sm-4"><i class="iconfont icon-employee"></i> employee</li>
				   <li class="fa-hover col-md-3 col-sm-4"><i class="iconfont icon-xitongguanli"></i> xitongguanli</li>
				   <li class="fa-hover col-md-3 col-sm-4"><i class="iconfont icon-bangong"></i> bangong</li>
				   <li class="fa-hover col-md-3 col-sm-4"><i class="iconfont icon-xinxifabu"></i> xinxifabu</li>
				   <li class="fa-hover col-md-3 col-sm-4"><i class="iconfont icon-gongwenguanli"></i>gongwenguanli</li>
				   <li class="fa-hover col-md-3 col-sm-4"><i class="iconfont icon-jiedai"></i> jiedai</li>
				   <li class="fa-hover col-md-3 col-sm-4"><i class="iconfont icon-hetong"></i> hetong</li>
				   <li class="fa-hover col-md-3 col-sm-4"><i class="iconfont icon-renwuxietong"></i> renwuxietong</li>
				   <li class="fa-hover col-md-3 col-sm-4"><i class="iconfont icon-renwuxietong"></i> daima</li>
			    </ul>
	<br/><br/>
</div>
</body>