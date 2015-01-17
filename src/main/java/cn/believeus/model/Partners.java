package cn.believeus.model;

import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table
public class Partners extends TbaseEntity{

	private static final long serialVersionUID = 3206958391548032662L;

	/** 名称*/
	private String name;
	
	/** Logo图片 */
	private String logo;

	/** 人物图片*/
	private String path;
	
	/** 内容 */
	private String content;
	
	/** 视频 */
	private String video;
	
	/** 视频链接 */
	private String videoLink;
	
	/** 是否首页显示
	 * 0：否 1：是 */
	private Integer showIndex;
	
	
	public Integer getShowIndex() {
		return showIndex;
	}

	public void setShowIndex(Integer showIndex) {
		this.showIndex = showIndex;
	}

	public String getVideoLink() {
		return videoLink;
	}

	public void setVideoLink(String videoLink) {
		this.videoLink = videoLink;
	}

	/** 获取名称*/
	public String getName() {
		return name;
	}

	/** 设置名称 */
	public void setName(String name) {
		this.name = name;
	}

	/** 获取LOGO图片*/
	public String getLogo() {
		return logo;
	}

	/** 设置LOGO图片*/
	public void setLogo(String logo) {
		this.logo = logo;
	}

	/** 获取 人物图片*/
	@Lob
	public String getPath() {
		return path;
	}

	/** 设置 人物图片 */
	public void setPath(String path) {
		this.path = path;
	}
	
	/** 获取内容*/
	public String getContent() {
		return content;
	}
	
	/** 设置内容*/
	public void setContent(String content) {
		this.content = content;
	}

	/** 获取视频*/
	public String getVideo() {
		return video;
	}

	/** 设置视频*/
	public void setVideo(String video) {
		this.video = video;
	}

}
