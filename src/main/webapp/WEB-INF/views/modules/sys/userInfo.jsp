<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>个人信息</title>
<meta name="decorator" content="default" />
<link href="${ctxStatic}/project/css/myoa.css" type="text/css">
<style>
	
	
	.userinfo-page {
		width: 1000px;
		padding-top: 20px;
	}
	table.myoa-userinfo-table {
		display: inline-block;
		width: 840px;		
	}
	table.myoa-userinfo-table>tbody>tr>td {
		border-top-width: 0;
		padding: 4px 8px;
		height: 34px;
	}
	table.myoa-userinfo-table>tbody>tr>td:nth-child(odd) {
		color: #333;
		width: 140px;
	}
	table.myoa-userinfo-table>tbody>tr>td:nth-child(even) {
		min-width: 270px;
	}
	.myoa-userinfo-img {
		width: 150px;
	    min-height: 100px;
	    display: inline-block;
	    vertical-align: top;
	}
	.myoa-userinfo-img .btn {
		padding: 6px 40px;
		color: #fff;
	    background-color: #35a5e7;
	    border-color: #35a5e7;
	}
	.myoa-userinfo-img .btn:hover,
	.myoa-userinfo-img .btn:active, 
	.myoa-userinfo-img .btn:focus {
	    color: #fff;
	    background-color: #1f96db;
	    border-color: #1f96db;
	}
	@media (max-width: 1200px) {
	    .userinfo-page {
			width: 774px;
		}
		.myoa-userinfo-img {
			width: 146px;	    
		}
		table.myoa-userinfo-table {
			width: 624px;		
		}
		table.myoa-userinfo-table>tbody>tr>td:nth-child(odd) {
			width: 94px;
		}
		table.myoa-userinfo-table>tbody>tr>td:nth-child(even) {
			min-width: 176px;
		}
	}
	
