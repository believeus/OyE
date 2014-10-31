package cn.believeus.admin.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
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
	public String list(HttpServletRequest request){
		@SuppressWarnings("unchecked")
		List<News> news = (List<News>) baseService.findObjectList(News.class);
		request.setAttribute("news", news);
		return "/WEB-INF/back/news/list.jsp";
	}
	
	/**
	 * 新闻添加
	 * @return
	 */
	@RequiresPermissions("newsDinamic:create")
	@RequestMapping(value="/admin/newsAdd")
	public String add(){
		return "/WEB-INF/back/news/add.jsp";
	}
	
	/**
	 * 新闻保存
	 * @return
	 * */
	@RequiresPermissions("newsDinamic:create")
	@RequestMapping(value="/admin/newsSave")
	public String save(News news){
		news.setCreateTime(System.currentTimeMillis());
		baseService.saveOrUpdata(news);
		return "redirect:/admin/newsList.jhtml";
	}
	
	/**
	 * 新闻更新
	 * @return
	 */
	@RequiresPermissions("newsDinamic:update")
	@RequestMapping(value="/admin/newsUpdate")
	public String newsUpdate(News news){
		news.setEditTime(System.currentTimeMillis());
		baseService.saveOrUpdata(news);
		return "redirect:/admin/newsList.jhtml";
	}
	
	/**
	 * 新闻修改
	 * @return
	 */
	@RequiresPermissions("newsDinamic:update")
	@RequestMapping(value="/admin/newsEdit")
	public String edit(Integer myNewId, HttpServletRequest request){
		News news = (News) baseService.findObject(News.class, myNewId);
		request.setAttribute("news", news);
		return "/WEB-INF/back/news/edit.jsp";
	}
	
	/**
	 * 新闻删除
	 * @return
	 */
	@RequiresPermissions("newsDinamic:delete")
	@RequestMapping(value="/admin/newsDel")
	public String delete(){
		return "/WEB-INF/back/news/list.jsp";
	}
}