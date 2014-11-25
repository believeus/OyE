package cn.believeus.controller;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mydfs.storage.server.MydfsTrackerServer;

import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


import cn.believeus.PaginationUtil.Page;
import cn.believeus.PaginationUtil.Pageable;
import cn.believeus.PaginationUtil.PaginationUtil;
import cn.believeus.model.Banner;
import cn.believeus.model.Business;
import cn.believeus.model.CompanyInfo;
import cn.believeus.model.ContactusInfo;
import cn.believeus.model.Customers;
import cn.believeus.model.Example;
import cn.believeus.model.News;
import cn.believeus.model.Partners;
import cn.believeus.model.Processs;
import cn.believeus.model.Team;
import cn.believeus.service.BaseService;
import cn.believeus.variables.Variables;

/**
 * 首页面
 * */
@Controller
public class ControllerIndex {
	
	@Resource
	private BaseService baseService;
	
	@Resource
	private MydfsTrackerServer mydfsTrackerServer;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/index")
	public String index(HttpServletRequest request) {
		//banner
		List<Banner> banners = (List<Banner>) baseService.findObjectList(Banner.class);
		request.setAttribute("banners", banners);
		request.setAttribute("bannersSize", banners.size());
		//企业信息
		CompanyInfo companyInfo = (CompanyInfo) baseService.findObject(CompanyInfo.class, Variables.compinfoId);
		request.setAttribute("companyInfo", companyInfo);
		//我们的客户
		List<Customers> customerType1 = (List<Customers>) baseService.findObjectList(Customers.class, "type", Variables.ourCtustomer1);
		List<Customers> customerType2 = (List<Customers>) baseService.findObjectList(Customers.class, "type", Variables.ourCtustomer2);
		List<Customers> customerType3 = (List<Customers>) baseService.findObjectList(Customers.class, "type", Variables.ourCtustomer3);
		request.setAttribute("customerType1", customerType1);
		request.setAttribute("customerType2", customerType2);
		request.setAttribute("customerType3", customerType3);
		List<Customers> customers = (List<Customers>) baseService.findObjectList(Customers.class);
		request.setAttribute("customersSize", customers.size());
		//案例
		List<Example> examples1 = (List<Example>) baseService.findObjectList(Example.class, "category", (short)1);
		List<Example> examples2 = (List<Example>) baseService.findObjectList(Example.class, "category", (short)2);
		List<Example> examples3 = (List<Example>) baseService.findObjectList(Example.class, "category", (short)3);
		List<Example> examples4 = (List<Example>) baseService.findObjectList(Example.class, "category", (short)4);
		request.setAttribute("examples1", examples1);
		request.setAttribute("examples2", examples2);
		request.setAttribute("examples3", examples3);
		request.setAttribute("examples4", examples4);
		List<Example> examples = (List<Example>) baseService.findObjectList(Example.class);
		request.setAttribute("examplesSize", examples.size());
		//团队管理
		List<Team> teams = (List<Team>) baseService.findObjectList(Team.class);
		request.setAttribute("teams", teams);
		request.setAttribute("tsize", teams.size());
		//服务范围
		List<Business> businesses = (List<Business>) baseService.findObjectList(Business.class);
		request.setAttribute("businesses", businesses);
		request.setAttribute("bsize", businesses.size());
		//流程控制 
		List<Processs> pros = (List<Processs>) baseService.findObjectList(Processs.class);
		request.setAttribute("pros", pros);
		request.setAttribute("prosSize", pros.size());
		//合作伙伴
		List<Partners> partners = (List<Partners>) baseService.findObjectList(Partners.class);
		request.setAttribute("partners", partners);
		request.setAttribute("partnersSize", partners.size());
		//最新动态
		List<News> news = (List<News>) baseService.findObjectList(News.class);
//		List<News> news = (List<News>) baseService.findObjectList(News.class, "top", (short)1);
		for (News tnews : news) {
			String content = tnews.getContent();
			String content2 = content.replaceAll("<[^>]+>", "");
			String content3 = content2.replaceAll("&nbsp;", "");
			tnews.setContent(content3);
		}
		request.setAttribute("news", news);
		List<News> news2 = (List<News>) baseService.findObjectList(News.class);
		request.setAttribute("newsSize", news2.size());
		//关于我们
		ContactusInfo contactusInfo = (ContactusInfo)baseService.findObject(ContactusInfo.class, 1);
		request.setAttribute("contactusInfo", contactusInfo);
		
		return "/WEB-INF/front/index.jsp";
	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/newsList")
	public String news(HttpServletRequest request,Integer type) {
		List<News> news;
		if (type ==0) {
			news = (List<News>)baseService.findObjectList(News.class,"type",type);
			request.setAttribute("news", news);
		}else if (type ==1) {
			news = (List<News>)baseService.findObjectList(News.class,"type",type);
			request.setAttribute("news", news);
		}else if (type ==2) {
			news = (List<News>)baseService.findObjectList(News.class,"type",type);
			request.setAttribute("news", news);
		}else {
			news = new ArrayList<News>();
			request.setAttribute("news", news);
		}
		//企业信息
		CompanyInfo companyInfo = (CompanyInfo) baseService.findObject(CompanyInfo.class, Variables.compinfoId);
		request.setAttribute("companyInfo", companyInfo);
		return "/WEB-INF/front/newsList.jsp";
	}
	@RequestMapping(value = "/newsInfo")
	public String newsInfo(Integer id,HttpServletRequest request) {
		News news = (News)baseService.findObject(News.class, id);
		request.setAttribute("news", news);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		request.setAttribute("time", sdf.format(news.getCreateTime()));
		//企业信息
		CompanyInfo companyInfo = (CompanyInfo) baseService.findObject(CompanyInfo.class, Variables.compinfoId);
		request.setAttribute("companyInfo", companyInfo);
		return "/WEB-INF/front/newsInfo.jsp";
	}
	
	
	@RequestMapping(value = "/cust")
	public String cust(HttpServletRequest request) {
//		List<Partners> Partners = (List<Partners>)baseService.findObjectList(Partners.class);
//		request.setAttribute("partners", Partners);
		
		String pageNumber = request.getParameter("pageNumber");
		// 如果为空，则设置为1
		if (StringUtils.isEmpty(pageNumber)) {
			pageNumber="1";
		}
		Pageable pageable=new Pageable(Integer.valueOf(pageNumber),6);
		String hql= "from Partners as entity order by editTime desc";
		Page<?> page = baseService.findObjectList(hql, pageable);
		request.setAttribute("partners", page.getContent());
		request.setAttribute("size",page.getTotal());
		// 分页
		PaginationUtil.pagination(request, page.getPageNumber(),page.getTotalPages(), 0);
		
		//企业信息
		CompanyInfo companyInfo = (CompanyInfo) baseService.findObject(CompanyInfo.class, Variables.compinfoId);
		request.setAttribute("companyInfo", companyInfo);
		return "/WEB-INF/front/cust.jsp";
	}
	
	/**
	 * 文本框的图片上传
	 * @return
	 */
	@RequestMapping(value = "/UEupload", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	public  void UEpload(HttpServletRequest request,HttpServletResponse response) throws IOException {
		// 图片描述
		String pictitle = request.getParameter("pictitle");
		// 遍历有二进制文件的form表单
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		String storepath = "";
		Map<String, MultipartFile> files = multipartRequest.getFileMap();
		for (MultipartFile file : files.values()) {
			InputStream inputStream;
			try {
				inputStream = file.getInputStream();
				String originName=file.getOriginalFilename();
				String extention = originName.substring(originName.lastIndexOf(".") + 1);
				storepath = mydfsTrackerServer.upload(inputStream, extention);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		//
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("status", "SUCCESS");
		map.put("title", "图片");
		map.put("url", storepath);
		String json="{\"url\":\""+storepath+"\", \"title\":\""+pictitle+"\", \"state\":\"SUCCESS\" }";
		response.setContentType("text/html; charset=UTF-8");
		OutputStream out = response.getOutputStream();
		PrintWriter writer = new PrintWriter(out);
		writer.println(json.toString());
		writer.flush();
		writer.close();
		out.close();
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/caseList")
	public String cases(HttpServletRequest request) {
		List<Example> examples = (List<Example>)baseService.findObjectList(Example.class);
		request.setAttribute("examples", examples);
		//企业信息
		CompanyInfo companyInfo = (CompanyInfo) baseService.findObject(CompanyInfo.class, Variables.compinfoId);
		request.setAttribute("companyInfo", companyInfo);
		return "/WEB-INF/front/caseList.jsp";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/teamList")
	public String teams(HttpServletRequest request) {
		List<Team> teams = (List<Team>)baseService.findObjectList(Team.class);
		request.setAttribute("teams", teams);
		//企业信息
		CompanyInfo companyInfo = (CompanyInfo) baseService.findObject(CompanyInfo.class, Variables.compinfoId);
		request.setAttribute("companyInfo", companyInfo);
		return "/WEB-INF/front/teamList.jsp";
	}
	/**
	 * 客户列表
	 * @param request
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/customerList")
	public String customerList(HttpServletRequest request) {
		List<Customers> customers = (List<Customers>)baseService.findObjectList(Customers.class);
		request.setAttribute("customers", customers);
		//企业信息
		CompanyInfo companyInfo = (CompanyInfo) baseService.findObject(CompanyInfo.class, Variables.compinfoId);
		request.setAttribute("companyInfo", companyInfo);
		return "/WEB-INF/front/customerList.jsp";
	}
	/**
	 * 关于我们列表
	 * @param request
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/contactusInfo")
	public String contactusInfoList(HttpServletRequest request,Integer type) {
		List<ContactusInfo> contactusInfos;
		if (type==0) {
			contactusInfos = (List<ContactusInfo>)baseService.findObjectList(ContactusInfo.class,"type",type);
			request.setAttribute("contactusInfos", contactusInfos);
		}else if (type==1) {
			contactusInfos = (List<ContactusInfo>)baseService.findObjectList(ContactusInfo.class,"type",type);
			request.setAttribute("contactusInfos", contactusInfos);
		}else if (type==2) {
			contactusInfos = (List<ContactusInfo>)baseService.findObjectList(ContactusInfo.class,"type",type);
			request.setAttribute("contactusInfos", contactusInfos);
		}else {
			contactusInfos = new ArrayList<ContactusInfo>();
			request.setAttribute("contactusInfos", contactusInfos);
		}
		//企业信息
		CompanyInfo companyInfo = (CompanyInfo) baseService.findObject(CompanyInfo.class, Variables.compinfoId);
		request.setAttribute("companyInfo", companyInfo);
		return "/WEB-INF/front/contactusInfo.jsp";
	}
	
	/**
	 * 流程控制
	 * @param request
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/serviceProcess")
	public String serviceProcess(HttpServletRequest request) {
		List<Processs> pros = (List<Processs>) baseService.findObjectList(Processs.class);
		request.setAttribute("pros", pros);
		request.setAttribute("prosSize", pros.size());
		//企业信息
		CompanyInfo companyInfo = (CompanyInfo) baseService.findObject(CompanyInfo.class, Variables.compinfoId);
		request.setAttribute("companyInfo", companyInfo);
		return "/WEB-INF/front/serviceProcess.jsp";
	}
	
	/**
	 * 业务范围
	 * @param request
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/ourBussiness")
	public String businesss(HttpServletRequest request) {
		List<Business> businesses = (List<Business>) baseService.findObjectList(Business.class);
		request.setAttribute("businesses", businesses);
		request.setAttribute("bsize", businesses.size());
		//企业信息
		CompanyInfo companyInfo = (CompanyInfo) baseService.findObject(CompanyInfo.class, Variables.compinfoId);
		request.setAttribute("companyInfo", companyInfo);
		return "/WEB-INF/front/ourBusiness.jsp";
	}
	
	/**
	 * 案例详情
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/caseInfo")
	public String caseInfo(HttpServletRequest request,Integer id) {
		Example example = (Example) baseService.findObject(Example.class, id);
		String[] path = example.getPaths().split("#");
		List<String> paths = new ArrayList<String>();
		for (int i = 0; i < path.length; i++) {
			paths.add(path[i]);
		}
		request.setAttribute("paths", paths);
		
		request.setAttribute("example", example);
		//企业信息
		CompanyInfo companyInfo = (CompanyInfo) baseService.findObject(CompanyInfo.class, Variables.compinfoId);
		request.setAttribute("companyInfo", companyInfo);
		return "/WEB-INF/front/caseInfo.jsp";
	}
}
