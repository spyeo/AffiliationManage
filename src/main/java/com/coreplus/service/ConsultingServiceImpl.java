package com.coreplus.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.coreplus.domain.BrandVO;
import com.coreplus.domain.CodeVO;
import com.coreplus.domain.Criteria;
import com.coreplus.domain.FranchiseVO;
import com.coreplus.domain.LeadVO;
import com.coreplus.domain.ProspectVO;
import com.coreplus.mapper.BrandMapper;
import com.coreplus.mapper.CodeMapper;
import com.coreplus.mapper.FranchiseMapper;
import com.coreplus.mapper.LeadMapper;
import com.coreplus.mapper.ProspectMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ConsultingServiceImpl implements ConsultingService{

	private CodeMapper codeMapper;
	private LeadMapper leadMapper;
	private ProspectMapper prospectMapper;
	private FranchiseMapper franchiseMapper;
	private BrandMapper brandMapper;
	
	@Override
	public List<CodeVO> getCodeList() {

		return codeMapper.selectList();
	}
	
	@Override
	public List<CodeVO> getSelectCodeList(String code) {
		
		return codeMapper.selectSearchList(code);
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

	//수정 필요
	@Override
	public boolean registLead(LeadVO leadVO) {
		if(leadMapper.insertLead(leadVO)>0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean modifyLead(LeadVO leadVO) {
		
		if(leadMapper.updateLead(leadVO) > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteLead(String lead_id) {
		if(leadMapper.deleteLead(lead_id)>0) {
			return true;
		}
		return false;
	}

	@Override
	public List<FranchiseVO> getFranchiseList() {
		return franchiseMapper.getFranchises();
	}

	@Override
	public List<BrandVO> getBrands(String fra_cd) {
		return brandMapper.getBrands(fra_cd);
	}

	@Override
	public ProspectVO insertProspect(ProspectVO prospectVO) {
		
		if(prospectMapper.insertProspect(prospectVO)>0) {
			prospectVO = prospectMapper.selectOne(prospectVO.getPros_id());
			return prospectVO;
		}
		return null;
	}

	@Override
	public ProspectVO getProspect(String id) {
		return prospectMapper.selectOne(id);
	}

	@Override
	public String getFranchise(String brand_cd) {
		return brandMapper.getFranchise(brand_cd);
	}

	

	


}
