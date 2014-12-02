<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
<title>Our Business</title>
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<link rel="stylesheet" href="/static/public/css/oye.css" />
<script type="text/javascript" src="/static/public/js/jquery-1.9.1.min.js"></script>
<style type="text/css">
	.main_content{
		width:1140px;height:auto;overflow:hidden;margin:0 auto;
	}
	.main_content_title{
		height:40px;line-height:40px;border-bottom:1px dashed #C6C6C6;margin-bottom: 20px;
	}
	.main_content_body {
	    height: auto;
	    overflow: hidden;
	    width: 1140px;
	}
	.main_content_title_2{
		width:80px;height:40px;line-height:40px;border-bottom:1px solid #FFA9B0;font-size:17px;color:#FFA9B0;font-weight:bold;font-family: songti;
	}
	.main_content_body_img{
		width:600px;height:330px;float:left;margin-right: 20px; margin-bottom: 20px;
	}
	.main_content_body_link{
		float:left;height:330px;width: 520px;
	}
	.link_title a {
	    font-size: 17px;
	    text-decoration: underline;
	    line-height: 35px;
	}
	.main_content_body_list{
		width:1140px;height:auto;overflow:hidden;margin:0 auto 20px;
	}
	.list_date{
		width:150px;height:auto;overflow:hidden;float:left;padding-top: 10px;
	}
	.list_dis{
		width:990px;height:auto;overflow:hidden;float:left;
	}
	.list_title {
	    color: #888;
	    font-size: 18px;
	    font-weight: bold;
	    margin-bottom: 10px;
	}
	.list_content {
	    font-size: 16px;
	    line-height: 25px;
	}
	.img_a1{
	    height: 127px;
	    left: 557px;
	    position: relative;
	    top: -1637px;
	    width: 374px;
	}
	.img_a1 span {
	    color: #888;
	    font-size: 16px;
	    left: 30px;
	    position: relative;
	    top: 60px;
	}
	.img_a2{
	    height: 305px;
	    left: 73px;
	    position: relative;
	    top: -1719px;
	    width: 410px;
	}
	.img_a2 span {
	    color: #ffffff;
	    font-size: 16px;
	    left: 90px;
	    position: relative;
	    top: 100px;
	}
	.img_a3{
	    height: 299px;
	    left: 559px;
	    position: relative;
	    top: -1837px;
	    width: 402px;
	}
	.img_a3 span {
	    color: #ffffff;
	    font-size: 16px;
	    left: 30px;
	    position: relative;
	    top: 100px;
	}
	.img_a4{
	    height: 285px;
	    left: 90px;
	    position: relative;
	    top: -1929px;
	    width: 394px;
	}
	.img_a4 span {
	    color: #ffffff;
	    font-size: 16px;
	    left: 70px;
	    position: relative;
	    top: 100px;
	}
	.img_a5{
	    height: 327px;
	    left: 554px;
	    position: relative;
	    top: -2027px;
	    width: 531px;
	}
	.img_a5 span {
	    color: #ffffff;
	    font-size: 16px;
	    left: 35px;
	    position: relative;
	    top: 120px;
	}
</style>
</head>
<body>
	<!--
       	作者：1213569843@qq.com
       	时间：2014-11-04
       	描述：页头
       -->
	<jsp:include page="enChild_header.jsp" />
	
	<div class="main">
		<div class="main_content">
			<div class="main_content_title">
				<div class="main_content_title_2" style="width: 130px;">Our Business</div>
			</div>
			<div class="main-service" style="margin-top:30px;">
				<div class="main-service-list">
					<c:if test="${bsize!=0 }">
						<c:forEach items="${businesses }" var="bus" varStatus="status">
								<div class="main-service-cont" <c:if test="${(status.index+1)%3==0 }">style="margin-right:0;"</c:if>>
									<div class="main-service-cont-img">
										<img src="${bus.path }" width="99" height="99"/>
									</div>
									<div class="main-service-cont-name">
										${fn:substring(bus.title, 0, 20)}
										<c:if test="${fn:length(bus.title) > 20 }">
						   					...
					   					</c:if>
									</div>
									<div class="main-service-cont-dis">
										${fn:substring(bus.description, 0, 100)}
										<c:if test="${fn:length(bus.description) > 100 }">
						   					...
					   					</c:if>
									</div>
								</div>
						</c:forEach>
					</c:if>
					<c:if test="${bsize==0 }">
						<div class="main-service-cont">
							<div class="main-service-cont-img">
								<img src="/static/public/images/bgs.png" width="99" height="99"/>
							</div>
							<div class="main-service-cont-name">
								Office cleaning and air treatment
							</div>
							<div class="main-service-cont-dis">
								According to the enterprise office relocation required to provide full or partial removal, puts forward the problems need to be noticed in the removal process.
							</div>
						</div>
						<div class="main-service-cont">
							<div class="main-service-cont-img">
								<img src="/static/public/images/cc.png" width="99" height="99"/>
							</div>
							<div class="main-service-cont-name">
								Storage
							</div>
							<div class="main-service-cont-dis">
								According to the enterprise office relocation required to provide full or partial removal, puts forward the problems need to be noticed in the removal process.
							</div>
						</div>
						<div class="main-service-cont" style="margin-right:0;">
							<div class="main-service-cont-img">
								<img src="/static/public/images/es.png" width="99" height="99"/>
							</div>
							<div class="main-service-cont-name">
								Second-hand furniture recycling
							</div>
							<div class="main-service-cont-dis">
								According to the enterprise office relocation required to provide full or partial removal, puts forward the problems need to be noticed in the removal process.
							</div>
						</div>
						<div class="main-service-cont">
							<div class="main-service-cont-img">
								<img src="/static/public/images/people.png" width="99" height="99"/>
							</div>
							<div class="main-service-cont-name">
								Private domestic city relocation
							</div>
							<div class="main-service-cont-dis">
								According to the enterprise office relocation required to provide full or partial removal, puts forward the problems need to be noticed in the removal process.
							</div>
						</div>
						<div class="main-service-cont">
							<div class="main-service-cont-img">
								<img src="/static/public/images/phone.png" width="99" height="99"/>
							</div>
							<div class="main-service-cont-name">
								Office moved
							</div>
							<div class="main-service-cont-dis">
								According to the enterprise office relocation required to provide full or partial removal, puts forward the problems need to be noticed in the removal process.
							</div>
						</div>
						<div class="main-service-cont" style="margin-right:0;">
							<div class="main-service-cont-img">
								<img src="/static/public/images/es.png" width="99" height="99"/>
							</div>
							<div class="main-service-cont-name">
								Laboratory moved
							</div>
							<div class="main-service-cont-dis">
								According to the enterprise office relocation required to provide full or partial removal, puts forward the problems need to be noticed in the removal process.
							</div>
						</div>
					</c:if>
				</div>
			</div>
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
