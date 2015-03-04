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
import cn.believeus.model.en.ENContactusInfo;
import cn.believeus.service.BaseService;

@Controller
public class ContactusController {
	
	private static final Log log=LogFactory.getLog(ContactusController.class);
	
	@Resource
	private MydfsTrackerServer mydfsTrackerServer;
	
	@Resource
	private BaseService baseService;

	/**
	 * 查看关于我们信息
	 * @return
	 */
	@RequestMapping(value="/admin/contactusView")
	public String contactusView(HttpServletRequest request){
		ContactusInfo contactusInfo = (ContactusInfo)baseService.findObject(ContactusInfo.class, 1);
		ENContactusInfo encontactusInfo = (ENContactusInfo)baseService.findObject(ENContactusInfo.class, 1);
		if (contactusInfo==null&&encontactusInfo==null) {
			contactusInfo=new ContactusInfo();
			contactusInfo.setTitle("关于我们");
			contactusInfo.setContent("我们是搬家公司，不管你是办公室搬迁还是实验室搬迁，你都可以找我们！");
			encontactusInfo=new ENContactusInfo();
			encontactusInfo.setTitle("About us");
			encontactusInfo.setContent("We are moving company, no matter you are moving office or laboratory moved, you can find us!");
			baseService.saveOrUpdata(contactusInfo);
			baseService.saveOrUpdata(encontactusInfo);
		}
		request.setAttribute("contactusInfo", contactusInfo);
		request.setAttribute("encontactusInfo", encontactusInfo);
		return "/WEB-INF/back/contactus/contactusMsg.jsp";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/admin/contactus/conlist")
	public String list(HttpServletRequest request){
		List<ContactusInfo> contactusInfos = (List<ContactusInfo>) baseService.findObjectList(ContactusInfo.class);
		request.setAttribute("contactusInfos", contactusInfos);
		return "/WEB-INF/back/contactus/list.jsp";
	}
	
	@RequestMapping(value="/admin/conAdd")
	public String add(HttpServletRequest request){
		return "/WEB-INF/back/contactus/add.jsp";
	}
	
	@RequiresPermissions("contactus:create")
	@RequestMapping(value="/admin/conSave")
	public String save(HttpServletRequest request,ContactusInfo contactusInfo){
		contactusInfo.setContent(request.getParameter("content"));
		//contactusInfo.setTitle(request.getParameter("title"));
		contactusInfo.setCategory(request.getParameter("category"));
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
			contactusInfo.setPath(storepath);			
		}else {
			contactusInfo.setPath(request.getParameter("filename0"));
		}
		baseService.saveOrUpdata(contactusInfo);
		
		ENContactusInfo enContactusInfo = new ENContactusInfo();
		enContactusInfo.setPath(contactusInfo.getPath());
		enContactusInfo.setContent(request.getParameter("encontent"));
		//enContactusInfo.setTitle(request.getParameter("entitle"));
		enContactusInfo.setCategory(request.getParameter("encategory"));
		baseService.saveOrUpdata(enContactusInfo);
		return "redirect:/admin/contactus/conlist.jhtml";
	}
	
	/**
	 * 关于我们信息修改
	 * @return
	 */
	@RequiresPermissions("contactus:update")
	@RequestMapping(value="/admin/contactusEdit")
	public String contactusEdit(HttpServletRequest request,Integer id){
		System.out.println(id);
		ContactusInfo contactusInfo = (ContactusInfo)baseService.findObject(ContactusInfo.class, id);
		request.setAttribute("contactusInfo", contactusInfo);
		ENContactusInfo encontactusInfo = (ENContactusInfo)baseService.findObject(ENContactusInfo.class, id);
		request.setAttribute("encontactusInfo", encontactusInfo);
		return "/WEB-INF/back/contactus/edit.jsp";
	}
	 
	/**
	 * 关于我们信息修改
	 * @return
	 */
	@RequiresPermissions("contactus:update")
	@RequestMapping(value="/admin/contactusUpdate")
	public String contactusUpdate(ContactusInfo contactusInfo,HttpServletRequest request){
		String id=request.getParameter("id");
		ENContactusInfo enContactusInfo =(ENContactusInfo)baseService.findObject(ENContactusInfo.class, Integer.parseInt(id));
		enContactusInfo.setTitle(request.getParameter("entitle"));
		enContactusInfo.setContent(request.getParameter("encontent"));
		enContactusInfo.setPath(request.getParameter("enpath"));
		enContactusInfo.setCategory(request.getParameter("encategory"));
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
			contactusInfo.setPath(storepath);
			enContactusInfo.setPath(storepath);
		}
		baseService.saveOrUpdata(contactusInfo);
		baseService.saveOrUpdata(enContactusInfo);
		return "redirect:/admin/contactus/conlist.jhtml";
	}
	
	@RequiresPermissions("contactus:delete")
	@RequestMapping(value="/admin/contactus/delete")
	public @ResponseBody String contactus(Integer[] ids){
		List<Integer> list = Arrays.asList(ids);
		baseService.delete(ContactusInfo.class, list);
		baseService.delete(ENContactusInfo.class, list);
		return "{\"type\":\"success\"}";
	}
}
