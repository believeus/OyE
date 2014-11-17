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
	<title>编辑客户 - Powered By believeus</title>
	<meta name="author" content="believeus Team" />
	<meta name="copyright" content="believeus" />
	<link href="/static/public/css/common_s.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="/static/public/js/jquery.js"></script>
	<script type="text/javascript" src="/static/public/js/jquery.validate.js"></script>
	<script type="text/javascript" src="/static/public/js/common.js"></script>
	<script type="text/javascript" src="/static/public/js/input.js"></script>
	<style type="text/css">
		table.input th {
		    font-size: 13px;
		}
		textarea.editor {
		    height: 200px;
		    width: 800px;
		}
	</style>
	<script type="text/javascript">
	$().ready(function() {
	
		var $inputForm = $("#inputForm");
		
		// 表单验证
		$inputForm.validate({
			rules: {
				clink: "required",
				filename0: "required"
			}
		});
		
		
	});
	
	</script>
  </head>
  
  <body>
     <div class="path">
		<a href="/admin/manager.jhtml" target="_parent">首页</a> &raquo; 编辑流程
	</div>
	<form id="inputForm" action="/admin/ourcustomer/save.jhtml" method="post" enctype="multipart/form-data">
		<input type="hidden" name="id" value="${customers.id }"/>
		<table class="input">
			<tr>
				<th>类型：</th>
				<td>
					<select name="type">
						<c:if test="${customers.type ==1}">
							<option value="">--请选择--</option>
							<option value="1" selected="selected">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
						</c:if>
						<c:if test="${customers.type ==2}">
							<option value="">--请选择--</option>
							<option value="1">1</option>
							<option value="2" selected="selected">2</option>
							<option value="3">3</option>
						</c:if>
						<c:if test="${customers.type ==3}">
							<option value="">--请选择--</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3" selected="selected">3</option>
						</c:if>
						<c:if test="${customers.type !=3 &&customers.type !=2 &&customers.type !=1}">
							<option value="">--请选择--</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
						</c:if>
					</select>
				</td>
			</tr>
			<tr id="pathTr">
				<th>
					<span class="requiredField">*</span>相关图片:
				</th>
				<td colspan="3">
					<div>
						<span style="float:left">
							<div id="preview_wrapper">
						        <div id="preview_fake"> 
						            <img id="preview" onload="onPreviewLoad(this,190,120)" src="/${customers.url }"/>
						        </div>    
						    </div>    
						    <br/>    
						    <input id="upload_img" type="file" name="upload_img" value="${customers.url }" onchange="filename0.value=this.value;onUploadImgChange(this,190,120,'preview','preview_fake','preview_size_fake');"/>  
						    <input type="hidden" id="filename0" name="filename0" value="${customers.url }">
						    <br/>    
						    <img id="preview_size_fake"/> 
						</span>
					</div>
				</td>
			</tr>
			<tr>
				<th>
					链接:
				</th>
				<td colspan="3">
					<input type="text" name="clink" value="${customers.clink }" style="width:192px;">
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
