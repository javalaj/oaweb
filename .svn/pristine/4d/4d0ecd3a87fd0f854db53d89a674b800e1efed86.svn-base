<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>月绩效考核</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
 <h1 style="text-align:center">${offname }----${cyname }----${StartTime2}月绩效</h1>
 	 <form:form id="inputForm2">
			
		<thead>
			<tr>
				<th style="width: 200px;">任务名</th>
				<th>分值</th>
				<th>边界定义</th>
				<th>开始时间</th>
				<th>结束时间</th>
				<th style="width:80px">自我评分</th>
				<th>经理评分</th>
				<th colspan="2">副总评分</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page}" var="cyTspOaMonthlyPlan">
			<tr><td style="display: none;"><input name="id"  type="text" value="${cyTspOaMonthlyPlan.id}" readonly="true"/></td>
					<td>
				<textarea  rows="3" cols="6" style="width: 200px;"  name="taskName" type="text" style="width:80px;border:none" readonly="readonly" >${cyTspOaMonthlyPlan.taskName}</textarea>	
				</td>
				<td>
				<input type="text" name="taskScrores" style="color: red; width: 50px;border:none" value="${cyTspOaMonthlyPlan.taskScrores }"  readonly="readonly" />
				</td>
				<td>
				<textarea  rows="3" cols="6" style="width: 200px;"  readonly="readonly"   name="definiti"  type="text"  style="width:80px;border:none">${cyTspOaMonthlyPlan.definiti}</textarea>
				</td>
				<td>
					<input name="startTime" type="text" style="width:80px"  value="${cyTspOaMonthlyPlan.startTime}" readonly="true">
				</td>
				<td>
					<input name="endTime"  type="text"  style="width:80px"  value="${cyTspOaMonthlyPlan.endTime}" readonly="true"> 
				</td>
				<td>
					<input name="myScores" type="text" style="width:50px" value="${cyTspOaMonthlyPlan.myScores} " readonly="true" >
				</td>
				<td>
					<input id="cpleaderScores" name="leaderScores" type="text" style="width:50px" value="${cyTspOaMonthlyPlan.leaderScores}" readonly="true">
				</td>
				<td colspan="2">
					<input id="cpviceScores" name="viceScores" style="width:50px" type="text" value="${cyTspOaMonthlyPlan.viceScores}">
				</td>
				<td style="display: none;">
					<input name="approvalState" type="text" value="${cyTspOaMonthlyPlan.approvalState}">
				</td>
				<td style="display: none;">
					<input name="procInsId" type="text" value="${cyTspOaMonthlyPlan.procInsId}">
				</td>
				<td style="display: none;">
					<input name="officeId" type="text" value="${cyTspOaMonthlyPlan.officeId}">
				</td>
				<td style="display: none;">
					<input name="commonId" type="text" style="width:80px" 	 value="${cyTspOaMonthlyPlan.commonId}" >
				</td>
				<td style="display: none;">
					<input name="userId" type="text" style="width:80px" 	 value="${cyTspOaMonthlyPlan.userId}" >
				</td>
			</tr>
		</c:forEach>
		
			 <tr>
		  <td colspan="5">统计<span style="color: red;">(${Scrores["key"]})</span></td>
		 
		 <td colspan="2">
		 
		    自我评价总分<span style="color: red;">(${Scrores["value"]})</span>
		 </td>
		 </tr>
		 <tr>
		  
		   <td colspan="6"></td>
		  <td>
		  	 <input style="" id="btnSubmit" class="btn btn-primary" type="button"
					value="保存并提交" onclick="submitUserList_5();"/> 
					
					
		  </td>
		  <td>
		  <input class="btn btn-primary" id="btncp" value="复制打分" onclick="submitcp();" type="button" />
		  </td>
		  <td><input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.back()"/></td>
		 
		 </tr>
		  
		  
		</form:form>
	</table>
	  <script type="text/javascript">
	   function submitcp(){

		   
		   var array1=$("input[name='leaderScores']");
		   var array2=$("input[name='viceScores']");
		   $.each(array1,function(n,value){
	           // alert(n);
	            //alert(value.value);
	            var temp=array2[n];
	            temp.value=value.value;
	            //$("#cpleaderScores").val(value.value);
	        }
	        );

		   
	   }
	  
	  
	  </script>
		
	<script type="text/javascript">



	  (function($){
          $.fn.serializeJson = function(){
              var jsonData1 = {};
              var serializeArray = this.serializeArray();
              // 先转换成{"id": ["12","14"], "name": ["aaa","bbb"], "pwd":["pwd1","pwd2"]}这种形式
              $(serializeArray).each(function () {
                  if (jsonData1[this.name]) {
                      if ($.isArray(jsonData1[this.name])) {
                          jsonData1[this.name].push(this.value);
                      } else {
                          jsonData1[this.name] = [jsonData1[this.name], this.value];
                      }
                  } else {
                      jsonData1[this.name] = this.value;
                  }
              });
              // 再转成[{"id": "12", "name": "aaa", "pwd":"pwd1"},{"id": "14", "name": "bb", "pwd":"pwd2"}]的形式
              var vCount = 0;
              // 计算json内部的数组最大长度
              for(var item in jsonData1){
                  var tmp = $.isArray(jsonData1[item]) ? jsonData1[item].length : 1;
                  vCount = (tmp > vCount) ? tmp : vCount;
              }

              if(vCount > 1) {
                  var jsonData2 = new Array();
                  for(var i = 0; i < vCount; i++){
                      var jsonObj = {};
                      for(var item in jsonData1) {
                          jsonObj[item] = jsonData1[item][i];
                      }
                      jsonData2.push(jsonObj);
                  }
                  return JSON.stringify(jsonData2);
              }else{
                  return "[" + JSON.stringify(jsonData1) + "]";
              }
          };
      })(jQuery);

      function submitUserList_6() {
	            
          var jsonStr = $("#inputForm2").serializeJson();
        
          $.ajax({
              url: "${ctx}/oa/cyTspOaMonthlyPlan/dispose",
              type: "POST",
              contentType : 'application/json;charset=utf-8', 
              dataType:"text",
              data: jsonStr,
              success: function(data){
            	  if (data == "1") {
            		  top.layer.msg("提交失败！");
            		  /* top.$.jBox.tip.mess = 1;
    					top.$.jBox.tip("提交失败", "error", {
    						persistent : true,
    						opacity : 0
    					}); */
    					$("#messageBox").show();
                	  window.location.href='${ctx}/act/task/historic';
                	  }
                	  else{
                		  top.layer.msg("提交成功！");
                		 /*  top.$.jBox.tip.mess = 1;
      					top.$.jBox.tip("提交成功", "success", {
      						persistent : true,
      						opacity : 0
      					}); */
      					$("#messageBox").show();
                		
                  	  window.location.href='${ctx}/act/task/historic';
                    	  }
            	  
              },
              error: function(res){
            	  top.layer.msg("提交失败！");
            	  /* top.$.jBox.tip.mess = 1;
					top.$.jBox.tip("保存失败", "error", {
						persistent : true,
						opacity : 0
					}); */
					$("#messageBox").show();
            	  window.location.href="${ctx}/act/task/historic";
              }
          });
      }
      function submitUserList_5(){
				oaLoading('正在提交，请稍候…');
				submitUserList_6();
}
	
      

	</script>
</body>
</html>