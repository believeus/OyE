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
		<a href="/admin/manager.jhtml" target="_parent">首页</a> &raquo; 案例列表 <span>共${size}条记录</span>
	</div>
	<div>
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
					<a href="javascript:;" class="sort" name="category">分类信息</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="content">LOGO链接</a>
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
					<c:if test="${example.category==1 }">
		   					世界500强
	   				</c:if>
	   				<c:if test="${example.category==2 }">
		   					国有企业
	   				</c:if>
	   				<c:if test="${example.category==3 }">
		   					事业单位
	   				</c:if>
	   				<c:if test="${example.category==4 }">
		   					私有企业
	   				</c:if>
				</td>
				<td>
	   				<a href="/${example.logo }" target="_blank">点击查看logo</a>
				</td>
				<td>
					<a href="/admin/example/edit.jhtml?id=${example.id}">[修改]</a>
				</td>
			</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<form action="/admin/example/list.jhtml" id="listForm">
			<jsp:include page="../include/pagination.jsp" flush="true" />
		</form>
	</div>
  </body>
</html>