</style>
<script type="text/javascript">

	$.validator.addMethod('isTel', function(value, element) {//  element数组保存
		var tel =/^$|(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$/;     // 区号+座机号码+分机号码
		return this.optional(element) || (tel.test(value));
	}, '请正确填写您的电话号码');
	
	$(document).ready(
			function() {
				/* //兴趣爱好
				var hobby = document.getElementById("hobby").value;		
				if (hobby.substr(0,1)==','){
					hobby=hobby.substr(1);
				}
				var hobbys = new Array();				
				hobbys = hobby.split(",");
 				for(var i = 0 ;i<hobbys.length;i++){
 					//alert(hobbys[i]);
 					/* $("input[name=hobby][value= " + hobbys[i] + "]").prop(
							"checked", true);
 				}
				 for ( var str in hobbys) {
					$("input[name=hobby][value= " + hobbys[str] + "]").attr(
							"checked", true);
				}  */
				
				$("#inputForm").validate({
					rules:{
						phone:{
							isTel:[0]
						},
						email:{
							email:true
						}
					},
					messages:{
						email:{
							email:"请输入正确格式的邮箱地址"
						}
					},
					submitHandler : function(form) {
// 						loading('正在提交，请稍等...');
						form.submit();
					},
					errorContainer : "#messageBox",
					errorPlacement : function(error, element) {
						$("#messageBox").text("输入有误，请先更正。");
						if (element.is(":checkbox")
								|| element.is(":radio")
								|| element.parent().is(
										".input-append")) {
							error.appendTo(element.parent()
									.parent());
						} else {
							error.insertAfter(element);
						}
					}
				});
			});

	/* function choose() {
		var mobile = document.getElementById("mobile").value;
		var upper = document.getElementById("userName").value;
		var identificationum = document.getElementById("identificationum").value;
		var re = /^(1[34578][0-9]{9})$/;
		if (mobile == null || mobile == '') {
			top.$.jBox.tip.mess = 1;
			top.$.jBox.tip("手机号码不能为空！", "error", {
				persistent : true,
				opacity : 0
			});
			$("#messageBox").show();
			return false;
		} else if (re.test(mobile) == false) {
			top.$.jBox.tip.mess = 1;
			top.$.jBox.tip("手机号码输入不合规范！！", "error", {
				persistent : true,
				opacity : 0
			});
			$("#messageBox").show();
			return false;
		} */

		/* if (upper == null || upper == '') {
			top.$.jBox.tip.mess = 1;
			top.$.jBox.tip("请选择直接上级！", "error", {
				persistent : true,
				opacity : 0
			});
			$("#messageBox").show();
			return false;
		}
	
		// 身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X  
		var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
		if (reg.test(identificationum) === false) {
			top.$.jBox.tip.mess = 1;
			top.$.jBox.tip("身份证输入不合法！！", "error", {
				persistent : true,
				opacity : 0
			});
			$("#messageBox").show();
			return false;
		}
		 //判断身份证号码是否存在
		<c:forEach items="${listUser}" var="item" varStatus="status">
		if (identificationum == ("${item.identificationum}")
				&& ("${user.name}") != ("${item.name}")) {
			top.$.jBox.tip.mess = 1;
			top.$.jBox.tip("已存在此身份证号！", "error", {
				persistent : true,
				opacity : 0
			});
			$("#messageBox").show();
			return false;
		}
		</c:forEach>
		return true;
	} */
</script>

</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="ibox">
			<div class="ibox-content" style="padding: 0 0 2px 0;">
				<ul class="nav nav-tabs myoa-tabs">
					<li class="active"><a href="${ctx}/sys/user/info">个人信息</a></li>
					<li><a href="${ctx}/sys/user/modifyPwd">修改密码</a></li>
				</ul>
				<form:form id="inputForm" modelAttribute="user"
		action="${ctx}/sys/user/info" method="post" class="form-horizontal">
		<form:hidden path="name" />
		<input type="hidden" value="${user.hobby}" id="hobby" />
		<form:hidden path="gender" value="${user.gender}"/>
		<sys:message content="${message}" />
			
		<div class="userinfo-page">
			<div class="myoa-userinfo-img">
				<form:hidden id="nameImage" path="photo" htmlEscape="false" maxlength="255"
							class="form-control" /> <sys:ckfinder input="nameImage"
							type="images" uploadPath="/photo" selectMultiple="false"
							maxWidth="100" maxHeight="100" buttonLabel="上传照片"/>
			</div>					
			<table class="table myoa-userinfo-table dataTables-example dataTable no-footer">
				<tr>
					<td>姓名：</td>
					<td>${user.name}</td>
					<td>专业：</td>
					<td>${user.major}</td>
				</tr>
				<tr>
					<td>性别：</td>
					<td><c:if test="${user.gender eq '1'}">男</c:if><c:if test="${user.gender eq '2'}">女</c:if></td>
					<td>毕业时间：</td>
					<td><fmt:formatDate value="${user.graduateDate}" pattern="yyyy-MM-dd" /></td>
				</tr>
				<tr>
					<td>部门</td>
					<td>${user.office.name}</td>
					<td>参加工作时间:</td>
					<td><fmt:formatDate value="${user.workdate}" pattern="yyyy-MM-dd" /></td>
				</tr>
				<tr>
					<td>上级领导：</td>
					<td>${upperX}</td>
					<td>身份证号码：</td>
					<td>${user.identificationum}</td>
				</tr>
				<tr>
					<td>婚姻状况：</td>
					<td>${user.marriage}</td>
					<td>手机号码：</td>
					<td>${user.mobile}</td>
				</tr>
				<tr>
					<td>籍贯：</td>
					<td>${user.registeredAdd}</td>
					<td>座机：</td>
					<td><form:input path="phone" id="phone" htmlEscape="false" maxlength="50"  class="form-control"/></td>
				</tr>
				<tr>
					<td>职务：</td>
					<td>${fns:getDictLabel(user.title, 'user_position', '')}</td>
					<td>QQ号：</td>
					<td><form:input path="qq" id="qq" htmlEscape="false" maxlength="50"  class="form-control"/></td>
				</tr>
				<tr>
					<td>岗位：</td>
					<td>${user.duty}</td>
					<td>E-mail：</td>
					<td><form:input path="email" id="email" htmlEscape="false" maxlength="50" class="form-control email" /></td>
				</tr>
				<tr>
					<td>出生年月：</td>
					<td><fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd" /></td>
					<td>办公地址：</td>
					<td><form:input path="worklocation" id="worklocation" htmlEscape="false" maxlength="50"  class="form-control"/></td>
				</tr>
				<tr>
					<td>年龄：</td>
					<td>${user.age}</td>
					<td>入职时间：</td>
					<td><fmt:formatDate value="${user.indate}" pattern="yyyy-MM-dd" /></td>
				</tr>
				<tr>
					<td>毕业院校：</td>
					<td>${user.school}</td>
					<td>转正日期：</td>
					<td><fmt:formatDate value="${user.pdate}" pattern="yyyy-MM-dd" /></td>
				</tr>
				<tr>
					<td>最高学历：</td>
					<td>${user.education}</td>
					<td><font color="blue">剩余调休时间</font>：</td>
					<td><input type="text" value="${restTime }" readonly="readonly" class="form-control"></td>
				</tr>
				<tr>
					<td><input id="btnSubmit" class="btn btn-myoa-sec"
						type="submit" value="保存"/></td>
					<td><input class="btn btn-myoa" type="button" value="取消"
						onclick="location.reload()" /></td>
					<td></td>
					<td></td>
				</tr>
			</table>
					</div>
			
					<br />
					<br />
					<table id="contentTable"
						class="table table-striped table-bordered table-condensed">
						<tr>
							<td colspan="9">我的固定资产</td>
						</tr>
						<tr>
							<td>固定资产名称</td>
							<td>资产类别</td>
							<td>品牌</td>
							<td>型号规格</td>
							<td>价格（元）</td>
							<td>数量</td>
							<td>领用/借用日期</td>
							<td>资产编号</td>
							<td>状态</td>
						</tr>
						<c:if test="${empty resultMap}">
							<tr>
								<td colspan="9">
									<h3 style="font-weight: bolder;text-align: center;vertical-align: middle;">暂无固定资产</h3>
								</td>
							</tr>
						</c:if>
						<c:forEach items="${resultMap}" var="tMap">
							<tr>
								<td>${tMap.assetsName}</td>
								<td>${tMap.assetsCategory}</td>
								<td>${tMap.brand}</td>
								<td>${tMap.model}</td>
								<td>${tMap.unitPrice}</td>
								<td><label>1</label></td>
								<td>${tMap.claimTime}</td>
								<td>${tMap.claimNumber}</td>
								<td>${tMap.type}</td>
							</tr>
						</c:forEach>
					</table>
				</form:form>		
			</div>
		</div>
	</div>	
</body>
</html>