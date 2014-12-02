<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String domain = request.getHeader("Host");
    //domain = domain.substring(domain.indexOf("."), domain.length());
    request.setAttribute("www_prefix", "http://" + domain);
%>
<style type="text/css">
.nav a {
    color: #999;
    font-size: 20px;
    padding: 8px 16px;
}
</style>
<script type="text/javascript">
	$(function(){
		/* $(".nav a").click(function(){
			$(this).parent().parent().find("a").removeClass("current");
			$(this).addClass("current");
		}); */
		var href = window.location.pathname;
		$(".nav a").each(function(){
			if(href == $(this).attr("href")){
				$(this).parent().parent().find("a").removeClass("current");
				$(this).addClass("current");
			}
		});
	});
</script>
<div class="header">
	<div class="logo">
		<div style="width:1180px;height: auto;overflow: hidden;margin: 10px auto 0;">
			<div class="logo-img">
				<a href="/english.jhtml">
					<!-- <img src="/static/public/images/logo2.png" width="160" /> -->
					<img src="/static/public/images/oyelogo.png" width="356" />
				</a>
			</div>
			<div class="sel-languages">
				<span style="position: relative; top: -30px; left: 355px;">
					<a href="/">中文</a> |
					<a href="/english.jhtml" style="margin-right: 57px;">English</a>
				</span>
				<span style="position: relative; left: 135px;">Service hotline：400-7681867</span>
			</div>
		</div>
	</div> 
	<div style="background:#E9E9E9;width:100%;height:60px;line-height: 60px;">
		<div class="nav">
			<ul>
				<li><a href="/english.jhtml">Home</a></li>
				<li><a id="busId" href="/english.jhtml#bus">BusinessScope</a></li>
				<li><a id="anliId" href="/english.jhtml#anli">CaseShow</a></li>
				<li><a id="zhizhiId" href="/english.jhtml#zhizhi">CompanyTeam</a></li>
				<li><a id="custId" href="/english.jhtml#cust">Testimonials</a></li>
				<li><a id="liuchengId" href="/english.jhtml#liucheng">ServiceProcess</a></li>
				<li><a id="newsId" href="/english.jhtml#news">StationNews</a></li>
				<li><a id="zixunId" href="/english.jhtml#zixun">ContactUs</a></li>
			</ul>
		</div>
	</div>
</div>
