package com.coreplus.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ManagerVO {
	private String mgr_id;
	private String mgr_pw;
	private String del_yn;
	private Date created;
	private Date last_upd;
	private String mgr_name;
	private String cell_ph_no;
	private String cell_ph_tno;
	private String cell_ph_pno;
	private String eml_id;
	private String eml_domain;
}
