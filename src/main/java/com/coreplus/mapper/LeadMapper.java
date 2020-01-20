package com.coreplus.mapper;

import java.util.List;
import java.util.Map;

import com.coreplus.domain.Criteria;
import com.coreplus.domain.LeadVO;

public interface LeadMapper {

	public int selectCount();


	public List<LeadVO> selectJoinList(Criteria cri);


	public LeadVO selectOne(String lead_id);
}
