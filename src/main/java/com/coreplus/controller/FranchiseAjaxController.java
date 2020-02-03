package com.coreplus.controller;

import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.coreplus.domain.FranchiseVO;
import com.coreplus.service.FranchiseService;

import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
@RequestMapping("/franchise/ajax")
public class FranchiseAjaxController {

	private FranchiseService service;
	
	@GetMapping(value="/store/{fra_cd}",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public List<FranchiseVO> store(@PathVariable("fra_cd") String fra_cd){
		List<FranchiseVO> result=service.getListF(fra_cd);
		return result;
	}
}
