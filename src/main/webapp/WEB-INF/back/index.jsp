<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<head id="Head1">
    <title>OYE后台管理系统</title>
    <meta http-equiv="Content-Type" content="text/html charset=gbk"/>
    <link href="/static/public/css/default.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="/static/public/js/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="/static/public/js/themes/icon.css" />
    <script type="text/javascript" src="/static/public/js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="/static/public/js/jQuery.easyui.js"></script>

	<script type="text/javascript" src='/static/public/js/outlook2.js'></script>
    <script type="text/javascript">
	 var _menus = {"menus":[
			{"menuid":"1","icon":"icon-sys","menuname":"内容管理",
				"menus":[
						<shiro:hasPermission name="newsDinamic:view">
				         {"menuname":"企业新闻管理","icon":"icon-add","url":"/admin/news/list.jhtml"},
				        </shiro:hasPermission>
				         
				        <shiro:hasPermission name="business:view"> 
						 {"menuname":"业务发布管理","icon":"icon-users","url":"/admin/business/list.jhtml"},
						</shiro:hasPermission>
						 
						<shiro:hasPermission name="example:view"> 
						 {"menuname":"企业案例管理","icon":"icon-role","url":"/admin/example/list.jhtml"},
						</shiro:hasPermission>
						 
						<shiro:hasPermission name="contact:view">  
						{"menuname":"用户咨询管理","icon":"icon-set","url":"/admin/message/list.jhtml"},
						</shiro:hasPermission>
						
						<shiro:hasPermission name="customer:view">  	
						{"menuname":"合作伙伴管理","icon":"icon-set","url":"/admin/partners/list.jhtml"},
						</shiro:hasPermission>
						
						<shiro:hasPermission name="companyMsg:view">  	
						{"menuname":"企业信息管理","icon":"icon-nav","url":"/admin/companyView.jhtml"},
						</shiro:hasPermission>
						
						<shiro:hasPermission name="team:view">  	
						{"menuname":"核心团队管理","icon":"icon-set","url":"/admin/team/list.jhtml"},
						</shiro:hasPermission>
						
						<shiro:hasPermission name="banner:view">  	
						{"menuname":"banner 管理","icon":"icon-set","url":"/admin/banner/list.jhtml"},
						</shiro:hasPermission>
						
						<shiro:hasPermission name="process:view">  	
						{"menuname":"企业流程管理","icon":"icon-set","url":"/admin/process/list.jhtml"},
						</shiro:hasPermission>
						
						<shiro:hasPermission name="ourcustomer:view">  	
						{"menuname":"企业客户管理","icon":"icon-set","url":"/admin/ourcustomer/list.jhtml"},
						</shiro:hasPermission>
						
						<shiro:hasPermission name="contactus:view">  	
						{"menuname":"关于我们管理","icon":"icon-nav","url":"/admin/contactusView.jhtml"},
						</shiro:hasPermission>
					]
			}
			,{"menuid":"2","icon":"icon-sys","menuname":"系统管理",
				"menus":[
						<c:if test="${sessionUser.id==1}">
				        {"menuname":"角色管理","icon":"icon-log","url":"/admin/roleList.jhtml"},
				        </c:if>
						{"menuname":"管理员管理","icon":"icon-log","url":"/admin/adminList.jhtml"}
					]
			}
			
	]};
        //设置登录窗口
        function openPwd() {
            $('#w').window({
                title: '修改密码',
                width: 300,
                modal: true,
                shadow: true,
                closed: true,
                height: 160,
                resizable:false
            });
        }
        //关闭登录窗口
        function close() {
            $('#w').window('close');
        }

        

        //修改密码
        function serverLogin() {
            var $newpass = $('#txtNewPass');
            var $rePass = $('#txtRePass');

            if ($newpass.val() == '') {
                msgShow('系统提示', '请输入密码！', 'warning');
                return false;
            }
            if ($rePass.val() == '') {
                msgShow('系统提示', '请在一次输入密码！', 'warning');
                return false;
            }

            if ($newpass.val() != $rePass.val()) {
                msgShow('系统提示', '两次密码不一至！请重新输入', 'warning');
                return false;
            }
	        // ajax 页面无刷新调用后台方法
            $.post('/admin/updatePwd.jhtml?newpass=' + $newpass.val(), function(msg) {
                msgShow('系统提示', '恭喜，密码修改成功！<br>您的新密码为：' + msg, 'info');
                $newpass.val('');
                $rePass.val('');
                close();
            });
            
        }

        $(function() {

            openPwd();
            //
            $('#editpass').click(function() {
                $('#w').window('open');
            });

            $('#btnEp').click(function() {
                serverLogin();
            })

           

            $('#loginOut').click(function() {
                $.messager.confirm('系统提示', '您确定要退出本次登录吗?', function(r) {

                    if (r) {
                        location.href = '/admin/logout.jhtml';
                    }
                });

            })
			
			
			
        });
		
		$(function(){
			$(".panel div").each(function(){
				//$(this).removeClass("accordion-header-selected");
			});
		});

    </script>

