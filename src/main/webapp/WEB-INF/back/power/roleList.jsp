<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>角色列表</title>
<meta name="author" content="Believeus Team" />
<meta name="copyright" content="Believeus" />
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
	<form id="listForm" action="list.jhtml" method="post">
		<table id="listTable" class="list">
			<tr>
				<th class="check">
					<a href="javascript:;" class="sort">角色名称</a>
				</th>
				<th>
					<a href="javascript:;" class="sort">操作</a>
				</th>
			</tr>
			<tr>
				<td>
					张三
				</td>
				<td>
					<a href="/admin/power.jhtml">[编辑权限]</a>
				</td>
			</tr>
			<tr>
				<td>
					李四
				</td>
				<td>
					<a href="/admin/power.jhtml">[编辑权限]</a>
				</td>
			</tr>
			<tr>
				<td>
					王武
				</td>
				<td>
					<a href="/admin/power.jhtml">[编辑权限]</a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>