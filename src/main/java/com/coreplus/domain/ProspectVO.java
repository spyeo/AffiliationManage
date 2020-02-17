package com.coreplus.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ProspectVO {
	String pros_id;
	String del_yn;
	String created_by;
	Date created;
	String last_upd_by;
	Date last_upd;
	String pros_nm;
	String cell_ph_no;
	String cell_ph_tno;
	String cell_ph_pno;
	String eml_id;
	String eml_domain;
	
}
