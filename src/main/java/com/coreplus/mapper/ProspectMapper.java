package com.coreplus.mapper;

import java.util.List;

import com.coreplus.domain.ProspectVO;

public interface ProspectMapper {

	public List<ProspectVO> selectList(String name);

	public ProspectVO selectOne(String pros_id);

	public int insertProspect(ProspectVO prospectVO);

	public int updateProspect(ProspectVO prospectVO);

}
