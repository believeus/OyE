<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
<title>About OyE</title>
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
		width:210px;height:40px;line-height:40px;border-bottom:1px solid #FFA9B0;font-size:17px;color:#FFA9B0;font-weight:bold;font-family: songti;
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
	.link_title a:hover{
		color:#000;
	}
	.list_title a{
		font-size:18px;
	}
	.list_title a:hover{
		color:#000;
		text-decoration: underline;
	}
	.newstitle a {
	    font-weight: bold;
	}
	.newstitle li{
		border-bottom: 1px solid #eee;
	    line-height: 30px;
	    text-align: center;
	    margin: 0 22px;
	}
	.newscontent li{
		border-bottom: 1px dashed #eee;
	    line-height: 30px;
	    text-align: left;
	    height: 35px;
	}
	.newstitle a:hover{
		color:#ff5900;
	}
	.newscontent p {
	    font-size: 16px;
	}
	.newscontent p:hover{
		color:#ff5900 !important;
		text-decoration: underline;
	}
	.current_au{
		color:#DD2A2A;
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
		<!-- <img src="/static/public/images/news_list.jpg" width="100%"/> -->
		<div class="main_content">
			<div class="main_content_title">
				<div class="main_content_title_2" style="">
					${fn:substring(contactusInfo.category, 0, 20)}
					<c:if test="${fn:length(contactusInfo.category) > 20 }">
	   					...
   					</c:if>
				</div>
			</div>
			<div class="main_content_body">
				<div style="width:180px;height:300px;overflow:hidden;float:left;margin-right:50px;border: 2px solid #e4e4e4;margin-bottom:50px;">
					<div style="background:#dd2a2a;color: #fff;font-size: 15px;font-weight: bold; height: 30px;line-height: 30px;padding-left: 20px;">Column navigation</div>
					<ul class="newstitle">
						<c:forEach items="${categories }" var="category" varStatus="status">
							<li>
								<a
									<c:if test="${status.index==0}">id="dt" </c:if>
									<c:if test="${status.index==1}">id="ry" </c:if>
									<c:if test="${status.index==2}">id="wh" </c:if>
									<c:if test="${status.index==3}">id="wh2" </c:if>
									<c:if test="${status.index==4}">id="wh3" </c:if>
									<c:if test="${status.index==0}"> class="current_au" </c:if> 
									href="/oyeInfo.jhtml?id=${category.id }#${status.index}" title="${category.category }">
									${fn:substring(category.category, 0, 16)}
									<c:if test="${fn:length(category.category) > 16 }">
					   					...
				   					</c:if>
								</a>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div style="width:900px;height:30px;overflow: hidden;float:left;border-bottom:1px solid #eee;line-height:30px;margin-bottom: 10px;">
					&gt;&gt;  your position：<a href="/contactusInfo.jhtml?type=0">${contactusInfo.category}</a>
				</div>
				<div style="width:900px;height:auto;overflow: hidden;float:left;">
					<div>${contactusInfo.content }</div>
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
	<script type="text/javascript">
		$(function(){
			//alert(window.location.href.substring(window.location.href.length-1));
			var type = window.location.href.substring(window.location.href.length-1);
			if(type==0){
				$("#dt").removeClass("current_au");
				$("#ry").removeClass("current_au");
				$("#wh").removeClass("current_au");
				$("#wh2").removeClass("current_au");
				$("#wh3").removeClass("current_au");
				$("#dt").addClass("current_au");
			}else if(type==1){
				$("#dt").removeClass("current_au");
				$("#ry").removeClass("current_au");
				$("#wh").removeClass("current_au");
				$("#wh2").removeClass("current_au");
				$("#wh3").removeClass("current_au");
				$("#ry").addClass("current_au");
			}else if(type==2){
				$("#dt").removeClass("current_au");
				$("#ry").removeClass("current_au");
				$("#wh").removeClass("current_au");
				$("#wh2").removeClass("current_au");
				$("#wh3").removeClass("current_au");
				$("#wh").addClass("current_au");
			}else if(type==3){
				$("#dt").removeClass("current_au");
				$("#ry").removeClass("current_au");
				$("#wh").removeClass("current_au");
				$("#wh2").removeClass("current_au");
				$("#wh3").removeClass("current_au");
				$("#wh2").addClass("current_au");
			}else if(type==3){
				$("#dt").removeClass("current_au");
				$("#ry").removeClass("current_au");
				$("#wh").removeClass("current_au");
				$("#wh2").removeClass("current_au");
				$("#wh3").removeClass("current_au");
				$("#wh3").addClass("current_au");
			}
			
		});
	</script>
</body>
</html>
