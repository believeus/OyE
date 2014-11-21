<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
<title>Company Teams</title>
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<link rel="stylesheet" href="/static/public/css/oye.css" />
<script type="text/javascript" src="/static/public/js/jquery-1.9.1.min.js"></script>
<style type="text/css">
	.main_content{
		width:1140px;height:auto;overflow:hidden;margin:0 auto;
	}
	.main_content_title{
		width:1140px;height:40px;line-height:40px;border-bottom:1px dashed #C6C6C6;margin-bottom: 20px;
	}
	.main_content_body {
	    height: auto;
	    overflow: hidden;
	    width: 1140px;
	}
	.main_content_title_2{
		width:115px;height:40px;line-height:40px;border-bottom:1px solid #FFA9B0;font-size:17px;color:#FFA9B0;font-weight:bold;font-family: songti;
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
	.anli_list{
		width:1140px;height:auto;overflow:hidden;
	}
	.team_list{
		width:145px;height:180px;float:left;margin-right:53px;
	}
	.team_list_img{
		width: 145px;height:110px;text-align:center;
	}
	.team_list_name{
		width:145px;height:25px;line-height:25px;text-align:center;font-size:13px;font-weight:bold;color:#000;
	}
	.team_list_position{
		width:145px;height:auto;text-align:center;
	}
	.team_list_img img {
	    border-radius: 55px;
	    border:2px solid #5685CE;
	}
</style>
</head>
<body>
	<!--
       	作者：1213569843@qq.com
       	时间：2014-11-04
       	描述：页头
       -->
	<jsp:include page="enHeader.jsp" />
	
	<div class="main">
		<div class="main_content">
			<div class="main_content_title">
				<div class="main_content_title_2">Company Teams</div>
			</div>
			<div class="anli_list">
				<c:forEach items="${teams }" var="team" varStatus="status">
					<div class="team_list" <c:if test="${(status.index+1)%6==0 }">style="margin-right:0;"</c:if>>
						<div class="team_list_img">
							<img src="${team.path }" width="105" height="105" />
						</div>
						<div class="team_list_name">
							${team.name }
						</div>
						<div class="team_list_position" title="${team.position }">
							${fn:substring(team.position, 0, 17)}
							<c:if test="${fn:length(team.position) > 9 }">
			   					...
		   					</c:if>
						</div>
					</div>
				</c:forEach>
			</div>
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
