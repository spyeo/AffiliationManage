package com.coreplus.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BrandVO {

	private String brand_cd;
	private String del_yn;
	private String created_by;
	private Date created;
	private String last_upd_by;
	private Date last_upd;
	private String brand_nm;
	private String fra_cd;
	
}
