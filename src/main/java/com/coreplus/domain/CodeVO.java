package com.coreplus.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CodeVO {
	String code_type;
	String code;
	String del_yn;
	String created_by;
	Date created;
	String last_upd_by;
	Date last_upd;
	String code_nm;
}
