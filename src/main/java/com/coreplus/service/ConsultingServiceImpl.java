package com.coreplus.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.coreplus.domain.CodeVO;
import com.coreplus.mapper.CodeMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ConsultingServiceImpl implements ConsultingService{

	private CodeMapper mapper;
	
	@Override
	public List<CodeVO> getCode() {
		
		return mapper.getCode();
	}

}
