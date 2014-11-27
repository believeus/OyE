package cn.believeus.admin.controller;

import java.util.Arrays;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import mydfs.storage.server.MydfsTrackerServer;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import cn.believeus.model.Category;
import cn.believeus.service.BaseService;

@Controller
public class CategoryController {
	
	private static final Log log=LogFactory.getLog(CategoryController.class);
	
	@Resource
	private MydfsTrackerServer mydfsTrackerServer;
	
	@Resource
	private BaseService baseService;

	/**
	 * 分类
	 * @return
	 */
	@RequestMapping(value="/admin/category/list")
	public String bannerList(HttpServletRequest request){
		@SuppressWarnings("unchecked")
		List<Category> banners = (List<Category>) baseService.findObjectList(Category.class);
		request.setAttribute("categories", banners);
		request.setAttribute("size", banners.size());
		return "/WEB-INF/back/category/list.jsp";
	}
	
	/**
	 * 分类添加
	 * @return
	 */
	@RequiresPermissions("category:create")
	@RequestMapping(value="/admin/category/add")
	public String bannerAdd(){
		return "/WEB-INF/back/category/add.jsp";
	}
	
	/**
	 * 分类保存或更新
	 * @return
	 */
	@RequiresPermissions("category:update")
	@RequestMapping(value="/admin/category/saveOrUpdate")
	public String saveOrUpdate(Category category,HttpServletRequest request){
		baseService.saveOrUpdata(category);
		return "redirect:/admin/category/list.jhtml";
	}
	 
	/**
	 * 分类修改
	 * @return
	 */
	@RequiresPermissions("category:update")
	@RequestMapping(value="/admin/category/edit")
	public String bannerEdit(Integer id, HttpServletRequest request){
		Category category = (Category) baseService.findObject(Category.class, id);
		request.setAttribute("category", category);
		return "/WEB-INF/back/category/edit.jsp";
	}
	
	/**
	 * 分类删除
	 * @return
	 */
	@RequiresPermissions("category:delete")
	@RequestMapping(value="/admin/category/delete")
	public @ResponseBody String delete(Integer[] ids){
		List<Integer> list = Arrays.asList(ids); 
		System.out.println(list); 
		baseService.delete(Category.class, list);
		return "{\"type\":\"success\"}";
	}
}
