<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
     <meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title>编辑团队成员 - Powered By believeus</title>
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
	
		var $inputForm = $("#inputForm");
		// 表单验证
		$inputForm.validate({
			rules: {
				name: "required",
				ehName: "required",
				position: "required",
				content: "required",
				encontent: "required"
			}
		});
		
		
	});
	
	</script>
  </head>
  
  <body>
     <div class="path">
		<a href="/admin/manager.jhtml" target="_parent">首页</a> &raquo; 编辑团队成员
	</div>
	<form id="inputForm" action="/admin/team/SaveOrUpdate.jhtml" method="post" enctype="multipart/form-data">
		<input type="hidden" name="id" value="${team.id}"/>
		<input type="hidden" name="path" value="${team.path}"/>
		<table class="input">
			<tr>
				<th>
					成员姓名:
				</th>
				<td>
					<input type="text" name="name" class="text" maxlength="100" value="${team.name}"/>
				</td>
			</tr>
			<tr>
				<th>
					英文姓名:
				</th>
				<td>
					<input type="text" name="ehName" class="text" maxlength="100" value="${team.ehName}"/>
				</td>
			</tr>
			<tr>
				<th>
					成员职位:
				</th>
				<td>
					<input type="text" name="position" class="text" maxlength="100" value="${team.position}"/>
				</td>
			</tr>
			<tr id="pathTr">
				<th>
					成员图片:
				</th>
				<td colspan="3">
					<div>
						<span style="float:left">
							<div id="preview_wrapper">    
						        <div id="preview_fake" >    
						            <img id="preview" onload="onPreviewLoad(this,190,120)" src="/${team.path}"/>
						        </div>    
						    </div>    
						    <br/>    
						    <input id="upload_img" type="file" name="upload_img" onchange="filename0.value=this.value;onUploadImgChange(this,190,120,'preview','preview_fake','preview_size_fake');"/>  
						    <input type="hidden" id="filename0" name="filename0">
						    <br/>    
						    <img id="preview_size_fake"/> 
						</span>
					</div>
				</td>
			</tr>
			<tr id="contentTr">
				<th>
					内容:
				</th>
				<td colspan="3">
					<textarea id="" name="content" class="editor" style="width: 400px;height: 100px" maxlength="26">${team.content}</textarea>
				</td>
			</tr>
			<tr id="contentTr">
				<th>
					内容:
				</th>
				<td colspan="3">
					<textarea id="" name="encontent" class="editor" style="width: 400px;height: 100px" maxlength="26">${enteam.content}</textarea>
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
