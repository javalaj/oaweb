<%-- <%@ page contentType="text/html;charset=UTF-8"%><meta
	http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta name="author" content="http://jeesite.com/" />
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=8,IE=9,IE=10" />
<meta http-equiv="Expires" content="0">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Cache-Control" content="no-store">
<script src="${ctxStatic}/jquery/jquery-1.8.3.min.js"
	type="text/javascript"></script>
<link
	href="${ctxStatic}/bootstrap/2.3.1/css_${not empty cookie.theme.value ? cookie.theme.value : 'cerulean'}/bootstrap.min.css"
	type="text/css" rel="stylesheet" />
<script src="${ctxStatic}/bootstrap/2.3.1/js/bootstrap.min.js"
	type="text/javascript"></script>
<link href="${ctxStatic}/bootstrap/2.3.1/awesome/font-awesome.min.css"
	type="text/css" rel="stylesheet" />
<!--[if lte IE 7]><link href="${ctxStatic}/bootstrap/2.3.1/awesome/font-awesome-ie7.min.css" type="text/css" rel="stylesheet" /><![endif]-->
<!--[if lte IE 6]><link href="${ctxStatic}/bootstrap/bsie/css/bootstrap-ie6.min.css" type="text/css" rel="stylesheet" />
<script src="${ctxStatic}/bootstrap/bsie/js/bootstrap-ie.min.js" type="text/javascript"></script><![endif]-->
<link href="${ctxStatic}/jquery-select2/3.4/select2.min.css"
	rel="stylesheet" />
<script src="${ctxStatic}/jquery-select2/3.4/select2.min.js"
	type="text/javascript"></script>
<link
	href="${ctxStatic}/jquery-validation/1.11.0/jquery.validate.min.css"
	type="text/css" rel="stylesheet" />
<script
	src="${ctxStatic}/jquery-validation/1.11.0/jquery.validate.min.js"
	type="text/javascript"></script>
<link href="${ctxStatic}/jquery-jbox/2.3/Skins/Bootstrap/jbox.min.css"
	rel="stylesheet" />
<script src="${ctxStatic}/jquery-jbox/2.3/jquery.jBox-2.3.min.js"
	type="text/javascript"></script>
<script src="${ctxStatic}/My97DatePicker/WdatePicker.js"
	type="text/javascript"></script>
<script src="${ctxStatic}/common/mustache.min.js" type="text/javascript"></script>
<link href="${ctxStatic}/common/jeesite.css" type="text/css"
	rel="stylesheet" />
<script src="${ctxStatic}/common/jeesite.js" type="text/javascript"></script>
<script src="${ctxStatic}/liuxin/fn.js" type="text/javascript"></script>
<script src="${ctxStatic}/messageBox/messageBox.js" type="text/javascript"></script>
<script type="text/javascript">
	var ctx = '${ctx}', ctxStatic = '${ctxStatic}';
</script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						function banBackSpace(e) {
							var ev = e || window.event;
							var obj = ev.target || ev.srcElement;

							var t = obj.type || obj.getAttribute('type');

							var vReadOnly = obj.getAttribute('readonly');
							var vEnabled = obj.getAttribute('enabled');

							vReadOnly = (vReadOnly == null) ? false : vReadOnly;
							vEnabled = (vEnabled == null) ? true : vEnabled;

							var flag1 = (ev.keyCode == 8
									&& (t == "password" || t == "text" || t == "textarea") && (vReadOnly == true || vEnabled != true)) ? true
									: false;

							var flag2 = (ev.keyCode == 8 && t != "password"
									&& t != "text" && t != "textarea") ? true
									: false;

							if (flag2) {
								return false;
							}
							if (flag1) {
								return false;
							}
						}
						document.onkeypress = banBackSpace;
						document.onkeydown = banBackSpace;

					});
</script> --%>
<%@ page contentType="text/html;charset=UTF-8" %><meta http-equiv="Content-Type" content="text/html;charset=utf-8" /><meta name="author" content="http://www.jeeplus.org/"/>
<meta name="renderer" content="webkit"><meta http-equiv="X-UA-Compatible" content="IE=9,IE=10" />
<meta http-equiv="Expires" content="0"><meta http-equiv="Cache-Control" content="no-cache"><meta http-equiv="Cache-Control" content="no-store">
<!-- 引入jquery插件 -->
<script src="${ctxStatic}/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/jquery/jquery-migrate-1.1.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctxStatic}/TableDnD/jquery.tablednd.js"></script>


<!-- 引入依赖的第三方插件 -->
<script src="${ctxStatic}/slimscroll/jquery.slimscroll.min.js"></script>
<link
	href="${ctxStatic}/jquery-validation/1.11.0/jquery.validate.min.css"
	type="text/css" rel="stylesheet" />
<script
	src="${ctxStatic}/jquery-validation/1.11.0/jquery.validate.min.js"
	type="text/javascript"></script>
