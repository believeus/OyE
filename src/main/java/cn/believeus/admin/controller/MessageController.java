package cn.believeus.admin.controller;



import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.believeus.service.BaseService;

@Controller
public class MessageController {
	@Resource
	private BaseService baseService;

	
	/**
	 *留言列表
	 * @return
	 */
	@RequestMapping(value="/admin/messageList")
	public String newsList(){
		return "/WEB-INF/back/message/list.jsp";
	}
	/**
	 * 留言添加
	 * @return
	 */
	@RequestMapping(value="/admin/messageAdd")
	public String newsAdd(){
		return "/WEB-INF/back/message/add.jsp";
	}
	/**
	 * 留言修改
	 * @return
	 */
	@RequestMapping(value="/admin/messageEdit")
	public String newsEdit(){
		return "/WEB-INF/back/message/edit.jsp";
	}
	/**
	 * 留言删除
	 * @return
	 */
	@RequestMapping(value="/admin/messageDel")
	public String newsDel(){
		return "/WEB-INF/back/message/list.jsp";
	}
}
