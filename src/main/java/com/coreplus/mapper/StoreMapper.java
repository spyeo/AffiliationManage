package com.coreplus.mapper;

import java.util.List;

import com.coreplus.domain.StoreVO;

public interface StoreMapper {

	public List<StoreVO> getList();
	
	public void insert(StoreVO store);
	
	public int delete(String str_cd);
	
	public int update(StoreVO store);
	
}
