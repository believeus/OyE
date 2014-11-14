<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<head>
<title>新闻页面</title>
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<link rel="stylesheet" href="/static/public/css/oye.css" />
<link rel="stylesheet" href="/static/public/css/jquery.bxslider.css"/>
<script type="text/javascript" src="/static/public/js/jquery-1.9.1.min.js"></script>
<script src="/static/public/js/jquery.bxslider.min.js"></script>
<!--<script type="text/javascript" src="js/bootstrap.min.js"></script>-->
<style type="text/css">
	.banner_main{width:100%;margin:0 auto;position: relative;}
    .banner_nav{width:210px;height:370px;position:absolute;top:0;left:0;z-index:100;background:#cccccc}
    .banner_slider{position: relative;overflow: hidden;height:370px;z-index: 50;}
    .banner_slider img{width:100%;height:370px;}
    .banner_slider .bx-wrapper .bx-controls-direction a{width:40px;height: 40px;background:#000000;opacity: .3;}
    .banner_slider .bx-wrapper .bx-controls-direction a.bx-prev:before{
        content:'';position: absolute;top:8px;left:12px; width: 16px; height: 24px;
        background: url(/static/public/images/zy.png) no-repeat -200px 0;}
    .banner_slider .bx-wrapper .bx-controls-direction a.bx-next:before{
        content:'';position: absolute;top:8px;left:12px; width: 16px;height: 24px;
        background: url(/static/public/images/zy.png) no-repeat -200px -24px; }
    .banner_slider .bx-wrapper .bx-controls-direction a:hover{opacity: .6}
</style>
<style type="">
#product {
	width:1250px;
	height:auto;
	overflow:hidden;
	margin:0 5px 5px 0;
	float:left;
}
#product div#content {
	position:relative;
	width:1170px;
	height:280px;
	/* display:inline-block; */
	overflow:hidden;
	/* float:left; */
	margin: 0 auto;
	left: -15px;
}
#product div#content_list {
	position:absolute;
	width:4000px;
}
#product dl{
	width:280px;
	height:260px;
	float:left;
	margin:10px 4px;
	padding:2px 2px;
	border:1px solid #F1F4F9;
}
#product dl:hover {
	border:1px solid #F94C54;
	/* background:#ccc; */
}
#product dl dt {
	
}
#product dl dt img {
	width:280px;
	height:260px;
	border:none;
}
#product dl dd {
	text-align:center;
}
#product span.prev{
	cursor:pointer;
	display:inline-block;
	width:25px;
	height:42px;
	background:url(/static/public/images/zuo.png) no-repeat left center;
	float:left;
	margin-top: 130px;
}
#product span.next{
	cursor:pointer;
	display:inline-block;
	width:25px;
	height:42px;
	background:url(/static/public/images/you.png) no-repeat left center;
	float:right;
	margin-top: -150px;
}
</style>
<script type="text/javascript">
	$(function(){
		$(".nav a").click(function(){
			$(this).parent().parent().find("a").removeClass("current");
			$(this).addClass("current");
		});
		$('.banner_slider ul').bxSlider({
            auto:true,
            autoHover:true,
             pager:false,
             touch:false
        });
		$("#xx_img").css("left",$("#list01").offset().left+78);
		$(".main-comps-list").click(function(){
			var left = $(this).offset().left + 78;
			//$("#xx_img").css("left" , left);
			$("#xx_img").animate({left:left});
		});
	});
</script>
<script type="text/javascript">
	$(function(){
		var page = 1;
		var i = 4; //每版放4个图片
		//向后 按钮
		$("span.next").click(function(){    //绑定click事件
			 var content = $("div#content"); 
			 var content_list = $("div#content_list");
			 var v_width = content.width();
			 var len = content.find("dl").length;
			 var page_count = Math.ceil(len / i) ;   //只要不是整数，就往大的方向取最小的整数
			 if( !content_list.is(":animated") ){    //判断“内容展示区域”是否正在处于动画
				  if( page == page_count ){  //已经到最后一个版面了,如果再向后，必须跳转到第一个版面。
					content_list.animate({ left : '0px'}, "slow"); //通过改变left值，跳转到第一个版面
					page = 1;
				  }else{
					content_list.animate({ left : '-='+v_width }, "slow");  //通过改变left值，达到每次换一个版面
					page++;
				 }
			 }
	   });
		//往前 按钮
		$("span.prev").click(function(){
			 var content = $("div#content"); 
			 var content_list = $("div#content_list");
			 var v_width = content.width();
			 var len = content.find("dl").length;
			 var page_count = Math.ceil(len / i) ;   //只要不是整数，就往大的方向取最小的整数
			 if(!content_list.is(":animated") ){    //判断“内容展示区域”是否正在处于动画
				 if(page == 1 ){  //已经到第一个版面了,如果再向前，必须跳转到最后一个版面。
					content_list.animate({ left : '-='+v_width*(page_count-1) }, "slow");
					page = page_count;
				}else{
					content_list.animate({ left : '+='+v_width }, "slow");
					page--;
				}
			}
		});
	});
