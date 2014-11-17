package cn.believeus.model;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table
public class News extends TbaseEntity{

	private static final long serialVersionUID = 1546254968156234087L;
	
	/** 新闻*/
	private String title;
	
	private String path;
	
	private String content;
	
	/** 1:置顶   0:非置顶   */
	private Short top;
	
	public Short getTop() {
		return top;
	}
	public void setTop(Short top) {
		this.top = top;
	}
	
	/** 新闻*/
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
}
