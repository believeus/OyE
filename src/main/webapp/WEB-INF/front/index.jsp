<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    color: #888;
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
    color: #888;
    font-size: 16px;
    left: 90px;
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
    color: #888;
    font-size: 16px;
    left: 90px;
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
    color: #888;
    font-size: 16px;
    left: 60px;
    position: relative;
    top: 110px;
}
</style>
<script type="text/javascript">
	$(function(){
		$(".main-comp-const-title-list").click(function(){
			$(this).parent().find("div").removeClass("current");
			$(this).addClass("current");
		});
		$('.banner_slider ul').bxSlider({
            auto:true,
            autoHover:true,
             pager:false,
             touch:false
        });
		$("#xx_img01").css("left",$("#list01").offset().left+78);
		$("#xx_img02").css("left",$("#list01").offset().left+78);
		$("#xx_img03").css("left",$("#list01").offset().left+78);
		$("#xx_img04").css("left",$("#list01").offset().left+78);
		/* $(".main-comps-list").click(function(){
			var left = $(this).offset().left + 78;
			$("#xx_img").animate({left:left});
			$("#xx_img").animate({left:$(this).offset().left + 78});
		}); */
		
		$("#shijie").click(function(){
			$("#shijie500qiang").show();
			$("#guoyouqiye").hide();
			$("#shiyedanwei").hide();
			$("#siyouqiye").hide();
		});
		$("#guoyou").click(function(){
			$("#shijie500qiang").hide();
			$("#guoyouqiye").show();
			$("#shiyedanwei").hide();
			$("#siyouqiye").hide();
		});
		$("#shiye").click(function(){
			$("#shijie500qiang").hide();
			$("#guoyouqiye").hide();
			$("#shiyedanwei").show();
			$("#siyouqiye").hide();
		});
		$("#siyou").click(function(){
			$("#shijie500qiang").hide();
			$("#guoyouqiye").hide();
			$("#shiyedanwei").hide();
			$("#siyouqiye").show();
		});
		//-----------------------------
		$("#list01").click(function(){
			$("#compimg01").show();
			$("#compimg02").hide();
			$("#compimg03").hide();
			$("#compimg04").hide();
			$("#xx_img01").animate({left:$(this).offset().left + 78});
		});
		$("#list02").click(function(){
			$("#compimg01").hide();
			$("#compimg02").show();
			$("#compimg03").hide();
			$("#compimg04").hide();
			$("#xx_img01").animate({left:$(this).offset().left + 78});
		});
		$("#list03").click(function(){
			$("#compimg01").hide();
			$("#compimg02").hide();
			$("#compimg03").show();
			$("#compimg04").hide();
			$("#xx_img01").animate({left:$(this).offset().left + 78});
		});
		$("#list04").click(function(){
			$("#compimg01").hide();
			$("#compimg02").hide();
			$("#compimg03").hide();
			$("#compimg04").show();
			$("#xx_img01").animate({left:$(this).offset().left + 78});
		});
		//-----------------------------
		$("#2list01").click(function(){
			$("#2compimg01").show();
			$("#2compimg02").hide();
			$("#2compimg03").hide();
			$("#2compimg04").hide();
			$("#xx_img02").animate({left:$(this).offset().left + 78});
		});
		$("#2list02").click(function(){
			$("#2compimg01").hide();
			$("#2compimg02").show();
			$("#2compimg03").hide();
			$("#2compimg04").hide();
			$("#xx_img02").animate({left:$(this).offset().left + 78});
		});
		$("#2list03").click(function(){
			$("#2compimg01").hide();
			$("#2compimg02").hide();
			$("#2compimg03").show();
			$("#2compimg04").hide();
			$("#xx_img02").animate({left:$(this).offset().left + 78});
		});
		$("#2list04").click(function(){
			$("#2compimg01").hide();
			$("#2compimg02").hide();
			$("#2compimg03").hide();
			$("#2compimg04").show();
			$("#xx_img02").animate({left:$(this).offset().left + 78});
		});
		//-------------------------------
		$("#3list01").click(function(){
			$("#3compimg01").show();
			$("#3compimg02").hide();
			$("#3compimg03").hide();
			$("#3compimg04").hide();
			$("#xx_img03").animate({left:$(this).offset().left + 78});
		});
		$("#3list02").click(function(){
			$("#3compimg01").hide();
			$("#3compimg02").show();
			$("#3compimg03").hide();
			$("#3compimg04").hide();
			$("#xx_img03").animate({left:$(this).offset().left + 78});
		});
		$("#3list03").click(function(){
			$("#3compimg01").hide();
			$("#3compimg02").hide();
			$("#3compimg03").show();
			$("#3compimg04").hide();
			$("#xx_img03").animate({left:$(this).offset().left + 78});
		});
		$("#3list04").click(function(){
			$("#3compimg01").hide();
			$("#3compimg02").hide();
			$("#3compimg03").hide();
			$("#3compimg04").show();
			$("#xx_img03").animate({left:$(this).offset().left + 78});
		});
		//-------------------------------------
		$("#4list01").click(function(){
			$("#4compimg01").show();
			$("#4compimg02").hide();
			$("#4compimg03").hide();
			$("#4compimg04").hide();
			$("#xx_img04").animate({left:$(this).offset().left + 78});
		});
		$("#4list02").click(function(){
			$("#4compimg01").hide();
			$("#4compimg02").show();
			$("#4compimg03").hide();
			$("#4compimg04").hide();
			$("#xx_img04").animate({left:$(this).offset().left + 78});
		});
		$("#4list03").click(function(){
			$("#4compimg01").hide();
			$("#4compimg02").hide();
			$("#4compimg03").show();
			$("#4compimg04").hide();
			$("#xx_img04").animate({left:$(this).offset().left + 78});
		});
		$("#4list04").click(function(){
			$("#4compimg01").hide();
			$("#4compimg02").hide();
			$("#4compimg03").hide();
			$("#4compimg04").show();
			$("#xx_img04").animate({left:$(this).offset().left + 78});
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
	<jsp:include page="header.jsp" />
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
			<div class="main-comp-const-title" style="width:460px;">
				<div id="shijie" class="main-comp-const-title-list current" style="width: 130px;">世界500强</div>
				<div id="guoyou" class="main-comp-const-title-list">国有企业</div>
				<div id="shiye" class="main-comp-const-title-list">事业单位</div>
				<div id="siyou" class="main-comp-const-title-list">私有企业</div>
			</div>
			<div id="shijie500qiang">
				<c:forEach items="${examples1 }" var="example" varStatus="status">
					<div class="main-comp-const-img" id="compimg0${status.index+1 }" <c:if test="${status.index>0 }">style="display:none;"</c:if>>
						<div id="product">
							<span class="prev"></span>
							<div id="content">
								<div id="content_list">
									<c:forEach items="${fn:split(example.paths, '#') }" var="url" varStatus="status">
										<dl>
											<dt><img src="${url }"/></dt>
										</dl>
									</c:forEach>
								</div>
							</div>
							<span class="next"></span>
						</div>
					</div>
				</c:forEach>
				<div class="ico">
					<div style="width:100%;height:28px;border-top:5px solid #000;margin-top: 30px;">
						<img id="xx_img01" src="/static/public/images/xx.png" style="position: relative; top: -5px;"/>
					</div>
				</div>
				<div class="main-comps">
					<c:forEach items="${examples1 }" var="example" varStatus="status">
						<c:if test="${status.index<5 }">
							<div class="main-comps-list" id="list0${status.index+1 }">
								<img src="/static/public/images/cry.png" />
								<img src="${example.logo }" width="88" height="30" style="position: relative; top: -65px;"/>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<div id="guoyouqiye" style="display:none;">
				<c:forEach items="${examples2 }" var="example" varStatus="status">
					<div class="main-comp-const-img" id="2compimg0${status.index+1 }" <c:if test="${status.index>0 }">style="display:none;"</c:if>>
						<div id="product">
							<span class="prev"></span>
							<div id="content">
								<div id="content_list">
									<c:forEach items="${fn:split(example.paths, '#') }" var="url" varStatus="status">
										<dl>
											<dt><img src="${url }"/></dt>
										</dl>
									</c:forEach>
								</div>
							</div>
							<span class="next"></span>
						</div>
					</div>
				</c:forEach>
				<div class="ico">
					<div style="width:100%;height:28px;border-top:5px solid #000;margin-top: 30px;">
						<img id="xx_img02" src="/static/public/images/xx.png" style="position: relative; top: -5px;"/>
					</div>
				</div>
				<div class="main-comps">
					<c:forEach items="${examples2 }" var="example" varStatus="status">
						<c:if test="${status.index<5 }">
							<div class="main-comps-list" id="2list0${status.index+1 }">
								<img src="/static/public/images/cry.png" />
								<img src="${example.logo }" width="88" height="30" style="position: relative; top: -65px;"/>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<div id="shiyedanwei" style="display:none;">
				<c:forEach items="${examples3 }" var="example" varStatus="status">
					<div class="main-comp-const-img" id="3compimg0${status.index+1 }" <c:if test="${status.index>0 }">style="display:none;"</c:if>>
						<div id="product">
							<span class="prev"></span>
							<div id="content">
								<div id="content_list">
									<c:forEach items="${fn:split(example.paths, '#') }" var="url" varStatus="status">
										<dl>
											<dt><img src="${url }"/></dt>
										</dl>
									</c:forEach>
								</div>
							</div>
							<span class="next"></span>
						</div>
					</div>
				</c:forEach>
				<div class="ico">
					<div style="width:100%;height:28px;border-top:5px solid #000;margin-top: 30px;">
						<img id="xx_img03" src="/static/public/images/xx.png" style="position: relative; top: -5px;"/>
					</div>
				</div>
				<div class="main-comps">
					<c:forEach items="${examples3 }" var="example" varStatus="status">
						<c:if test="${status.index<5 }">
							<div class="main-comps-list" id="3list0${status.index+1 }">
								<img src="/static/public/images/cry.png" />
								<img src="${example.logo }" width="88" height="30" style="position: relative; top: -65px;"/>
							</div>
						</c:if>
					</c:forEach>
			</div>
			</div>
			<div id="siyouqiye" style="display:none;">
				<c:forEach items="${examples4 }" var="example" varStatus="status">
					<div class="main-comp-const-img" id="4compimg0${status.index+1 }" <c:if test="${status.index>0 }">style="display:none;"</c:if>>
						<div id="product">
							<span class="prev"></span>
							<div id="content">
								<div id="content_list">
									<c:forEach items="${fn:split(example.paths, '#') }" var="url" varStatus="status">
										<dl>
											<dt><img src="${url }"/></dt>
										</dl>
									</c:forEach>
								</div>
							</div>
							<span class="next"></span>
						</div>
					</div>
				</c:forEach>
				<div class="ico">
					<div style="width:100%;height:28px;border-top:5px solid #000;margin-top: 30px;">
						<img id="xx_img04" src="/static/public/images/xx.png" style="position: relative; top: -5px;"/>
					</div>
				</div>
				<div class="main-comps">
					<c:forEach items="${examples4 }" var="example" varStatus="status">
						<c:if test="${status.index<5 }">
							<div class="main-comps-list" id="4list0${status.index+1 }">
								<img src="/static/public/images/cry.png" />
								<img src="${example.logo }" width="88" height="30" style="position: relative; top: -65px;"/>
							</div>
						</c:if>
					</c:forEach>
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
					<img src="/static/public/images/a2.jpg"  style="margin-top: 50px; position: relative; top: -650px; left: -355px;"/>
					<img src="/static/public/images/a3.jpg"  style="position: relative; left: 560px; top: -770px;"/>
			 		<img src="/static/public/images/a4.jpg"  style="position: relative; left: -315px; top: -575px;"/>
					<img src="/static/public/images/a5.jpg"  style="position: relative; top: -675px; left: 555px;"/>
				</div>
				<div class="img_a1">
					<span>流程控制</span>
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
					<c:forEach items="${customerType1}" var="cust1" varStatus="status">
						<c:if test="${status.index < 6 }">
							<div class="ot">
								<div class="main-ourteam-cont-list-img">
									<a href="${cust1.clink }" title="${cust1.clink }" target="_blank">
										<img src="${cust1.url }" width="75"/>
									</a>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
				<div class="main-ourteam-cont-list" style="margin-top: -20px; width: 735px;">
					<c:forEach items="${customerType2}" var="cust1" varStatus="status">
						<c:if test="${status.index < 5 }">
							<div class="ot">
								<div class="main-ourteam-cont-list-img">
									<a href="${cust1.clink }" title="${cust1.clink }" target="_blank">
										<img src="${cust1.url }" width="75"/>
									</a>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
				<div class="main-ourteam-cont-list" style="margin-top: -20px;">
					<c:forEach items="${customerType3}" var="cust1" varStatus="status">
						<c:if test="${status.index < 6 }">
							<div class="ot">
								<div class="main-ourteam-cont-list-img">
									<a href="${cust1.clink }" title="${cust1.clink }" target="_blank">
										<img src="${cust1.url }" width="75"/>
									</a>
								</div>
							</div>
						</c:if>
					</c:forEach>
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
						<!-- <form action="/message/add.jhtml" method="post"> -->
							<input class="input" type="text" id="name" name="name" placeholder="姓名" style="margin-top: 10px;" />
							<input class="input" type="text" id="phone" name="phone" placeholder="手机" />
							<input class="input" type="text" id="email" name="email" placeholder="邮箱" />
							<input class="input" type="text" id="title" name="title" placeholder="标题" />
							<textarea class="input" id="content_a" name="content" style="height: 125px;resize: none;overflow-y: hidden;" placeholder="内容填写"></textarea>
							<input class="botton" type="submit" value="提交" />
							<script type="text/javascript">
								$(function(){
									$("input[type=submit]").click(function(){
										$.ajax({
											type : "get",
											url : "/message/add.jhtml",
											dataType : "json",
											data :{"name":$("#name").val(),"phone":$("#phone").val(),"email":$("#email").val(),"title":$("#title").val(),"content":$("#content_a").val()} ,
											success : function(msg) {
												alert(msg);
											}
										});
									});
								});
							</script>
						<!-- </form> -->
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
	<jsp:include page="footer.jsp" />
</body>
</html>
