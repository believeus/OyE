<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title>添加案例 - Powered By believeus</title>
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
		.brandImg{
			float: left; 
			height: auto; 
			margin-right: 10px; 
			border: 1px solid; 
			width: 192px;
		}
	</style>
	<script type="text/javascript">
	$().ready(function() {
	
		var $inputForm = $("#inputForm");
		
		// 表单验证
		$inputForm.validate({
			rules: {
				upload_img1: "required"
				,upload_img2: "required"
			}
		});
		
		var index =$(".brandImg").size()+2;
		$("#addImg").click(function(){
			var size=$("#upload_img"+(index-1)).val();
			if(size==""){
				alert("请选择前一张图片");
				return false;
			}
			var html='<div class="brandImg">'
				+'<div id="preview_wrapper"> '   
				+'<div id="preview_fake'+index+'" >'    
				+'<img id="preview'+index+'" onload="onPreviewLoad(this,190,120)" src="/static/public/images/bg.png"/>'
				+'</div>    '
				+' </div>    '
				+'<br/>    '
				+'<input style="width: 190px;" id="upload_img'+index+'" type="file" name="upload_img'+index+'" onchange="filename0.value=this.value;onUploadImgChange(this,190,120,\'preview'+index+'\',\'preview_fake'+index+'\',\'preview_size_fake'+index+'\');"/>'  
				+'<input type="hidden" id="filename0" name="filename0">'
				+'<br/>    '
				+'<img id="preview_size_fake'+index+'"/> '
				+'<div style="text-align: right; border-top: 1px dashed #E4E4E4; height: 24px; line-height: 24px; margin-right: 3px;">'
				+'<a onclick="delete_pic(this);" href="javascript:void(0);">删除</a>'
				+'</div>'
				+'</div>';
			
			if($("#Imgs .brandImg").size() > 7){
				alert("最多8张图片");
			}else{
				$("#Imgs").append(html);
			}
			index++;
		});
	});
	function delete_pic(object){		
		// 获取图片是否有值
		if($(object).closest("div").parent().find("img").attr("src")!="/static/public/images/bg.png"){
			// 清空图片和描述
			$(object).closest("div").parent().find("img").attr("src","/static/public/images/bg.png");
			// 清空文件
			var file = $(object).closest("div").parent().find("[name^='upload_img']");
			file.after(file.clone().val(""));
			file.remove(); 
		}					
}
	</script>
  </head>
  
  <body>
    <div class="path">
		<a href="/admin/manager.jhtml" target="_parent">首页</a> &raquo; 添加案例
	</div>
	<form id="inputForm" action="/admin/example/saveOrUpdate.jhtml" method="post" enctype="multipart/form-data">
		<table class="input">
			<tr>
				<th>
					案例分类:
				</th>
				<td>
					<select name="category">
						<option value="1" >世界500强</option>
						<option value="2">国有企业</option>
						<option value="3">事业单位</option>
						<option value="4">私有企业</option>
					</select>
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
						    <input  id="upload_img" type="file" name="upload_img1" onchange="filename0.value=this.value;onUploadImgChange(this,190,120,'preview','preview_fake','preview_size_fake');"/>  
						    <input type="hidden" id="filename0" name="filename0">
						    <br/>    
						    <img id="preview_size_fake"/> 
						</span>
					</div>
				</td>
			</tr>
			<tr id="pathTr" >
				<th>
					<span>案例图片:</span><br/>
					<input type="button" id="addImg" value="添加图片"/>
				</th>
				<td colspan="3" id="Imgs">
					<div  class="brandImg">
						<div id="preview_wrapper">    
					        <div id="preview_fake2" >    
					            <img id="preview2" onload="onPreviewLoad(this,190,120)" src="/static/public/images/bg.png"/>
					        </div>    
					    </div>    
					    <br/>    
					    <input style="width: 190px;" id="upload_img2" type="file" name="upload_img2" onchange="filename0.value=this.value;onUploadImgChange(this,190,120,'preview2','preview_fake2','preview_size_fake2');"/>  
					    <input type="hidden" id="filename0" name="filename0">
					    <br/>    
					    <img id="preview_size_fake2"/> 
					     <div style="text-align: right; border-top: 1px dashed #E4E4E4; height: 24px; line-height: 24px; margin-right: 3px;">
							<a onclick="delete_pic(this);" href="javascript:void(0);">删除</a>   
						</div>
					</div>
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
