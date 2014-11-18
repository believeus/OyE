<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
     <meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title>关于我们 - Powered By believeus</title>
	<meta name="author" content="believeus Team" />
	<meta name="copyright" content="believeus" />
	<link href="/static/public/css/common_s.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="/static/public/js/jquery.js"></script>
	<style type="text/css">
		table.input th,td {
		    font-size: 13px;
		}
	</style>
  </head>
  
  <body>
     <div class="path">
		<a href="/admin/manager.jhtml" target="_parent">首页</a> &raquo; 查看关于我们信息
	</div>
	<form id="inputForm" action="/admin/news/save.jhtml" method="post" enctype="multipart/form-data">
		<table class="input">
			<tr>
				<td colspan="4">
					<input type="button" class="button" value="编辑关于我们信息" onclick="javascript:window.location.href='/admin/contactusEdit.jhtml'"/>
				</td>
			</tr>
			<tr>
				<th>
					中文标题:
				</th>
				<td>
					${contactusInfo.title }
				</td>
			</tr>
			<tr>
				<th>
					英文标题:
				</th>
				<td>
					${encontactusInfo.title }
				</td>
			</tr>
			
			<tr id="pathTr">
				<th>
					相关图片:
				</th>
				<td colspan="3">
					<div>
						<span style="float:left">
							<div id="preview_wrapper">    
						        <div id="preview_fake" >   
						        	<c:if  test="${contactusInfo.path =='' ||contactusInfo.path == null }">
							            <img id="preview" onload="onPreviewLoad(this,190,120)" src="/static/public/images/bg.png"/>
						        	</c:if> 
						        	<c:if  test="${contactusInfo.path !='' && contactusInfo.path != null }">
							            <img id="preview" onload="onPreviewLoad(this,190,120)" src="/${contactusInfo.path}"/>
						        	</c:if> 
						        </div>    
						    </div>    
						    <br/>    
						    <input type="hidden" id="filename0" name="filename0">
						    <br/>    
						    <img id="preview_size_fake"/> 
						</span>
					</div>
				</td>
			</tr>
			
			<tr id="contentTr">
				<th>
					中文内容:
				</th>
				<td colspan="3">
					${contactusInfo.content }
				</td>
			</tr>
			<tr id="contentTr">
				<th>
					英文内容:
				</th>
				<td colspan="3">
					${encontactusInfo.content }
				</td>
			</tr>
		</table>
	</form>
  </body>
</html>
