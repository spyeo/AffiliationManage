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
	public ModelAndView leads(ModelAndView mv, 
			@ModelAttribute Criteria cri, Model model) {
		
		int totalCount = service.getLeadCount(cri);
		List<LeadVO> result = service.getLeadList(cri);
		model.addAttribute("leadList", result);
		model.addAttribute("pageMarker", new PageDTO(cri, totalCount));
		model.addAttribute("codeList", service.getCodeList());
		mv.setViewName("consulting/LeadList.tiles");
		
		return mv;
	}

	@GetMapping("/lead")
	public ModelAndView lead(ModelAndView mv, 
			@ModelAttribute Criteria cri, 
			@RequestParam String lead_id, Model model) {

		int totalCount = service.getLeadCount(cri);
		LeadVO result = service.getLeadInfo(lead_id);
		model.addAttribute("lead", result);
		model.addAttribute("pageMarker",new PageDTO(cri, totalCount));
		mv.setViewName("consulting/Lead.tiles");
		return mv;
	}
	
	@GetMapping("/registlead")
	public ModelAndView newlead(ModelAndView mv, 
			@ModelAttribute Criteria cri, Model model) {
		int totalCount=service.getLeadCount(cri);
		model.addAttribute("pageMarker",new PageDTO(cri,totalCount));
		mv.setViewName("consulting/NewLead.tiles");
		return mv;
	}
	
	@PostMapping("/registlead")
	public String newlead(@ModelAttribute LeadVO leadVO,
			@ModelAttribute ProspectVO prospectVO,
			@RequestParam String newProspectCheck, Model model) {
		String user="me";
		prospectVO.setCreated_by(user);
		prospectVO.setLast_upd_by(user);
		leadVO.setCreated_by(user);
		leadVO.setLast_upd_by(user);
		leadVO.setProspectVO(prospectVO);
		return "/consulting/leads";
	}
	
	@GetMapping("/modal")
	public ModelAndView modal(ModelAndView mv) {
		mv.setViewName("htmlcode/modal/Modal.tiles");
		return mv;
	}
	
	@GetMapping("/modal/prospects")
	public ModelAndView prospectListView(ModelAndView mv) {
		mv.setViewName("htmlcode/modal/Prospects.tiles");
		return mv;
	}
	
	@GetMapping("/modal/newprospect")
	public ModelAndView newProspect(ModelAndView mv) {
		mv.setViewName("htmlcode/modal/NewProspect.tiles");
		return mv;
	}

}
