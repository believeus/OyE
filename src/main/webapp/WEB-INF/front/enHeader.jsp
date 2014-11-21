<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style type="text/css">
	.nav a {
	    color: #999;
	    font-size: 20px;
	    padding: 8px 10px;
	}
</style>
<script type="text/javascript">
	$(function(){
		/* $(".nav a").click(function(){
			$(this).parent().parent().find("a").removeClass("current");
			$(this).addClass("current");
		}); */
		var href = window.location.pathname;
		//alert(href);
		$(".nav a").each(function(){
			//alert($(this).attr("href"));
			if(href == $(this).attr("href")){
				$(this).parent().parent().find("a").removeClass("current");
				$(this).addClass("current");
			}else{
				//$(this).parent().parent().find("a").removeClass("current");
			}
		});
	});
</script>
<div class="header">
	<div class="sel-languages">
		<a href="/">中文</a> |
		<a href="/english.jhtml" style="margin-right: 70px;">English</a>
	</div>
	<div class="logo">
		<div style="width:1300px;height: auto;overflow: hidden;margin: 0 auto;">
			<div class="logo-img">
				<img src="/static/public/images/logo.png" width="160" />
			</div>
			<div class="nav">
				<ul>
					<li><a href="/english.jhtml">Home</a></li>
					<li><a id="busId" href="#bus">BusinessScope</a></li>
					<li><a id="anliId" href="#anli">CaseShow</a></li>
					<li><a id="zhizhiId" href="#zhizhi">CompanyTeam</a></li>
					<li><a id="custId" href="#cust">Testimonials</a></li>
					<li><a id="liuchengId" href="#liucheng">ServiceProcess</a></li>
					<li><a id="newsId" href="#news">StationNews</a></li>
					<li><a id="zixunId" href="#zixun">ContactUs</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
