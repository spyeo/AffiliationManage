package com.coreplus.service;

import java.util.List;
import java.util.Map;

import com.coreplus.domain.CodeVO;
import com.coreplus.domain.Criteria;
import com.coreplus.domain.LeadVO;

public interface ConsultingService {
	
	//code table crud
	public List<CodeVO> getCodeList(String code);

	//lead table crud
	
	public List<LeadVO> getLeadList(Criteria cri);

	public int getLeadCount(Criteria cri);
	
	public LeadVO getLeadInfo(String lead_id);


}
