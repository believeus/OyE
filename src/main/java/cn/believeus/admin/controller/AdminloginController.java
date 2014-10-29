package cn.believeus.admin.controller;


import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.believeus.model.Admin;
import cn.believeus.service.BaseService;

@Controller
public class AdminloginController {
	@Resource
	private BaseService baseService;

	@RequestMapping(value = "/adminlogin")
	public String adminlogin(Admin formAdmin) {
		String username = formAdmin.getUsername();
		Admin admin = (Admin) baseService.findObject(Admin.class, "username",
				username);
		String password = formAdmin.getPassword();
		if (password.equals(admin.getPassword())) {
			return "redirect:/backlogin.jhtml";
		} else {
			return "redirect:/backlogin.jhtml";
		}
	}
}
