package cn.believeus.admin.controller;



import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.believeus.service.BaseService;

@Controller
public class CompanyController {
	@Resource
	private BaseService baseService;

	/**
	 * 查看企业信息
	 * @return
	 */
	@RequestMapping(value="/admin/companyView")
	public String companyView(){
		return "/WEB-INF/back/company/companyMsg.jsp";
	}
	/**
	 * 企业信息修改
	 * @return
	 */
	@RequestMapping(value="/admin/companyEdit")
	public String companyEdit(){
		return "/WEB-INF/back/company/edit.jsp";
	}
}
