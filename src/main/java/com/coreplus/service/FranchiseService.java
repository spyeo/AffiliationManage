package com.coreplus.service;

import java.util.List;

import com.coreplus.domain.BrandVO;
import com.coreplus.domain.Criteria2;
import com.coreplus.domain.FranchiseVO;
import com.coreplus.domain.StoreVO;

public interface FranchiseService {

	public void insert(StoreVO store);
	
	public StoreVO read(String str_cd);
	
	public boolean update(StoreVO store);
	
	public boolean delete(String str_cd);
	
	//public List<StoreVO> getList();
	
	public List<StoreVO> getList(Criteria2 cri);
	
	public List<BrandVO> getList(String brand_cd);
	
	public List<FranchiseVO> getListF(String fra_cd);
	
	public int total(Criteria2 cri);
}