</head>
<body class="easyui-layout" style="overflow-y: hidden"  scroll="no">
<noscript>
<div style=" position:absolute; z-index:100000; height:2046px;top:0px;left:0px; width:100%; background:white; text-align:center;">
    <img src="images/noscript.gif" alt='抱歉，请开启脚本支持！' />
</div></noscript>
    <div region="north" split="true" border="false" style="overflow: hidden; height: 30px;
        background: url(/static/public/images/layout-browser-hd-bg.gif) #7f99be repeat-x center 50%;
        line-height: 20px;color: #fff; font-family: Verdana, 微软雅黑,黑体">
        <span style="float:right; padding-right:20px;" class="head">欢迎 admin <a href="#" id="editpass">修改密码</a> <a href="#" id="loginOut">安全退出</a></span>
        <span style="padding-left:10px; font-size: 16px; "><img src="/static/public/images/blocks.gif" width="20" height="20" align="absmiddle" />朗悦 www.oyemoving.com</span>
    </div>
    <div region="south" split="true" style="height: 30px; background: #D2E0F2; ">
        <div class="footer">By 朗悦</div>
    </div>
    <div region="west" split="true" title="导航菜单" style="width:180px;" id="west">
<div class="easyui-accordion" fit="true" border="false">
		<!--  导航内容 -->
				
			</div>

    </div>
    <div id="mainPanle" region="center" style="background: #eee; overflow-y:hidden">
        <div id="tabs" class="easyui-tabs"  fit="true" border="false" >
			<div title="欢迎使用" style="padding:20px;overflow:hidden;" id="home">
				
			<h1>联系方式:</h1>
			<h1>地址:上海市长宁区中山西路179号E-F座</h1>
			<h1>电话:+86 21-6259-0368</h1>
			<h1>传真:+86 21-6215-3789</h1>
			<h1>热线:+86 400-6358-8798</h1>
			</div>
		</div>
    </div>
    
    
    <!--修改密码窗口-->
    <div id="w" class="easyui-window" title="修改密码" collapsible="false" minimizable="false"
        maximizable="false" icon="icon-save"  style="width: 300px; height: 150px; padding: 5px;
        background: #fafafa;">
        <div class="easyui-layout" fit="true">
            <div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
                <table cellpadding=3>
                    <tr>
                        <td>新密码：</td>
                        <td><input id="txtNewPass" type="password" class="txt01" /></td>
                    </tr>
                    <tr>
                        <td>确认密码：</td>
                        <td><input id="txtRePass" type="password" class="txt01" /></td>
                    </tr>
                </table>
            </div>
            <div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;">
                <a id="btnEp" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)" >
                    确定</a> <a class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0)"
                        onclick="closeLogin()">取消</a>
            </div>
        </div>
    </div>

	<div id="mm" class="easyui-menu" style="width:150px;">
		<div id="mm-tabclose">关闭</div>
		<div id="mm-tabcloseall">全部关闭</div>
		<div id="mm-tabcloseother">除此之外全部关闭</div>
		<div class="menu-sep"></div>
		<div id="mm-tabcloseright">当前页右侧全部关闭</div>
		<div id="mm-tabcloseleft">当前页左侧全部关闭</div>
		<div class="menu-sep"></div>
		<div id="mm-exit">退出</div>
	</div>


</body>
</html>