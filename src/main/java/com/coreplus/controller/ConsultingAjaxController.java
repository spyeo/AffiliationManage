package com.coreplus.controller;

import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.coreplus.domain.CodeVO;
import com.coreplus.domain.ProspectVO;
import com.coreplus.service.ConsultingService;

import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
@RequestMapping("/consulting/data")
public class ConsultingAjaxController {
	
	private ConsultingService service;
	
	@GetMapping(value="/codes/{code}", produces= {
			MediaType.APPLICATION_JSON_UTF8_VALUE})
	public List<CodeVO> codes(@PathVariable("code") String code) {
		List<CodeVO> result=service.getCodeList(code);
		return result;
	}
	
	
	 @GetMapping(value="/prospects/{name}", produces= {
			MediaType.APPLICATION_JSON_UTF8_VALUE})
	 public List<ProspectVO> prospects(@PathVariable("name") String name){
		 List<ProspectVO> result = service.getProspectList(name);
		 return result;
	 }
	 
	 @GetMapping(value="/prospect/{id}", produces= {
			 MediaType.APPLICATION_JSON_UTF8_VALUE})
	 public ProspectVO prospect(@PathVariable("id") String pros_id) {
		 ProspectVO result = service.getProspect(pros_id);
		 return result;
	 }
	 
}
