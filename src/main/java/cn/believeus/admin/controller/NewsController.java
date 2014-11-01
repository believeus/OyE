package cn.believeus.admin.controller;

import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.believeus.model.News;
import cn.believeus.service.BaseService;
import cn.believeus.variables.Variables;

@Controller
public class NewsController {
	
	@Resource
	private BaseService baseService;

	/**
	 * 新闻列表
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/admin/news/list")
	public String list(HttpServletRequest request){
		String hql="From News news order by news.top desc,news.editTime desc";
		List<News> news = (List<News>) baseService.findObjectList(hql, 20);
		request.setAttribute("news", news);
		return "/WEB-INF/back/news/list.jsp";
	}
	
	/**
	 * 新闻添加
	 * @return
	 */
	@RequiresPermissions("newsDinamic:create")
	@RequestMapping(value="/admin/news/add")
	public String add(){
		return "/WEB-INF/back/news/add.jsp";
	}
	
	/**
	 * 新闻保存
	 * @return
	 * */
	@RequiresPermissions("newsDinamic:create")
	@RequestMapping(value="/admin/news/save")
	public String save(News news){
		baseService.saveOrUpdata(news);
		return "redirect:/admin/news/list.jhtml";
	}
	
	/**
	 * 新闻修改
	 * @return
	 */
	@RequiresPermissions("newsDinamic:update")
	@RequestMapping(value="/admin/news/edit")
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
	@RequestMapping(value="/admin/news/delete")
	public @ResponseBody String delete(Integer[] ids){
		List<Integer> list = Arrays.asList(ids); 
		baseService.delete(News.class, list);
		return "{\"type\":\"success\"}";
	}
	
	/**
	 * 新闻置顶
	 * @return
	 */
	@RequestMapping(value="/admin/news/top")
	public String newsTop(Integer myNewId, HttpServletRequest request){
		News news = (News) baseService.findObject(News.class, myNewId);
		news.setTop(Variables.newsUp);
		baseService.saveOrUpdata(news);
		return "redirect:/admin/news/list.jhtml";
	}
	@RequestMapping(value="/admin/news/down")
	public String downTop(Integer myNewId){
		News news = (News) baseService.findObject(News.class, myNewId);
		news.setTop(Variables.newsDown);
		baseService.saveOrUpdata(news);
		return "redirect:/admin/news/list.jhtml";
	}
}