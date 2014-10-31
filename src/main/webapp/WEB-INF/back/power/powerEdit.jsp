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
	$("#c1").click(function(){
		var checked=$("#c1").attr("checked");
		if(checked){
		   $("#c2,#c3,#c4").attr("disabled",false);
	    }else{
	       $("#c2,#c3,#c4").attr("disabled","disabled").attr("checked",false);
	    }
	});
	$("#nv1").click(function(){
		var checked=$("#nv1").attr("checked");
		if(checked){
		   $("#nv2,#nv3,#nv4").attr("disabled",false);
	    }else{
	    	$("#nv2,#nv3,#nv4").attr("disabled","disabled").attr("checked",false);
	    }
	});
	$("#bv1").click(function(){
		var checked=$("#bv1").attr("checked");
		if(checked){
		   $("#bv2,#bv3,#bv4").attr("disabled",false);
	    }else{
	       $("#bv2,#bv3,#bv4").attr("disabled","disabled").attr("checked",false);
	    }
	});
	$("#ev1").click(function(){
		var checked=$("#ev1").attr("checked");
		if(checked){
		   $("#ev2,#ev3,#ev4").attr("disabled",false);
	    }else{
	       $("#ev2,#ev3,#ev4").attr("disabled","disabled").attr("checked",false);
	    }
	});
	$("#cv1").click(function(){
		var checked=$("#cv1").attr("checked");
		if(checked){
		   $("#cv2,#cv3,#cv4").attr("disabled",false);
	    }else{
	       $("#cv2,#cv3,#cv4").attr("disabled","disabled").attr("checked",false);
	    }
	});
	<c:forEach var="authority" items="${authoritys}">
	   $("input[value='${authority.authorityName}']").attr("checked",true);
	</c:forEach>
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
					<input type="checkbox" id="c1" name="authority" value="content:view" />
				</td>
				<td>
					<input type="checkbox" id="c2" name="authority" value="content:create" disabled="disabled"/>
				</td>
				<td>
					<input type="checkbox" id="c3" name="authority" value="content:update" disabled="disabled"/>
				</td>
				<td>
					<input type="checkbox" id="c4" name="authority" value="content:delete" disabled="disabled" />
				</td>
			</tr>
			<tr>
				<td>
					新闻系统
				</td>
				<td>
					<input type="checkbox" id="nv1" name="authority" value="newsDinamic:view" />
				</td>
				<td>
					<input type="checkbox" id="nv2" name="authority" value="newsDinamic:create" disabled="disabled"/>
				</td>
				<td>
					<input type="checkbox" id="nv3" name="authority" value="newsDinamic:update" disabled="disabled" />
				</td>
				<td>
					<input type="checkbox" id="nv4" name="authority" value="newsDinamic:delete" disabled="disabled"/>
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
					<input type="checkbox" id="bv2" name="authority" value="business:create" disabled="disabled"/>
				</td>
				<td>
					<input type="checkbox" id="bv3" name="authority" value="business:update" disabled="disabled"/>
				</td>
				<td>
					<input type="checkbox" id="bv4" name="authority" value="business:delete" disabled="disabled" />
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
					<input type="checkbox" id="ev2" name="authority" value="example:create" disabled="disabled"/>
				</td>
				<td>
					<input type="checkbox" id="ev3" name="authority" value="example:update" disabled="disabled"/>
				</td>
				<td>
					<input type="checkbox" id="ev4" name="authority" value="example:delete" disabled="disabled"/>
				</td>
			</tr>
			<tr>
				<td>
					联系方式
				</td>
				<td>
					<input type="checkbox" id="cv1" name="authority" value="contact:view" />
				</td>
				<td>
					<input type="checkbox" id="cv2" name="authority" value="contact:create" disabled="disabled"/>
				</td>
				<td>
					<input type="checkbox" id="cv3" name="authority" value="contact:update" disabled="disabled"/>
				</td>
				<td>
					<input type="checkbox" id="cv4" name="authority" value="contact:delete" disabled="disabled"/>
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