package cn.believeus.model;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table
public class Category extends TbaseEntity{

	private static final long serialVersionUID = 2282825747147193617L;
	
	/** 分类名称   */
	private String name;
	
	/** 分类英文名称   */
	private String enName;

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
	
}
