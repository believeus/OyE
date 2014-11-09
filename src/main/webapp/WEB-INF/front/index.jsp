<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<head>
<title>OYE首页</title>
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
						<li><a class="current" href="#">首页</a></li>
						<li><a href="#">业务范围</a></li>
						<li><a href="#">案例展示</a></li>
						<li><a href="#">企业资质</a></li>
						<li><a href="#">客户感言</a></li>
						<li><a href="#">服务流程</a></li>
						<li><a href="#">站内新闻</a></li>
						<li><a href="#">联系我们</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="main">
		<div class="main-img">
			<!-- <img src="/static/public/images/img1.png" width="100%" /> -->
			<div class="banner_slider">
                <ul>
                    <li><img src="/static/public/images/img1.jpg" width="100%"/></li>
                    <li><img src="/static/public/images/img1.jpg" width="100%"/></li>
                    <li><img src="/static/public/images/img1.jpg" width="100%"/></li>
                    <li><img src="/static/public/images/img1.jpg" width="100%"/></li>
                </ul>
            </div>
		</div>
		<div class="main-service">
			<p class="">
				<i style="width: 22px; height: 26px; background: url(/static/public/images/ser.png); display: inline-block; position: relative; top: 5px; margin-right: 5px;"></i>
				服务范围Our Business
			</p>
			<div class="main-service-list">
				<div class="main-service-cont">
					<div class="main-service-cont-img">
						<img src="/static/public/images/phone.png" />
					</div>
					<div class="main-service-cont-name">
						办公室搬迁
					</div>
					<div class="main-service-cont-dis">
						黑龙江网络广播电视台讯（通讯员金钢 记者姚以斌）11月3日晚，哈尔滨警方经近24小时连续奋战，成功将公安部B级通缉令逃犯王庆新抓捕归案。
					</div>
				</div>
				<div class="main-service-cont">
					<div class="main-service-cont-img">
						<img src="/static/public/images/people.png" />
					</div>
					<div class="main-service-cont-name">
						国内室内私人搬迁
					</div>
					<div class="main-service-cont-dis">
						黑龙江网络广播电视台讯（通讯员金钢 记者姚以斌）11月3日晚，哈尔滨警方经近24小时连续奋战，成功将公安部B级通缉令逃犯王庆新抓捕归案。
					</div>
				</div>
				<div class="main-service-cont" style="margin-right: 0;">
					<div class="main-service-cont-img">
						<img src="/static/public/images/sys.png" />
					</div>
					<div class="main-service-cont-name">
						实验室搬迁
					</div>
					<div class="main-service-cont-dis">
						黑龙江网络广播电视台讯（通讯员金钢 记者姚以斌）11月3日晚，哈尔滨警方经近24小时连续奋战，成功将公安部B级通缉令逃犯王庆新抓捕归案。
					</div>
				</div>
				<!--  -->
				<!-- <img src="/static/public/images/jt00.png" style="position: absolute; top: 808px; left: 78px;"/>
				<img src="/static/public/images/jt01.png" style="position: absolute; top: 935px; left: 78px;"/> -->
				<div class="main-service-cont">
					<div class="main-service-cont-img">
						<img src="/static/public/images/cc.png" />
					</div>
					<div class="main-service-cont-name">
						仓储
					</div>
					<div class="main-service-cont-dis">
						黑龙江网络广播电视台讯（通讯员金钢 记者姚以斌）11月3日晚，哈尔滨警方经近24小时连续奋战，成功将公安部B级通缉令逃犯王庆新抓捕归案。
					</div>
				</div>
				<div class="main-service-cont">
					<div class="main-service-cont-img">
						<img src="/static/public/images/es.png" />
					</div>
					<div class="main-service-cont-name">
						二手家具回收及出售
					</div>
					<div class="main-service-cont-dis">
						黑龙江网络广播电视台讯（通讯员金钢 记者姚以斌）11月3日晚，哈尔滨警方经近24小时连续奋战，成功将公安部B级通缉令逃犯王庆新抓捕归案。
					</div>
				</div>
				<div class="main-service-cont" style="margin-right: 0;">
					<div class="main-service-cont-img">
						<img src="/static/public/images/bgs.png" />
					</div>
					<div class="main-service-cont-name">
						办公室整体清洁及空气治理
					</div>
					<div class="main-service-cont-dis">
						黑龙江网络广播电视台讯（通讯员金钢 记者姚以斌）11月3日晚，哈尔滨警方经近24小时连续奋战，成功将公安部B级通缉令逃犯王庆新抓捕归案。
					</div>
				</div>
			</div>
			<!-- <img src="/static/public/images/jt02.png" style="position: absolute; top: 965px; right: 290px;"/> -->
		</div>
		<div class="main-comp-const">
			<div class="main-ourteam-cont-title" style="position: absolute; left: 120px;">
				<i style="width: 37px; height: 28px; background: url(/static/public/images/al.png); display: inline-block; position: relative; top: 5px; margin-right: 5px;"></i>
				我们的案例
			</div>
			<div class="main-comp-const-title">
				<div class="main-comp-const-title-list current" style="width: 130px;">世界500强</div>
				<div class="main-comp-const-title-list">国有企业</div>
				<div class="main-comp-const-title-list">事业单位</div>
				<div class="main-comp-const-title-list">私有企业</div>
			</div>
			<div class="main-comp-const-img">
				<!-- <img src="/static/public/images/img2.jpg"/> -->
				<div id="product">
					<span class="prev"></span>
					<div id="content">
						<div id="content_list">
							<dl>
								<dt><img src="/static/public/images/b1.jpg"/></dt>
							</dl>
							<dl>
								<dt><img src="/static/public/images/b2.jpg"/></dt>
							</dl>
							<dl>
								<dt><img src="/static/public/images/b3.jpg"/></dt>
							</dl>
							<dl>
								<dt><img src="/static/public/images/b4.jpg"/></dt>
							</dl>
							<dl>
								<dt><img src="/static/public/images/b1.jpg"/></dt>
							</dl>
							<dl>
								<dt><img src="/static/public/images/b2.jpg"/></dt>
							</dl>
							<dl>
								<dt><img src="/static/public/images/b3.jpg"/></dt>
							</dl>
							<dl>
								<dt><img src="/static/public/images/b4.jpg"/></dt>
							</dl>
						</div>
					</div>
					<span class="next"></span>
				</div>
			</div>
			<div class="ico">
				<!-- <img src="/static/public/images/jiantou.jpg" width="100%" /> -->
				<div style="width:100%;height:28px;border-top:5px solid #000;margin-top: 30px;">
					<img id="xx_img" src="/static/public/images/xx.png" style="position: relative; top: -5px;"/>
				</div>
			</div>
			<div class="main-comps">
				<div class="main-comps-list" id="list01">
					<img src="/static/public/images/cry.png" />
					<img src="/static/public/images/lenovo.png" style="position: relative; top: -65px;"/>
				</div>
				<div class="main-comps-list">
					<img src="/static/public/images/cry.png" />
					<img src="/static/public/images/lenovo.png" style="position: relative; top: -65px;"/>
				</div>
				<div class="main-comps-list">
					<img src="/static/public/images/cry.png" />
					<img src="/static/public/images/lenovo.png" style="position: relative; top: -65px;"/>
				</div>
				<div class="main-comps-list">
					<img src="/static/public/images/cry.png" />
					<img src="/static/public/images/lenovo.png" style="position: relative; top: -65px;"/>
				</div>
			</div>
		</div>
		<div class="main-partner">
			<img src="/static/public/images/img03.jpg" width="100%" />
		</div>
		<div class="main-evaluation">
			<div class="main-evaluation-list">
				<div class="main-evaluation-list-cont">
					<div class="main-evaluation-list-cont-img">
						<img src="/static/public/images/philips.jpg" width="" height="" style="margin-top: 50px;" />
					</div>
					<div class="main-evaluation-list-cont-dis">
						<p class="main-cont-dis-title">来自飞利浦的评价</p>
						<p class="main-cont-dis-conts">来自飞利浦的评价来自飞利浦的评价来自飞利浦的评价来自飞利浦的评价来自飞利浦的评价来自飞利浦的评价来自飞利浦的评价来自飞利浦的评价来自飞利浦的评价</p>
					</div>
				</div>
				<div class="main-evaluation-list-cont">
					<div class="main-evaluation-list-cont-img">
						<img src="/static/public/images/lotus.jpg" width="" height="" style="margin-top: 40px;" />
					</div>
					<div class="main-evaluation-list-cont-dis">
						<p class="main-cont-dis-title">来自飞利浦的评价</p>
						<p class="main-cont-dis-conts">来自飞利浦的评价来自飞利浦的评价来自飞利浦的评价来自飞利浦的评价来自飞利浦的评价来自飞利浦的评价来自飞利浦的评价来自飞利浦的评价来自飞利浦的评价</p>
					</div>
				</div>
				<div class="main-evaluation-list-cont">
					<div class="main-evaluation-list-cont-img">
						<img src="/static/public/images/philips.jpg" width="" height="" style="margin-top: 50px;" />
					</div>
					<div class="main-evaluation-list-cont-dis">
						<p class="main-cont-dis-title">来自飞利浦的评价</p>
						<p class="main-cont-dis-conts">来自飞利浦的评价来自飞利浦的评价来自飞利浦的评价来自飞利浦的评价来自飞利浦的评价来自飞利浦的评价来自飞利浦的评价来自飞利浦的评价来自飞利浦的评价</p>
					</div>
				</div>
			</div>
		</div>
		<div class="main-ourteam">
			<div class="main-ourteam-cont">
				<div class="main-ourteam-cont-title">
					<i style="width: 28px; height: 28px; background: url(/static/public/images/hxtd.png); display: inline-block; position: relative; top: 5px; margin-right: 5px;"></i>
					我们的核心团队
				</div>
				<div class="main-ourteam-cont-const">
					<div class="main-ourteam-cont-const-list">
						<div class="img">
							<img src="/static/public/images/img04.jpg" width="250" height="165" style="margin-top: 35px;" />
						</div>
						<div class="name">
							<span style="font-size: 18px;">孙磊 | Jeremy</span>
							<p>项目经理</p>
							
						</div>
						<div class="dis">
							价来自飞利浦的评价来自飞利浦的评价来自飞利浦的评价来自飞利浦的评价
						</div>
					</div>
					<div class="main-ourteam-cont-const-list">
						<div class="img">
							<img src="/static/public/images/img04.jpg" width="250" height="165" style="margin-top: 35px;" />
						</div>
						<div class="name">
							<span style="font-size: 18px;">孙磊 | Jeremy</span>
							<p>项目经理</p>
							
						</div>
						<div class="dis">
							价来自飞利浦的评价来自飞利浦的评价来自飞利浦的评价来自飞利浦的评价
						</div>
					</div>
					<div class="main-ourteam-cont-const-list">
						<div class="img">
							<img src="/static/public/images/img04.jpg" width="250" height="165" style="margin-top: 35px;" />
						</div>
						<div class="name">
							<span style="font-size: 18px;">孙磊 | Jeremy</span>
							<p>项目经理</p>
							
						</div>
						<div class="dis">
							价来自飞利浦的评价来自飞利浦的评价来自飞利浦的评价来自飞利浦的评价
						</div>
					</div>
					<div class="main-ourteam-cont-const-list" style="margin-right: 0;">
						<div class="img">
							<img src="/static/public/images/img04.jpg" width="250" height="165" style="margin-top: 35px;" />
						</div>
						<div class="name">
							<span style="font-size: 18px;">孙磊 | Jeremy</span>
							<p>项目经理</p>
							
						</div>
						<div class="dis">
							价来自飞利浦的评价来自飞利浦的评价来自飞利浦的评价来自飞利浦的评价
						</div>
					</div>
					<img src="/static/public/images/a.png" style="position: relative; top: -81px; left: 69px;" />
					<img src="/static/public/images/b.png" style="position: relative; top: -81px; left: 950px;" />
					<div style="background: #ffa7a9;height: 34px;left: 105px;position: relative;top: -136px;width: 925px;" ></div>
				</div>
			</div>			
		</div>
		<div class="main-tp">
			<div class="main-tp-cont">
				<p class="main-tp-title">
					<i style="width: 31px; height: 28px; background: url(/static/public/images/lc.png); display: inline-block; position: relative; top: 5px; margin-right: 5px;"></i>
					我们的流程
				</p>
				<div style="">
					<img src="/static/public/images/img06.png" style="position: relative; left: 500px;" />
					<img src="/static/public/images/a1.jpg"  style="position: relative; left: 507px; top: -875px;"/>
					<img src="/static/public/images/a2.jpg"  style="position: absolute; left: 200px;margin-top: 50px;"/>
					<img src="/static/public/images/a3.jpg"  style="position: relative; left: 125px; top: -470px;"/>
			 		<img src="/static/public/images/a4.jpg"  style="position: relative; top: -600px; left: 97px;"/>
					<img src="/static/public/images/a5.jpg"  style="position: relative; top: -370px; left: 150px;"/>
				</div>
			</div>
		</div>
		<div class="main-cust">
			<div style="width:1100px;height:auto;overflow:hidden;margin:0 auto 30px;">
				<div class="main-ourteam-cont-title">
					<i style="width: 37px; height: 28px; background: url(/static/public/images/3333.png); display: inline-block; position: relative; top: 5px; margin-right: 5px;"></i>
					我们的客户
				</div>
				<div class="main-ourteam-cont-list">
					<div class="ot">
						<div class="main-ourteam-cont-list-img">
							<img src="/static/public/images/55.jpg" />
						</div>
					</div>
					<div class="ot">
						<div class="main-ourteam-cont-list-img">
							<img src="/static/public/images/22.jpg" />
						</div>
					</div>
					<div class="ot">
						<div class="main-ourteam-cont-list-img">
							<img src="/static/public/images/33.jpg" />
						</div>
					</div>
					<div class="ot">
						<div class="main-ourteam-cont-list-img">
							<img src="/static/public/images/44.jpg" />
						</div>
					</div>
					<div class="ot">
						<div class="main-ourteam-cont-list-img">
							<img src="/static/public/images/55.jpg" />
						</div>
					</div>
					<div class="ot">
						<div class="main-ourteam-cont-list-img">
							<img src="/static/public/images/66.jpg" />
						</div>
					</div>
				</div>
				<div class="main-ourteam-cont-list" style="margin-top: -20px; width: 735px;">
					<div class="ot">
						<div class="main-ourteam-cont-list-img">
							<img src="/static/public/images/77.jpg" />
						</div>
					</div>
					<div class="ot">
						<div class="main-ourteam-cont-list-img">
							<img src="/static/public/images/66.jpg" />
						</div>
					</div>
					<div class="ot">
						<div class="main-ourteam-cont-list-img">
							<img src="/static/public/images/55.jpg" />
						</div>
					</div>
					<div class="ot">
						<div class="main-ourteam-cont-list-img">
							<img src="/static/public/images/22.jpg" />
						</div>
					</div>
					<div class="ot">
						<div class="main-ourteam-cont-list-img">
							<img src="/static/public/images/33.jpg" />
						</div>
					</div>
				</div>
				<div class="main-ourteam-cont-list" style="margin-top: -20px;">
					<div class="ot">
						<div class="main-ourteam-cont-list-img">
							<img src="/static/public/images/44.jpg" />
						</div>
					</div>
					<div class="ot">
						<div class="main-ourteam-cont-list-img">
							<img src="/static/public/images/55.jpg" />
						</div>
					</div>
					<div class="ot">
						<div class="main-ourteam-cont-list-img">
							<img src="/static/public/images/66.jpg" />
						</div>
					</div>
					<div class="ot">
						<div class="main-ourteam-cont-list-img">
							<img src="/static/public/images/77.jpg" />
						</div>
					</div>
					<div class="ot">
						<div class="main-ourteam-cont-list-img">
							<img src="/static/public/images/88.jpg" />
						</div>
					</div>
					<div class="ot">
						<div class="main-ourteam-cont-list-img">
							<img src="/static/public/images/99.jpg" />
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="main-aboutus" style="background: #505050;height: auto;">
			<div style="width: 1180px;height: auto;overflow: hidden;margin: 0 auto;">
				<div class="aboutus" style="width: 380px;height: auto;overflow: hidden;float: left;">
					<div style="height: 45px;line-height: 45px;color: #EF738B;border-bottom: 1px solid #868686;">
						<div style="width: 80px;height:45px;line-height: 45px;border-bottom: 1px solid #EF738B;text-align: center;">关于我们</div>
					</div>
					<div style="">
						<img src="/static/public/images/img07.jpg" width="185" height="130" style="float: left;margin: 15px 15px 15px 0;" />
						<span style="color: #d6d6d6;line-height: 27px;">价来自飞利浦的评价来自飞利浦的评价价来自飞利浦的评价来自飞利浦的评价价来自飞利浦的评价来自飞利浦的评价价来自飞利浦的评价来自飞利浦的评价价来自飞利浦的评价来自飞利浦的评价价来自飞利浦的评价来自飞利浦的评价来自飞利浦的评价浦的评价来自飞利浦的评价浦的评价来自飞利浦的评价浦的评价来自飞利浦的评价浦的评价来自飞利浦的评价浦的评价来自飞利浦的评价浦的评价来自飞利浦的评价浦的评价来自飞利浦的评价浦的评价来自飞利浦的评价浦的评价来自飞利浦的评价浦的评价来自飞利浦的评价。</span>
					</div>
				</div>
				<div class="aboutus" style="width: 360px;height: auto;overflow: hidden;float: left;">
					<div style="height: 45px;line-height: 45px;color: #EF738B;border-bottom: 1px solid #868686;">
						<div style="width: 80px;height:45px;line-height: 45px;border-bottom: 1px solid #EF738B;text-align: center;">最新动态</div>
					</div>
					<div style="">
						<div style="width: 365px;height: auto;overflow: hidden;">
							<img src="/static/public/images/img08.jpg" width="100" height="80" style="float: left; margin: 15px 20px 10px 0px;"/>
							<div style="float: left;width: 240px;margin-top: 10px;">
								<p style="color: #FBFBFB;font-size: 15px;">价来自飞利浦的评价来自飞利浦</p>
								<p style="color: #FBFBFB;font-size: 14px;">价来自飞利浦的评价来自飞利浦评价来自飞利浦</p>
								<div style="background: #FF6569;color: #FFFFFF;width: 75px;height: 27px;line-height: 27px;text-align: center;border-radius: 4px;float: right;margin-right: 20px;">
									<a href="#" title="更多">
										<img src="/static/public/images/more.jpg" height="27"/>
									</a>
								</div>
							</div>
						</div>
						<div style="width: 365px; height: auto; overflow: hidden; margin-top: 8px;">
							<img src="/static/public/images/img08.jpg" width="100" height="80" style="float: left; margin: 15px 20px 10px 0px;"/>
							<div style="float: left;width: 240px;margin-top: 10px;">
								<p style="color: #FBFBFB;font-size: 15px;">价来自飞利浦的评价来自飞利浦</p>
								<p style="color: #FBFBFB;font-size: 14px;">价来自飞利浦的评价来自飞利浦评价来自飞利浦</p>
								<div style="background: #FF6569;color: #FFFFFF;width: 75px;height: 27px;line-height: 27px;text-align: center;border-radius: 4px;float: right;margin-right: 20px;">
									<a href="#" title="更多">
										<img src="/static/public/images/more.jpg" height="27"/>
									</a>
								</div>
							</div>
						</div>
						<div style="width: 365px; height: auto; overflow: hidden; margin-top: 8px;">
							<img src="/static/public/images/img08.jpg" width="100" height="80" style="float: left; margin: 15px 20px 10px 0px;"/>
							<div style="float: left;width: 240px;margin-top: 10px;">
								<p style="color: #FBFBFB;font-size: 15px;">价来自飞利浦的评价来自飞利浦</p>
								<p style="color: #FBFBFB;font-size: 14px;">价来自飞利浦的评价来自飞利浦评价来自飞利浦</p>
								<div style="background: #FF6569;color: #FFFFFF;width: 75px;height: 27px;line-height: 27px;text-align: center;border-radius: 4px;float: right;margin-right: 20px;">
									<a href="#" title="更多">
										<img src="/static/public/images/more.jpg" height="27"/>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="aboutus" style="width: 380px;height: auto;overflow: hidden;float: left;margin-right: 0;">
					<div style="height: 45px;line-height: 45px;color: #EF738B;border-bottom: 1px solid #868686;">
						<div style="width: 80px;height:45px;line-height: 45px;border-bottom: 1px solid #EF738B;text-align: center;">在线咨询</div>
					</div>
					<div style="text-align: center;">
						<form action="">
							<input class="input" type="text" placeholder="姓名" style="margin-top: 10px;" />
							<input class="input" type="text" placeholder="手机" />
							<input class="input" type="text" placeholder="邮箱" />
							<textarea class="input" style="height: 160px;resize: none;overflow-y: hidden;" placeholder="内容填写"></textarea>
							<input class="botton" type="submit" value="提交" />
						</form>
					</div>
				</div>
			</div>
		</div>
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
