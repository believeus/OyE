package cn.believeus.model;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table
public class Team extends TbaseEntity{

	private static final long serialVersionUID = -5770298886416112741L;

	/** 名称*/
	private String name;
	
	/** 图片链接 */
	private String path;

	/** 职位*/
	private String position;

	/** 获取图片链接*/
	public String getPath() {
		return path;
	}

	/** 设置图片链接*/
	public void setPath(String path) {
		this.path = path;
	}

	/** 获取名称*/
	public String getName() {
		return name;
	}

	/** 设置名称 */
	public void setName(String name) {
		this.name = name;
	}

	/** 获取职位*/
	public String getPosition() {
		return position;
	}

	/** 设置职位 */
	public void setPosition(String position) {
		this.position = position;
	}

}