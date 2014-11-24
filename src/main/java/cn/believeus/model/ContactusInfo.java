package cn.believeus.model;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table
public class ContactusInfo extends TbaseEntity{
	
	private static final long serialVersionUID = 6424344384956825199L;
	
	/** 关于我们-标题*/
	public String title;

	/** 关于我们-图片路径*/
	public String path;
	
	/** 关于我们-内容*/
	public String content;
	
	/**
	 * 0:公司介绍 1:企业资质 2:我们特色
	 */
	private Integer type;
	
	
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	
	/** 关于我们-获取标题*/
	public String getTitle() {
		return title;
	}
	/** 关于我们-设置标题*/
	public void setTitle(String title) {
		this.title = title;
	}
	
	/** 关于我们-获取图片路径*/
	public String getPath() {
		return path;
	}
	/** 关于我们-设置图片路径*/
	public void setPath(String path) {
		this.path = path;
	}
	
	/** 关于我们-获取内容*/
	public String getContent() {
		return content;
	}
	/** 关于我们-设置内容*/
	public void setContent(String content) {
		this.content = content;
	}
}
