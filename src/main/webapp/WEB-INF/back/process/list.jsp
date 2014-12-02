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
	<title>流程列表 - Powered By believeus</title>
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
		<a href="/admin/manager.jhtml" target="_parent">首页</a> &raquo; 流程列表 <span>共${size}条记录</span>
	</div>
	<div>
		<div class="bar">
			<!-- <a href="/admin/process/add.jhtml" class="iconButton">
				<span class="addIcon">&nbsp;</span>添加
			</a> -->
		<div class="buttonWrap">
			<!-- <a href="javascript:;" id="deleteButton" class="iconButton disabled">
				<span class="deleteIcon">&nbsp;</span>删除
			</a> -->
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>刷新
				</a>
			</div>
		</div>
		<table id="listTable" class="list">
			<tr>
				<!-- <th class="check">
					<input type="checkbox" id="selectAll" />
				</th> -->
				<th>
					<a href="javascript:;" class="sort" name="id">排序编号</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="cn">中文描述</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="en">英文描述</a>
				</th>
				<th>
					<a href="#"  class="sort">操作</a>
				</th>
			</tr>
			<c:forEach var="processs" items="${processs}" varStatus="status">
					<tr>
				<%-- <td>
					<input type="checkbox" name="ids" value="${pro1.id }" />
				</td> --%>
				<td>
					<span>${status.index+1}</span>
				</td>
				<td>
					${processs.cn }
				</td>
				<td>
					${processs.en }
				</td>
				<td>
					<a href="/admin/process/edit.jhtml?id=${processs.id }">[修改]</a>
				</td>
			</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<form action="/admin/news/list.jhtml" id="listForm">
			<jsp:include page="../include/pagination.jsp" flush="true" />
		</form>
	</div>
  </body>
</html>
