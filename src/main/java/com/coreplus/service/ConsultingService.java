package com.coreplus.service;

import java.util.List;

import com.coreplus.domain.BrandVO;
import com.coreplus.domain.CodeVO;
import com.coreplus.domain.Criteria;
import com.coreplus.domain.FranchiseVO;
import com.coreplus.domain.LeadVO;
import com.coreplus.domain.ProspectVO;

public interface ConsultingService {
	
	//code table crud
	
	public List<CodeVO> getCodeList();
	
	public List<CodeVO> getSelectCodeList(String code);

	//lead table crud
	
	public List<LeadVO> getLeadList(Criteria cri);

	public int getLeadCount(Criteria cri);
	
	public LeadVO getLeadInfo(String lead_id);

	public List<ProspectVO> getProspectList(String name);

	public ProspectVO getProspect(String pros_id);

	public boolean registLead(LeadVO leadVO);

	public boolean modifyLead(LeadVO leadVO);

	public boolean deleteLead(String lead_id);

	public List<FranchiseVO> getFranchiseList();

	public List<BrandVO> getBrands(String fra_cd);


}
