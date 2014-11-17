<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
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
</style>
</head>
<body>
	<!--
       	作者：1213569843@qq.com
       	时间：2014-11-04
       	描述：页头
       -->
	<jsp:include page="header.jsp" />
	
	<div class="main">
		<!-- <img src="/static/public/images/news_list.jpg" width="100%"/> -->
		<div class="main_content">
			<div class="main_content_title">
				<div class="main_content_title_2">最新动态</div>
			</div>
			<div class="main_content_body">
				<div class="main_content_body_img">
					<img src="/static/public/images/newslist_img.jpg" width="600"/>
				</div>
				<div class="main_content_body_link">
				<c:forEach var="newx" items="${news}" varStatus="status">
					<p class="link_title">
						<a href="/newsInfo.jhtml?id=${newx.id }" style="color:#000;">${newx.title }</a>
					</p>									
				</c:forEach>				
				</div>
				<div class="main_content_body_list">
					<div class="list_date">
						07.11.2014
					</div>
					<div class="list_dis">
						<div class="list_title">
							南大通用与oye联手，在中国创建自主创新的数据库
						</div>
						<div class="list_content">
							oye与天津南大通用数据技术股份公司（一下简称南大通用）今日宣布将在中国创建自主创新的数据库产品。为支持国家科技规划，南大通用将基于oye技术开发并销售这种本地创新的解决方案。
						</div>
					</div>
				</div>
				<div class="main_content_body_list">
					<div class="list_date">
						07.11.2014
					</div>
					<div class="list_dis">
						<div class="list_title">
							南大通用与oye联手，在中国创建自主创新的数据库
						</div>
						<div class="list_content">
							oye与天津南大通用数据技术股份公司（一下简称南大通用）今日宣布将在中国创建自主创新的数据库产品。为支持国家科技规划，南大通用将基于oye技术开发并销售这种本地创新的解决方案。
						</div>
					</div>
				</div>
				<div class="main_content_body_list">
					<div class="list_date">
						07.11.2014
					</div>
					<div class="list_dis">
						<div class="list_title">
							南大通用与oye联手，在中国创建自主创新的数据库
						</div>
						<div class="list_content">
							oye与天津南大通用数据技术股份公司（一下简称南大通用）今日宣布将在中国创建自主创新的数据库产品。为支持国家科技规划，南大通用将基于oye技术开发并销售这种本地创新的解决方案。
						</div>
					</div>
				</div>
				<div class="main_content_body_list">
					<div class="list_date">
						07.11.2014
					</div>
					<div class="list_dis">
						<div class="list_title">
							南大通用与oye联手，在中国创建自主创新的数据库
						</div>
						<div class="list_content">
							oye与天津南大通用数据技术股份公司（一下简称南大通用）今日宣布将在中国创建自主创新的数据库产品。为支持国家科技规划，南大通用将基于oye技术开发并销售这种本地创新的解决方案。
						</div>
					</div>
				</div>
				<div class="main_content_body_list">
					<div class="list_date">
						07.11.2014
					</div>
					<div class="list_dis">
						<div class="list_title">
							南大通用与oye联手，在中国创建自主创新的数据库
						</div>
						<div class="list_content">
							oye与天津南大通用数据技术股份公司（一下简称南大通用）今日宣布将在中国创建自主创新的数据库产品。为支持国家科技规划，南大通用将基于oye技术开发并销售这种本地创新的解决方案。
						</div>
					</div>
				</div>
				<div class="main_content_body_list">
					<div class="list_date">
						07.11.2014
					</div>
					<div class="list_dis">
						<div class="list_title">
							南大通用与oye联手，在中国创建自主创新的数据库
						</div>
						<div class="list_content">
							oye与天津南大通用数据技术股份公司（一下简称南大通用）今日宣布将在中国创建自主创新的数据库产品。为支持国家科技规划，南大通用将基于oye技术开发并销售这种本地创新的解决方案。
						</div>
					</div>
				</div>
			</div>
			<div style="width:1140px;height:1px;border-bottom:1px dashed #c6c6c6;margin-bottom:30px;"></div>
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
