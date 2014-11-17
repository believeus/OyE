package cn.believeus.admin.controller;




import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import mydfs.storage.server.MydfsTrackerServer;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.junit.Assert;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import cn.believeus.PaginationUtil.Page;
import cn.believeus.PaginationUtil.Pageable;
import cn.believeus.PaginationUtil.PaginationUtil;
import cn.believeus.model.Customers;
import cn.believeus.service.BaseService;

@Controller
public class OurCustomerController {
	
	private static final Log log=LogFactory.getLog(OurCustomerController.class);
	@Resource
	private MydfsTrackerServer mydfsTrackerServer;
	
	@Resource
	private BaseService baseService;

	
	/**
	 * 我们的客户
	 * @return
	 */
	@RequestMapping(value="/admin/ourcustomer/list")
	public String exampleList(HttpServletRequest request){
		String pageNumber = request.getParameter("pageNumber");
		// 如果为空，则设置为1
		if (StringUtils.isEmpty(pageNumber)) {
			pageNumber="1";
		}
		Pageable pageable=new Pageable(Integer.valueOf(pageNumber),20);
		String hql="From Customers customers order by customers.editTime desc";
		Page<?> page = baseService.findObjectList(hql, pageable);
		request.setAttribute("customers", page.getContent());
		request.setAttribute("size",page.getTotal());
		// 分页
		PaginationUtil.pagination(request, page.getPageNumber(),page.getTotalPages(), 0);
		return "/WEB-INF/back/ourcustomer/list.jsp";
	}
	/** 
	 * 我们的客户添加
	 * @return 
	 */
	@RequiresPermissions("ourcustomer:create")
	@RequestMapping(value="/admin/ourcustomer/add")
	public String exampleAdd(){
		return "/WEB-INF/back/ourcustomer/add.jsp";
	}
	/**
	 * 我们的客户保存或更新
	 * @return
	 */
	@RequiresPermissions("ourcustomer:update")
	@RequestMapping(value="/admin/ourcustomer/save")
	public String saveOrUpdate(Customers customers,HttpServletRequest request){
		String clink = request.getParameter("clink");
		String type = request.getParameter("type");
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		String storepath = "";
		Map<String, MultipartFile> files = multipartRequest.getFileMap();
		for (MultipartFile file : files.values()) {
			InputStream inputStream;
			try {
				inputStream = file.getInputStream();
				if(inputStream.available()==0){
					break;
				}
				Assert.assertNotNull("upload file InputStream is null", inputStream);
				String originName=file.getOriginalFilename();
				String extention = originName.substring(originName.lastIndexOf(".") + 1);
				log.debug("upload file stuffix:"+extention);
				storepath += mydfsTrackerServer.upload(inputStream, extention);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		if (!storepath.equals("")) {
			customers.setUrl(storepath);			
		}else {
			customers.setUrl(request.getParameter("filename0"));
		}
		System.out.println(request.getParameter("filename0"));
		customers.setClink(clink);
		customers.setType(Integer.parseInt(type));
		baseService.saveOrUpdata(customers);
		return "redirect:/admin/ourcustomer/list.jhtml";
	}
	 
	/**
	 * 我们的客户修改
	 * @return
	 */
	@RequiresPermissions("ourcustomer:update")
	@RequestMapping(value="/admin/ourcustomer/edit")
	public String exampleEdit(Integer id,HttpServletRequest request){
		Customers customers = (Customers) baseService.findObject(Customers.class, id);
		request.setAttribute("customers", customers);
		return "/WEB-INF/back/ourcustomer/edit.jsp";
	}
	
	/**
	 * 我们的客户删除
	 * @return
	 */
	@RequiresPermissions("ourcustomer:delete")
	@RequestMapping(value="/admin/ourcustomer/delete")
	public @ResponseBody String example(Integer[] ids){
		List<Integer> list = Arrays.asList(ids); 
		baseService.delete(Customers.class, list);
		return "{\"type\":\"success\"}";
	}
}
