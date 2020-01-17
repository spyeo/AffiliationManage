package com.coreplus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class MainController {
	
	//메인
	@RequestMapping("/")
	public ModelAndView mainView(ModelAndView mv) throws Exception {
		
		mv.setViewName("main/main.tiles");
		return mv;
	}	
	
}
