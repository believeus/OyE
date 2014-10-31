package cn.believeus.admin.controller;



import javax.annotation.Resource;

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
	public String newsList(){
		return "/WEB-INF/back/business/list.jsp";
	}
	/**
	 * 业务发布添加
	 * @return
	 */
	@RequestMapping(value="/admin/businessAdd")
	public String newsAdd(){
		return "/WEB-INF/back/business/add.jsp";
	}
	/**
	 * 业务发布修改
	 * @return
	 */
	@RequestMapping(value="/admin/businessEdit")
	public String newsEdit(){
		return "/WEB-INF/back/business/edit.jsp";
	}
	/**
	 * 业务发布删除
	 * @return
	 */
	@RequestMapping(value="/admin/businessDel")
	public String newsDel(){
		return "/WEB-INF/back/business/list.jsp";
	}
}
