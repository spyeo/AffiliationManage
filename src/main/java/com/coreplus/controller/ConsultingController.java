package com.coreplus.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
	public ModelAndView leads(ModelAndView mv, @ModelAttribute Criteria cri, Model model) {
		
		int totalCount = service.getLeadCount(cri);
		List<LeadVO> result = service.getLeadList(cri);
		model.addAttribute("leadReceiptList", result);
		model.addAttribute("pageMarker", new PageDTO(cri, totalCount));
		mv.setViewName("consulting/LeadList.tiles");
		
		return mv;
	}

	@GetMapping("/lead")
	public ModelAndView lead(ModelAndView mv, @RequestParam String lead_id, Model model) {

		LeadVO result = service.getLeadInfo(lead_id);
		model.addAttribute("lead", result);
		mv.setViewName("consulting/Lead.tiles");
		return mv;
	}
	
	@GetMapping("/newlead")
	public ModelAndView newlead(ModelAndView mv) {
		mv.setViewName("consulting/LeadInsertForm.tiles");
		return mv;
	}

}
