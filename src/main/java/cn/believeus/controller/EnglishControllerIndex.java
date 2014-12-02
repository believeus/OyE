package cn.believeus.controller;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.believeus.PaginationUtil.Page;
import cn.believeus.PaginationUtil.Pageable;
import cn.believeus.PaginationUtil.PaginationUtil;
import cn.believeus.model.Banner;
import cn.believeus.model.CompanyInfo;
import cn.believeus.model.Customers;
import cn.believeus.model.Example;
import cn.believeus.model.News;
import cn.believeus.model.OyEInfo;
import cn.believeus.model.Processs;
import cn.believeus.model.en.ENBusiness;
import cn.believeus.model.en.ENCompanyInfo;
import cn.believeus.model.en.ENContactusInfo;
import cn.believeus.model.en.ENNews;
import cn.believeus.model.en.ENOyEInfo;
import cn.believeus.model.en.ENPartners;
import cn.believeus.model.en.ENTeam;
import cn.believeus.service.BaseService;
import cn.believeus.variables.Variables;

/**
 * 首页面
 * */
@Controller
public class EnglishControllerIndex {
	@Resource
	private BaseService baseService;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/english")
	public String index(HttpServletRequest request) {
		//banner
		List<Banner> banners = (List<Banner>) baseService.findObjectList(Banner.class);
		request.setAttribute("banners", banners);
		request.setAttribute("bannersSize", banners.size());
		//企业信息
		ENCompanyInfo companyInfo = (ENCompanyInfo) baseService.findObject(ENCompanyInfo.class, Variables.compinfoId);
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
		List<ENTeam> teams = (List<ENTeam>) baseService.findObjectList(ENTeam.class);
		request.setAttribute("teams", teams);
		request.setAttribute("tsize", teams.size());
		//服务范围
		List<ENBusiness> businesses = (List<ENBusiness>) baseService.findObjectList(ENBusiness.class);
		request.setAttribute("businesses", businesses);
		request.setAttribute("bsize", businesses.size());
		//流程控制
		List<Processs> pros = (List<Processs>) baseService.findObjectList(Processs.class);
		request.setAttribute("pros", pros);
		request.setAttribute("prosSize", pros.size());
		//合作伙伴
		List<ENPartners> partners = (List<ENPartners>) baseService.findObjectList(ENPartners.class);
		request.setAttribute("partners", partners);
		request.setAttribute("partnersSize", partners.size());
		//最新动态
//		List<ENNews> news = (List<ENNews>) baseService.findObjectList(ENNews.class, "top", (short)1);
		List<ENNews> news = (List<ENNews>) baseService.findObjectList(ENNews.class);
		for (ENNews tnews : news) {
			String content = tnews.getContent();
			String content2 = content.replaceAll("<[^>]+>", "");
			String content3 = content2.replaceAll("&nbsp;", "");
			tnews.setContent(content3);
		}
		request.setAttribute("news", news);
		List<News> news2 = (List<News>) baseService.findObjectList(News.class);
		request.setAttribute("newsSize", news2.size());
		//关于我们
		List<ENContactusInfo> contactusInfos = (List<ENContactusInfo>)baseService.findObjectList(ENContactusInfo.class);
		ENContactusInfo info =null;
		if (contactusInfos.size()!=0) {
			info = contactusInfos.get(0);
		}else {
			info=new ENContactusInfo();
		}
		request.setAttribute("contactusInfo", info);
		
		return "/WEB-INF/front/enIndex.jsp";
	}
	@RequestMapping(value = "/english/newsList")
	public String news(HttpServletRequest request,Integer type) {
		
		String pageNumber = request.getParameter("pageNumber");
		// 如果为空，则设置为1
		if (StringUtils.isEmpty(pageNumber)) {
			pageNumber="1";
		}
		Pageable pageable=new Pageable(Integer.valueOf(pageNumber),20);
		String hql;
		if (type==0) {
			hql= "from ENNews as entity where entity.type=0 order by editTime desc";
			Page<?> page = baseService.findObjectList(hql, pageable);
			request.setAttribute("news", page.getContent());
			request.setAttribute("size",page.getTotal());
			PaginationUtil.pagination(request, page.getPageNumber(),page.getTotalPages(), 0);
		}else if (type ==1) {
			hql= "from ENNews as entity where entity.type=1 order by editTime desc";
			Page<?> page = baseService.findObjectList(hql, pageable);
			request.setAttribute("news", page.getContent());
			request.setAttribute("size",page.getTotal());
			PaginationUtil.pagination(request, page.getPageNumber(),page.getTotalPages(), 0);
		}else if (type==2) {
			hql= "from ENNews as entity where entity.type=2 order by editTime desc";
			Page<?> page = baseService.findObjectList(hql, pageable);
			request.setAttribute("news", page.getContent());
			request.setAttribute("size",page.getTotal());
			PaginationUtil.pagination(request, page.getPageNumber(),page.getTotalPages(), 0);
		}
		request.setAttribute("type", type);
		
//		List<ENNews> news;
//		if (type ==0) {
//			news = (List<ENNews>)baseService.findObjectList(ENNews.class,"type",type);
//			request.setAttribute("news", news);
//		}else if (type ==1) {
//			news = (List<ENNews>)baseService.findObjectList(ENNews.class,"type",type);
//			request.setAttribute("news", news);
//		}else if (type ==2) {
//			news = (List<ENNews>)baseService.findObjectList(ENNews.class,"type",type);
//			request.setAttribute("news", news);
//		}else {
//			news = new ArrayList<ENNews>();
//			request.setAttribute("news", news);
//		}
//		for (ENNews news2 : news) {
//			SimpleDateFormat sdf = new SimpleDateFormat("MM.dd.yyyy");
//			List<String> dates =  new ArrayList<String>();
//			dates.add(sdf.format(news2.getCreateTime()));
//			request.setAttribute("times", dates);
//		}
		//企业信息
		ENCompanyInfo companyInfo = (ENCompanyInfo) baseService.findObject(ENCompanyInfo.class, Variables.compinfoId);
		request.setAttribute("companyInfo", companyInfo);
		return "/WEB-INF/front/enNewsList.jsp";
	}
	
