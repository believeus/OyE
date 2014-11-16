<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
				//alert("nihao");
				$(this).parent().parent().find("a").removeClass("current");
				$(this).addClass("current");
			}
		});
		
	});
</script>
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
					<li><a class="current" href="/">首页</a></li>
					<li><a href="#">业务范围</a></li>
					<li><a href="#">案例展示</a></li>
					<li><a href="#">企业资质</a></li>
					<li><a href="/cust.jhtml">客户感言</a></li>
					<li><a href="#">服务流程</a></li>
					<li><a href="/news.jhtml">站内新闻</a></li>
					<li><a href="#">联系我们</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>