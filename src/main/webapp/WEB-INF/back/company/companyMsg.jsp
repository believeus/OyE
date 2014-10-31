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
		<a href="/admin/common/main.jhtml" target="_parent">首页</a> &raquo; 查看企业信息
	</div>
	<form id="inputForm" action="/admin/news/save.jhtml" method="post" enctype="multipart/form-data">
		<input type="hidden" name="type" value="${type}"/>
		<table class="input">
			<tr>
				<td colspan="4">
					<input type="button" class="button" value="编辑企业信息" onclick="javascript:window.location.href='/admin/companyEdit.jhtml'"/>
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>企业电话:
				</th>
				<td>
					13212345567
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>企业邮箱:
				</th>
				<td>
					aaa@qq.com
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>企业地址:
				</th>
				<td>
					湖北武汉
				</td>
			</tr>
			<tr id="contentTr">
				<th>
					企业简介:
				</th>
				<td colspan="3">
					你好
				</td>
			</tr>
		</table>
	</form>
  </body>
</html>
