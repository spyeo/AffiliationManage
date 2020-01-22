package com.coreplus.domain;

import java.util.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
public class StoreVO {

	private String str_cd;
	private String del_yn;
	private String created_by;
	private Date created;
	private String last_upd_by;
	private Date last_upd;
	private String str_nm;
	private String str_rep_nm;
	private String str_zipcd;
	private String str_addr;
	private String str_addr_dtl;
	private int ph_area_no;
	private int ph_tno;
	private int ph_cno;
	private String brand_cd;
	private BrandVO brand;
	private FranchiseVO franchise;
	
}
