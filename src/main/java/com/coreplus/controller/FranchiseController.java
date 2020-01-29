package com.coreplus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.coreplus.domain.StoreVO;
import com.coreplus.service.FranchiseService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/franchise/*")
@Log4j
@AllArgsConstructor
public class FranchiseController {
	
	private FranchiseService service;
	
	@GetMapping("/list")
	public ModelAndView list(ModelAndView mv, Model model) {
		
		log.info("list  ::  : :: :: ");
		model.addAttribute("list", service.getList());
		mv.setViewName("franchise/list.tiles");
		
		return mv;
		
	}
	
	/*@GetMapping("/list")
	public ModelAndView list(ModelAndView mv, Criteria cri, Model model) {
		
		log.info("list  ::  : :: :: " + cri);
		model.addAttribute("list", service.getList(cri));
		mv.setViewName("franchise/list.tiles");
		
		return mv;
		
	}*/
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute StoreVO store, RedirectAttributes rttr) {
		
		log.info("insert " + store);
		service.insert(store);
		rttr.addFlashAttribute("result", store.getStr_cd());
		
		return "redirect:/franchise/list";
		
	}
	
	@GetMapping("/insert")
	public ModelAndView insert(ModelAndView mv){
		
		mv.setViewName("franchise/insert.tiles");
		return mv;
		
	}
	
	@GetMapping("/update_view")
	public ModelAndView update(@RequestParam("str_cd") String str_cd, ModelAndView mv, Model model){
		
		model.addAttribute("store", service.read(str_cd));
		mv.setViewName("franchise/update.tiles");
		return mv;
		
	}
	
	@PostMapping("/update")
	public String update(@ModelAttribute StoreVO store, RedirectAttributes rttr) {
		System.out.println("업데이트 실행됨");
		log.info("update : " + store);
		
		if(service.update(store)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/franchise/list";
	}
	
	@PostMapping("/delete")
	public String delete(@RequestParam("str_cd") String str_cd, RedirectAttributes rttr) {
		
		log.info("delete " + str_cd);
		
		if(service.delete(str_cd)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/franchise/list";
	}
	
}
