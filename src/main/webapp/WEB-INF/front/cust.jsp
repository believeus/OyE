<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<head>
<title>客户感言</title>
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<link rel="stylesheet" href="/static/public/css/oye.css" />
<script type="text/javascript" src="/static/public/js/jquery-1.9.1.min.js"></script>
<!--<script type="text/javascript" src="js/bootstrap.min.js"></script>-->
<style type="text/css">
	.main-evaluation-list-cont-img{
		background:#fff;
	}
	.main-evaluation-list-cont{
		margin-bottom: 30px;
	}
</style>
</head>
<body>
	<!--
       	作者：1213569843@qq.com
       	时间：2014-11-04
       	描述：页头
       -->
	<jsp:include page="header.jsp" />
	
	<div class="main" style="background: #eaeaea;">
		<img src="/static/public/images/customer_img.jpg" width="100%"/>
		<div class="main-evaluation-list" style="margin:30px auto;">
			<c:forEach var="partners" items="${partners}" varStatus="status">
				<div class="main-evaluation-list-cont">
				<div class="main-evaluation-list-cont-img">
					<img src="/${partners.path }" width="120px" height="50px" style="margin-top: 40px;" />
				</div>
				<div class="main-evaluation-list-cont-dis">
					<p class="main-cont-dis-title">${partners.name }</p>
					<p class="main-cont-dis-conts">${partners.content }</p>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
	<!--
       	作者：1213569843@qq.com
       	时间：2014-11-04
       	描述：页尾
       -->
	<jsp:include page="footer.jsp" />
</body>
</html>
