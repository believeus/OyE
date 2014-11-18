package cn.believeus.controller;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import cn.believeus.model.Banner;
import cn.believeus.model.Customers;
import cn.believeus.model.Example;
import cn.believeus.model.en.ENBusiness;
import cn.believeus.model.en.ENCompanyInfo;
import cn.believeus.model.en.ENContactusInfo;
import cn.believeus.model.en.ENNews;
import cn.believeus.model.en.ENPartners;
import cn.believeus.model.en.ENProcesss;
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
		//案例
		List<Example> examples1 = (List<Example>) baseService.findObjectList(Example.class, "category", (short)1);
		List<Example> examples2 = (List<Example>) baseService.findObjectList(Example.class, "category", (short)2);
		List<Example> examples3 = (List<Example>) baseService.findObjectList(Example.class, "category", (short)3);
		List<Example> examples4 = (List<Example>) baseService.findObjectList(Example.class, "category", (short)4);
		request.setAttribute("examples1", examples1);
		request.setAttribute("examples2", examples2);
		request.setAttribute("examples3", examples3);
		request.setAttribute("examples4", examples4);
		//团队管理
		List<ENTeam> teams = (List<ENTeam>) baseService.findObjectList(ENTeam.class);
		request.setAttribute("teams", teams);
		//服务范围
		List<ENBusiness> businesses = (List<ENBusiness>) baseService.findObjectList(ENBusiness.class);
		request.setAttribute("businesses", businesses);
		//流程控制
		List<ENProcesss> pros = (List<ENProcesss>) baseService.findObjectList(ENProcesss.class);
		request.setAttribute("pros", pros);
		//合作伙伴
		List<ENPartners> partners = (List<ENPartners>) baseService.findObjectList(ENPartners.class);
		request.setAttribute("partners", partners);
		//最新动态
		List<ENNews> news = (List<ENNews>) baseService.findObjectList(ENNews.class, "top", (short)1);
		for (ENNews tnews : news) {
			String content = tnews.getContent();
			String content2 = content.replaceAll("<[^>]+>", "");
			String content3 = content2.replaceAll("&nbsp;", "");
			tnews.setContent(content3);
		}
		request.setAttribute("news", news);
		//关于我们
		List<ENContactusInfo> contactusInfos = (List<ENContactusInfo>) baseService.findObjectList(ENContactusInfo.class);
		request.setAttribute("contactusInfos", contactusInfos);
		
		return "/WEB-INF/front/index.jsp";
	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/english/newsList")
	public String news(HttpServletRequest request) {
		List<ENNews> news = (List<ENNews>)baseService.findObjectList(ENNews.class);
		request.setAttribute("news", news);
		for (ENNews news2 : news) {
			SimpleDateFormat sdf = new SimpleDateFormat("MM.dd.yyyy");
			List<String> dates =  new ArrayList<String>();
			dates.add(sdf.format(news2.getCreateTime()));
			request.setAttribute("times", dates);
		}
		return "/WEB-INF/front/newsList.jsp";
	}
	@RequestMapping(value = "/english/newsInfo")
	public String newsInfo(Integer id,HttpServletRequest request) {
		ENNews news = (ENNews)baseService.findObject(ENNews.class, id);
		request.setAttribute("news", news);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		request.setAttribute("time", sdf.format(news.getCreateTime()));
		return "/WEB-INF/front/newsInfo.jsp";
	}
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/english/cust")
	public String cust(HttpServletRequest request) {
		List<ENPartners> Partners = (List<ENPartners>)baseService.findObjectList(ENPartners.class);
		request.setAttribute("partners", Partners);
		return "/WEB-INF/front/cust.jsp";
	}
}
