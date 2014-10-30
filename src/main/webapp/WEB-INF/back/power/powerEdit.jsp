<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>权限管理</title>
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
		<%-- <div class="bar">
		 ​
			<a href="add.jhtml" class="iconButton">
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
		</div> --%>
		<table id="listTable" class="list">
			<tr>
				<th class="check">
					<a href="javascript:;" class="sort">栏目</a>
				</th>
				<th>
					<a href="javascript:;" class="sort">查看</a>
				</th>
				<th>
					<a href="javascript:;" class="sort">添加</a>
				</th>
				<th>
					<a href="javascript:;" class="sort">修改</a>
				</th>
				<th>
					<a href="javascript:;" class="sort">删除</a>
				</th>
			</tr>
			<tr>
				<td>
					内容管理系统
				</td>
				<td>
					<input type="checkbox" name="authority" value="content:view" />
				</td>
				<td>
					<input type="checkbox" name="authority" value="content:create" />
				</td>
				<td>
					<input type="checkbox" name="authority" value="content:update" />
				</td>
				<td>
					<input type="checkbox" name="authority" value="content:delete" />
				</td>
			</tr>
			<tr>
				<td>
					新闻系统
				</td>
				<td>
					<input type="checkbox" name="authority" value="newsDinamic:view" />
				</td>
				<td>
					<input type="checkbox" name="authority" value="newsDinamic:create" />
				</td>
				<td>
					<input type="checkbox" name="authority" value="newsDinamic:update" />
				</td>
				<td>
					<input type="checkbox" name="authority" value="newsDinamic:delete" />
				</td>
			</tr>
			<tr>
				<td>
					业务发布管理
				</td>
				<td>
					<input type="checkbox" name="authority" value="business:view" />
				</td>
				<td>
					<input type="checkbox" name="authority" value="business:create" />
				</td>
				<td>
					<input type="checkbox" name="authority" value="business:update" />
				</td>
				<td>
					<input type="checkbox" name="authority" value="business:delete" />
				</td>
			</tr>
			<tr>
				<td>
					案例管理
				</td>
				<td>
					<input type="checkbox" name="authority" value="example:view" />
				</td>
				<td>
					<input type="checkbox" name="authority" value="example:create" />
				</td>
				<td>
					<input type="checkbox" name="authority" value="example:update" />
				</td>
				<td>
					<input type="checkbox" name="authority" value="example:delete" />
				</td>
			</tr>
			<tr>
				<td>
					联系方式
				</td>
				<td>
					<input type="checkbox" name="authority" value="contact:view" />
				</td>
				<td>
					<input type="checkbox" name="authority" value="contact:create" />
				</td>
				<td>
					<input type="checkbox" name="authority" value="contact:update" />
				</td>
				<td>
					<input type="checkbox" name="authority" value="contact:delete" />
				</td>
			</tr>
			<tr>
				<td>
					添加管理员
				</td>
				<td>
					<input type="checkbox" name="authority" value="addAdmin:view" />
				</td>
				<td>
					<input type="checkbox" name="authority" value="addAdmin:create" />
				</td>
				<td>
					<input type="checkbox" name="authority" value="addAdmin:update" />
				</td>
				<td>
					<input type="checkbox" name="authority" value="addAdmin:delete" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>