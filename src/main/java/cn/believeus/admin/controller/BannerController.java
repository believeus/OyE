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
import cn.believeus.model.Banner;
import cn.believeus.service.BaseService;

@Controller
public class BannerController {
	
	private static final Log log=LogFactory.getLog(BannerController.class);
	
	@Resource
	private MydfsTrackerServer mydfsTrackerServer;
	
	@Resource
	private BaseService baseService;

	/**
	 * banner
	 * @return
	 */
	@RequestMapping(value="/admin/banner/list")
	public String bannerList(HttpServletRequest request){
		@SuppressWarnings("unchecked")
		List<Banner> banners = (List<Banner>) baseService.findObjectList(Banner.class);
		request.setAttribute("banners", banners);
		return "/WEB-INF/back/banner/list.jsp";
	}
	
	/**
	 * banner添加
	 * @return
	 */
	@RequiresPermissions("banner:create")
	@RequestMapping(value="/admin/banner/add")
	public String bannerAdd(){
		return "/WEB-INF/back/banner/add.jsp";
	}
	
	/**
	 * banner保存或更新
	 * @return
	 */
	@RequiresPermissions("banner:update")
	@RequestMapping(value="/admin/banner/saveOrUpdate")
	public String saveOrUpdate(Banner banner,HttpServletRequest request){
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
			banner.setPath(storepath);
		}
		baseService.saveOrUpdata(banner);
		return "redirect:/admin/banner/list.jhtml";
	}
	 
	/**
	 * banner修改
	 * @return
	 */
	@RequiresPermissions("banner:update")
	@RequestMapping(value="/admin/banner/edit")
	public String bannerEdit(Integer bannerId, HttpServletRequest request){
		Banner banner = (Banner) baseService.findObject(Banner.class, bannerId);
		request.setAttribute("banner", banner);
		return "/WEB-INF/back/banner/edit.jsp";
	}
	
	/**
	 * banner删除
	 * @return
	 */
	@RequiresPermissions("banner:delete")
	@RequestMapping(value="/admin/banner/delete")
	public @ResponseBody String delete(Integer[] ids){
		List<Integer> list = Arrays.asList(ids); 
		System.out.println(list); 
		baseService.delete(Banner.class, list);
		return "{\"type\":\"success\"}";
	}
}
