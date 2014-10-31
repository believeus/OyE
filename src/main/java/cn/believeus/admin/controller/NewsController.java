package cn.believeus.admin.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.believeus.model.News;
import cn.believeus.service.BaseService;

@Controller
public class NewsController {
	
	@Resource
	private BaseService baseService;

	/**
	 * 新闻列表
	 * @return
	 */
	@RequestMapping(value="/admin/newsList")
	public String newsList(HttpServletRequest request){
		@SuppressWarnings("unchecked")
		List<News> news = (List<News>) baseService.findObjectList(News.class);
		request.setAttribute("news", news);
		return "/WEB-INF/back/news/list.jsp";
	}
	
	/**
	 * 新闻添加
	 * @return
	 */
	@RequestMapping(value="/admin/newsAdd")
	public String newsAdd(){
		return "/WEB-INF/back/news/add.jsp";
	}
	
	/**
	 * 新闻保存
	 * @return
	 * */
	@RequestMapping(value="/admin/newsSave")
	public String newsSave(News news, HttpServletRequest request){
		news.setCreateTime(System.currentTimeMillis());
		
		System.out.println(news.getCategory());
		baseService.saveOrUpdata(news);
		return "redirect:/admin/newsList.jhtml";
	}
	
	/**
	 * 新闻修改
	 * @return
	 */
	@RequestMapping(value="/admin/newsEdit")
	public String newsEdit(){
		return "/WEB-INF/back/news/edit.jsp";
	}
	
	/**
	 * 新闻删除
	 * @return
	 */
	@RequestMapping(value="/admin/newsDel")
	public String newsDel(){
		return "/WEB-INF/back/news/list.jsp";
	}
}