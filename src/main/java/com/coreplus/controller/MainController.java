package com.coreplus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.coreplus.service.FranchiseService;


@Controller
public class MainController {
	
	private FranchiseService service;
	
	//메인
/*	@RequestMapping("/")
	public ModelAndView mainView(ModelAndView mv) throws Exception {
		
		mv.setViewName("main/main.tiles");
		return mv;
	}	*/
	
	@GetMapping("/")
	public String franchise() {
		return "franchise/list.tiles";
	}

}



