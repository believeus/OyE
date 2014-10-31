package cn.believeus.admin.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
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
	public String addRoleLogic(ServletRequest request){
		
		Role role = new Role();
		String roleName = request.getParameter("roleName");
		String description = request.getParameter("description");
		role.setRoleName(roleName);
		role.setDescription(description);
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
	@RequestMapping(value="/admin/updateRole")
	public String editRoleLogic(ServletRequest request){
		String roleId = request.getParameter("roleId");
		Role role=(Role)baseService.findObject(Role.class, Integer.parseInt(roleId));
		List<Authority> authoritys = role.getAuthoritys();
		List<Integer> idList=new ArrayList<Integer>();
		for (Authority authority : authoritys) {
			idList.add(authority.getId());
		}
		baseService.delete(Authority.class, idList);
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
