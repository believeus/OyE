package cn.believeus.model;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table
public class Message extends TbaseEntity{

	private static final long serialVersionUID = -7122124692793465793L;

	/** 收件人姓名*/
	private String name;
	
	/** 邮箱*/
	private String email;
	
	/** 主题*/
	private String theme;
	
	/** 留言内容*/
	private String content;
	
	/** 获取收件人姓名 */
	public String getName() {
		return name;
	}

	/** 设置收件人姓名 */
	public void setName(String name) {
		this.name = name;
	}

	/** 获取邮箱 */
	public String getEmail() {
		return email;
	}

	/** 设置邮箱*/
	public void setEmail(String email) {
		this.email = email;
	}

	/** 获取留言主题*/
	public String getTheme() {
		return theme;
	}

	/** 设置留言主题 */
	public void setTheme(String theme) {
		this.theme = theme;
	}

	/** 获取留言 */
	public String getContent() {
		return content;
	}

	/** 设置留言 */
	public void setContent(String content) {
		this.content = content;
	}


}
