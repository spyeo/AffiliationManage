package com.coreplus.mapper;

import com.coreplus.domain.ManagerVO;

public interface ManagerMapper {

	int login(ManagerVO manager);

	ManagerVO getManager(String mgr_id);

}
