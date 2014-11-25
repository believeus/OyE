package cn.believeus.model;

import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Length;

@Entity
@Table
public class Example extends TbaseEntity{

	private static final long serialVersionUID = 3206958391548032662L;

	/** Logo图片 */
	private String logo;

	/** 案例图片*/
	private String paths;

	/** 分类：1:世界500强，2:国有企业，3:事业单位，4:私有企业*/
	private short category;
	
	/** 案例名称 */
	private String name;
	
	/** 案例英文名称 */
	private String enName;
	
	/** 案例介绍 */
	private String content;
	
	/** 案例英文介绍 */
	private String enContent;
	
	@Length
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@Length
	public String getEnContent() {
		return enContent;
	}

	public void setEnContent(String enContent) {
		this.enContent = enContent;
	}

	public String getEnName() {
		return enName;
	}

	public void setEnName(String enName) {
		this.enName = enName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	/** 获取LOGO图片*/
	public String getLogo() {
		return logo;
	}

	/** 设置LOGO图片*/
	public void setLogo(String logo) {
		this.logo = logo;
	}

	/** 获取案例图片*/
	@Lob
	public String getPaths() {
		return paths;
	}

	/** 设置案例图片 */
	public void setPaths(String paths) {
		this.paths = paths;
	}

	/** 获取分类 */
	public short getCategory() {
		return category;
	}
	
	/** 设置分类 */
	public void setCategory(short category) {
		this.category = category;
	}
}
