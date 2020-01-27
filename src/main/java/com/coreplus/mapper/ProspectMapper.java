package com.coreplus.mapper;

import java.util.List;

import com.coreplus.domain.Criteria;
import com.coreplus.domain.ProspectVO;

public interface ProspectMapper {

	public List<ProspectVO> selectList(Criteria cri);

}
