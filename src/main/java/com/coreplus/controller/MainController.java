package com.coreplus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class MainController {
	
	@RequestMapping(value="/")
	public ModelAndView MainView(ModelAndView mv) throws Exception{
		
		mv.setViewName("main/header");
		return mv;
	}
	
}
