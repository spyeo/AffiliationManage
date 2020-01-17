package com.coreplus.service;

import java.util.List;
import java.util.Map;

import com.coreplus.domain.CodeVO;
import com.coreplus.domain.Criteria;
import com.coreplus.domain.LeadVO;

public interface ConsultingService {
	
	//code table crud
	public List<CodeVO> getCodeList();

	
	//lead table crud
	//public List<LeadVO> getLeadList();
	
	public List<LeadVO> getLeadList(Criteria cri);
	
	public Map<String, Object> getLeadReceiptList(Criteria cri);

	public int getLeadCount();


}
