package com.coreplus.mapper;

import java.util.List;

import com.coreplus.domain.Criteria;
import com.coreplus.domain.LeadVO;

public interface LeadMapper {
	
	//public List<LeadVO> selectList();
	
	public List<LeadVO> selectListWithPaging(Criteria cri);

	public int selectCount();
}
