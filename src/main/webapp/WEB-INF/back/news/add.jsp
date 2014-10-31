<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title>添加新闻 - Powered By believeus</title>
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
		var $type = $("#type");
		var $contentTr = $("#contentTr");
		var $pathTr = $("#pathTr");
		var $path = $("#path");
		var $browserButton = $("#browserButton");
		
		
		
		// "类型"修改
		$type.change(function() {
			if ($type.val() == "text") {
				$contentTr.show();
				$pathTr.hide();
				$path.prop("disabled", true)
			} else {
				$contentTr.hide();
				$pathTr.show();
				$path.prop("disabled", false)
				$browserButton.unbind().browser({
					type: $type.val()
				});
			}
		});
		
		// 表单验证
		$inputForm.validate({
			rules: {
				title: "required",
				author: "required",
				path: "required",
				order: "digits"
			}
		});
		
		$("#checked_true").click(function(){
			if($("#checked_true").attr("value") == 0){
				$("#checked_true").attr("value","1");
			}else{
				$("#checked_true").attr("value","0");
			}
		});
		
	});
	
	</script>
  </head>
  
  <body>
    <div class="path">
		<a href="/admin/manager.jhtml" target="_parent">首页</a> &raquo; 添加新闻
	</div>
	<form id="inputForm" action="/admin/newsSave.jhtml" method="post" enctype="multipart/form-data">
		<input type="hidden" name="type" value="${type}"/>
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>新闻标题:
				</th>
				<td>
					<input type="text" name="title" class="text" maxlength="200" />
				</td>
			</tr>
			<tr id="pathTr">
				<th>
					<span class="requiredField">*</span>选择分类:
				</th>
				<td colspan="3">
					<select name="category">
						<option value="1">分类111</option>
						<option value="2">分类222</option>
						<option value="3">分类333</option>
					</select>
				</td>
			</tr>
			<tr id="contentTr">
				<th>
					内容:
				</th>
				<td colspan="3">
					<textarea id="editor" name="content" class="editor"></textarea>
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td colspan="3">
					<input type="submit" class="button" value="确定" />
					<input type="button" class="button" value="返回"  onclick="javascript:window.history.back();"/>
				</td>
			</tr>
		</table>
	</form>
  </body>
</html>
