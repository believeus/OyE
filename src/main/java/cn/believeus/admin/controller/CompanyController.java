package cn.believeus.admin.controller;



import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.believeus.model.CompanyInfo;
import cn.believeus.model.en.ENCompanyInfo;
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
		ENCompanyInfo enCompanyInfo = (ENCompanyInfo)baseService.findObject(ENCompanyInfo.class, 1);
		if (companyInfo==null&&enCompanyInfo==null) {
			companyInfo=new CompanyInfo();
			companyInfo.setPhone("400-xxxx-xxxx");
			companyInfo.setFax("+86 21 6259 0368 - 805");
			companyInfo.setMobile("+86 13524728911");
			companyInfo.setEmail("xxxx@163.com");
			companyInfo.setAddress("第179号西中山路，长宁，5F，E座");
			companyInfo.setName("上海欧耶");
			enCompanyInfo=new ENCompanyInfo();
			enCompanyInfo.setPhone("400-xxxx-xxxx");
			enCompanyInfo.setFax("+86 21 6259 0368 - 805");
			enCompanyInfo.setMobile("+86 13524728911");
			enCompanyInfo.setEmail("xxxx@163.com");
			enCompanyInfo.setAddress("NO.179 West Zhongshan Road,Changning,5F,Block E");
			enCompanyInfo.setName("Shanghai Ouye");
			baseService.saveOrUpdata(companyInfo);
			baseService.saveOrUpdata(enCompanyInfo);
		}
		request.setAttribute("companyInfo", companyInfo);
		request.setAttribute("encompanyInfo", enCompanyInfo);
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
		ENCompanyInfo enCompanyInfo = (ENCompanyInfo)baseService.findObject(ENCompanyInfo.class, 1);
		request.setAttribute("encompanyInfo", enCompanyInfo);
		return "/WEB-INF/back/company/edit.jsp";
	}
	
	/**
	 * 企业信息修改
	 * @return
	 */
	@RequiresPermissions("companyMsg:update")
	@RequestMapping(value="/admin/companyUpdate")
	public String companyUpdate(CompanyInfo companyInfo,HttpServletRequest request){
		String enname = request.getParameter("enname");
		String enaddress = request.getParameter("enaddress");
		ENCompanyInfo enCompanyInfo = (ENCompanyInfo)baseService.findObject(ENCompanyInfo.class, companyInfo.getId());
		enCompanyInfo.setName(enname);
		enCompanyInfo.setAddress(enaddress);
		enCompanyInfo.setEmail(companyInfo.getEmail());
		enCompanyInfo.setFax(companyInfo.getFax());
		enCompanyInfo.setPhone(companyInfo.getPhone());
		enCompanyInfo.setMobile(companyInfo.getMobile());
		baseService.saveOrUpdata(companyInfo);
		baseService.saveOrUpdata(enCompanyInfo);
		request.setAttribute("companyInfo", companyInfo);
		request.setAttribute("encompanyInfo", enCompanyInfo);
		return "/WEB-INF/back/company/companyMsg.jsp";
	}
}
