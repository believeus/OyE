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
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.believeus.PaginationUtil.Page;
import cn.believeus.PaginationUtil.Pageable;
import cn.believeus.PaginationUtil.PaginationUtil;
import cn.believeus.model.News;
import cn.believeus.model.Processs;
import cn.believeus.service.BaseService;

@Controller
public class ProcessController {
	
	private static final Log log=LogFactory.getLog(ProcessController.class);
	@Resource
	private MydfsTrackerServer mydfsTrackerServer;
	
	@Resource
	private BaseService baseService;

	
	/**
	 * 流程
	 * @return
	 */
	@RequestMapping(value="/admin/process/list")
	public String exampleList(HttpServletRequest request){
		String pageNumber = request.getParameter("pageNumber");
		// 如果为空，则设置为1
		if (StringUtils.isEmpty(pageNumber)) {
			pageNumber="1";
		}
		Pageable pageable=new Pageable(Integer.valueOf(pageNumber),20);
		String hql="From Processs processs order by processs.editTime desc";
		Page<?> page = baseService.findObjectList(hql, pageable);
		request.setAttribute("processs", page.getContent());
		request.setAttribute("size",page.getTotal());
		// 分页
		PaginationUtil.pagination(request, page.getPageNumber(),page.getTotalPages(), 0);
		return "/WEB-INF/back/process/list.jsp";
	}
	/** 
	 * 流程添加
	 * @return 
	 */
	@RequiresPermissions("process:create")
	@RequestMapping(value="/admin/process/add")
	public String exampleAdd(){
		return "/WEB-INF/back/process/add.jsp";
	}
	/**
	 * 流程保存或更新
	 * @return
	 */
	@RequiresPermissions("process:update")
	@RequestMapping(value="/admin/process/save")
	public String saveOrUpdate(Processs process,HttpServletRequest request){
		baseService.saveOrUpdata(process);
		return "redirect:/admin/process/list.jhtml";
	}
	 
	/**
	 * 流程修改
	 * @return
	 */
	@RequiresPermissions("process:update")
	@RequestMapping(value="/admin/process/edit")
	public String exampleEdit(Integer id,HttpServletRequest request){
		Processs process = (Processs) baseService.findObject(Processs.class, id);
		request.setAttribute("process", process);
		return "/WEB-INF/back/process/edit.jsp";
	}
	
	/**
	 * 流程删除
	 * @return
	 */
	@RequiresPermissions("process:delete")
	@RequestMapping(value="/admin/process/delete")
	public @ResponseBody String example(Integer[] ids){
		List<Integer> list = Arrays.asList(ids); 
		baseService.delete(Processs.class, list);
		return "{\"type\":\"success\"}";
	}
}
