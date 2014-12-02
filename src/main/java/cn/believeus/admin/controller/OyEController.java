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

import cn.believeus.model.ContactusInfo;
import cn.believeus.model.OyEInfo;
import cn.believeus.model.en.ENContactusInfo;
import cn.believeus.model.en.ENOyEInfo;
import cn.believeus.service.BaseService;

@Controller
public class OyEController {
	
	private static final Log log=LogFactory.getLog(OyEController.class);
	
	@Resource
	private MydfsTrackerServer mydfsTrackerServer;
	
	@Resource
	private BaseService baseService;

	@SuppressWarnings("unchecked")
	@RequestMapping(value="/admin/oye/list")
	public String list(HttpServletRequest request){
		List<OyEInfo> oyEInfos = (List<OyEInfo>) baseService.findObjectList(OyEInfo.class);
		request.setAttribute("oyEInfos", oyEInfos);
		return "/WEB-INF/back/oye/list.jsp";
	}
	
	@RequestMapping(value="/admin/oye/add")
	public String add(HttpServletRequest request){
		return "/WEB-INF/back/oye/add.jsp";
	}
	
	@RequiresPermissions("oye:create")
	@RequestMapping(value="/admin/oye/save")
	public String save(HttpServletRequest request,OyEInfo oyEInfo){
		oyEInfo.setContent(request.getParameter("content"));
		oyEInfo.setTitle(request.getParameter("title"));
		oyEInfo.setTitle(request.getParameter("category"));
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
			oyEInfo.setPath(storepath);			
		}else {
			oyEInfo.setPath(request.getParameter("filename0"));
		}
		baseService.saveOrUpdata(oyEInfo);
		
		ENOyEInfo enOyEInfo = new ENOyEInfo();
		enOyEInfo.setPath(oyEInfo.getPath());
		enOyEInfo.setContent(request.getParameter("encontent"));
		enOyEInfo.setTitle(request.getParameter("entitle"));
		enOyEInfo.setCategory(request.getParameter("encategory"));
		baseService.saveOrUpdata(enOyEInfo);
		return "redirect:/admin/oye/list.jhtml";
	}
	
	/**
	 * 关于欧耶信息修改
	 * @return
	 */
	@RequiresPermissions("oye:update")
	@RequestMapping(value="/admin/oye/edit")
	public String contactusEdit(HttpServletRequest request,Integer id){
		OyEInfo oyEInfo = (OyEInfo)baseService.findObject(OyEInfo.class, id);
		request.setAttribute("contactusInfo", oyEInfo);
		ENOyEInfo enOyEInfo = (ENOyEInfo)baseService.findObject(ENOyEInfo.class, id);
		request.setAttribute("encontactusInfo", enOyEInfo);
		return "/WEB-INF/back/oye/edit.jsp";
	}
	 
	/**
	 * 关于欧耶信息修改
	 * @return
	 */
	@RequiresPermissions("oye:update")
	@RequestMapping(value="/admin/oye/update")
	public String contactusUpdate(OyEInfo oyEInfo,HttpServletRequest request){
		ENOyEInfo enOyEInfo =(ENOyEInfo)baseService.findObject(ENOyEInfo.class, oyEInfo.getId());
		enOyEInfo.setTitle(request.getParameter("entitle"));
		enOyEInfo.setContent(request.getParameter("encontent"));
		enOyEInfo.setPath(request.getParameter("enpath"));
		enOyEInfo.setCategory(request.getParameter("encategory"));
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
			oyEInfo.setPath(storepath);
			enOyEInfo.setPath(storepath);
		}
		baseService.saveOrUpdata(oyEInfo);
		baseService.saveOrUpdata(enOyEInfo);
		return "redirect:/admin/oye/list.jhtml";
	}
	
	@RequiresPermissions("oye:delete")
	@RequestMapping(value="/admin/oye/delete")
	public @ResponseBody String contactus(Integer[] ids){
		List<Integer> list = Arrays.asList(ids);
		baseService.delete(OyEInfo.class, list);
		baseService.delete(ENOyEInfo.class, list);
		return "{\"type\":\"success\"}";
	}
}