</script>
</head>
<body>
	<!-- <img src="/static/public//static/public/images/background.png" width="100%" alt="" /> -->
	<!--
       	作者：1213569843@qq.com
       	时间：2014-11-04
       	描述：页头
       -->
	<div class="header">
		<div class="sel-languages">
			<a href="#">中文</a> |
			<a href="#" style="margin-right: 70px;">English</a>
		</div>
		<div class="logo">
			<div style="width:1300px;height: auto;overflow: hidden;margin: 0 auto;">
				<div class="logo-img">
					<img src="/static/public/images/logo.png" width="160" />
				</div>
				<div class="nav">
					<ul>
						<li><a href="/">首页</a></li>
						<li><a href="#">业务范围</a></li>
						<li><a href="#">案例展示</a></li>
						<li><a href="#">企业资质</a></li>
						<li><a href="/cust.jhtml">客户感言</a></li>
						<li><a href="#">服务流程</a></li>
						<li><a class="current" href="/news.jhtml">站内新闻</a></li>
						<li><a href="#">联系我们</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	<div class="main">
		<img src="/static/public/images/news.jpg" width="100%"/>
	</div>
	<!--
       	作者：1213569843@qq.com
       	时间：2014-11-04
       	描述：页尾
       -->
	<div class="footer">
		<div class="footer-dis">
			<div class="footer-main">
				<div class="footer-main-1">
					<table class="f-table">
						<tr>
							<th>业务范围</th>
							<th>服务案例</th>
							<th>客户见证</th>
							<th>信息中心</th>
							<th>关于我们</th>
						</tr>
						<tr>
							<td><a href="#">整体搬迁</a></td>
							<td><a href="#">整体搬迁</a></td>
							<td><a href="#">视频见证</a></td>
							<td><a href="#">最新动态</a></td>
							<td><a href="#">公司介绍</a></td>
						</tr>
						<tr>
							<td><a href="#">仓储服务</a></td>
							<td><a href="#">仓储服务</a></td>
							<td><a href="#">合作见证</a></td>
							<td><a href="#">媒体报道</a></td>
							<td><a href="#">企业资质</a></td>
						</tr>
						<tr>
							<td><a href="#">家具回收</a></td>
							<td><a href="#">家具回收</a></td>
							<td><a href="#">客户感言</a></td>
							<td><a href="#">常见问题</a></td>
							<td><a href="#">我们特色</a></td>
						</tr>
						<tr>
							<td><a href="#">环境保洁</a></td>
							<td><a href="#">环境保洁</a></td>
							<td><a href="#">感谢状</a></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td><a href="#">绿化服务</a></td>
							<td><a href="#">绿化服务</a></td>
							<td><a href="#">服务流程</a></td>
							<td></td>
							<td></td>
						</tr>
					</table>
				</div>
				<div class="footer-main-2">
					<img src="/static/public/images/footer-img.png" />
				</div>
				<div class="footer-main-3">
					<h1 style="font-family: 黑体; font-weight: bold;letter-spacing: 5px;">恭候您的垂询</h1>
					<p>NO.179 West Zhongshan Road,Changning,5F,Block E</p>
					<p>T:+86 21 6259 0368</p>
					<p>+86 21 5032 1196</p>
					<p>F:+86 21 6259 0368 - 805</p>
					<p>M:+86 13524728911</p>
				</div>
			</div>
		</div>
		<div class="footer-cn">
			Copyright &copy; 2014 上海欧耶办公有限公司 All Rights Reserved 沪ICP备11000511号-34
		</div>
	</div>
</body>
</html>
