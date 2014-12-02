<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<head>
<title>Case Show</title>
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<link rel="stylesheet" href="/static/public/css/oye.css" />
<link rel="stylesheet" href="/static/public/css/jquery.bxslider.css"/>
<script type="text/javascript" src="/static/public/js/jquery-1.9.1.min.js"></script>
<script src="/static/public/js/jquery.bxslider.min.js"></script>
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
		width: 1100px; height: auto; overflow: hidden; margin: 30px auto;font-size: 21px;color:#fff;
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
	/* ************* */
	.banner_main{width:100%;margin:0 auto;position: relative;}
    .banner_nav{width:210px;height:370px;position:absolute;top:0;left:0;z-index:100;background:#cccccc}
    .banner_slider{position: relative;overflow: hidden;height:500px;z-index: 50;}
    .banner_slider img{width:100%;height:500px;}
    .banner_slider .bx-wrapper .bx-controls-direction a{width:40px;height: 40px;background:#000000;opacity: .3;}
    .banner_slider .bx-wrapper .bx-controls-direction a.bx-prev:before{
        content:'';position: absolute;top:8px;left:12px; width: 16px; height: 24px;
        background: url(/static/public/images/zy.png) no-repeat -200px 0;}
    .banner_slider .bx-wrapper .bx-controls-direction a.bx-next:before{
        content:'';position: absolute;top:8px;left:12px; width: 16px;height: 24px;
        background: url(/static/public/images/zy.png) no-repeat -200px -24px; }
    .banner_slider .bx-wrapper .bx-controls-direction a:hover{opacity: .6}
</style>
<script type="text/javascript">
	$(function(){
		$('.banner_slider ul').bxSlider({
            auto:true,
            autoHover:true,
             pager:false,
             touch:false
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
	
	<div class="main" style="background:#505050;">
		<div class="main_content">
			<div class="main_content_title">
				<div class="main_content_title_2" style="width:120px;">Case Show</div>
			</div>
			<div class="">
				<h1 class="NI_h1" style="text-align:center;">${example.enName }</h1>
				<%-- <p style="text-align:center;margin-bottom:30px;color:#fff;">
					<span style="margin-right:20px;">时间：${time }</span>
				</p> --%>
				<div style="text-align:center;">
					<div class="banner_slider">
		                <ul>
		                	<c:forEach items="${paths }" var="path">
			                    <li>
		                    		<img src="${path }" width="780"/>
		                   		</li>
		                	</c:forEach>
		                </ul>
		            </div>
				</div>
				<div class="NI_duanluo">
					${example.enContent }
				</div>
			</div>
			<div class="NI_line"></div>
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
