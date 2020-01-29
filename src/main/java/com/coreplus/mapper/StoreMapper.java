package com.coreplus.mapper;

import java.util.List;

import com.coreplus.domain.Criteria;
import com.coreplus.domain.StoreVO;

public interface StoreMapper {

	public List<StoreVO> getList();
	
	public List<StoreVO> getListPaging(Criteria cri);
	
	public StoreVO read(String str_cd);
	
	public void insert(StoreVO store);
	
	public int delete(String str_cd);
	
	public int update(StoreVO store);
	
	
}
