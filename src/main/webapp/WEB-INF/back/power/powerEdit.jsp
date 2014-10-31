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
	<c:forEach var="authority" items="${authoritys}">
	   $("input[value='${authority.authorityName}']").attr("checked",true);
	</c:forEach>
});
</script>
</head>
<body>
	<div class="path">
		<a href="/admin/manager.jhtml" target="_parent">首页</a> &raquo; 内容列表 <span>共${dataCenters.total}条记录</span>
	</div>
	<form id="listForm" action="/admin/updateRole.jhtml" method="post">
	    <input type="hidden" name="roleId" value="${roleId}"/>
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
					新闻管理
				</td>
				<td>
					<input type="checkbox" id="nv1" name="authority" value="newsDinamic:view" />
				</td>
				<td>
					<input type="checkbox" id="nv2" name="authority" value="newsDinamic:create" />
				</td>
				<td>
					<input type="checkbox" id="nv3" name="authority" value="newsDinamic:update"  />
				</td>
				<td>
					<input type="checkbox" id="nv4" name="authority" value="newsDinamic:delete" />
				</td>
			</tr>
			<tr>
				<td>
					业务发布管理
				</td>
				<td>
					<input type="checkbox" id="bv1" name="authority" value="business:view" />
				</td>
				<td>
					<input type="checkbox" id="bv2" name="authority" value="business:create" />
				</td>
				<td>
					<input type="checkbox" id="bv3" name="authority" value="business:update" />
				</td>
				<td>
					<input type="checkbox" id="bv4" name="authority" value="business:delete"  />
				</td>
			</tr>
			<tr>
				<td>
					案例管理
				</td>
				<td>
					<input type="checkbox" id="ev1" name="authority" value="example:view" />
				</td>
				<td>
					<input type="checkbox" id="ev2" name="authority" value="example:create" />
				</td>
				<td>
					<input type="checkbox" id="ev3" name="authority" value="example:update" />
				</td>
				<td>
					<input type="checkbox" id="ev4" name="authority" value="example:delete" />
				</td>
			</tr>
			<tr>
				<td>
					留言管理
				</td>
				<td>
					<input type="checkbox" id="cv1" name="authority" value="contact:view" />
				</td>
				<td>
					<input type="checkbox" id="cv2" name="authority" value="contact:create" />
				</td>
				<td>
					<input type="checkbox" id="cv3" name="authority" value="contact:update" />
				</td>
				<td>
					<input type="checkbox" id="cv4" name="authority" value="contact:delete" />
				</td>
			</tr>
			<tr>
				<td>
					客户感言管理
				</td>
				<td>
					<input type="checkbox" id="cv1" name="authority" value="customer:view" />
				</td>
				<td>
					<input type="checkbox" id="cv2" name="authority" value="customer:create" />
				</td>
				<td>
					<input type="checkbox" id="cv3" name="authority" value="customer:update" />
				</td>
				<td>
					<input type="checkbox" id="cv4" name="authority" value="customer:delete" />
				</td>
			</tr>
			<tr>
				<td>
					企业信息管理
				</td>
				<td>
					<input type="checkbox" id="cv1" name="authority" value="companyMsg:view" />
				</td>
				<td>
					<input type="checkbox" id="cv2" name="authority" value="companyMsg:create" />
				</td>
				<td>
					<input type="checkbox" id="cv3" name="authority" value="companyMsg:update" />
				</td>
				<td>
					<input type="checkbox" id="cv4" name="authority" value="companyMsg:delete" />
				</td>
			</tr>
			<tr>
				<td>
					团队管理
				</td>
				<td>
					<input type="checkbox" id="cv1" name="authority" value="team:view" />
				</td>
				<td>
					<input type="checkbox" id="cv2" name="authority" value="team:create" />
				</td>
				<td>
					<input type="checkbox" id="cv3" name="authority" value="team:update" />
				</td>
				<td>
					<input type="checkbox" id="cv4" name="authority" value="team:delete" />
				</td>
			</tr>
			<tr>
				<td colspan="4">
				&nbsp;
				</td>
				<td>
					<input type="submit" class="button" value="确定" />
					<input type="button" class="button" value="返回" onclick="javascript:window.history.back();"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>