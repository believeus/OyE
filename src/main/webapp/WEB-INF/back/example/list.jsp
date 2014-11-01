<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title>案例列表 - Powered By believeus</title>
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
		<a href="/admin/manager.jhtml" target="_parent">首页</a> &raquo; 案例列表 <span>共${dataCenters.total}条记录</span>
	</div>
	<form id="listForm" action="list.jhtml" method="post">
		<div class="bar">
			<a href="/admin/example/add.jhtml" class="iconButton">
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
					<a href="javascript:;" class="sort" name="content">描述</a>
				</th>
				<th>
					<a href="javascript:;"  class="sort">操作</a>
				</th>
			</tr>
			<c:forEach var="example" items="${exampleList}" varStatus="status">
			<tr>
				<td>
					<input type="checkbox" name="ids" value="${example.id}" />
				</td>
				<td>
					<span>${status.index+1 }</span>
				</td>
				<td>
					${example.title}
				</td>
				<td>
					${fn:substring(example.content, 0, 38)}
	   				<c:if test="${fn:length(example.content) >38 }">
		   					...
	   				</c:if>
				</td>
				<td>
					<a href="/admin/example/edit.jhtml?id=${example.id}">[修改]</a>
				</td>
			</tr>
			</c:forEach>
		</table>
	</form>
  </body>
</html>
