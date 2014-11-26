<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<title>站内新闻</title>
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
	    /* color: #000; */
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
	    padding-left:20px;
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
	<jsp:include page="child_header.jsp" />
	
	<div class="main">
		<!-- <img src="/static/public/images/news_list.jpg" width="100%"/> -->
		<div class="main_content">
			<div class="main_content_title">
				<div class="main_content_title_2">最新动态</div>
			</div>
			<div class="main_content_body">
				
				<div style="width:180px;height:300px;overflow:hidden;float:left;margin-right:50px;border: 2px solid #e4e4e4;margin-bottom:50px;">
					<div style="background:#dd2a2a;color: #fff;font-size: 15px;font-weight: bold; height: 30px;line-height: 30px;padding-left: 20px;">资讯导航</div>
					<ul class="newstitle">
						<li>
							<a class="current_au" id="dt" href="/newsList.jhtml?type=0" title="最新动态">最新动态</a>
						</li>
						<li>
							<a id="bd" href="/newsList.jhtml?type=1" title="媒体报道">媒体报道</a>
						</li>
						<li>
							<a id="wt" href="/newsList.jhtml?type=2" title="常见问题">常见问题</a>
						</li>
					</ul>
				</div>
				<div style="width:900px;height:30px;overflow: hidden;float:left;border-bottom:1px solid #eee;line-height:30px;margin-bottom: 10px;">
					&gt;&gt;  您现在的位置：<a href="/newsList.jhtml?type=0">站内新闻</a>
				</div>
				<div style="width:900px;height:auto;overflow: hidden;float:left;">
					<ul class="newscontent">
						<c:forEach items="${news }" var="news">
							<li>
								<span style="float:left;margin-right:10px;">&gt;&gt;</span>
								<a href="/newsInfo.jhtml?id=${news.id }" title="${news.title }" style="float: left;">${news.title }</a>
								<%-- <span style="float:right;">${news.createTime }</span> --%>
								<span style="float:right;">2014-11-22</span>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!--
       	作者：1213569843@qq.com
       	时间：2014-11-04
       	描述：页尾
       -->
	<jsp:include page="footer.jsp" />
	<script type="text/javascript">
		$(function(){
			//alert(window.location.href.substring(window.location.href.length-1));
			var type = window.location.href.substring(window.location.href.length-1);
			if(type==0){
				$("#dt").removeClass("current_au");
				$("#bd").removeClass("current_au");
				$("#wt").removeClass("current_au");
				$("#dt").addClass("current_au");
			}else if(type==1){
				$("#dt").removeClass("current_au");
				$("#bd").removeClass("current_au");
				$("#wt").removeClass("current_au");
				$("#bd").addClass("current_au");
			}else if(type==2){
				$("#dt").removeClass("current_au");
				$("#bd").removeClass("current_au");
				$("#wt").removeClass("current_au");
				$("#wt").addClass("current_au");
			}
		});
	</script>
</body>
</html>
