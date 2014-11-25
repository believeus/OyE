<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<head>
<title>服务流程</title>
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
	<div style="width:100%;height:80px;text-align:center;font-size:25px;line-height:80px;">
		服务流程
	</div>
	<jsp:include page="header.jsp" />
	
	<div class="main">
		<div class="main_content" style="height: 1100px;">
			<div class="main_content_title">
				<div class="main_content_title_2">服务流程</div>
			</div>
			<div style="margin-top: 50px;">
					<img src="/static/public/images/img06.png" style="position: relative; left: 500px;" />
					<img src="/static/public/images/a1.jpg"  style="position: relative; left: 507px; top: -875px;"/>
					<img src="/static/public/images/a2.jpg"  style="margin-top: 50px; position: relative; top: -650px; left: -355px;"/>
					<img src="/static/public/images/a3.jpg"  style="position: relative; left: 560px; top: -770px;"/>
			 		<img src="/static/public/images/a4.jpg"  style="position: relative; left: -315px; top: -575px;"/>
					<img src="/static/public/images/a5.jpg"  style="position: relative; top: -675px; left: 555px;"/>
				</div>
				<c:if test="${prosSize!=0 }">
					<c:forEach items="${pros }" var="pro" varStatus="status">
						<div class="img_a${status.index+1 }">
							<span>${pro.cn }</span><br /><br />
							<span>${pro.en }</span>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${prosSize==0 }">
					<div class="img_a1">
						<span>控制流程</span><br /><br />
						<span>control stream</span>
					</div>
					<div class="img_a2">
						<span>第一步</span><br /><br />
						<span>the first step</span>
					</div>
					<div class="img_a3">
						<span>第二步</span><br /><br />
						<span>the second step</span>
					</div>
					<div class="img_a4">
						<span>第三步</span><br /><br />
						<span>the third step</span>
					</div>
					<div class="img_a5">
						<span>第四步</span><br /><br />
						<span>the four step</span>
					</div>
				</c:if>
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
