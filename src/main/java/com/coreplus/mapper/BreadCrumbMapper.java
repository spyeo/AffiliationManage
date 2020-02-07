package com.coreplus.mapper;

import java.util.List;

import com.coreplus.domain.BreadCrumbVO;

public interface BreadCrumbMapper {
	public List<BreadCrumbVO> getList(String url);
}
