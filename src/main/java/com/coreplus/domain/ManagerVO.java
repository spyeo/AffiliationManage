package com.coreplus.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ManagerVO {
	private String id;
	private String password;
	private Date created;
	private Date last_upd;
	private String name;
	private String eml_id;
	private String eml_domain;
	private String cell_ph_no;
	private String cell_ph_tno;
	private String cell_ph_pno;
}
