package cn.believeus.model.en;

import javax.persistence.Entity;
import javax.persistence.Table;
import cn.believeus.model.TbaseEntity;
@Entity
@Table
public class ENProcesss extends TbaseEntity{

	private static final long serialVersionUID = -7122124692793465793L;

	/** 中文描述*/
	private String cn;
	
	/** 英文描述*/
	private String en;

	public String getCn() {
		return cn;
	}

	public void setCn(String cn) {
		this.cn = cn;
	}

	public String getEn() {
		return en;
	}

	public void setEn(String en) {
		this.en = en;
	}
}
