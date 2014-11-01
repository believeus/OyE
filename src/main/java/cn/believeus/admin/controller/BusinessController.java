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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import cn.believeus.model.Business;
import cn.believeus.model.News;
import cn.believeus.service.BaseService;

@Controller
public class BusinessController {
	
	private static final Log log=LogFactory.getLog(BusinessController.class);
	
	@Resource
	private MydfsTrackerServer mydfsTrackerServer;
	
	@Resource
	private BaseService baseService;

	/**
	 *业务发布列表
	 * @return
	 */
	@RequestMapping(value="/admin/business/list")
	public String list(HttpServletRequest request){
		@SuppressWarnings("unchecked")
		List<Business> business = (List<Business>) baseService.findObjectList(Business.class);
		request.setAttribute("business", business);
		return "/WEB-INF/back/business/list.jsp";
	}
	
	/**
	 * 业务发布添加
	 * @return
	 */
	@RequiresPermissions("business:create")
	@RequestMapping(value="/admin/business/add")
	public String add(){
		return "/WEB-INF/back/business/add.jsp";
	}
	
	/**
	 * 业务发布保存
	 * @return
	 */
	@RequiresPermissions("business:create")
	@RequestMapping(value="/admin/business/save")
	public String save(Business business,HttpServletRequest request){
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
			business.setPath(storepath);			
		}
		baseService.saveOrUpdata(business);
		return "redirect:/admin/business/list.jhtml";
	}
	
	/**
	 * 业务发布修改
	 * @return
	 */
	@RequiresPermissions("business:update")
	@RequestMapping(value="/admin/business/edit")
	public String edit(Integer businessId, HttpServletRequest request){
		Business business = (Business) baseService.findObject(Business.class, businessId);
		request.setAttribute("business", business);
		return "/WEB-INF/back/business/edit.jsp";
	}
	
	/**
	 * 业务发布删除
	 * @return
	 */
	@RequiresPermissions("business:delete")
	@RequestMapping(value="/admin/business/delete")
	public @ResponseBody String delete(Integer[] ids){
		List<Integer> list = Arrays.asList(ids); 
		System.out.println(list); 
		baseService.delete(Business.class, list);
		return "{\"type\":\"success\"}";
	}
}
