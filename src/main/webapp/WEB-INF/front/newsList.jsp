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
</style>
<style type="text/css">
#banner {position:relative; width:600px; height:330px; border:1px solid #666; overflow:hidden;}
#banner_list img {border:0px;}
#banner_bg {position:absolute; bottom:0;background-color:#000;height:30px;filter: Alpha(Opacity=30);opacity:0.3;z-index:1000;
cursor:pointer; width:600px; }
#banner_info{position:absolute; bottom:0; left:5px;height:22px;color:#fff;z-index:1001;cursor:pointer}
#banner_text {position:absolute;width:120px;z-index:1002; right:3px; bottom:3px;}
#banner ul {position:absolute;list-style-type:none;filter: Alpha(Opacity=80);opacity:0.8; border:1px solid #fff;z-index:1002;
margin:0; padding:0; bottom:3px; right:5px;}
#banner ul li { padding:0px 8px;float:left;display:block;color:#FFF;border:#e5eaff 1px solid;background:#6f4f67;cursor:pointer}
#banner ul li.on { background:#900}
#banner_list a{position:absolute;} <!-- 让四张图片都可以重叠在一起-->
</style>
<script type="text/javascript">
var t = n = 0, count;
$(document).ready(function(){
count=$("#banner_list a").length;
$("#banner_list a:not(:first-child)").hide();
$("#banner_info").html($("#banner_list a:first-child").find("img").attr('alt'));
$("#banner_info").click(function(){window.open($("#banner_list a:first-child").attr('href'), "_blank")});
$("#banner li").click(function() {
var i = $(this).text() - 1;//获取Li元素内的值，即1，2，3，4
n = i;
if (i >= count) return;
$("#banner_info").html($("#banner_list a").eq(i).find("img").attr('alt'));
$("#banner_info").unbind().click(function(){window.open($("#banner_list a").eq(i).attr('href'), "_blank")})
$("#banner_list a").filter(":visible").fadeOut(500).parent().children().eq(i).fadeIn(1000);
document.getElementById("banner").style.background="";
$(this).toggleClass("on");
$(this).siblings().removeAttr("class");
});
t = setInterval("showAuto()", 4000);
$("#banner").hover(function(){clearInterval(t)}, function(){t = setInterval("showAuto()", 4000);});
})

function showAuto()
{
n = n >=(count - 1) ? 0 : ++n;
$("#banner li").eq(n).trigger('click');
}
</script>
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
					<div id="bigImg">
						<div id="banner" style="margin:0 auto;">
							<div id="banner_bg"></div> <!--标题背景-->
							<div id="banner_info"></div> <!--标题-->
							<ul>
								<c:forEach var="newx" items="${news}" varStatus="status">
									<li <c:if test="${status.index==0 }">class="on"</c:if> >${status.index+1 }</li>
								</c:forEach>
							</ul>
							<div id="banner_list">
								<c:forEach var="newx" items="${news}" varStatus="status">
									<a href="/newsInfo.jhtml?id=${newx.id }" target="_blank">
										<img src="${newx.path }" title="${newx.title }" alt="${newx.title }" width="600" height="330"/>
									</a>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				<div class="main_content_body_link">
				<c:forEach var="newx" items="${news}" varStatus="status">
					<p class="link_title">
						<a href="/newsInfo.jhtml?id=${newx.id }">${newx.title }</a>
					</p>									
				</c:forEach>				
				</div>
				<c:forEach var="newx" items="${news}" varStatus="status">
					<c:forEach var="time" items="${times}" varStatus="status2">
						<div class="main_content_body_list">
							<div class="list_date">
								${time }
							</div>
							<div class="list_dis">
								<div class="list_title">
									<a href="/newsInfo.jhtml?id=${newx.id }">${newx.title }</a>
								</div>
								<div class="list_content">
									${newx.content }
								</div>
							</div>
						</div>
					</c:forEach>
				</c:forEach>
				<!-- <div class="main_content_body_list">
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
				</div> -->
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
