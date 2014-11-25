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
import cn.believeus.model.News;
import cn.believeus.model.en.ENNews;
import cn.believeus.service.BaseService;
import cn.believeus.variables.Variables;

@Controller
public class NewsController {
	
	private static final Log log=LogFactory.getLog(NewsController.class);
	
	@Resource
	private MydfsTrackerServer mydfsTrackerServer;
	
	@Resource
	private BaseService baseService;

	/**
	 * 新闻列表
	 * @return
	 */
	@RequiresPermissions("newsDinamic:view")
	@RequestMapping(value="/admin/news/list")
	public String list(HttpServletRequest request){
		String pageNumber = request.getParameter("pageNumber");
		// 如果为空，则设置为1
		if (StringUtils.isEmpty(pageNumber)) {
			pageNumber="1";
		}
		Pageable pageable=new Pageable(Integer.valueOf(pageNumber),20);
		String hql="From News news order by news.top desc,news.editTime desc";
		Page<?> page = baseService.findObjectList(hql, pageable);
		request.setAttribute("news", page.getContent());
		request.setAttribute("size",page.getTotal());
		// 分页
		PaginationUtil.pagination(request, page.getPageNumber(),page.getTotalPages(), 0);

		return "/WEB-INF/back/news/list.jsp";
	}
	
	/**
	 * 新闻添加
	 * @return
	 */
	@RequiresPermissions("newsDinamic:create")
	@RequestMapping(value="/admin/news/add")
	public String add(){
		return "/WEB-INF/back/news/add.jsp";
	}
	
	/**
	 * 新闻保存
	 * @return
	 * */
	@RequiresPermissions("newsDinamic:create")
	@RequestMapping(value="/admin/news/save")
	public String save(News news,HttpServletRequest request){
		//英文表
		ENNews enNews=null;
		if (news.getId()==0) {
			enNews=new ENNews();
		}else {
			enNews = (ENNews)baseService.findObject(ENNews.class, news.getId());
		}
		enNews.setTitle(request.getParameter("entitle"));
		enNews.setContent(request.getParameter("encontent"));
		enNews.setPath(request.getParameter("path"));
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
			news.setPath(storepath);
			enNews.setPath(storepath);
		}
		baseService.saveOrUpdata(news);
		enNews.setType(news.getType());
		enNews.setTop(news.getTop());
		baseService.saveOrUpdata(enNews);
		return "redirect:/admin/news/list.jhtml";
	}
	
	/**
	 * 新闻修改
	 * @return
	 */
	@RequiresPermissions("newsDinamic:update")
	@RequestMapping(value="/admin/news/edit")
	public String edit(Integer myNewId, HttpServletRequest request){
		News news = (News) baseService.findObject(News.class, myNewId);
		request.setAttribute("news", news);
		ENNews enNews = (ENNews) baseService.findObject(ENNews.class, myNewId);
		request.setAttribute("ennews", enNews);
		return "/WEB-INF/back/news/edit.jsp";
	}
	
	/**
	 * 新闻删除
	 * @return
	 */
	@RequiresPermissions("newsDinamic:delete")
	@RequestMapping(value="/admin/news/delete")
	public @ResponseBody String delete(Integer[] ids){
		List<Integer> list = Arrays.asList(ids); 
		baseService.delete(News.class, list);
		baseService.delete(ENNews.class, list);
		return "{\"type\":\"success\"}";
	}
	
	/**
	 * 新闻置顶
	 * @return
	 */
	@RequiresPermissions("newsDinamic:update")
	@RequestMapping(value="/admin/news/top")
	public String newsTop(Integer myNewId, HttpServletRequest request){
		News news = (News) baseService.findObject(News.class, myNewId);
		news.setTop(Variables.newsUp);
		baseService.saveOrUpdata(news);
		ENNews enNews = (ENNews) baseService.findObject(ENNews.class, myNewId);
		enNews.setTop(Variables.newsUp);
		baseService.saveOrUpdata(enNews);
		return "redirect:/admin/news/list.jhtml";
	}
	
	@RequiresPermissions("newsDinamic:update")
	@RequestMapping(value="/admin/news/down")
	public String downTop(Integer myNewId){
		News news = (News) baseService.findObject(News.class, myNewId);
		news.setTop(Variables.newsDown);
		baseService.saveOrUpdata(news);
		ENNews enNews = (ENNews) baseService.findObject(ENNews.class, myNewId);
		enNews.setTop(Variables.newsDown);
		baseService.saveOrUpdata(enNews);
		return "redirect:/admin/news/list.jhtml";
	}
}