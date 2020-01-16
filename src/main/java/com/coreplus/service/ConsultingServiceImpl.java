package com.coreplus.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.coreplus.domain.CodeVO;
import com.coreplus.domain.Criteria;
import com.coreplus.domain.LeadVO;
import com.coreplus.mapper.CodeMapper;
import com.coreplus.mapper.LeadMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ConsultingServiceImpl implements ConsultingService{

	private CodeMapper codeMapper;
	private LeadMapper leadMapper;
	
	@Override
	public List<CodeVO> getCodeList() {
		
		return codeMapper.selectList();
	}

	/*
	 @Override
	public List<LeadVO> getLeadList() {
		
		return leadMapper.selectList();
	}
	 */
	
	@Override
	public List<LeadVO> getLeadList(Criteria cri) {

		return leadMapper.selectListWithPaging(cri);
	}

	@Override
	public int getLeadCount() {
		return leadMapper.selectCount();
	}

}
