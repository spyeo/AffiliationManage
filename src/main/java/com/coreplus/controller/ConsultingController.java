package com.coreplus.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.coreplus.domain.Criteria;
import com.coreplus.domain.LeadVO;
import com.coreplus.domain.PageDTO;
import com.coreplus.service.ConsultingService;

import lombok.AllArgsConstructor;


@Controller
@AllArgsConstructor
@RequestMapping("/consulting")
public class ConsultingController {
	
	private ConsultingService service;
	
	 @GetMapping("/leads") 
	public String leadReceiptList(@ModelAttribute Criteria cri, Model model) {
		int totalCount=service.getLeadCount();
		List<LeadVO> result=service.getLeadReceiptList(cri);
		model.addAttribute("leadReceiptList", result);
		model.addAttribute("pageMarker",new PageDTO(cri,totalCount));
		return "consulting/LeadList";
	}
	
	
}
