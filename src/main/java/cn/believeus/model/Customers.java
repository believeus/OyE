package cn.believeus.model;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table
public class Customers extends TbaseEntity{

	private static final long serialVersionUID = -7122124692793465793L;

	/** logo URL*/
	private String url;
	
	/** 链接*/
	private String clink;
	
	/**	类型 */
	private Integer type;
	

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getClink() {
		return clink;
	}

	public void setClink(String clink) {
		this.clink = clink;
	}
}
