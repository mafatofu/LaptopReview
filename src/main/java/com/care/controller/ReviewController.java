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
	
	@RequestMapping("charts")
	public String charts(Model model) {
		return "charts";
		//검색어를 받아와야 함
	}
	
	@RequestMapping("graph")
	public String graph() {
		return "graph";
		//검색어를 받아와야 함
	}
	@RequestMapping("graph2")
	public String graph2(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		service.pnCount(model);
		return "graph2";
	}
	@RequestMapping("result")
	public String resultMap(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		service.pnCount(model);
		return "result";
	}
	
	@RequestMapping("search")
	public String search(@RequestParam(value="searchItem", required=false, defaultValue = "item") String searchItem, 
			@RequestParam(value="searchOption", required=false, defaultValue = "MANUFACTURER") int option, Model model) {
		String search = null;
		String searchOption = null;
		switch (option) {
		case 1:
			searchOption = "MANUFACTURER";
			search = "제조사 \"" + searchItem + "\"에 대한 검색 결과";
			break;
		case 2:
			searchOption = "SERIES";
			search = "시리즈 \"" + searchItem + "\"에 대한 검색 결과";
			break;
		case 3:			
			searchOption = "MODELNAME";
			search = "모델명 \"" + searchItem + "\"에 대한 검색 결과";
			break;
		}		
		model.addAttribute("searchItem", searchItem);
		model.addAttribute("searchOption", searchOption);
		s_service.SearchModel(model);
		model.addAttribute("search", search);
		return "search";
	}
	
	@RequestMapping("test")
	public String test(@RequestParam(value="modelName", required = false) String modelName, Model model) {
		model.addAttribute("model", modelName);
		return "test";
	}
}
