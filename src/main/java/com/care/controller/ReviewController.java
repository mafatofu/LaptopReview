package com.care.controller;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.care.service.ReviewService;
import com.care.service.SearchService;

@Controller
public class ReviewController {
	
	@Autowired
	ReviewService service;
	
	@Autowired
	SearchService s_service;
	
	@RequestMapping("/")
	public String home() {
		return "home";
	}
	
	@RequestMapping("index")
	public String index() {
		return "index";
		//검색어를 받아와야 함
	}
	
	@RequestMapping("result")
	public String resultMap(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		service.pnCount(model);
		return "result";
	}
	
	@RequestMapping("result2")
	public String resultMap2(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		service.pnCount(model);
		return "result2";
	}
	
	@RequestMapping("search")
	public String search(@RequestParam(value="searchItem", required=false, defaultValue = "item") String searchItem, Model model) {
		String search = "\""+searchItem + "\"에 대한 검색결과'";
		model.addAttribute("searchItem", searchItem);
		s_service.SearchModel(model);
		model.addAttribute("search", search);
		return "search";
	}
	
	@RequestMapping("test")
	public String test(@RequestParam(value="modelName", required = false) String modelName, Model model) {
		model.addAttribute("model", modelName);
		return "wordcloud";
	}

}
