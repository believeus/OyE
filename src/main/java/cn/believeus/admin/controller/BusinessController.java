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
import cn.believeus.model.Business;
import cn.believeus.model.en.ENBusiness;
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
		String pageNumber = request.getParameter("pageNumber");
		// 如果为空，则设置为1
		if (StringUtils.isEmpty(pageNumber)) {
			pageNumber="1";
		}
		Pageable pageable=new Pageable(Integer.valueOf(pageNumber),20);
		String hql= "from Business as entity order by editTime desc";
		Page<?> page = baseService.findObjectList(hql, pageable);
		request.setAttribute("business", page.getContent());
		request.setAttribute("size",page.getTotal());
		// 分页
		PaginationUtil.pagination(request, page.getPageNumber(),page.getTotalPages(), 0);

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
		String enid = request.getParameter("enid"); 
		//英文表
		ENBusiness  enBusiness=null;
		if (enid!=null&&!enid.equals("")) {
			enBusiness=(ENBusiness)baseService.findObject(ENBusiness.class, Integer.valueOf(enid));
		}else {
			enBusiness=new ENBusiness();
		}
		enBusiness.setTitle(request.getParameter("entitle"));
		enBusiness.setDescription(request.getParameter("endescription"));
		
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
			enBusiness.setPath(storepath);
		}
		baseService.saveOrUpdata(business);
		baseService.saveOrUpdata(enBusiness);
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
		ENBusiness enBusiness = (ENBusiness) baseService.findObject(ENBusiness.class, businessId);
		request.setAttribute("enbusiness", enBusiness);
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
		baseService.delete(Business.class, list);
		baseService.delete(ENBusiness.class,list);
		return "{\"type\":\"success\"}";
	}
}
