package cn.believeus.model;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table
public class Banner extends TbaseEntity{
	
	private static final long serialVersionUID = -316254129526776390L;
	
	/** banner-链接*/
	public String link;
	
	/** banner-图片路径*/
	public String path;
	
	/** banner-获取链接*/
	public String getLink() {
		return link;
	}
	/** banner-设置链接*/
	public void setLink(String link) {
		this.link = link;
	}
	
	/** banner-获取图片路径*/
	public String getPath() {
		return path;
	}
	/** banner-设置图片路径*/
	public void setPath(String path) {
		this.path = path;
	}
}
