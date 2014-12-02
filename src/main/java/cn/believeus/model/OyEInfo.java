package cn.believeus.model;

import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table
public class OyEInfo extends TbaseEntity{
	
	private static final long serialVersionUID = 6424344384956825199L;
	
	/** 分类名称 */
	public String category;
	
	/** 关于我们-标题*/
	public String title;

	/** 关于我们-图片路径*/
	public String path;
	
	/** 关于我们-内容*/
	public String content;
	
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
	@Lob
	public String getContent() {
		return content;
	}
	/** 关于我们-设置内容*/
	public void setContent(String content) {
		this.content = content;
	}
	/** 关于我们-设置分类*/
	public String getCategory() {
		return category;
	}
	/** 关于我们-设置分类*/
	public void setCategory(String category) {
		this.category = category;
	}
}
