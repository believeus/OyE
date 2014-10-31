package cn.believeus.admin.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import cn.believeus.model.Authority;
import cn.believeus.model.Role;
import cn.believeus.service.BaseService;

@Controller
public class AdminPowerController {

	@Resource
	private BaseService baseService;
	
	@RequestMapping(value="/admin/addRoleLogic")
	public String addRoleLogic(HttpServletRequest request){
		
		Role role = new Role();
		String roleName = request.getParameter("roleName");
		role.setRoleName(roleName);
		baseService.saveOrUpdata(role);
			
		// 获取被选中的checkbook 并且name="authority"
		String[] parameterValues = request.getParameterValues("authority");
		for (String authorityName : parameterValues) {
			Authority authority = new Authority();
			authority.setAuthorityName(authorityName);
			authority.setRole(role);
			baseService.saveOrUpdata(authority);
		}
		return "redirect:/admin/roleList.jhtml";
	}
}
