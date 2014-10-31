package cn.believeus.admin.controller;



import javax.annotation.Resource;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.believeus.service.BaseService;

@Controller
public class TeamController {
	@Resource
	private BaseService baseService;

	/**
	 * 查看团队信息
	 * @return
	 */
	@RequestMapping(value="/admin/teamView")
	public String teamView(){
		return "/WEB-INF/back/team/teamMsg.jsp";
	}
	/**
	 * 团队信息修改
	 * @return
	 */
	@RequiresPermissions("team:update")
	@RequestMapping(value="/admin/teamEdit")
	public String teamEdit(){
		return "/WEB-INF/back/team/edit.jsp";
	}
}
