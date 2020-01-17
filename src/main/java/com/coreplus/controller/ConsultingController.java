package com.coreplus.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.coreplus.domain.Criteria;
import com.coreplus.domain.PageDTO;
import com.coreplus.service.ConsultingService;


@Controller
@RequestMapping("/consulting")
public class ConsultingController {
	
	private ConsultingService service;
	
	
	
	/*
	  @GetMapping("/leadlist")
	public String leadList(Criteria cri, Model model) {
		int totalCount=service.getLeadCount();
		model.addAttribute("pageMarker",new PageDTO(cri,totalCount));
		model.addAttribute("leadlist",service.getLeadList(cri));
		System.out.println("leadlist ½ÇÇà");
		return "consulting/LeadList";
	}
	 */
	
	
	@GetMapping("/leadReceiptList") 
	public String leadReceiptList(Criteria cri, Model model) {
		int totalCount=service.getLeadCount();
		Map<String, Object> result=service.getLeadReceiptList(cri);
		model.addAttribute("leadReceiptList", result);
		model.addAttribute("pageMarker",new PageDTO(cri,totalCount));
		return "consulting/LeadList";
	}
	
	
}
