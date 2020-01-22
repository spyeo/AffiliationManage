package com.coreplus.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.coreplus.domain.StoreVO;
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



