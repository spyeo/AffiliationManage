package com.coreplus.mapper;

import java.util.List;

import com.coreplus.domain.CodeVO;

public interface CodeMapper {
	
	public List<CodeVO> selectList();
	
	public List<CodeVO> selectSearchList(String code);
}
