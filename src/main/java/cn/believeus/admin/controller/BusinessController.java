package cn.believeus.admin.controller;



import javax.annotation.Resource;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.believeus.service.BaseService;

@Controller
public class BusinessController {
	@Resource
	private BaseService baseService;

	
	/**
	 *业务发布列表
	 * @return
	 */
	@RequestMapping(value="/admin/businessList")
	public String list(){
		return "/WEB-INF/back/business/list.jsp";
	}
	/**
	 * 业务发布添加
	 * @return
	 */
	
	@RequiresPermissions("business:create")
	@RequestMapping(value="/admin/businessAdd")
	public String add(){
		return "/WEB-INF/back/business/add.jsp";
	}
	/**
	 * 业务发布修改
	 * @return
	 */
	@RequiresPermissions("business:update")
	@RequestMapping(value="/admin/businessEdit")
	public String edit(){
		return "/WEB-INF/back/business/edit.jsp";
	}
	/**
	 * 业务发布删除
	 * @return
	 */
	
	@RequiresPermissions("business:delete")
	@RequestMapping(value="/admin/businessDel")
	public String delete(){
		return "/WEB-INF/back/business/list.jsp";
	}
}
