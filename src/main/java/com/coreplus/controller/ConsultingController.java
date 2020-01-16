package com.coreplus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.coreplus.domain.Criteria;
import com.coreplus.domain.PageDTO;
import com.coreplus.service.ConsultingService;

import lombok.AllArgsConstructor;


@Controller
@RequestMapping("/consulting")
@AllArgsConstructor
public class ConsultingController {
	
	private ConsultingService service;
	
	
	@GetMapping("leadlist")
	public String leadList(Criteria cri, Model model) {
		int totalCount=service.getLeadCount();
		model.addAttribute("pageMarker",new PageDTO(cri,totalCount));
		model.addAttribute("leadlist",service.getLeadList(cri));
		
		return "consulting/LeadList";
	}
	
}
