<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	    height: 320px;
	    width: 567px;
	    left: 178px;
	    position: relative;
	    top: 132px;
	}
	.m_imgs{
		position: relative; left: 891px; top: -32px; width: 203px; height: 267px;
	}
</style>
<script type="text/javascript">
	$(function(){
		$("#cont-img01").click(function(){
			$("#m_img01").show();
			$("#m_img02").hide();
			$("#m_img03").hide();
			$("#m_img04").hide();
			$("#m_img05").hide();
			$("#m_img06").hide();
			$("#embed01").show();
			$("#embed02").hide();
			$("#embed03").hide();
			$("#embed04").hide();
			$("#embed05").hide();
			$("#embed06").hide();
		});
		$("#cont-img02").click(function(){
			$("#m_img01").hide();
			$("#m_img02").show();
			$("#m_img03").hide();
			$("#m_img04").hide();
			$("#m_img05").hide();
			$("#m_img06").hide();
			$("#embed01").hide();
			$("#embed02").show();
			$("#embed03").hide();
			$("#embed04").hide();
			$("#embed05").hide();
			$("#embed06").hide();
		});
		$("#cont-img03").click(function(){
			$("#m_img01").hide();
			$("#m_img02").hide();
			$("#m_img03").show();
			$("#m_img04").hide();
			$("#m_img05").hide();
			$("#m_img06").hide();
			$("#embed01").hide();
			$("#embed02").hide();
			$("#embed03").show();
			$("#embed04").hide();
			$("#embed05").hide();
			$("#embed06").hide();
		});
		$("#cont-img04").click(function(){
			$("#m_img01").hide();
			$("#m_img02").hide();
			$("#m_img03").hide();
			$("#m_img04").show();
			$("#m_img05").hide();
			$("#m_img06").hide();
			$("#embed01").hide();
			$("#embed02").hide();
			$("#embed03").hide();
			$("#embed04").show();
			$("#embed05").hide();
			$("#embed06").hide();
		});
		$("#cont-img05").click(function(){
			$("#m_img01").hide();
			$("#m_img02").hide();
			$("#m_img03").hide();
			$("#m_img04").hide();
			$("#m_img05").show();
			$("#m_img06").hide();
			$("#embed01").hide();
			$("#embed02").hide();
			$("#embed03").hide();
			$("#embed04").hide();
			$("#embed05").show();
			$("#embed06").hide();
		});
		$("#cont-img06").click(function(){
			$("#m_img01").hide();
			$("#m_img02").hide();
			$("#m_img03").hide();
			$("#m_img04").hide();
			$("#m_img05").hide();
			$("#m_img06").show();
			$("#embed01").hide();
			$("#embed02").hide();
			$("#embed03").hide();
			$("#embed04").hide();
			$("#embed05").hide();
			$("#embed06").show();
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
		<!-- <img src="/static/public/images/customer_img.jpg" width="100%"/> -->
		<div style="width:1366px;height:614px;background:url(/static/public/images/customer_img.jpg);margin:0 auto;">
			<c:if test="${partnersSize!=0 }">
				<c:forEach items="${partners }" var="partners" varStatus="status">
					<c:if test="${status.index < 6}">
						<div id="embed0${status.index+1 }" <c:if test="${status.index > 0 }">style="display:none;"</c:if> class="em_video">
							<c:if test="${partners.videoLink ==null || partners.videoLink =='' }">
								 <embed id="ckplayer_a1" align="middle" width="567" height="320" 
									pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" name="ckplayer_a1" 
									flashvars="f=${www_prefix}/${partners.video }" 
									src="http://www.ckplayer.com/ckplayer/6.5/ckplayer.swf" wmode="transparent" bgcolor="#FFF" 
									quality="high" allowfullscreen="true" allowscriptaccess="always" />
							</c:if>
							<c:if test="${partners.videoLink !=null && partners.videoLink !='' }">
								<embed src="${partners.videoLink }" style="width:567px;height:320px;"/>
							</c:if>
						</div>
						<div id="m_img0${status.index+1 }" class="m_imgs" <c:if test="${status.index > 0 }">style="display:none;"</c:if>>
							<img src="${partners.path }" width="203" height="267"/>
						</div>
					</c:if>
				</c:forEach>
			</c:if>
		</div>
		<div class="main-evaluation-list" style="margin:30px auto;">
			<c:forEach var="partners" items="${partners}" varStatus="status">
				<div class="main-evaluation-list-cont">
					<div id="cont-img0${status.index+1 }" class="main-evaluation-list-cont-img">
						<img src="/${partners.logo }" width="120px" height="50px" style="margin-top: 40px;" />
					</div>
					<div class="main-evaluation-list-cont-dis">
						<p class="main-cont-dis-title">${partners.name }</p>
						<p class="main-cont-dis-conts">
							${fn:substring(partners.content, 0, 30)}
							<c:if test="${fn:length(partners.content) > 30 }">
			   					...
		   					</c:if>
						</p>
					</div>
				</div>
			</c:forEach>
			<form action="/enCust.jhtml" id="listForm">
				<jsp:include page="/WEB-INF/back/include/pagination.jsp" flush="true" />
			</form>
		</div>
	</div>
	<!--
       	作者：1213569843@qq.com
       	时间：2014-11-04
       	描述：页尾
       -->
	<jsp:include page="enFooter.jsp" />
</body>
</html>
