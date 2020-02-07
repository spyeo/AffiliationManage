package com.coreplus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.coreplus.service.BreadCrumbService;
import com.coreplus.service.FranchiseService;

import lombok.AllArgsConstructor;


@Controller
@AllArgsConstructor
@RequestMapping("/")
public class MainController {
	
	private FranchiseService service;
	private BreadCrumbService serv;
	
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
	
	@GetMapping("/breadCrumb")
	public ModelAndView breadCrumb(ModelAndView mv, @RequestParam(value="url")String url, Model model) {
		model.addAttribute("breadcrumb",serv.getBreadCrumb(url));
		mv.setViewName("htmlcode/breadcrumb/BreadCrumbMenu.tiles");
		return mv;
	}
}



