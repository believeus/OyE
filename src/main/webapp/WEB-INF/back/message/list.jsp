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
	<title>留言列表 - Powered By believeus</title>
	<meta name="author" content="believeus Team" />
	<meta name="copyright" content="believeus" />
	<link href="/static/public/css/common_s.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="/static/public/js/jquery.js"></script>
	<script type="text/javascript" src="/static/public/js/common.js"></script>
	<script type="text/javascript" src="/static/public/js/list.js"></script>
	<style type="text/css">
		table.list td {
		    font-size: 13px;
		}
	</style>
	<script type="text/javascript">
	$().ready(function() {
	});
	</script>

  </head>
  
  <body>
    <div class="path">
		<a href="/admin/manager.jhtml" target="_parent">首页</a> &raquo; 留言列表 <span>共${dataCenters.total}条记录</span>
	</div>
	<form id="listForm" action="newsList.jhtml" method="post">
		<div class="bar">
		<div class="buttonWrap">
			<a href="javascript:;" id="deleteButton" class="iconButton disabled">
				<span class="deleteIcon">&nbsp;</span>删除
			</a>
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>刷新
				</a>
			</div>
		</div>
		<table id="listTable" class="list">
			<tr>
				<th class="check">
					<input type="checkbox" id="selectAll" />
				</th>
				<th>
					<a href="javascript:;" class="sort" name="id">收件人</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="title">标题</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="title">内容</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="top">留言时间</a>
				</th>
				<th>
					<a href="javascript:;"  class="sort">操作</a>
				</th>
			</tr>
			<c:forEach var="message" items="${messageList}">
			<tr>
				<td>
					<input type="checkbox" name="ids" value="${message.id}" />
				</td>
				<td>
					<span >${message.name}</span>
				</td>
				<td>
					<span title="${message.theme}">${message.theme}</span>
				</td>
				<td>
					${message.content}
				</td>
				<td>
					${message.createTime}
				</td>
				<td>
					<a href="/admin/message/view.jhtml?id=${message.id}">[查看]</a>
				</td>
			</tr>
			</c:forEach>
		</table>
	</form>
  </body>
</html>
