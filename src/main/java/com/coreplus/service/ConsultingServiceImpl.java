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
	public List<ProspectVO> getProspectList(String name) {
		return prospectMapper.selectList(name);
	}

	@Override
	public ProspectVO getProspect(String pros_id) {
		return prospectMapper.selectOne(pros_id);
	}

	@Override
	public boolean registLead(LeadVO leadVO) {
		int prosResult;
		int leadResult;
		if(leadVO.getProspectVO().getPros_id().length() <= 0) {
			prosResult = prospectMapper.insertProspect(leadVO.getProspectVO());
		}
		else {
			prosResult = 1;
		}
		leadResult = leadMapper.insertLead(leadVO);

		if(prosResult > 0 && leadResult > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean modifyLead(LeadVO leadVO) {
		int prosResult;
		int leadResult;
		System.out.println("before");
		prosResult = prospectMapper.updateProspect(leadVO.getProspectVO());
		System.out.println("pros=============");
		leadResult = leadMapper.updateLead(leadVO);
		System.out.println("lead=============");
		
		if(prosResult > 0 && leadResult > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteLead(String lead_id) {
		boolean leadResult=false;
		if(leadMapper.deleteLead(lead_id)>0)
		{
			leadResult=true;
		}
		return leadResult;
	}


}
