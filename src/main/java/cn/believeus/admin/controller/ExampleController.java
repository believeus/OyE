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


import cn.believeus.model.Example;
import cn.believeus.service.BaseService;

@Controller
public class ExampleController {
	
	private static final Log log=LogFactory.getLog(ExampleController.class);
	@Resource
	private MydfsTrackerServer mydfsTrackerServer;
	
	@Resource
	private BaseService baseService;

	
	/**
	 *案例列表
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/admin/example/list")
	public String exampleList(HttpServletRequest request){
		List<Example> examples = (List<Example>)baseService.findObjectList(Example.class);
		request.setAttribute("exampleList", examples);
		return "/WEB-INF/back/example/list.jsp";
	}
	/**
	 * 案例添加
	 * @return
	 */
	@RequiresPermissions("example:create")
	@RequestMapping(value="/admin/example/add")
	public String exampleAdd(){
		return "/WEB-INF/back/example/add.jsp";
	}
	/**
	 * 案例保存或更新
	 * @return
	 */
	@RequiresPermissions("example:update")
	@RequestMapping(value="/admin/example/saveOrUpdate")
	public String saveOrUpdate(Example example,HttpServletRequest request){
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
			example.setPath(storepath);			
		}
		baseService.saveOrUpdata(example);
		return "redirect:/admin/example/list.jhtml";
	}
	
	/**
	 * 案例修改
	 * @return
	 */
	@RequiresPermissions("example:update")
	@RequestMapping(value="/admin/example/edit")
	public String exampleEdit(Integer id,HttpServletRequest request){
		Example example  = (Example) baseService.findObject(Example.class, id);
		request.setAttribute("example", example);
		return "/WEB-INF/back/example/edit.jsp";
	}
	
	/**
	 * 案例删除
	 * @return
	 */
	@RequiresPermissions("example:delete")
	@RequestMapping(value="/admin/example/delete")
	public @ResponseBody String example(Integer[] ids){
		List<Integer> list = Arrays.asList(ids); 
		baseService.delete(Example.class, list);
		return "{\"type\":\"success\"}";
	}
}
