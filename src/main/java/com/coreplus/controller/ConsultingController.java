package com.coreplus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.coreplus.service.ConsultingService;

import lombok.AllArgsConstructor;


@Controller
@RequestMapping("/consulting")
@AllArgsConstructor
public class ConsultingController {
	
	private ConsultingService service;
	
	@GetMapping("recruitlist")
	public String recruitList() {
		
		return "consulting/RecruitList";
	}
}
