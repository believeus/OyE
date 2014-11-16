package cn.believeus.model;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table
public class CompanyInfo extends TbaseEntity{

	private static final long serialVersionUID = 3051754114850340256L;

	/** 企业电话*/
	private String phone;
	
	/** 企业邮箱*/
	private String email;
	
	/** 企业地址*/
	private String address;
	
	/** 企业简介*/
	private String content;
	
	/** 企业传真 */
	private String fax;
	
	/** 企业移动电话 */
	private String mobile;

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	/** 获取企业电话 */
	public String getPhone() {
		return phone;
	}

	/** 设置企业电话 */
	public void setPhone(String phone) {
		this.phone = phone;
	}

	/** 获取企业邮箱 */
	public String getEmail() {
		return email;
	}

	/** 设置企业邮箱*/
	public void setEmail(String email) {
		this.email = email;
	}

	/** 获取企业地址 */
	public String getAddress() {
		return address;
	}

	/** 设置企业地址 */
	public void setAddress(String address) {
		this.address = address;
	}


	/** 获取企业简介 */
	public String getContent() {
		return content;
	}

	/** 设置企业简介 */
	public void setContent(String content) {
		this.content = content;
	}

}
