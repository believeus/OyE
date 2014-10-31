<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
     <meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title>编辑企业信息 - Powered By believeus</title>
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
		table.input th,td {
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
		
	});
	
	</script>
  </head>
  
  <body>
     <div class="path">
		<a href="/admin/common/main.jhtml" target="_parent">首页</a> &raquo; 查看企业信息
	</div>
	<form id="inputForm" action="/admin/news/save.jhtml" method="post" enctype="multipart/form-data">
		<table class="input">
			<tr>
				<td colspan="4">
					<input type="button" class="button" value="编辑企业信息" onclick="javascript:window.location.href='/admin/companyEdit.jhtml'"/>
				</td>
			</tr>
			<tr>
				<th>
					企业电话:
				</th>
				<td>
					${companyInfo.phone }
				</td>
			</tr>
			<tr>
				<th>
					企业邮箱:
				</th>
				<td>
					${companyInfo.email }
				</td>
			</tr>
			<tr>
				<th>
					企业地址:
				</th>
				<td>
					${companyInfo.address }
				</td>
			</tr>
			<tr id="contentTr">
				<th>
					企业简介:
				</th>
				<td colspan="3">
					${companyInfo.content }
				</td>
			</tr>
		</table>
	</form>
  </body>
</html>
