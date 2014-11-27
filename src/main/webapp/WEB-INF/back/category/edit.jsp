<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
     <meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title>编辑分类 - Powered By believeus</title>
	<meta name="author" content="believeus Team" />
	<meta name="copyright" content="believeus" />
	<link href="/static/public/css/common_s.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="/static/public/js/jquery.js"></script>
	<script type="text/javascript" src="/static/public/js/jquery.validate.js"></script>
	<script type="text/javascript" src="/static/public/js/admin/ueditor1_2_6_2/ueditor.config.js"></script>
	<script type="text/javascript" src="/static/public/js/admin/ueditor1_2_6_2/ueditor.all.js"></script>
	<script type="text/javascript" src="/static/public/js/common.js"></script>
	<script type="text/javascript" src="/static/public/js/input.js"></script>
	<style type="text/css">
		table.input th {
		    font-size: 13px;
		}
	</style>
	<script type="text/javascript">
	$().ready(function() {
	
		var editor = new UE.ui.Editor();
	    editor.render('editor');
	    editor.addListener('contentchange',function(){
	        this.sync();
	        $('textarea').valid();
	    });
	
		var $inputForm = $("#inputForm");
		
		// 表单验证
		$inputForm.validate({
			rules: {
				link: "required",
				name: "required",
				enName: "required"
			}
		});
		
	});
	
	</script>
  </head>
  
  <body>
     <div class="path">
		<a href="/admin/manager.jhtml" target="_parent">首页</a> &raquo; 编辑分类
	</div>
	<form id="inputForm" action="/admin/category/saveOrUpdate.jhtml" method="post" enctype="multipart/form-data">
		<input type="hidden" name="id" value="${category.id}"/>
		<table class="input">
			<tr>
				<th>
					中文名称:
				</th>
				<td>
					<input type="text" name="name" class="text" maxlength="200" value="${category.name }"/>
				</td>
			</tr>
			<tr id="pathTr">
				<th>
					英文名称:
				</th>
				<td colspan="3">
					<input type="text" name="enName" class="text" maxlength="200" value="${category.enName }"/>
				</td>
			</tr>
			<tr id="pathTr">
				<th>
					分类链接:
				</th>
				<td colspan="3">
					<input type="text" name="link" class="text" maxlength="200" value="${category.link }"/>
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td colspan="3">
					<input type="submit" class="button" value="确定" />
					<input type="button" class="button" value="返回" onclick="javascript:window.history.back();"/>
				</td>
			</tr>
		</table>
	</form>
  </body>
</html>
