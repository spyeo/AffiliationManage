package com.coreplus.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.coreplus.domain.ManagerVO;
import com.coreplus.service.BreadCrumbService;
import com.coreplus.service.ManagerService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("/")
public class MainController {

	private BreadCrumbService menuService;
	private ManagerService mgrService;

	@GetMapping("/")
	public String franchise() {
		return "franchise/list.tiles";
	}

	@GetMapping("/breadCrumb")
	public ModelAndView breadCrumb(ModelAndView mv, @RequestParam(value = "url") String url, Model model) {
		model.addAttribute("breadcrumb", menuService.getBreadCrumb(url));
		mv.setViewName("htmlcode/breadcrumb/BreadCrumbMenu.tiles");
		return mv;
	}

	@GetMapping("/login")
	public ModelAndView login(ModelAndView mv) {
		mv.setViewName("LoginPage.tiles");
		return mv;
	}

	@PostMapping("/login")
	public String login(@ModelAttribute ManagerVO manager, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {
		HttpSession session = request.getSession();
		if (mgrService.login(manager) > 0) {
			session.setAttribute("manager", mgrService.getManager(manager.getId()));
			return "redirect:/";
		}
		redirectAttributes.addAttribute("msg", "아이디 혹은 비밀번호가 틀렸습니다.");
		return "redirect:/login";
	}

}
