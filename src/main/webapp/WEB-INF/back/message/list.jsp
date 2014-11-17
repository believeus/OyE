<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		<a href="/admin/manager.jhtml" target="_parent">首页</a> &raquo; 留言列表 <span>共${size}条记录</span>
	</div>
	<div>
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
					<a href="javascript:;" class="sort" name="id">排序编号</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="id">姓名</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="title">手机</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="title">邮箱</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="title">内容</a>
				</th>
				<th>
					<a href="javascript:;"  class="sort">操作</a>
				</th>
			</tr>
			<c:forEach var="message" items="${messageList}" varStatus="status">
			<tr>
				<td>
					<input type="checkbox" name="ids" value="${message.id}" />
				</td>
				<td>
					<span>${status.index+1}</span>
				</td>
				<td>
					<span >${message.name}</span>
				</td>
				<td>
					<span >${message.phone}</span>
				</td>
				<td>
					<span >${message.email}</span>
				</td>
				<td>
				${fn:substring(message.content, 0, 38)}
   				<c:if test="${fn:length(message.content) >38 }">
	   					...
   				</c:if>
				</td>
				<td>
					<a href="/admin/message/view.jhtml?id=${message.id}">[查看]</a>
				</td>
			</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<form action="/admin/message/list.jhtml" id="listForm">
			<jsp:include page="../include/pagination.jsp" flush="true" />
		</form>
	</div>
  </body>
</html>
