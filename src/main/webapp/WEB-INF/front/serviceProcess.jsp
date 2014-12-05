<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    top: -1565px;
    width: 374px;
}
.img_a1 span {
    color: #888;
    font-size: 16px;
    left: 30px;
    position: relative;
    top: 60px;
    display: block;
    width:300px;
}
.img_a2{
    height: 220px;
    left: 566px;
    position: relative;
    top: -1615px;
    width: 410px;
}
.img_a2 span {
    color: #ffffff;
    display: block;
    font-size: 16px;
    left: 22px;
    position: relative;
    top: 110px;
    width: 300px;
}
.img_a3{
    height: 234px;
    left: 73px;
    position: relative;
    top: -1677px;
    width: 402px;
}
.img_a3 span {
    color: #ffffff;
    display: block;
    font-size: 16px;
    left: 88px;
    position: relative;
    top: 100px;
    width: 300px;
}
.img_a4{
    height: 203px;
    left: 565px;
    position: relative;
    top: -1708px;
    width: 394px;
}
.img_a4 span {
    color: #ffffff;
    display: block;
    font-size: 16px;
    left: 25px;
    position: relative;
    top: 90px;
    width: 300px;
}
.img_a5{
    height: 217px;
    left: 89px;
    position: relative;
    top: -1758px;
    width: 384px;
}
.img_a5 span {
    color: #ffffff;
    display: block;
    font-size: 16px;
    left: 70px;
    position: relative;
    top: 100px;
    width: 300px;
}
.img_a6 {
   	height: 236px;
    left: 565px;
    position: relative;
    top: -1797px;
    width: 420px;
}
.img_a6 span {
    color: #ffffff;
    display: block;
    font-size: 16px;
    left: 24px;
    position: relative;
    top: 110px;
    width: 300px;
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
		<div class="main_content" style="height: 1090px;">
			<div class="main_content_title">
				<div class="main_content_title_2">服务流程</div>
			</div>
			<div style="margin-top: 50px;">
					<img src="/static/public/images/img06.png" style="position: relative; left: 500px;" />
					<img src="/static/public/images/a1.jpg" style="position: relative; left: 507px; top: -880px;"/>
					<img src="/static/public/images/a2.jpg"  style="margin-top: 50px; position: relative; top: -705px; left: 130px;"/>
					<img src="/static/public/images/a3.jpg"  style="position: relative; left: 90px; top: -775px;"/>
			 		<img src="/static/public/images/a4.jpg"  style="position: relative; left: 168px; top: -600px;"/>
					<img src="/static/public/images/a5.jpg"  style="position: relative; top: -750px; left: 90px;"/>
					<img src="/static/public/images/a6.jpg"  style="position: relative; left: 172px; top: -545px;"/>
				</div>
				<c:if test="${prosSize!=0 }">
					<c:forEach items="${pros }" var="pro" varStatus="status">
						<div class="img_a${status.index+1 }">
							<span>
								${fn:substring(pro.cn, 0, 60)}
								<c:if test="${fn:length(pro.cn) > 60 }">
				   					...
			   					</c:if>
							</span>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${prosSize==0 }">
					<div class="img_a1">
						<span>控制流程</span>
					</div>
					<div class="img_a2">
						<span>第一步</span>
					</div>
					<div class="img_a3">
						<span>第二步</span>
					</div>
					<div class="img_a4">
						<span>第三步</span>
					</div>
					<div class="img_a5">
						<span>第四步</span>
					</div>f
					<div class="img_a6">
						<span>第五步</span>
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
