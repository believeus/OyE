package cn.believeus.admin.controller;




import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import mydfs.storage.server.MydfsTrackerServer;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import cn.believeus.model.Example;
import cn.believeus.service.BaseService;

@Controller
public class BannerController {
	
	private static final Log log=LogFactory.getLog(BannerController.class);
	@Resource
	private MydfsTrackerServer mydfsTrackerServer;
	
	@Resource
	private BaseService baseService;

	
	/**
	 * banner
	 * @return
	 */
	@RequestMapping(value="/admin/banner/list")
	public String exampleList(HttpServletRequest request){

		return "/WEB-INF/back/banner/list.jsp";
	}
	/**
	 * banner添加
	 * @return
	 */
	@RequiresPermissions("example:create")
	@RequestMapping(value="/admin/banner/add")
	public String exampleAdd(){
		return "/WEB-INF/back/banner/add.jsp";
	}
	/**
	 * banner保存或更新
	 * @return
	 */
	@RequiresPermissions("example:update")
	@RequestMapping(value="/admin/banner/saveOrUpdate")
	public String saveOrUpdate(Example example,HttpServletRequest request){
		return "redirect:/admin/banner/list.jhtml";
	}
	 
	/**
	 * banner修改
	 * @return
	 */
	@RequiresPermissions("example:update")
	@RequestMapping(value="/admin/banner/edit")
	public String exampleEdit(Integer id,HttpServletRequest request){
		return "/WEB-INF/back/banner/edit.jsp";
	}
	
	/**
	 * banner删除
	 * @return
	 */
	@RequiresPermissions("example:delete")
	@RequestMapping(value="/admin/banner/delete")
	public @ResponseBody String example(Integer[] ids){
		return "{\"type\":\"success\"}";
	}
}
