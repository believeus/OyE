package cn.believeus.admin.controller;



import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.believeus.model.CompanyInfo;
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
	public String companyView(HttpServletRequest request){
		CompanyInfo companyInfo = (CompanyInfo)baseService.findObject(CompanyInfo.class, 1);
		if (companyInfo==null) {
			companyInfo=new CompanyInfo();
			companyInfo.setPhone("400-xxxx-xxxx");
			companyInfo.setFax("+86 21 6259 0368 - 805");
			companyInfo.setMobile("+86 13524728911");
			companyInfo.setEmail("xxxx@163.com");
			companyInfo.setAddress("某市某省某区xxxxxxxx");
			companyInfo.setContent("我们是搬家公司！");
			companyInfo.setCreateTime(System.currentTimeMillis());
			baseService.saveOrUpdata(companyInfo);
		}
		request.setAttribute("companyInfo", companyInfo);
		return "/WEB-INF/back/company/companyMsg.jsp";
	}
	/**
	 * 企业信息修改
	 * @return
	 */
	@RequiresPermissions("companyMsg:update")
	@RequestMapping(value="/admin/companyEdit")
	public String companyEdit(HttpServletRequest request){
		CompanyInfo companyInfo = (CompanyInfo)baseService.findObject(CompanyInfo.class, 1);
		request.setAttribute("companyInfo", companyInfo);
		return "/WEB-INF/back/company/edit.jsp";
	}
	
	/**
	 * 企业信息修改
	 * @return
	 */
	@RequestMapping(value="/admin/companyUpdate")
	public String companyUpdate(CompanyInfo companyInfo,HttpServletRequest request){
		companyInfo.setEditTime(System.currentTimeMillis());
		baseService.saveOrUpdata(companyInfo);
		request.setAttribute("companyInfo", companyInfo);
		return "/WEB-INF/back/company/companyMsg.jsp";
	}
}
