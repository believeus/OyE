<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>添加角色</title>
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
	
	table.input {
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
		<a href="/admin/common/main.jhtml" target="_parent">首页</a> &raquo; 添加角色
	</div>
	<form id="inputForm" action="save.jhtml" method="post">
		<table class="input">
			<tr>
				<th colspan="2" style="text-align: left; font-size: 15px; padding-left: 120px;">
					新建角色
				</th>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>角色名:
				</th>
				<td>
					<input type="text" name="loginName" value="" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th><span class="requiredField">*</span>请选择角色权限:</th>
				<td colspan="4">&nbsp;</td>
			</tr>
		</table>
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
			<tr>
				<td colspan="5">
					<input type="submit" class="button" value="提交" />
					<input type="button" id="backButton" class="button" value="返回" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>