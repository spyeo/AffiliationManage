package com.coreplus.mapper;

import java.util.List;

import com.coreplus.domain.Criteria;
import com.coreplus.domain.LeadVO;

public interface LeadMapper {

	public int selectCount(Criteria cri);


	public List<LeadVO> selectJoinList(Criteria cri);


	public LeadVO selectOne(String lead_id);


	public int insertLead(LeadVO leadVO);
}
