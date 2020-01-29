package com.coreplus.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.coreplus.domain.CodeVO;
import com.coreplus.domain.Criteria;
import com.coreplus.domain.LeadVO;
import com.coreplus.domain.ProspectVO;
import com.coreplus.mapper.CodeMapper;
import com.coreplus.mapper.LeadMapper;
import com.coreplus.mapper.ProspectMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ConsultingServiceImpl implements ConsultingService{

	private CodeMapper codeMapper;
	private LeadMapper leadMapper;
	private ProspectMapper prospectMapper;
	
	@Override
	public List<CodeVO> getCodeList(String code) {
		
		return codeMapper.selectList(code);
	}
	
	//lead table crud
	
	@Override
	public List<LeadVO> getLeadList(Criteria cri) {
		return leadMapper.selectJoinList(cri);
	}

	@Override
	public int getLeadCount(Criteria cri) {
		return leadMapper.selectCount(cri);
	}

	@Override
	public LeadVO getLeadInfo(String lead_id) {
		return leadMapper.selectOne(lead_id);
	}

	@Override
	public List<ProspectVO> getProspectList(Criteria cri) {
		return prospectMapper.selectList(cri);
	}


}
