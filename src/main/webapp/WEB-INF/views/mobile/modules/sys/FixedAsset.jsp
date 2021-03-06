<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="decorator" content="default"/>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>我的固定资产</title>
		<link rel="stylesheet" type="text/css" href="${ctxStatic}/mobile/css/mui.min.css"/>
		<link rel="stylesheet" type="text/css" href="${ctxStatic}/mobile/css/oabase.css" />
		<script src="${ctxStatic}/mobile/js/mui.min.js"></script>
	</head>
	<body>
	<header class="mui-bar mui-bar-nav">
		<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
		<h1 class="mui-title">我的固定资产</h1>
	</header>
	
	<div class="mui-content fixedasset">
		<c:if test="${empty resultMap}">
			<h3 style="font-weight: bolder;text-align: center;margin-top: 50px;">没有固定资产</h3>
		</c:if>
		<c:forEach items="${resultMap}" var="tMap">
			<div class="fixedasset-list">
				<div class="main-tit">
					<span>
						固定资产名称:
					</span>
					<span class="spannumber">
						${tMap.assetsName} 
					</span>
				</div>
				<ul class="mui-table-view">
					<li class="mui-table-view-cell">
						<span class="fixedspan">
							资产类别:
						</span>
						<span class="assetname">
							${fns:getDictLabel(tMap.assetsCategory, 'assets_category', '')}
						</span>
					</li>		
					<li class="mui-table-view-cell">
						<span class="fixedspan">
							品牌:
						</span>
						<span class="assetname">
							${fns:getDictLabel(tMap.brand, 'equ_brand', '')}
						</span>
					</li>
					<li class="mui-table-view-cell" >
						<span class="fixedspan">
							型号规格:
						</span>
						<span class="assetname">
							${tMap.model}
						</span>
					</li>
					<li class="mui-table-view-cell">
						<span class="fixedspan">
							价格（元）:
						</span>
						<span class="assetname">
							${tMap.unitPrice}
						</span>
					</li>
					<li class="mui-table-view-cell">
						<span class="fixedspan">
							借/领日期:
						</span>
						<span class="assetname">
							${tMap.claimTime}
						</span>
					</li>
					<li class="mui-table-view-cell">
						<span class="fixedspan">
							资产编号:
						</span>
						<span class="assetname">
							${tMap.claimNumber}
						</span>
					</li>
					<li class="mui-table-view-cell">
						<span class="fixedspan">
							状态:
						</span>
						<span class="assetname">
							${tMap.type}
						</span>
					</li>
				</ul>
			</div>		
		</c:forEach>
		
		<div class="bottom-button">
			<button type="button" class="btnapp btn-next" onclick="history.go(-1)">返回</button>
		</div>
	</div>	
		<%-- <jsp:include page="/WEB-INF/views/mobile/modules/sys/foot.jsp"></jsp:include> --%>
	</body>  
</html>
