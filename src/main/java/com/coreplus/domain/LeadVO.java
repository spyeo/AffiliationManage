package com.coreplus.domain;

import java.util.Date;

import lombok.Data;

@Data
public class LeadVO {
	String lead_id;
	String del_yn;
	String created_by;
	Date created;
	String last_upd_by;
	Date last_upd;
	String reg_chnl_cd;
	String con_type_code;
	String spec_desc;
	String pros_id;
	
}
