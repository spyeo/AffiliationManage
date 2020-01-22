package com.coreplus.service;

import java.util.List;

import com.coreplus.domain.StoreVO;

public interface FranchiseService {

	public void insert(StoreVO store);
	
	public boolean update(StoreVO store);
	
	public boolean delete(String str_cd);
	
	public List<StoreVO> getList();
	
}
