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
	<title>新闻列表 - Powered By believeus</title>
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
		<a href="/admin/common/main.jhtml" target="_parent">首页</a> &raquo; 内容列表 <span>共${dataCenters.total}条记录</span>
	</div>
	<form id="listForm" action="newsList.jhtml" method="post">
		<div class="bar">
			<a href="/admin/newsAdd.jhtml" class="iconButton">
				<span class="addIcon">&nbsp;</span>添加
			</a>
		<div class="buttonWrap">
			<a href="javascript:;" id="deleteButton" class="iconButton disabled">
				<span class="deleteIcon">&nbsp;</span>删除
			</a>
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>刷新
				</a>
			</div>
			<div class="menuWrap">
				<div class="search">
					<span id="searchPropertySelect" class="arrow">&nbsp;</span>
					<input type="text" id="searchValue" name="searchValue" value="${searchValue}" maxlength="200" />
					<button type="submit">&nbsp;</button>
				</div>
				<div class="popupMenu">
					<ul id="searchPropertyOption">
						<li>
							<a href="javascript:;" class="current" val="title">标题</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<table id="listTable" class="list">
			<tr>
				<th class="check">
					<input type="checkbox" id="selectAll" />
				</th>
				<th>
					<a href="javascript:;" class="sort" name="id">排序编号</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="title">标题</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="top">置顶</a>
				</th>
				<th>
					<a href="#"  class="sort">操作</a>
				</th>
			</tr>
			<c:forEach var="myNew" items="${news}">
				<tr>
					<td>
						<input type="checkbox" name="ids" value="${myNew.id}" />
					</td>
					<td>
						<span title="${myNew.id}">${myNew.id}</span>
					</td>
					<td>
						${myNew.title}
					</td>
					<td>
						<a href="/admin/news/newsTop.jhtml?id=${myNew.id}"><font color="red">点击置顶</font></a>
					</td>
					<td>
						<a href="/admin/newsEdit.jhtml?id=${myNew.id}">[修改]</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</form>
  </body>
</html>
