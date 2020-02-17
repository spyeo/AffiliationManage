package com.coreplus.domain;

import java.util.Date;

import lombok.Data;

@Data
public class InterviewVO {
	private String interview_id;
	private Date created;
	private String created_by;
	private Date last_upd;
	private String last_upd_by;
	private String del_yn;
	private String set_up_interview;
	private String store_interview;
	private String final_interview;
	private String interview_status;
	private String lead_id;
}
