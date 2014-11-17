package cn.believeus.controller;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.believeus.model.CompanyInfo;
import cn.believeus.model.Customers;
import cn.believeus.model.Example;
import cn.believeus.service.BaseService;
import cn.believeus.variables.Variables;

/**
 * 首页面
 * */
@Controller
public class ControllerIndex {
	private static Log log = LogFactory.getLog(ControllerIndex.class);
	
	@Resource
	private BaseService baseService;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/index")
	public String index(HttpServletRequest request) {
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
		//案例
		List<Example> examples1 = (List<Example>) baseService.findObjectList(Example.class, "category", (short)1);
		List<Example> examples2 = (List<Example>) baseService.findObjectList(Example.class, "category", (short)2);
		List<Example> examples3 = (List<Example>) baseService.findObjectList(Example.class, "category", (short)3);
		List<Example> examples4 = (List<Example>) baseService.findObjectList(Example.class, "category", (short)4);
		request.setAttribute("examples1", examples1);
		request.setAttribute("examples2", examples2);
		request.setAttribute("examples3", examples3);
		request.setAttribute("examples4", examples4);
		
		return "/WEB-INF/front/index.jsp";
	}
	@RequestMapping(value = "/newsList")
	public String news(HttpServletRequest request) {
		return "/WEB-INF/front/newsList.jsp";
	}
	@RequestMapping(value = "/newsInfo")
	public String newsInfo(HttpServletRequest request) {
		return "/WEB-INF/front/newsInfo.jsp";
	}
	@RequestMapping(value = "/cust")
	public String cust(HttpServletRequest request) {
		return "/WEB-INF/front/cust.jsp";
	}
	
}
