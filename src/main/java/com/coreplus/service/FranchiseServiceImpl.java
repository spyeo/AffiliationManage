package com.coreplus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coreplus.domain.Criteria;
import com.coreplus.domain.StoreVO;
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
	
	@Override
	public void insert(StoreVO store) {
		
		log.info("insert ................" + store);
		mapper.insert(store);
		
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

	@Override
	public List<StoreVO> getList() {
		log.info("getList.................");
		return mapper.getList();
		
	}
	
	/*@Override
	public List<StoreVO> getList(Criteria cri) {
		log.info("getList................." + cri);
		return mapper.getListPaging(cri);
		
	}*/
}
