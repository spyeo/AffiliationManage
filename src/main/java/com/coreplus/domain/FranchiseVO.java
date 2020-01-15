package com.coreplus.domain;

import java.util.Date;

import lombok.Data;

@Data
public class FranchiseVO {

	private String fra_Cd;
	private String del_yn;
	private String created_by;
	private Date created;
	private String last_upd_by;
	private Date last_upd;
	private String fra_nm;
	
}
