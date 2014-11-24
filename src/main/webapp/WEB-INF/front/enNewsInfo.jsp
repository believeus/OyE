<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<head>
<title>News Info</title>
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
	.NI_h1{
		color: #fff;
	    font-family: songti;
	    font-size: 25px;
	    font-weight: normal;
	    text-align: center;	
	}
	.NI_duanluo{
		width: 1100px; height: auto; overflow: hidden; margin: 30px auto;
	}
	.NI_duanluo p {
	    color: #fefefe;
	    font-size: 21px;
	    line-height: 30px;
	    text-indent: 30px;
	    font-family: heiti;
	}
	.NI_line{
		width:1140px;height:1px;border-bottom:1px dashed #c6c6c6;margin-bottom:20px;
	}	
	.NI_fanye{
		width:1140px;height:auto;margin-bottom:20px;padding-left:30px;
	}
	.NI_fanye p{
		line-height:30px;
	}
	.NI_fanye a{
		color:#FFF;
	}
</style>
</head>
<body>
	<!--
       	作者：1213569843@qq.com
       	时间：2014-11-04
       	描述：页头
       -->
	<jsp:include page="enHeader.jsp" />
	
	<div class="main" style="background:#505050;">
		<div class="main_content">
			<div class="main_content_title">
				<div class="main_content_title_2" style="width:120px;">Dynamic news</div>
			</div>
			<div class="">
				<h1 class="NI_h1" style="text-align:center;">${news.title }</h1>
				<p style="text-align:center;margin-bottom:30px;color:#fff;">
					<span style="margin-right:20px;">date：${time }</span>
				</p>
				<div style="text-align:center;">
					<img src="/${news.path }" width="780"/>
				</div>
				<div class="NI_duanluo">
					${news.content }
				</div>
			</div>
			<div class="NI_line"></div>
			<!-- <div class="NI_fanye">
				<p>上一篇：<a href="#">二十国集团(G20)领导人第九次峰会</a></p>
				<p>下一篇：<a href="#">当地时间15日下午，国家主席习近平出席第一阶段会议</a></p>
			</div> -->
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
