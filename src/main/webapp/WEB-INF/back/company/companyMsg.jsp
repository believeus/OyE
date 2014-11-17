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
	<style type="text/css">
		table.input th,td {
		    font-size: 13px;
		}
	</style>
  </head>
  
  <body>
     <div class="path">
		<a href="/admin/manager.jhtml" target="_parent">首页</a> &raquo; 查看企业信息
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
					企业名称:
				</th>
				<td>
					${companyInfo.name }
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
					企业传真:
				</th>
				<td>
					${companyInfo.fax }
				</td>
			</tr>
			<tr>
				<th>
					企业移动电话:
				</th>
				<td>
					${companyInfo.mobile }
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
