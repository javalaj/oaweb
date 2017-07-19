<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<style type="text/css">
	.mui-bar{
	box-shadow: 0 0 1px rgba(0, 0, 0, .5);
	-webkit-box-shadow: 0 0 1px rgba(0, 0, 0, .5);
}
</style>

<nav class="mui-bar mui-bar-tab oa-bar-tab" id="oaBarTab">
		<a class="mui-tab-item" id="page_message" > 
			<span class="mui-icon tabicon-message">
			<c:if test="${fns:hasMessages()}">
			<span class="new-notice"></span>
			</c:if>
			</span>
			<span class="mui-tab-label">消息</span>
		</a> 
		
		<a class="mui-tab-item " id="page_maillist" >
			<span class="mui-icon tabicon-maillist"></span> <span
			class="mui-tab-label">通讯录</span>
		</a> 
		
		<a class="mui-tab-item " id="page_worktop" > <span
			class="mui-icon tabicon-worktop "></span> <span class="mui-tab-label">工作台</span>
		</a> 
		
		<a class="mui-tab-item " id="page_my" >
			<span class="mui-icon tabicon-my"></span> <span class="mui-tab-label">我的</span>
		</a>
	</nav>

	<script type="text/javascript">

$(document).ready(function() {

   mui.init();
   document.getElementById('page_message').addEventListener('tap',function(){  
	 
     message();
   });  

   document.getElementById('page_maillist').addEventListener('tap', function(){
	    maillist();
	    
    }); 
   
   document.getElementById('page_worktop').addEventListener('tap', function(){  
	   worktop();
   }); 
   
   document.getElementById('page_my').addEventListener('tap', function(){  
       mycenter();
   }); 
   
    
    function worktop() {
    	location.href = "${mctx}/mobile/sys/index/";
    	
    }
    function goContact(){
    		location.href="${mctx}/oa/contact/oaContact";
    	}

    function mycenter(){
    	location.href="${ctx}/m/sys/user/list";
    }
    function  maillist(){
    	location.href="${mctx}/oa/contact/oaContact";
    }	
    
    
    function message()
    {
    	location.href="${ctx}/m/oa/oaNotify/messageAll";
    }
});

</script>


