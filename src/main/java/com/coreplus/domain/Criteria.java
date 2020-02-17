package com.coreplus.domain;

import lombok.Data;

@Data
public class Criteria {
	private int pageNum;
	private int amount;
	
	private String reg_chnl_cd;
	private String con_type_cd;
	private String pros_nm;
	private String brand_cd;
	private String fra_cd;
	private String[] del_yn;
	

	public Criteria() {
		this(1,10);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum=pageNum;
		this.amount=amount;
	}
}