<link href="${ctxStatic}/jquery-jbox/2.3/Skins/Bootstrap/jbox.min.css" rel="stylesheet" />
<script src="${ctxStatic}/jquery-jbox/2.3/jquery.jBox-2.3.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script src="${ctxStatic}/pace/pace.min.js"></script>
<script src="${ctxStatic}/metisMenu/jquery.metisMenu.js"></script>
<link href="${ctxStatic}/iCheck/custom.css" rel="stylesheet" />
<script src="${ctxStatic}/iCheck/icheck.min.js"></script>
<script src="${ctxStatic}/iCheck/icheck-init.js"></script>
<link href="${ctxStatic}/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
<script src="${ctxStatic}/dataTables/jquery.dataTables.js"></script>
<script src="${ctxStatic}/dataTables/dataTables.bootstrap.js"></script>


<!-- jeeplus -->
<link href="${ctxStatic}/common/jeeplus.css" type="text/css" rel="stylesheet" />
<script src="${ctxStatic}/common/jeeplus.js" type="text/javascript"></script>

<!-- jquery ui -->
<script src="${ctxStatic}/jquery-ui/jquery-ui.min.js"></script>

<!-- 引入bootstrap插件 -->
<!-- bootswatch主题效果不怎么好，停止切换，使用官网的默认版本，如果你想切换主题请访问http://bootswatch.com/下载最新版版主题，by刘高峰 -->
<!--  <link href="${ctxStatic}/bootstrap/3.3.4/css_${not empty cookie.theme.value ? cookie.theme.value : 'default'}/bootstrap.min.css" type="text/css" rel="stylesheet" />-->
<link href="${ctxStatic}/bootstrap/3.3.4/css_default/bootstrap.min.css" type="text/css" rel="stylesheet" />
<script src="${ctxStatic}/bootstrap/3.3.4/js/bootstrap.min.js"  type="text/javascript"></script>
<link href="${ctxStatic}/awesome/4.4/css/font-awesome.min.css" rel="stylesheet" />
<link href="${ctxStatic}/common/css/style.css?v=3.2.0" type="text/css" rel="stylesheet" />
<!-- bootstrap-select插件 -->
<link href="${ctxStatic}/bootstrap-select/css/bootstrap-select.min.css" type="text/css" rel="stylesheet" />
<script src="${ctxStatic}/bootstrap-select/js/bootstrap-select.min.js" type="text/javascript"></script>
<!-- 引入layer插件 -->
<script src="${ctxStatic}/layui-v1.0.9_rls/layui/layui.js"></script>
<link rel="stylesheet" href="${ctxStatic}/layui-v1.0.9_rls/layui/css/layui.css"  media="all"></link>

<script src="${ctxStatic}/layui-v1.0.9_rls/laydate/laydate.js"></script>

<script src="${ctxStatic}/common/layuiindex.js"></script>

<!--引入webuploader-->
<link rel="stylesheet" type="text/css" href="${ctxStatic}/webuploader-0.1.5/webuploader.css">
<script type="text/javascript" src="${ctxStatic}/webuploader-0.1.5/webuploader.js"></script>

<!-- 引入summernote-->
<link href="${ctxStatic}/summernote/summernote.css" rel="stylesheet">
<link href="${ctxStatic}/summernote/summernote-bs3.css" rel="stylesheet">
<script src="${ctxStatic}/summernote/summernote.min.js"></script>
<script src="${ctxStatic}/summernote/summernote-zh-CN.js"></script>

<!-- 引入iconfont -->
<link href="${ctxStatic}/iconfont/iconfont.css" type="text/css" rel="stylesheet" />

<!-- 引入自定义文件 -->
<script src="${ctxStatic}/liuxin/fn.js" type="text/javascript"></script>
<script src="${ctxStatic}/liuxin/js/liuxin-validate.js" type="text/javascript"></script>
<script src="${ctxStatic}/messageBox/messageBox.js" type="text/javascript"></script>
<script src="${ctxStatic}/common/mustache.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/common/content.js" type="text/javascript"></script>
<link href="${ctxStatic}/common/css/animate.css" type="text/css" rel="stylesheet" />
<link href="${ctxStatic}/common/css/login.css" type="text/css" rel="stylesheet" />
<script type="text/javascript">var ctx = '${ctx}', ctxStatic='${ctxStatic}';</script>
<link href="${ctxStatic}/common/css/oa.css" type="text/css" rel="stylesheet" />

<!--  引入导出-->
<script type="text/javascript" src="${ctxStatic}/export-excel/Blob.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic}/export-excel/FileSaver.min.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic}/export-excel/ExportUtil.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic}/export-excel/assetExport.js" charset="utf-8"></script>

<script src="${ctxStatic}/common/oa.jquery.validate.ext.js"></script>
<script src="${ctxStatic}/common/oa.js"></script>

