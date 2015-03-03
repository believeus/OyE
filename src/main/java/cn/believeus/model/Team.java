package cn.believeus.model;

import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table
public class Team extends TbaseEntity{

	private static final long serialVersionUID = -5770298886416112741L;

	/** 中文名称*/
	private String name;
	
	/** 英文名称 */
	private String ehName;
	
	/** 图片链接 */
	private String path;

	/** 职位*/
	private String position;
	
	/** 描述*/
	private String content;

	/** 获取图片链接*/
	public String getPath() {
		return path;
	}

	/** 设置图片链接*/
	public void setPath(String path) {
		this.path = path;
	}

	/** 获取中文名称*/
	public String getName() {
		return name;
	}

	/** 设置中文名称 */
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

	/** 获取英文名称*/
	public String getEhName() {
		return ehName;
	}

	/** 设置英文名称 */
	public void setEhName(String ehName) {
		this.ehName = ehName;
	}
	
	/** 获取内容 */
	@Lob
	public String getContent() {
		return content;
	}
	
	/** 设置内容 */
	public void setContent(String content) {
		this.content = content;
	}

}
