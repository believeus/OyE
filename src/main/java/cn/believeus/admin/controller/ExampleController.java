package cn.believeus.admin.controller;



import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.believeus.service.BaseService;

@Controller
public class ExampleController {
	@Resource
	private BaseService baseService;

	
	/**
	 *案例列表
	 * @return
	 */
	@RequestMapping(value="/admin/exampleList")
	public String newsList(){
		return "/WEB-INF/back/example/list.jsp";
	}
	/**
	 * 案例添加
	 * @return
	 */
	@RequestMapping(value="/admin/exampleAdd")
	public String newsAdd(){
		return "/WEB-INF/back/example/add.jsp";
	}
	/**
	 * 案例修改
	 * @return
	 */
	@RequestMapping(value="/admin/exampleEdit")
	public String newsEdit(){
		return "/WEB-INF/back/example/edit.jsp";
	}
	/**
	 * 案例删除
	 * @return
	 */
	@RequestMapping(value="/admin/exampleDel")
	public String newsDel(){
		return "/WEB-INF/back/example/list.jsp";
	}
}