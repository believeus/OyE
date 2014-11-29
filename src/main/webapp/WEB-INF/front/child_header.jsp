<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String domain = request.getHeader("Host");
    //domain = domain.substring(domain.indexOf("."), domain.length());
    request.setAttribute("www_prefix", "http://" + domain);
%>
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
	<div class="logo">
		<div style="width:1180px;height: auto;overflow: hidden;margin: 10px auto 0;">
			<div class="logo-img">
				<a href="/"><img src="/static/public/images/logo2.png" width="160" /></a>
			</div>
			<div class="sel-languages">
					<span style="color:#EA3838; position: relative; top: -30px; font-weight: bold; font-size: 15px;">您身边最专业的搬迁专家</span>
					<span style="position: relative; left: 685px; top: -30px;">
						<a href="/">中文</a> |
						<a href="/english.jhtml" style="margin-right: 57px;">English</a>
					</span>
					<span style="position: relative; left: -320px; font-size: 12px; color: #888;">SPFE + PROFESSIONAL + FAST</span>
					<span style="position: relative; left: 285px;">服务热线：400-7681867</span>
			</div>
		</div>
	</div>
	<div style="background:#E9E9E9;width:100%;height:60px;line-height: 60px;">
		<div class="nav">
			<ul>
				<li><a href="/" target="_blank">首页</a></li>
				<li><a id="busId" href="/ourBussiness.jhtml" target="_blank">业务范围</a></li>
				<li><a id="anliId" href="/caseList.jhtml" target="_blank">案例展示</a></li>
				<li><a id="zhizhiId" href="/teamList.jhtml" target="_blank">企业资质</a></li>
				<li><a id="custId" href="/cust.jhtml" target="_blank">客户感言</a></li>
				<li><a id="liuchengId" href="/serviceProcess.jhtml" target="_blank">服务流程</a></li>
				<li><a id="newsId" href="/newsList.jhtml?type=0" target="_blank">站内新闻</a></li>
				<li><a id="zixunId" href="/contactusInfo.jhtml?type=0" target="_blank">联系我们</a></li>
			</ul>
		</div>
	</div>
</div>
