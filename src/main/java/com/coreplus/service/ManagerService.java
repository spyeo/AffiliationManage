package com.coreplus.service;

import com.coreplus.domain.ManagerVO;

public interface ManagerService {

	int login(ManagerVO manager);

	ManagerVO getManager(String mgr_id);


}
