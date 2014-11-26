<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<head>
<title>Testimonials</title>
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<link rel="stylesheet" href="/static/public/css/oye.css" />
<link href="/static/public/css/common_s.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/static/public/js/jquery-1.9.1.min.js"></script>
<!--<script type="text/javascript" src="js/bootstrap.min.js"></script>-->
<style type="text/css">
	.main-evaluation-list-cont-img{
		background:#fff;
	}
	.main-evaluation-list-cont{
		margin-bottom: 30px;
	}
	.em_video{
	    height: 315px;
	    left: 178px;
	    position: absolute;
	    top: 235px;
	    width: 556px;
	}
</style>
<script type="text/javascript">
	$(function(){
		$("#cont-img01").click(function(){
			$("#m_img01").css("z-index","99");
			$("#m_img02").css("z-index","88");
			$("#m_img03").css("z-index","77");
			$("#embed01").show();
			$("#embed02").hide();
			$("#embed03").hide();
		});
		$("#cont-img02").click(function(){
			$("#m_img02").css("z-index","99");
			$("#m_img01").css("z-index","88");
			$("#m_img03").css("z-index","77");
			$("#embed01").hide();
			$("#embed02").show();
			$("#embed03").hide();
		});
		$("#cont-img03").click(function(){
			$("#m_img01").css("z-index","77");
			$("#m_img02").css("z-index","88");
			$("#m_img03").css("z-index","99");
			$("#embed01").hide();
			$("#embed02").hide();
			$("#embed03").show();
		});
	});
</script>
</head>
<body>
	<!--
       	作者：1213569843@qq.com
       	时间：2014-11-04
       	描述：页头
       -->
	<jsp:include page="enChild_header.jsp" />
	
	<div class="main" style="background: #eaeaea;">
		<img src="/static/public/images/customer_img.jpg" width="100%"/>
		<div class="main-evaluation-list" style="margin:30px auto;">
			<c:forEach var="partners" items="${partners}" varStatus="status">
				<div class="main-evaluation-list-cont">
					<div id="cont-img0${status.index+1 }" class="main-evaluation-list-cont-img">
						<img src="/${partners.logo }" width="120px" height="50px" style="margin-top: 40px;" />
					</div>
					<div class="main-evaluation-list-cont-dis">
						<p class="main-cont-dis-title">${partners.name }</p>
						<p class="main-cont-dis-conts">${partners.content }</p>
					</div>
				</div>
				<div id="embed0${status.index+1 }" <c:if test="${status.index > 0 }">style="display:none;"</c:if> class="em_video">
					<embed id="ckplayer_a1" align="middle" width="556" height="315" 
						pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" name="ckplayer_a1" 
						<c:if test="${partners.videoLink ==null || partners.videoLink =='' }">
							flashvars="f=${www_prefix }/${partners.video }" 
						</c:if>
						<c:if test="${partners.videoLink !=null && partners.videoLink !='' }">
							flashvars="f=${partners.videoLink }" 
						</c:if>
						src="http://www.ckplayer.com/ckplayer/6.5/ckplayer.swf" wmode="transparent" bgcolor="#FFF" 
						quality="high" allowfullscreen="true" allowscriptaccess="always" />
						<!-- http://player.youku.com/player.php/sid/XMzI1ODcwODQw/v.swf -->
				</div>
				<div id="m_img0${status.index+1 }" style="position: absolute; left: 880px; top: 392px; width: 200px; height: 265px;">
					<img src="${partners.path }" width="200" height="265"/>
				</div>
			</c:forEach>
		</div>
		<form action="/enCust.jhtml" id="listForm">
			<jsp:include page="/WEB-INF/back/include/pagination.jsp" flush="true" />
		</form>
	</div>
	<!--
       	作者：1213569843@qq.com
       	时间：2014-11-04
       	描述：页尾
       -->
	<jsp:include page="enFooter.jsp" />
</body>
</html>
