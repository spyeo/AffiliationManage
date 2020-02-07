package com.coreplus.domain;

import lombok.Data;

@Data
public class BreadCrumbVO {
	private String route;
	private String parent;
	private String url;
	private String url_nm;
}
