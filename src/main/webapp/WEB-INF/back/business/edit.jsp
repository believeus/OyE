<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
     <meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title>编辑业务发布 - Powered By believeus</title>
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
				title: "required",
				description: "required",
				entitle: "required",
				endescription: "required"
			}
		});
		
	});
	
	</script>
  </head>
  
  <body>
     <div class="path">
		<a href="/admin/manager.jhtml" target="_parent">首页</a> &raquo; 编辑服务范围
	</div>
	<form id="inputForm" action="/admin/business/save.jhtml" method="post" enctype="multipart/form-data">
		<input type="hidden" name="id" value="${business.id}"/>
		<input type="hidden" name="enid" value="${enbusiness.id}"/>
		<input type="hidden" name="path" value="${business.path}"/>
		<input type="hidden" name="enpath" value="${enbusiness.path}"/>
		<table class="input">
			<tr>
				<th>
					服务中文名称:
				</th>
				<td>
					<input type="text" name="title" class="text" value="${business.title}" maxlength="16"/>
				</td>
			</tr>
			<tr>
				<th>
					服务英文名称:
				</th>
				<td>
					<input type="text" name="entitle" class="text" value="${enbusiness.title}" maxlength="16"/>
				</td>
			</tr>
			<tr id="pathTr">
				<th>
					相关图片:
				</th>
				<td colspan="3">
					<div>
						<span style="float:left">
							<div id="preview_wrapper">    
						        <div id="preview_fake" >    
						            <img id="preview" onload="onPreviewLoad(this,190,120)" src="/${business.path}"/>
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
					中文描述:
				</th>
				<td colspan="3">
					<textarea name="description" class="editor" style="height: 100px;width: 400px" maxlength="150">${business.description}</textarea>
				</td>
			</tr>
			<tr id="contentTr">
				<th>
					英文描述:
				</th>
				<td colspan="3">
					<textarea name="endescription" class="editor" style="height: 100px;width: 400px" maxlength="150">${enbusiness.description}</textarea>
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
