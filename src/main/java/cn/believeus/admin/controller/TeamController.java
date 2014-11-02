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
import cn.believeus.model.Team;
import cn.believeus.service.BaseService;

@Controller
public class TeamController {
	
	private static final Log log=LogFactory.getLog(TeamController.class);
	@Resource
	private MydfsTrackerServer mydfsTrackerServer;
	@Resource
	private BaseService baseService;

	
	/**
	 * 添加团队成员
	 * @return
	 */
	@RequestMapping(value="/admin/team/add")
	public String teamAdd(){
		return "/WEB-INF/back/team/add.jsp";
	}
	
	/**
	 * 团队成员保存和更新
	 * @return
	 */
	@RequiresPermissions("team:update")
	@RequestMapping(value="/admin/team/SaveOrUpdate")
	public String teamSaveOrUpdate(Team team,HttpServletRequest request){
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
			team.setPath(storepath);			
		}
		baseService.saveOrUpdata(team);
		return "redirect:/admin/team/list.jhtml";
	}
	
	/**
	 * 团队信息修改
	 * @return
	 */
	@RequiresPermissions("team:update")
	@RequestMapping(value="/admin/team/edit")
	public String teamEdit(Integer id,HttpServletRequest request){
		Team team = (Team)baseService.findObject(Team.class, id);
		request.setAttribute("team", team);
		return "/WEB-INF/back/team/edit.jsp";
	}
	/**
	 * 团队成员列表
	 * @return
	 */
	@RequestMapping(value="/admin/team/list")
	public String teamList(HttpServletRequest request){
		String pageNumber = request.getParameter("pageNumber");
		// 如果为空，则设置为1
		if (StringUtils.isEmpty(pageNumber)) {
			pageNumber="1";
		}
		Pageable pageable=new Pageable(Integer.valueOf(pageNumber),2);
		String hql= "from Team as entity order by id desc";;
		Page<?> page = baseService.findObjectList(hql, pageable);
		request.setAttribute("teamList", page.getContent());
		request.setAttribute("size",page.getTotal());
		// 分页
		PaginationUtil.pagination(request, page.getPageNumber(),page.getTotalPages(), 0);
		
		return "/WEB-INF/back/team/list.jsp";
	}
	/**
	 *	成员删除
	 * @return
	 */
	@RequestMapping(value="/admin/team/delete")
	public @ResponseBody String teamDelete(Integer[] ids){
		List<Integer> list = Arrays.asList(ids); 
		baseService.delete(Team.class, list);
		return "{\"type\":\"success\"}";
	}
}
