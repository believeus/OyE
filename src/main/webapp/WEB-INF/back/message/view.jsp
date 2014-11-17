<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
     <meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title>回复留言 - Powered By believeus</title>
	<meta name="author" content="believeus Team" />
	<meta name="copyright" content="believeus" />
	<link href="/static/public/css/common_s.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="/static/public/js/jquery.js"></script>
	<style type="text/css">
		table.input th ,td{
		    font-size: 13px;
		}
	</style>
  </head>
  
  <body>
     <div class="path">
		<a href="/admin/manager.jhtml" target="_parent">首页</a> &raquo; 回复留言
	</div>
		<table class="input">
			<tr>
				<th>
					姓名:
				</th>
				<td>
					${message.name }
				</td>
				<th>
					手机:
				</th>
				<td>
					${message.phone }
				</td>
				<th>
					邮箱:
				</th>
				<td>
					${message.email }
				</td>
			</tr>
			<tr>
				<th>
					留言标题:
				</th>
				<td>
					${message.title }
				</td>
			</tr>
			<tr>
				<th>
					留言内容:
				</th>
				<td colspan="3">
					<textarea class="editor" disabled="disabled" style="background-color: #fff;width: 800px; height:80px; border: 0px none; overflow: hidden;font-size:13px;">
					${message.content }
					</textarea>
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td colspan="3">
					<input type="button" class="button" value="返回" onclick="javascript:window.history.back();"/>
				</td>
			</tr>
		</table>
  </body>
</html>
