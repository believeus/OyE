package cn.believeus.admin.controller;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.believeus.model.Admin;
import cn.believeus.model.Role;
import cn.believeus.service.BaseService;

@Controller
public class AdminController {
	@Resource
	private BaseService baseService;

	@RequestMapping(value = "/admin/manager")
	public String manager(Admin formAdmin,HttpSession session) {
		String username = formAdmin.getUsername();
		Admin admin = (Admin) baseService.findObject(Admin.class, "username",username);
		String password = formAdmin.getPassword();
		if(admin==null){
			return "redirect:/admin/login.jhtml";
		}
		if (password.equals(admin.getPassword())) {
			session.setAttribute("sessionUser", admin);
			return "/WEB-INF/back/index.jsp";
		} else {
			return "redirect:/admin/login.jhtml";
		}
	}
	
	@RequestMapping(value="/admin/login")
	public String admin(){
		return "/WEB-INF/back/login.jsp";
	}
	// 更新管理员的密码
	@RequestMapping(value="/admin/updatePwd")
	public 	@ResponseBody String updatePwd(String newpass,HttpSession session){
		Admin admin=(Admin)session.getAttribute("sessionUser");
		admin = (Admin) baseService.findObject(Admin.class, "id",admin.getId());
		admin.setPassword(newpass);
		baseService.saveOrUpdata(admin);
		return newpass;
	}
	
	/**
	 * 权限管理
	 * @return
	 */
	@RequestMapping(value="/admin/power")
	public String power(){ 
		return "/WEB-INF/back/power/powerEdit.jsp";
	}
	
	/**
	 * 添加管理员
	 * @return
	 */
	@RequestMapping(value="/admin/addAdmin")
	public String addAdmin(HttpServletRequest request){ 
		@SuppressWarnings("unchecked")
		List<Role> roles = (List<Role>) baseService.findObjectList(Role.class);
		request.setAttribute("roles", roles);
		return "/WEB-INF/back/power/addAdmin.jsp";
	}
	/**
	 * 添加角色
	 * @return
	 */
	@RequestMapping(value="/admin/addRole")
	public String addRole(){ 
		return "/WEB-INF/back/power/addRole.jsp";
	}
	/**
	 * 角色列表
	 * @return
	 */
	@RequestMapping(value="/admin/roleList")
	public String roleList(HttpServletRequest request){ 
		@SuppressWarnings("unchecked")
		List<Role> roles = (List<Role>) baseService.findObjectList(Role.class);
		request.setAttribute("roles", roles);
		return "/WEB-INF/back/power/roleList.jsp";
	}
}
