package com.coreplus.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.coreplus.domain.BreadCrumbVO;
import com.coreplus.mapper.BreadCrumbMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class BreadCrumbServiceImpl implements BreadCrumbService{
	
	BreadCrumbMapper mapper;

	@Override
	public List<BreadCrumbVO> getBreadCrumb(String url) {
		return mapper.getList(url);
	}

}
