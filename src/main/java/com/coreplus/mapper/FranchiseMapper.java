package com.coreplus.mapper;

import java.util.List;

import com.coreplus.domain.FranchiseVO;

public interface FranchiseMapper {

	public List<FranchiseVO> getList(String fra_cd);

	public List<FranchiseVO> getFranchises();
	
}
