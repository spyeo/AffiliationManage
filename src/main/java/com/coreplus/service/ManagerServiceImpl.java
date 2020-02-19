package com.coreplus.service;

import org.springframework.stereotype.Service;

import com.coreplus.domain.ManagerVO;
import com.coreplus.mapper.ManagerMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ManagerServiceImpl implements ManagerService{

	private ManagerMapper managerMapper;
	
	public int login(ManagerVO manager) {
		return managerMapper.login(manager);
	}

	@Override
	public ManagerVO getManager(String mgr_id) {
		return managerMapper.getManager(mgr_id);
	}

}
