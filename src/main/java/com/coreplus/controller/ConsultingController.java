package com.coreplus.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.coreplus.domain.Criteria;
import com.coreplus.domain.LeadVO;
import com.coreplus.domain.PageDTO;
import com.coreplus.domain.ProspectVO;
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
	
	@GetMapping("/registlead")
	public ModelAndView newlead(ModelAndView mv, @ModelAttribute Criteria cri, Model model) {
		int totalCount=service.getLeadCount(cri);
		model.addAttribute("pageMarker",new PageDTO(cri,totalCount));
		mv.setViewName("consulting/LeadRegistForm.tiles");
		return mv;
	}
	
	@PostMapping("/registlead")
	public String newlead(@ModelAttribute LeadVO leadVO,
			@ModelAttribute ProspectVO prospectVO,
			@ModelAttribute Criteria cri, Model model) {
		
		leadVO.setProspectVO(prospectVO);
		return "redirect:/consulting/leads";
	}
	
	@GetMapping("/prospects")
	public String prospects( @ModelAttribute Criteria cri, Model model){
		List<ProspectVO> result = service.getProspectList(cri);
		model.addAttribute("prospects",result);
		
		return "consulting/ProspectList";
	}

}
