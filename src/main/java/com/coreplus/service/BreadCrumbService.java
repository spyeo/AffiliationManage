package com.coreplus.service;

import java.util.List;

import com.coreplus.domain.BreadCrumbVO;

public interface BreadCrumbService {

	List<BreadCrumbVO> getBreadCrumb(String url);

}