	@RequestMapping(value = "/english/newsInfo")
	public String newsInfo(Integer id,HttpServletRequest request) {
		ENNews news = (ENNews)baseService.findObject(ENNews.class, id);
		request.setAttribute("news", news); 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		request.setAttribute("time", sdf.format(news.getCreateTime()));
		//企业信息
		ENCompanyInfo companyInfo = (ENCompanyInfo) baseService.findObject(ENCompanyInfo.class, Variables.compinfoId);
		request.setAttribute("companyInfo", companyInfo);
		return "/WEB-INF/front/enNewsInfo.jsp";
	}
	
	
	@RequestMapping(value = "/english/enCust")
	public String cust(HttpServletRequest request) {
//		List<ENPartners> Partners = (List<ENPartners>)baseService.findObjectList(ENPartners.class);
//		request.setAttribute("partners", Partners);
		
		String pageNumber = request.getParameter("pageNumber");
		// 如果为空，则设置为1
		if (StringUtils.isEmpty(pageNumber)) {
			pageNumber="1";
		}
		Pageable pageable=new Pageable(Integer.valueOf(pageNumber),6);
		String hql= "from ENPartners as entity order by editTime desc";
		Page<?> page = baseService.findObjectList(hql, pageable);
		request.setAttribute("partners", page.getContent());
		request.setAttribute("size",page.getTotal());
		// 分页
		PaginationUtil.pagination(request, page.getPageNumber(),page.getTotalPages(), 0);
		
		//企业信息
		ENCompanyInfo companyInfo = (ENCompanyInfo) baseService.findObject(ENCompanyInfo.class, Variables.compinfoId);
		request.setAttribute("companyInfo", companyInfo);
		return "/WEB-INF/front/enCust.jsp";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/english/caseList")
	public String cases(HttpServletRequest request) {
		List<Example> examples = (List<Example>)baseService.findObjectList(Example.class);
		request.setAttribute("examples", examples);
		//企业信息
		CompanyInfo companyInfo = (CompanyInfo) baseService.findObject(CompanyInfo.class, Variables.compinfoId);
		request.setAttribute("companyInfo", companyInfo);
		return "/WEB-INF/front/enCaseList.jsp";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/english/teamList")
	public String teams(HttpServletRequest request) {
		List<ENTeam> teams = (List<ENTeam>)baseService.findObjectList(ENTeam.class);
		request.setAttribute("teams", teams);
		//企业信息
		ENCompanyInfo companyInfo = (ENCompanyInfo) baseService.findObject(ENCompanyInfo.class, Variables.compinfoId);
		request.setAttribute("companyInfo", companyInfo);
		return "/WEB-INF/front/enTeamList.jsp";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/english/customerList")
	public String customerList(HttpServletRequest request) {
		List<Customers> customers = (List<Customers>)baseService.findObjectList(Customers.class);
		request.setAttribute("customers", customers);
		//企业信息
		CompanyInfo companyInfo = (CompanyInfo) baseService.findObject(CompanyInfo.class, Variables.compinfoId);
		request.setAttribute("companyInfo", companyInfo);
		return "/WEB-INF/front/enCustomerList.jsp";
	}
	
	/**
	 * 关于我们列表
	 * @param request
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/english/contactusInfo")
	public String contactusInfoList(HttpServletRequest request,Integer id) {
		ENContactusInfo  contactusInfo=new ENContactusInfo();
		if (id!=null&&id!=0) {
			contactusInfo= (ENContactusInfo)baseService.findObject(ENContactusInfo.class, id);
			request.setAttribute("contactusInfo", contactusInfo);
		}else {
			List<ENContactusInfo> contactusInfos= (List<ENContactusInfo>)baseService.findObjectList(ENContactusInfo.class);
			request.setAttribute("contactusInfo", contactusInfos.get(0));
		}
		List<ENContactusInfo> contactusInfos = (List<ENContactusInfo>)baseService.findObjectList(ENContactusInfo.class);
		request.setAttribute("categories", contactusInfos);
		return "/WEB-INF/front/enContactusInfo.jsp";
	}
	
	/**
	 * 关于欧耶列表
	 * @param request
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/english/oyeInfo")
	public String oyeInfoList(HttpServletRequest request,Integer id) {
		ENOyEInfo  oyEInfo=new ENOyEInfo();
		if (id!=null&&id!=0) {
			oyEInfo= (ENOyEInfo)baseService.findObject(ENOyEInfo.class, id);
			request.setAttribute("contactusInfo", oyEInfo);
		}else {
			List<ENOyEInfo> contactusInfos= (List<ENOyEInfo>)baseService.findObjectList(ENOyEInfo.class);
			request.setAttribute("contactusInfo", contactusInfos.get(0));
		}
		List<ENOyEInfo> contactusInfos = (List<ENOyEInfo>)baseService.findObjectList(ENOyEInfo.class);
		request.setAttribute("categories", contactusInfos);
		return "/WEB-INF/front/enOyeInfo.jsp";
	}
	
	/**
	 * 流程控制
	 * @param request
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/english/serviceProcess")
	public String serviceProcess(HttpServletRequest request) {
		List<Processs> pros = (List<Processs>) baseService.findObjectList(Processs.class);
		request.setAttribute("pros", pros);
		request.setAttribute("prosSize", pros.size());
		//企业信息
		CompanyInfo companyInfo = (CompanyInfo) baseService.findObject(CompanyInfo.class, Variables.compinfoId);
		request.setAttribute("companyInfo", companyInfo);
		return "/WEB-INF/front/enServiceProcess.jsp";
	}
	
	/**
	 * 业务范围
	 * @param request
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/english/ourBussiness")
	public String businesss(HttpServletRequest request) {
		List<ENBusiness> businesses = (List<ENBusiness>) baseService.findObjectList(ENBusiness.class);
		request.setAttribute("businesses", businesses);
		request.setAttribute("bsize", businesses.size());
		//企业信息
		CompanyInfo companyInfo = (CompanyInfo) baseService.findObject(CompanyInfo.class, Variables.compinfoId);
		request.setAttribute("companyInfo", companyInfo);
		return "/WEB-INF/front/enOurBusiness.jsp";
	}
	
	/**
	 * 案例详情
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/english/caseInfo")
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
		return "/WEB-INF/front/enCaseInfo.jsp";
	}
}
