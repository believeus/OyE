<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String domain = request.getHeader("Host");
    //domain = domain.substring(domain.indexOf("."), domain.length());
    request.setAttribute("www_prefix", "http://" + domain);
%>
<style type="text/css">
	.nav a {
	    color: #999;
	    font-size: 16px;
	    padding: 8px 20px;
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
				<img src="/static/public/images/logo2.png" width="160" />
			</div>
			<div class="nav">
				<ul>
					<li><a href="/" target="_blank">Home</a></li>
					<li><a id="busId" href="/ourBussiness.jhtml" target="_blank">BusinessScope</a></li>
					<li><a id="anliId" href="/caseList.jhtml" target="_blank">CaseShow</a></li>
					<li><a id="zhizhiId" href="/teamList.jhtml" target="_blank">CompanyTeam</a></li>
					<li><a id="custId" href="/enCust.jhtml" target="_blank">Testimonials</a></li>
					<li><a id="liuchengId" href="/serviceProcess.jhtml" target="_blank">ServiceProcess</a></li>
					<li><a id="newsId" href="/newsList.jhtml?type=0" target="_blank">StationNews</a></li>
					<li><a id="zixunId" href="/contactusInfo.jhtml?type=0" target="_blank">ContactUs</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
