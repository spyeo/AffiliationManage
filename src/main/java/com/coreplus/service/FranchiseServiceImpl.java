package com.coreplus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coreplus.domain.BrandVO;
import com.coreplus.domain.Criteria2;
import com.coreplus.domain.FranchiseVO;
import com.coreplus.domain.StoreVO;
import com.coreplus.mapper.BrandMapper;
import com.coreplus.mapper.FranchiseMapper;
import com.coreplus.mapper.StoreMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class FranchiseServiceImpl implements FranchiseService {

	@Setter(onMethod_= @Autowired)
	private StoreMapper mapper;
	
	@Setter(onMethod_= @Autowired)
	private BrandMapper mapper2;
	
	@Setter(onMethod_= @Autowired)
	private FranchiseMapper mapper3;
	
	@Override
	public void insert(StoreVO store) {
		
		log.info("insert ................" + store);
		mapper.insert(store);
		
	}
	
	@Override
	public StoreVO read(String str_cd) {
		
		log.info("read .........." + str_cd);
		return mapper.read(str_cd);
	}

	@Override
	public boolean update(StoreVO store) {
		log.info("update............" + store);
		return mapper.update(store) >= 1;
		
	}

	@Override
	public boolean delete(String str_cd) {
		log.info("delete.............." + str_cd);
		return mapper.delete(str_cd) >= 1;
		
	}

	/*@Override
	public List<StoreVO> getList() {
		log.info("getList.................");
		return mapper.getList();
		
	}*/
	
	@Override
	public List<StoreVO> getList(Criteria2 cri) {
		log.info("getList................." + cri);
		return mapper.getListPaging(cri);
		
	}
	
	@Override
	public List<BrandVO> getList(String brand_cd){
		log.info("getList.......................Brand" + brand_cd);
		return mapper2.getList(brand_cd);
	}
	
	@Override
	public List<FranchiseVO> getListF(String fra_cd){
		log.info("getList.......................Franchise" + fra_cd);
		return mapper3.getList(fra_cd);
	}
	
	@Override
	public int total(Criteria2 cri) {
		log.info("totalc count ..........................");
		return mapper.totalCount(cri);
		
	}
}
