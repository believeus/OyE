<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title>添加客户感言 - Powered By believeus</title>
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
				name: "required"
				,enname: "required"
				,upload_img1: "required"
				,upload_img2: "required"
				/* ,upload_img3: "required" */
				,content: "required"
				,encontent: "required"
			}
		});
	});
	
	 // 检查视频格式
	  function checkV(file) {
	   if(!(/(?:flv)$/i.test(file.value))) {
		  alert("只允许上传flv 格式的视频");
		  if(window.ActiveXObject) {//for IE
				file.select();//select the file ,and clear selection
			    document.selection.clear();
			} else if(window.opera) {//for opera
				file.type="text";file.type="file";
			} else file.value="";//for FF,Chrome,Safari
		} 
	  }
	
	</script>
  </head>
  
  <body>
    <div class="path">
		<a href="/admin/manager.jhtml" target="_parent">首页</a> &raquo; 添加合作伙伴
	</div>
	<form id="inputForm" action="/admin/partners/saveOrUpdate.jhtml" method="post" enctype="multipart/form-data">
		<table class="input">
			<tr>
				<th>
					是否首页显示:
				</th>
				<td>
					<select name="showIndex">
						<option value="0">否</option>
						<option value="1">是</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					合作伙伴中文名称:
				</th>
				<td>
					<input type="text" name="name" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					合作伙伴英文名称:
				</th>
				<td>
					<input type="text" name="enname" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					视频:
				</th>
				<td>
					<input type="file" name="upload_img3" onchange="checkV(this)"/>
					<font size="2" color="#999999">只能上传 .flv 格式的视频。</font>
				</td>
			</tr>
			<tr>
				<th>
					视频链接:
				</th>
				<td>
					<input type="text" name="videoLink" class="text" style="margin-right: 42px;" />
					<font size="2" color="#999999">可选填第三方视频链接</font>
				</td>
			</tr>
			<tr id="pathTr">
				<th>
					LOGO图片:
				</th>
				<td colspan="3">
					<div>
						<span style="float:left">
							<div id="preview_wrapper">    
						        <div id="preview_fake" >    
						            <img id="preview" onload="onPreviewLoad(this,190,120)" src="/static/public/images/bg.png"/>
						        </div>    
						    </div>    
						    <br/>    
						    <input id="upload_img1" type="file" name="upload_img1" onchange="filename0.value=this.value;onUploadImgChange(this,190,120,'preview','preview_fake','preview_size_fake');"/>  
						    <input type="hidden" id="filename0" name="filename0">
						    <br/>    
						    <img id="preview_size_fake"/> 
						</span>
					</div>
				</td>
			</tr>
			<tr id="pathTr">
				<th>
					人物图片:
				</th>
				<td colspan="3">
					<div>
						<span style="float:left">
							<div id="preview_wrapper">    
						        <div id="preview_fake2" >    
						            <img id="preview2" onload="onPreviewLoad(this,190,120)" src="/static/public/images/bg.png"/>
						        </div>    
						    </div>    
						    <br/>    
						    <input id="upload_img2" type="file" name="upload_img2" onchange="filename0.value=this.value;onUploadImgChange(this,190,120,'preview2','preview_fake2','preview_size_fake2');"/>  
						    <input type="hidden" id="filename0" name="filename0">
						    <br/>    
						    <img id="preview_size_fake2"/> 
						</span>
					</div>
				</td>
			</tr>
			<tr id="contentTr">
				<th>
					中文描述:
				</th>
				<td colspan="3">
					<textarea name="content" class="editor" style="width: 400px;height: 100px"></textarea>
				</td>
			</tr>
			<tr id="contentTr">
				<th>
					英文描述:
				</th>
				<td colspan="3">
					<textarea name="encontent" class="editor"  style="width: 400px;height: 100px"></textarea>
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
