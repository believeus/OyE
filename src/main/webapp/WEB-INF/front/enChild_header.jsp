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
			var url = $(this).attr("href");
			//alert(url.substring(0,url.indexOf("?")));
			var uri = url.substring(0,url.indexOf("?"));
			if(href == $(this).attr("href") || href == uri){
				$(this).parent().parent().find("a").removeClass("current");
				$(this).addClass("current");
			}
			var anli = "/caseInfo.jhtml";
			var news = "/newsInfo.jhtml";
			if(anli == href){
				$("#anliId").addClass("current");
			}else if(news == href){
				$("#newsId").addClass("current");
			}
		});
	});
</script>
<div class="header">
	<div class="logo">
		<div style="width:1180px;height: auto;overflow: hidden;margin: 10px auto 0;">
			<div class="logo-img">
				<a href="/">
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
				<li><a href="/" target="_blank">Home</a></li>
				<li><a id="busId" href="/ourBussiness.jhtml" target="_blank">BusinessScope</a></li>
				<li><a id="anliId" href="/caseList.jhtml" target="_blank">CaseShow</a></li>
				<li><a id="zhizhiId" href="/oyeInfo.jhtml" target="_blank">About Oye</a></li>
				<li><a id="custId" href="/enCust.jhtml" target="_blank">Testimonials</a></li>
				<li><a id="liuchengId" href="/serviceProcess.jhtml" target="_blank">ServiceProcess</a></li>
				<li><a id="newsId" href="/newsList.jhtml?type=0" target="_blank">StationNews</a></li>
				<li><a id="zixunId" href="/contactusInfo.jhtml?type=0" target="_blank">ContactUs</a></li>
			</ul>
		</div>
	</div>
</div>
