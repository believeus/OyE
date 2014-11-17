package cn.believeus.model;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table
public class Message extends TbaseEntity{

	private static final long serialVersionUID = -7122124692793465793L;

	/** 姓名*/
	private String name;
	
	/** 手机*/
	private String phone;
	
	/** 邮箱*/
	private String email;
	
	
	/** 留言内容*/
	private String content;
	
	
	/** 获取姓名 */
	public String getName() {
		return name;
	}
	/** 设置姓名 */
	public void setName(String name) {
		this.name = name;
	}
	
	/** 获取手机 */
	public String getPhone() {
		return phone;
	}
	/** 设置手机 */
	public void setPhone(String phone) {
		this.phone = phone;
	}

	/** 获取邮箱 */
	public String getEmail() {
		return email;
	}
	/** 设置邮箱*/
	public void setEmail(String email) {
		this.email = email;
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
